/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "map.h"

#include "common/async.h"
#include "common/blowfish.h"
#include "common/console_service.h"
#include "common/database.h"
#include "common/debug.h"
#include "common/ipp.h"
#include "common/logging.h"
#include "common/socket.h"
#include "common/timer.h"
#include "common/utils.h"
#include "common/vana_time.h"
#include "common/version.h"
#include "common/zlib.h"

#include "ability.h"
#include "daily_system.h"
#include "ipc_client.h"
#include "job_points.h"
#include "latent_effect_container.h"
#include "linkshell.h"
#include "mob_spell_list.h"
#include "monstrosity.h"
#include "packet_guard.h"
#include "packet_system.h"
#include "roe.h"
#include "spell.h"
#include "status_effect_container.h"
#include "time_server.h"
#include "transport.h"
#include "zone.h"
#include "zone_entities.h"

#include "ai/controllers/automaton_controller.h"

#include "items/item_equipment.h"

#include "packets/basic.h"
#include "packets/chat_message.h"
#include "packets/server_ip.h"

#include "utils/battleutils.h"
#include "utils/charutils.h"
#include "utils/fishingutils.h"
#include "utils/gardenutils.h"
#include "utils/guildutils.h"
#include "utils/instanceutils.h"
#include "utils/itemutils.h"
#include "utils/mobutils.h"
#include "utils/moduleutils.h"
#include "utils/petutils.h"
#include "utils/serverutils.h"
#include "utils/synergyutils.h"
#include "utils/synthutils.h"
#include "utils/trustutils.h"
#include "utils/zoneutils.h"

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <thread>

#include <nonstd/jthread.hpp>

#ifdef WIN32
#include <io.h>
#endif

IPP gMapIPP;

MapSessionContainer gMapSessions;

std::unique_ptr<SqlConnection> _sql;

extern std::map<uint16, CZone*> g_PZoneList; // Global array of pointers for zones

bool gLoadAllLua = false;

std::unordered_map<uint32, std::unordered_map<uint16, std::vector<std::pair<uint16, uint8>>>> PacketMods;

extern std::atomic<bool> gProcessLoaded;

namespace
{
    // Map UDP socket file descriptor
    int32 map_fd = 0;

    // Map udp buffers
    NetworkBuffer PBuff;        // Global packet clipboard
    NetworkBuffer PBuffCopy;    // Copy of above, used to decrypt a second time if necessary.
    NetworkBuffer PScratchBuff; // Temporary packet clipboard

    // ZMQ message thread
    nonstd::jthread messageThread;

    // Runtime statistics
    uint32 TotalPacketsToSendPerTick  = 0U;
    uint32 TotalPacketsSentPerTick    = 0U;
    uint32 TotalPacketsDelayedPerTick = 0U;
} // namespace

void initConsoleService()
{
    // clang-format off
    gConsoleService = std::make_unique<ConsoleService>();

    gConsoleService->RegisterCommand("crash", "Force-crash the process.",
    [](std::vector<std::string>& inputs)
    {
        crash();
    });

    gConsoleService->RegisterCommand("gm", "Change a character's GM level.",
    [](std::vector<std::string>& inputs)
    {
        if (inputs.size() != 3)
        {
            fmt::print("Usage: gm <char_name> <level>. example: gm Testo 1\n");
            return;
        }

        auto  name  = inputs[1];
        auto* PChar = zoneutils::GetCharByName(name);
        if (!PChar)
        {
            fmt::print("Couldnt find character: {}\n", name);
            return;
        }

        auto level = std::clamp<uint8>(static_cast<uint8>(stoi(inputs[2])), 0, 5);

        PChar->m_GMlevel = level;

        // NOTE: This is the same logic as charutils::SaveCharGMLevel(PChar);
        // But we're not executing on the main thread, so we're doing it with
        // our own SQL connection.
        {
            auto otherSql  = std::make_unique<SqlConnection>();
            auto query = "UPDATE %s SET %s %u WHERE charid = %u";
            otherSql->Query(query, "chars", "gmlevel =", PChar->m_GMlevel, PChar->id);
        }

        fmt::print("Promoting {} to GM level {}\n", PChar->name, level);
        PChar->pushPacket<CChatMessagePacket>(PChar, MESSAGE_SYSTEM_3, fmt::format("You have been set to GM level {}.", level));
    });

    gConsoleService->RegisterCommand("reload_settings", "Reload settings files.",
    [&](std::vector<std::string>& inputs)
    {
        fmt::print("Reloading settings files\n");
        settings::init();
    });

    gConsoleService->RegisterCommand("reload_recipes", "Reload crafting recipes.",
    [&](std::vector<std::string>& inputs)
    {
        fmt::print("Reloading crafting recipes\n");
        synthutils::LoadSynthRecipes();
    });

    gConsoleService->RegisterCommand("exit", "Terminate the program.",
    [&](std::vector<std::string>& inputs)
    {
        fmt::print("> Goodbye!\n");
        gConsoleService->stop();
        gRunFlag = false;
    });
    // clang-format on
}

/************************************************************************
 *                                                                       *
 *  do_init                                                              *
 *                                                                       *
 ************************************************************************/

int32 do_init(int32 argc, char** argv)
{
    TracyZoneScoped;

#ifdef TRACY_ENABLE
    ShowInfo("*** TRACY IS ENABLED ***");

    if (!debug::isUserRoot())
    {
        ShowWarning("You are NOT running as the root superuser or admin.");
        ShowWarning("This is required for Tracy to work properly.");
        std::this_thread::sleep_for(std::chrono::seconds(5));
    }
#endif // TRACY_ENABLE

    ShowInfo("do_init: begin server initialization");

    // These aren't set unless --ip or --port is set, respectively.
    auto mapIP   = 0;
    auto mapPort = 0;

    // TODO: Replace with argparse::ArgumentParser
    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "--ip") == 0)
        {
            mapIP = str2ip(argv[i + 1]);
        }
        else if (strcmp(argv[i], "--port") == 0)
        {
            mapPort = std::stoi(argv[i + 1]);
        }
        else if (strcmp(argv[i], "--load_all") == 0)
        {
            gLoadAllLua = true;
        }
    }

    gMapIPP = IPP(mapIP, mapPort);

    ShowInfoFmt("map_ip: {}", gMapIPP.getIPString());
    ShowInfoFmt("map_port: {}", gMapIPP.getPort());
    ShowInfoFmt("Zones assigned to this process: {}", zoneutils::GetZonesAssignedToThisProcess().size());

    srand((uint32)time(nullptr));
    xirand::seed();
    ShowInfo(fmt::format("Random samples (integer): {}", utils::getRandomSampleString(0, 255)));
    ShowInfo(fmt::format("Random samples (float): {}", utils::getRandomSampleString(0.0f, 1.0f)));

    // TODO: Get rid of legacy _sql and SqlConnection
    ShowInfo("do_init: connecting to database");
    _sql = std::make_unique<SqlConnection>();

    ShowInfo(fmt::format("database name: {}", db::getDatabaseSchema()).c_str());
    ShowInfo(fmt::format("database server version: {}", db::getDatabaseVersion()).c_str());
    ShowInfo(fmt::format("database client version: {}", db::getDriverVersion()).c_str());
    db::checkCharset();
    db::checkTriggers();

    luautils::init(); // Also calls moduleutils::LoadLuaModules();

    PacketParserInitialize();

    _sql->Query("DELETE FROM accounts_sessions WHERE IF(%u = 0 AND %u = 0, true, server_addr = %u AND server_port = %u)",
                gMapIPP.getIP(), gMapIPP.getPort(), gMapIPP.getIP(), gMapIPP.getPort());

    ShowInfo("do_init: zlib is reading");
    zlib_init();

    ShowInfo("do_init: starting ZMQ thread");
    message::init();

    ShowInfo("do_init: loading items");
    itemutils::Initialize();

    ShowInfo("do_init: loading plants");
    gardenutils::Initialize();

    // One method to initialize all data in battleutils
    // and one method to free this data

    ShowInfo("do_init: loading spells");
    spell::LoadSpellList();
    mobSpellList::LoadMobSpellList();
    automaton::LoadAutomatonSpellList();
    automaton::LoadAutomatonAbilities();

    guildutils::Initialize();
    charutils::LoadExpTable();
    traits::LoadTraitsList();
    effects::LoadEffectsParameters();
    battleutils::LoadSkillTable();
    meritNameSpace::LoadMeritsList();
    ability::LoadAbilitiesList();
    battleutils::LoadWeaponSkillsList();
    battleutils::LoadMobSkillsList();
    battleutils::LoadPetSkillsList();
    battleutils::LoadSkillChainDamageModifiers();
    petutils::LoadPetList();
    trustutils::LoadTrustList();
    mobutils::LoadSqlModifiers();
    jobpointutils::LoadGifts();
    daily::LoadDailyItems();
    roeutils::UpdateUnityRankings();
    synthutils::LoadSynthRecipes();
    synergyutils::LoadSynergyRecipes();
    CItemEquipment::LoadAugmentData(); // TODO: Move to itemutils

    if (!std::filesystem::exists("./navmeshes/") || std::filesystem::is_empty("./navmeshes/"))
    {
        ShowInfo("./navmeshes/ directory isn't present or is empty");
    }

    if (!std::filesystem::exists("./losmeshes/") || std::filesystem::is_empty("./losmeshes/"))
    {
        ShowInfo("./losmeshes/ directory isn't present or is empty");
    }

    ShowInfo("do_init: loading zones");
    zoneutils::LoadZoneList();

    fishingutils::InitializeFishingSystem();
    instanceutils::LoadInstanceList();

    monstrosity::LoadStaticData();

    ShowInfo("do_init: server is binding with port %u", gMapIPP.getPort() == 0 ? settings::get<uint16>("network.MAP_PORT") : gMapIPP.getPort());
    map_fd = makeBind_udp(INADDR_ANY, gMapIPP.getPort() == 0 ? settings::get<uint16>("network.MAP_PORT") : gMapIPP.getPort());

    CVanaTime::getInstance()->setCustomEpoch(settings::get<int32>("map.VANADIEL_TIME_EPOCH"));

    zoneutils::InitializeWeather(); // Need VanaTime initialized

    CTransportHandler::getInstance()->InitializeTransport();

    CTaskMgr::getInstance()->AddTask("time_server", server_clock::now(), nullptr, CTaskMgr::TASK_INTERVAL, 2400ms, time_server);
    CTaskMgr::getInstance()->AddTask("map_cleanup", server_clock::now(), nullptr, CTaskMgr::TASK_INTERVAL, 5s, map_cleanup);
    CTaskMgr::getInstance()->AddTask("garbage_collect", server_clock::now(), nullptr, CTaskMgr::TASK_INTERVAL, 15min, map_garbage_collect);
    CTaskMgr::getInstance()->AddTask("persist_server_vars", server_clock::now(), nullptr, CTaskMgr::TASK_INTERVAL, 1min, serverutils::PersistVolatileServerVars);

    zoneutils::TOTDChange(CVanaTime::getInstance()->GetCurrentTOTD()); // This tells the zones to spawn stuff based on time of day conditions (such as undead at night)

    ShowInfo("do_init: Removing expired database variables");
    uint32 currentTimestamp = CVanaTime::getInstance()->getSysTime();
    _sql->Query("DELETE FROM char_vars WHERE expiry > 0 AND expiry <= %d", currentTimestamp);
    _sql->Query("DELETE FROM server_variables WHERE expiry > 0 AND expiry <= %d", currentTimestamp);

    PacketGuard::Init();

    initConsoleService();

    moduleutils::OnInit();

    luautils::OnServerStart();

    moduleutils::ReportLuaModuleUsage();

    db::enableTimers();

    ShowInfo("The map-server is ready to work!");
    ShowInfo("=======================================================================");

#ifdef TRACY_ENABLE
    ShowInfo("*** TRACY IS ENABLED ***");
#endif // TRACY_ENABLE

    gProcessLoaded = true;

    return 0;
}

/************************************************************************
 *                                                                       *
 *  do_final                                                             *
 *                                                                       *
 ************************************************************************/
void do_final(int code)
{
    TracyZoneScoped;

    ability::CleanupAbilitiesList();
    itemutils::FreeItemList();
    battleutils::FreeWeaponSkillsList();
    battleutils::FreeMobSkillList();
    battleutils::FreePetSkillList();
    fishingutils::CleanupFishing();
    guildutils::Cleanup();
    mobutils::Cleanup();
    traits::ClearTraitsList();

    petutils::FreePetList();
    trustutils::FreeTrustList();
    zoneutils::FreeZoneList();

    if (messageThread.joinable())
    {
        messageThread.join();
    }

    CTaskMgr::delInstance();
    CVanaTime::delInstance();
    Async::delInstance();

    timer_final();

    luautils::cleanup();
    logging::ShutDown();

#ifdef WIN32
    shutdown(map_fd, SD_SEND);
#else
    shutdown(map_fd, SHUT_WR);
#endif
    close(map_fd);

    if (code != EXIT_SUCCESS)
    {
        std::exit(code);
    }
}

/************************************************************************
 *                                                                       *
 *  do_abort                                                             *
 *                                                                       *
 ************************************************************************/

void do_abort()
{
    do_final(EXIT_FAILURE);
}

void ReportTracyStats()
{
    TracyReportLuaMemory(lua.lua_state());

    std::size_t activeZoneCount       = 0;
    std::size_t playerCount           = 0;
    std::size_t mobCount              = 0;
    std::size_t dynamicTargIdCount    = 0;
    std::size_t dynamicTargIdCapacity = 0;

    for (auto& [id, PZone] : g_PZoneList)
    {
        if (PZone->IsZoneActive())
        {
            activeZoneCount += 1;
            playerCount += PZone->GetZoneEntities()->GetCharList().size();
            mobCount += PZone->GetZoneEntities()->GetMobList().size();
            dynamicTargIdCount += PZone->GetZoneEntities()->GetUsedDynamicTargIDsCount();
            dynamicTargIdCapacity += 511;
        }
    }

    TracyReportGraphNumber("Active Zones (Process)", static_cast<std::int64_t>(activeZoneCount));
    TracyReportGraphNumber("Connected Players (Process)", static_cast<std::int64_t>(playerCount));
    TracyReportGraphNumber("Active Mobs (Process)", static_cast<std::int64_t>(mobCount));
    TracyReportGraphNumber("Task Manager Tasks", static_cast<std::int64_t>(CTaskMgr::getInstance()->getTaskList().size()));

    TracyReportGraphPercent("Dynamic Entity TargID Capacity Usage Percent", static_cast<double>(dynamicTargIdCount) / static_cast<double>(dynamicTargIdCapacity));

    TracyReportGraphNumber("Total Packets To Send Per Tick", static_cast<std::int64_t>(TotalPacketsToSendPerTick));
    TracyReportGraphNumber("Total Packets Sent Per Tick", static_cast<std::int64_t>(TotalPacketsSentPerTick));
    TracyReportGraphNumber("Total Packets Delayed Per Tick", static_cast<std::int64_t>(TotalPacketsDelayedPerTick));

    TotalPacketsToSendPerTick  = 0;
    TotalPacketsSentPerTick    = 0;
    TotalPacketsDelayedPerTick = 0;
}

/************************************************************************
 *                                                                       *
 *  do_sockets                                                           *
 *                                                                       *
 ************************************************************************/

int32 do_sockets(fd_set* rfd, duration next)
{
    message::handle_incoming();

    timeval timeout{};
    int32   ret = 0;
    std::memcpy(rfd, &readfds, sizeof(*rfd));

    timeout.tv_sec  = std::chrono::duration_cast<std::chrono::seconds>(next).count();
    timeout.tv_usec = std::chrono::duration_cast<std::chrono::microseconds>(next - std::chrono::duration_cast<std::chrono::seconds>(next)).count();

    ret = sSelect(fd_max, rfd, nullptr, nullptr, &timeout);
    if (ret == SOCKET_ERROR)
    {
        if (sErrno != S_EINTR)
        {
            ShowCritical("do_sockets: select() failed, error code %d!", sErrno);
            do_final(EXIT_FAILURE);
        }
        return 0; // interrupted by a signal, just loop and try again
    }

    last_tick = time(nullptr);

    if (sFD_ISSET(map_fd, rfd))
    {
        sockaddr_in from{};
        socklen_t   fromlen = sizeof(from);

        ret = recvudp(map_fd, PBuff.data(), kMaxBufferSize, 0, (struct sockaddr*)&from, &fromlen);
        if (ret != -1)
        {
            const auto ip   = sockaddr2netip(from);
            const auto port = sockaddr2hostport(from);
            const auto ipp  = IPP(ip, port);

            // find player char
            MapSession* map_session_data = gMapSessions.getSessionByIPP(ipp);
            if (map_session_data == nullptr)
            {
                map_session_data = gMapSessions.createSession(ipp);
                if (map_session_data == nullptr)
                {
                    gMapSessions.destroySession(ipp);
                    return -1;
                }
            }

            size_t size = ret;

            int32 decryptCount = recv_parse(PBuff.data(), &size, &from, map_session_data);
            if (decryptCount != -1)
            {
                // DecryptCount of 0 means the main key decrypted the packet
                if (decryptCount == 0)
                {
                    // If the previous package was lost, then we do not collect a new one,
                    // and send the previous packet again
                    if (!parse(PBuff.data(), &size, &from, map_session_data))
                    {
                        send_parse(PBuff.data(), &size, &from, map_session_data, false);
                    }
                }
                else if (decryptCount == 1 && map_session_data->blowfish.status == BLOWFISH_PENDING_ZONE)
                {
                    // TODO: Client will send 0x00D in response to 0x00B, so we are probably always sending an extra 0x00B when we don't need to.
                    // However, the client will fail to decrypt this if they received it before, effectively being a no-op.
                    // It could be beneficial to parse 0x00D here anyway.

                    // Client failed to receive 0x00B, resend it
                    if (auto PChar = map_session_data->PChar)
                    {
                        PChar->clearPacketList();
                        PChar->pushPacket<CServerIPPacket>(PChar, map_session_data->zone_type, map_session_data->zone_ipp);
                    }
                    send_parse(PBuff.data(), &size, &from, map_session_data, true);

                    // Increment sync count with every packet
                    // TODO: match incoming with a new parse that only cares about sync count
                    map_session_data->server_packet_id += 1;
                }

                ret = sendudp(map_fd, PBuff.data(), size, 0, (const struct sockaddr*)&from, fromlen);

                std::swap(PBuff, map_session_data->server_packet_data);
                std::swap(size, map_session_data->server_packet_size);
            }

            // If client is logging out, just close it.
            if (map_session_data->shuttingDown == 1)
            {
                gMapSessions.destroySession(map_session_data);
            }
        }
    }

    ReportTracyStats();

    _sql->TryPing();

    return 0;
}

/************************************************************************
 *                                                                       *
 *  map_decipher_packet                                                  *
 *                                                                       *
 ************************************************************************/

int32 map_decipher_packet(uint8* buff, size_t size, sockaddr_in* from, MapSession* PSession, blowfish_t* pbfkey)
{
    TracyZoneScoped;

    uint16 tmp = 0;
    uint16 i   = 0;

    // counting blocks whose size = 4 byte
    tmp = (uint16)((size - FFXI_HEADER_SIZE) / 4);
    tmp -= tmp % 2;

    const auto ip = sockaddr2netip(*from);

    for (i = 0; i < tmp; i += 2)
    {
        blowfish_decipher((uint32*)buff + i + 7, (uint32*)buff + i + 8, pbfkey->P, pbfkey->S[0]);
    }

    if (checksum((uint8*)(buff + FFXI_HEADER_SIZE), (uint32)(size - (FFXI_HEADER_SIZE + 16)), (char*)(buff + size - 16)) == 0)
    {
        return 0;
    }

    // We can fail to decipher if the client is attempting to zone.
    if (PSession->blowfish.status != BLOWFISH_PENDING_ZONE)
    {
        ShowError(fmt::format("map_decipher_packet: bad packet from <{}>", ip2str(ip)));
    }
    return -1;
}

/************************************************************************
 *                                                                       *
 *  main function to parse recv packets                                  *
 *                                                                       *
 ************************************************************************/

int32 recv_parse(uint8* buff, size_t* buffsize, sockaddr_in* from, MapSession* map_session_data)
{
    TracyZoneScoped;

    size_t size           = *buffsize;
    int32  checksumResult = -1;

    try
    {
        if (size <= (FFXI_HEADER_SIZE + 16)) // check for underflow or no-data packet
        {
            return -1;
        }
        checksumResult = checksum((uint8*)(buff + FFXI_HEADER_SIZE), (uint32)(size - (FFXI_HEADER_SIZE + 16)), (char*)(buff + size - 16));
    }
    catch (...)
    {
        ShowError(fmt::format("Possible crash attempt from: {}", map_session_data->client_ipp.toString()));
        return -1;
    }

    if (checksumResult == 0)
    {
        uint16 packetID = ref<uint16>(buff, FFXI_HEADER_SIZE) & 0x1FF;

        if (packetID != 0x00A)
        {
            return -1;
        }

        // Not big enough to be 0x00A
        if (size < (FFXI_HEADER_SIZE + sizeof(GP_CLI_LOGIN)))
        {
            return -1;
        }

        GP_CLI_LOGIN loginPacket = {};

        std::memcpy(&loginPacket, buff + FFXI_HEADER_SIZE, sizeof(GP_CLI_LOGIN));

        // See LoginPacketCheck from https://github.com/atom0s/XiPackets/tree/main/world/client/0x000A
        uint8 checksum = 0;

        const auto checksumOffset = offsetof(GP_CLI_LOGIN, unknown01);
        const auto checksumLength = sizeof(GP_CLI_LOGIN) - checksumOffset;

        for (int i = 0; i < checksumLength; i++)
        {
            checksum += ref<uint8>(&loginPacket, checksumOffset + i);
        }

        // Failed checksum
        if (checksum != loginPacket.LoginPacketCheck)
        {
            return -1;
        }

        // We can only get here if an 0x00A (not encrypted) packet was here.
        // If we were pending zones, delete our old char
        if (map_session_data->blowfish.status == BLOWFISH_PENDING_ZONE)
        {
            destroy(map_session_data->PChar);
        }

        if (map_session_data->PChar == nullptr)
        {
            uint32 charID = ref<uint32>(buff, FFXI_HEADER_SIZE + 0x0C);
            uint16 langID = ref<uint16>(buff, FFXI_HEADER_SIZE + 0x58);

            std::ignore = langID;

            auto rset = db::preparedStmt("SELECT charid FROM chars WHERE charid = ? LIMIT 1", charID);
            if (!rset || rset->rowsCount() == 0 || !rset->next())
            {
                ShowError("recv_parse: Cannot load charid %u", charID);
                return -1;
            }

            rset = db::preparedStmt("SELECT session_key FROM accounts_sessions WHERE charid = ? LIMIT 1", charID);
            if (!rset || rset->rowsCount() == 0 || !rset->next())
            {
                ShowError("recv_parse: Cannot load session_key for charid %u", charID);
            }
            else
            {
                db::extractFromBlob(rset, "session_key", map_session_data->blowfish.key);

                map_session_data->initBlowfish();
            }

            map_session_data->PChar  = charutils::LoadChar(charID);
            map_session_data->charID = charID;

            // If we're a new char on a new instance and prevzone != zone
            if (map_session_data->blowfish.status == BLOWFISH_WAITING && map_session_data->PChar->loc.destination != map_session_data->PChar->loc.prevzone)
            {
                message::send(ipc::KillSession{
                    .victimId = charID,
                });
            }
        }

        map_session_data->client_packet_id = 0;
        map_session_data->server_packet_id = 0;
        map_session_data->zone_ipp         = {};
        map_session_data->zone_type        = 0;

        return 0;
    }
    else
    {
        if (map_session_data->blowfish.status == BLOWFISH_PENDING_ZONE)
        {
            // Copy buff into the backup buffer. Blowfish can't be rewound currently.
            std::memcpy(PBuffCopy.data(), buff, *buffsize);
        }
        int decryptCount = 0;
        // char packets
        if (map_decipher_packet(buff, *buffsize, from, map_session_data, &map_session_data->blowfish) == -1)
        {
            // If the client is pending zone, they might not have received 0x00B, and thus not incremented their key
            // Check old blowfish data
            if (map_session_data->blowfish.status == BLOWFISH_PENDING_ZONE &&
                map_decipher_packet(PBuffCopy.data(), *buffsize, from, map_session_data, &map_session_data->prev_blowfish) != -1)
            {
                // Copy decrypted bytes back into buffer
                std::memcpy(buff, PBuffCopy.data(), *buffsize);
                decryptCount++;
            }
            else
            {
                *buffsize = 0;
                return -1;
            }
        }

        // reading data size
        uint32 PacketDataSize = ref<uint32>(buff, *buffsize - sizeof(int32) - 16);

        // it's decompressing data and getting new size
        PacketDataSize = zlib_decompress((int8*)(buff + FFXI_HEADER_SIZE), PacketDataSize, (int8*)PScratchBuff.data(), kMaxBufferSize);

        // Not sure why zlib_decompress is defined to return a uint32 when it returns -1 in situations.
        if (static_cast<int32>(PacketDataSize) != -1)
        {
            // it's making result buff
            // don't need std::memcpy header
            std::memcpy(buff + FFXI_HEADER_SIZE, PScratchBuff.data(), PacketDataSize);
            *buffsize = FFXI_HEADER_SIZE + PacketDataSize;

            return decryptCount;
        }

        return decryptCount;
    }
}

/************************************************************************
 *                                                                       *
 *  main function parsing the packets                                    *
 *                                                                       *
 ************************************************************************/

int32 parse(uint8* buff, size_t* buffsize, sockaddr_in* from, MapSession* map_session_data)
{
    TracyZoneScoped;

    // Start processing the incoming packet
    uint8* PacketData_Begin = &buff[FFXI_HEADER_SIZE];
    uint8* PacketData_End   = &buff[*buffsize];

    CCharEntity* PChar = map_session_data->PChar;

    TracyZoneString(PChar->getName());

    uint16 SmallPD_Size = 0;
    uint16 SmallPD_Type = 0;
    uint16 SmallPD_Code = ref<uint16>(buff, 0);

    // TODO: figure out what exactly the client sends when you're not in a CS. there's no C2S packets being sent via the client,
    // and yet we receive something here. It doesnt look like a valid packet, as it has no size and the type is 0x001 which is not valid.
    if (map_session_data->blowfish.status != BLOWFISH_PENDING_ZONE && map_session_data->blowfish.status != BLOWFISH_WAITING)
    {
        // Update the time we last got a char sync packet
        // The client can spam some other packets when trying to zone, preventing timely session deletions
        map_session_data->last_update = time(nullptr);
    }

    for (uint8* SmallPD_ptr = PacketData_Begin; SmallPD_ptr + (ref<uint8>(SmallPD_ptr, 1) & 0xFE) * 2 <= PacketData_End && (ref<uint8>(SmallPD_ptr, 1) & 0xFE);
         SmallPD_ptr        = SmallPD_ptr + SmallPD_Size * 2)
    {
        SmallPD_Size = (ref<uint8>(SmallPD_ptr, 1) & 0x0FE);
        SmallPD_Type = (ref<uint16>(SmallPD_ptr, 0) & 0x1FF);

        if (PacketSize[SmallPD_Type] == SmallPD_Size || PacketSize[SmallPD_Type] == 0) // Tests incoming packets for the correct size prior to processing
        {
            // Google Translate:
            // if the code of the current package is less than or equal to the last received
            // or more global then ignore the package

            if ((ref<uint16>(SmallPD_ptr, 2) <= map_session_data->client_packet_id) || (ref<uint16>(SmallPD_ptr, 2) > SmallPD_Code))
            {
                continue;
            }

            if (SmallPD_Type != 0x15)
            {
                DebugPackets("parse: %03hX | %04hX %04hX %02hX from user: %s",
                             SmallPD_Type, ref<uint16>(SmallPD_ptr, 2), ref<uint16>(buff, 2), SmallPD_Size, PChar->getName());
            }

            if (settings::get<bool>("map.PACKETGUARD_ENABLED") && PacketGuard::IsRateLimitedPacket(PChar, SmallPD_Type))
            {
                ShowWarning("[PacketGuard] Rate-limiting packet: Player: %s - Packet: %03hX", PChar->getName(), SmallPD_Type);
                continue; // skip this packet
            }

            if (settings::get<bool>("map.PACKETGUARD_ENABLED") && !PacketGuard::PacketIsValidForPlayerState(PChar, SmallPD_Type))
            {
                ShowWarning("[PacketGuard] Caught mismatch between player substate and recieved packet: Player: %s - Packet: %03hX",
                            PChar->getName(), SmallPD_Type);
                continue; // skip this packet
            }

            if (settings::get<bool>("map.PACKETGUARD_ENABLED") && !PacketGuard::PacketsArrivingInCorrectOrder(PChar, SmallPD_Type))
            {
                ShowWarning("[PacketGuard] Caught out-of-order packet: Player: %s - Packet: %03hX", PChar->getName(), SmallPD_Type);
                continue; // skip this packet
            }

            if (PChar->loc.zone == nullptr && SmallPD_Type != 0x0A)
            {
                // Packets aren't unexpected from the old key under BLOWFISH_PENDING_ZONE
                if (map_session_data->blowfish.status != BLOWFISH_PENDING_ZONE)
                {
                    ShowWarning("This packet is unexpected from %s - Received %03hX earlier without matching 0x0A", PChar->getName(), SmallPD_Type);
                }
            }
            else
            {
                // TODO: We should be passing a non-modifyable span of the packet data into the parser
                //     : instead of creating a new packet here.
                auto basicPacket = CBasicPacket::createFromBuffer(reinterpret_cast<uint8*>(SmallPD_ptr));
                ShowTrace(fmt::format("map::parse: Char: {} ({}): 0x{:03X}", PChar->getName(), PChar->id, basicPacket->getType()).c_str());
                PacketParser[SmallPD_Type](map_session_data, PChar, *basicPacket);
            }
        }
        else
        {
            ShowWarning("Bad packet size %03hX | %04hX %04hX %02hX from user: %s", SmallPD_Type, ref<uint16>(SmallPD_ptr, 2), ref<uint16>(buff, 2),
                        SmallPD_Size, PChar->getName());
        }
    }

    if (PChar->retriggerLatents)
    {
        for (uint8 equipSlotID = 0; equipSlotID < 16; ++equipSlotID)
        {
            if (PChar->equip[equipSlotID] != 0)
            {
                PChar->PLatentEffectContainer->CheckLatentsEquip(equipSlotID);
            }
        }
        PChar->retriggerLatents = false; // reset as we have retriggered the latents somewhere
    }

    map_session_data->client_packet_id = SmallPD_Code;

    // Google Translate:
    // here we check if the client received the previous package
    // if not received, then we do not create a new one, but send the previous one

    if (ref<uint16>(buff, 2) != map_session_data->server_packet_id)
    {
        /*
         * If the client and server have become out of sync, then caching takes place. However, caching
         * zone packets will result in the client never properly connecting. Ignore those specifically.
         */
        if (SmallPD_Type == 0x0A)
        {
            return 0;
        }

        ref<uint16>(map_session_data->server_packet_data.data(), 2) = SmallPD_Code;
        ref<uint16>(map_session_data->server_packet_data.data(), 8) = (uint32)time(nullptr);

        PBuff     = map_session_data->server_packet_data;
        *buffsize = map_session_data->server_packet_size;

        std::memcpy(map_session_data->server_packet_data.data(), buff, *buffsize);

        return -1;
    }

    // GT: increase the number of the sent packet only if new data is sent

    map_session_data->server_packet_id += 1;

    return 0;
}

/************************************************************************
 *                                                                       *
 *  main function is building big packet                                 *
 *                                                                       *
 ************************************************************************/

int32 send_parse(uint8* buff, size_t* buffsize, sockaddr_in* from, MapSession* map_session_data, bool usePreviousKey)
{
    TracyZoneScoped;

    // Modify the header of the outgoing packet
    // The essence of the transformations:
    // - send the client the number of the last packet received from him
    // - assign the outgoing packet the number of the last packet sent to the client +1
    // - write down the current time of sending the packet

    ref<uint16>(buff, 0) = map_session_data->server_packet_id;
    ref<uint16>(buff, 2) = map_session_data->client_packet_id;

    // save the current time (32 BIT!)
    ref<uint32>(buff, 8) = (uint32)time(nullptr);

    // build a large package, consisting of several small packets
    CCharEntity* PChar = map_session_data->PChar;
    TracyZoneString(PChar->name);

    std::unique_ptr<CBasicPacket> PSmallPacket = nullptr;

    uint32 PacketSize               = UINT32_MAX;
    size_t PacketCount              = std::clamp<size_t>(PChar->getPacketCount(), 0, kMaxPacketPerCompression);
    uint8  packets                  = 0;
    bool   incrementKeyAfterEncrypt = false;

    TotalPacketsToSendPerTick += static_cast<uint32>(PChar->getPacketCount());

#ifdef LOG_OUTGOING_PACKETS
    PacketGuard::PrintPacketList(PChar);
#endif

    do
    {
        do
        {
            *buffsize       = FFXI_HEADER_SIZE;
            auto packetList = PChar->getPacketListCopy();
            packets         = 0;

            while (!packetList.empty() && *buffsize + packetList.front()->getSize() < kMaxBufferSize && static_cast<size_t>(packets) < PacketCount)
            {
                PSmallPacket = std::move(packetList.front());
                packetList.pop_front();

                PSmallPacket->setSequence(map_session_data->server_packet_id);
                auto type = PSmallPacket->getType();

                // Apply packet mods if available
                if (!PacketMods[PChar->id].empty())
                {
                    if (PacketMods[PChar->id].find(type) != PacketMods[PChar->id].end())
                    {
                        for (auto& entry : PacketMods[PChar->id][type])
                        {
                            auto offset = entry.first;
                            auto value  = entry.second;
                            ShowInfo(fmt::format("Packet Mod ({}): {:04X}: {:04X}: {:02X}",
                                                 PChar->name, type, offset, value));
                            PSmallPacket->ref<uint8>(offset) = value;
                        }
                    }
                }

                // Store zoneout packet in case we need to re-send this
                if (type == 0x00B && map_session_data->blowfish.status == BLOWFISH_PENDING_ZONE && map_session_data->zone_ipp.getRawIPP() == 0)
                {
                    auto IPPacket = static_cast<CServerIPPacket*>(PSmallPacket.get());

                    map_session_data->zone_ipp  = IPPacket->zoneIPP();
                    map_session_data->zone_type = IPPacket->zoneType();

                    incrementKeyAfterEncrypt = true;

                    // Set client port to zero, indicating the client tried to zone out and no longer has a port until the next 0x00A
                    db::preparedStmt("UPDATE accounts_sessions SET client_port = 0, last_zoneout_time = NOW() WHERE charid = ?", map_session_data->charID);
                }

                std::memcpy(buff + *buffsize, *PSmallPacket, PSmallPacket->getSize());

                *buffsize += PSmallPacket->getSize();

                packets++;
            }

            PacketCount -= PacketCount / 3;

            // Compress the data without regard to the header
            // The returned size is 8 times the real data
            PacketSize = zlib_compress((int8*)(buff + FFXI_HEADER_SIZE), (uint32)(*buffsize - FFXI_HEADER_SIZE), (int8*)PScratchBuff.data(), kMaxBufferSize);

            // handle compression error
            if (PacketSize == static_cast<uint32>(-1))
            {
                ShowError("zlib compression error");
                continue;
            }

            ref<uint32>(PScratchBuff.data(), zlib_compressed_size(PacketSize)) = PacketSize;

            PacketSize = (uint32)zlib_compressed_size(PacketSize) + 4;

        } while (PacketCount > 0 && PacketSize > 1300 - FFXI_HEADER_SIZE - 16); // max size for client to accept

        if (PacketSize == static_cast<uint32>(-1))
        {
            if (PChar->getPacketCount() > 0)
            {
                PChar->erasePackets(1);
                PacketCount = PChar->getPacketCount();
            }
            else
            {
                *buffsize = 0;
                return -1;
            }
        }
    } while (PacketSize == static_cast<uint32>(-1));
    PChar->erasePackets(packets);
    TotalPacketsSentPerTick += packets;
    TracyZoneString(fmt::format("Sending {} packets", packets));

    // Record data size excluding header
    uint8 hash[16];
    md5(PScratchBuff.data(), hash, PacketSize);
    std::memcpy(PScratchBuff.data() + PacketSize, hash, 16);
    PacketSize += 16;

    if (PacketSize > kMaxBufferSize)
    {
        ShowCritical("Memory manager: PScratchBuff is overflowed (%u)", PacketSize);
    }

    // Making total packet
    std::memcpy(buff + FFXI_HEADER_SIZE, PScratchBuff.data(), PacketSize);

    uint32 CypherSize = (PacketSize / 4) & -2;

    blowfish_t* pbfkey = nullptr;

    if (map_session_data->blowfish.status == BLOWFISH_PENDING_ZONE && usePreviousKey)
    {
        pbfkey = &map_session_data->prev_blowfish;
    }
    else
    {
        pbfkey = &map_session_data->blowfish;
    }

    for (uint32 j = 0; j < CypherSize; j += 2)
    {
        blowfish_encipher((uint32*)(buff) + j + 7, (uint32*)(buff) + j + 8, pbfkey->P, pbfkey->S[0]);
    }

    // Increment the key after 0x00B was sent (otherwise the client would never get it!)
    if (incrementKeyAfterEncrypt)
    {
        map_session_data->incrementBlowfish();

        char session_key[20 * 2 + 1];
        bin2hex(session_key, (uint8*)map_session_data->blowfish.key, 20);
        const char* fmtQuery = "UPDATE accounts_sessions SET session_key = x'%s' WHERE charid = %u";

        _sql->Query(fmtQuery, session_key, PChar->id);
    }

    // Control the size of the sent packet.
    // if its size exceeds 1400 bytes (data size + 42 bytes IP header),
    // then the client ignores the packet and returns a message about its loss

    // in case of a similar situation, display a warning message and
    // decrease the size of BuffMaxSize in 4 byte increments until it is removed (manually)

    *buffsize = PacketSize + FFXI_HEADER_SIZE;

    auto remainingPackets = PChar->getPacketCount();
    TotalPacketsDelayedPerTick += static_cast<uint32>(remainingPackets);

    if (settings::get<bool>("logging.DEBUG_PACKET_BACKLOG"))
    {
        TracyZoneString(fmt::format("{} packets remaining", remainingPackets));
        if (remainingPackets > kMaxPacketBacklogSize)
        {
            if (PChar->loc.zone == nullptr)
            {
                ShowWarning(fmt::format("Packet backlog exists for char {} with a nullptr zone. Clearing packet list.", PChar->name));
                PChar->clearPacketList();
                return 0;
            }
            ShowWarning(fmt::format("Packet backlog for char {} in {} is {}! Limit is: {}",
                                    PChar->name, PChar->loc.zone->getName(), remainingPackets, kMaxPacketBacklogSize));
        }
    }

    return 0;
}

/************************************************************************
 *                                                                       *
 *  Timer function that cleans up all timed out players                  *
 *  and removes stale dynamic targIDs after some time                    *
 *                                                                       *
 ************************************************************************/

int32 map_cleanup(time_point tick, CTaskMgr::CTask* PTask)
{
    TracyZoneScoped;

    gMapSessions.cleanupSessions();

    // clang-format off
    zoneutils::ForEachZone([](CZone* PZone)
    {
        PZone->GetZoneEntities()->EraseStaleDynamicTargIDs();
    });
    // clang-format on

    return 0;
}

int32 map_garbage_collect(time_point tick, CTaskMgr::CTask* PTask)
{
    TracyZoneScoped;

    ShowInfo("CTaskMgr Active Tasks: %i", CTaskMgr::getInstance()->getTaskList().size());

    luautils::garbageCollectFull();
    return 0;
}

void log_init(int argc, char** argv)
{
    std::string logFile;
#ifdef DEBUGLOGMAP
#ifdef WIN32
    logFile = "log\\map-server.log";
#else
    logFile = "log/map-server.log";
#endif
#endif
    bool defaultname = true;
    bool appendDate{};
    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "--ip") == 0 && defaultname)
        {
            logFile = argv[i + 1];
        }
        else if (strcmp(argv[i], "--port") == 0 && defaultname)
        {
            logFile.append(argv[i + 1]);
        }
        else if (strcmp(argv[i], "--log") == 0)
        {
            defaultname = false;
            logFile     = argv[i + 1];
        }

        if (strcmp(argv[i], "--append-date") == 0)
        {
            appendDate = true;
        }
    }
    logging::InitializeLog("map", logFile, appendDate);
}
