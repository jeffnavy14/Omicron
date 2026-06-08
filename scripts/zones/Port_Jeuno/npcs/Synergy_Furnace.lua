-----------------------------------
-- Area: Port Jeuno (and others)
--  NPC: Synergy Furnace
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

local ambuscadeItems = {
    [xi.item.AMBUSCADE_VOUCHER_HEAD] = 2,
    [xi.item.AMBUSCADE_VOUCHER_BODY] = 5,
    [xi.item.AMBUSCADE_VOUCHER_HANDS] = 1,
    [xi.item.AMBUSCADE_VOUCHER_LEGS] = 3,
    [xi.item.AMBUSCADE_VOUCHER_FEET] = 1,
    [xi.item.AMBUSCADE_VOUCHER_BACK] = 3,
    [xi.item.AMBUSCADE_VOUCHER_HEAD_P1] = 7,
    [xi.item.AMBUSCADE_VOUCHER_BODY_P1] = 17,
    [xi.item.AMBUSCADE_VOUCHER_HANDS_P1] = 4,
    [xi.item.AMBUSCADE_VOUCHER_LEGS_P1] = 11,
    [xi.item.AMBUSCADE_VOUCHER_FEET_P1] = 2,
    [xi.item.AMBUSCADE_VOUCHER_FINGERS] = 10,
    [xi.item.AMBUSCADE_VOUCHER_WEAPON] = 19,
    [xi.item.AMBUSCADE_CHIT_HEADGEAR] = 2,
    [xi.item.AMBUSCADE_CHIT_BODYGEAR] = 5,
    [xi.item.AMBUSCADE_CHIT_HANDGEAR] = 1,
    [xi.item.AMBUSCADE_CHIT_LEGGEAR] = 3,
    [xi.item.AMBUSCADE_CHIT_FOOTGEAR] = 1,
    [xi.item.AMBUSCADE_CHIT_HEADGEAR_P1] = 7,
    [xi.item.AMBUSCADE_CHIT_BODYGEAR_P1] = 17,
    [xi.item.AMBUSCADE_CHIT_HANDGEAR_P1] = 4,
    [xi.item.AMBUSCADE_CHIT_LEGGEAR_P1] = 10,
    [xi.item.AMBUSCADE_CHIT_FOOTGEAR_P1] = 2,
    [xi.item.AMBUSCADE_CHIT_RING] = 9,
}

local synergyRecipes = {
    {
        name = "Combatant's Torque",
        ingredients = {
            { id = xi.item.CARNAL_TORQUE, qty = 1 },
            { id = xi.item.DECIMUS_TORQUE, qty = 1 },
            { id = xi.item.BILIOUS_TORQUE, qty = 1 },
            { id = xi.item.AGELAST_TORQUE, qty = 1 },
            { id = xi.item.MASKIROVA_TORQUE, qty = 1 },
            { id = xi.item.YARAK_TORQUE, qty = 1 },
            { id = xi.item.ACANTHA_TORQUE, qty = 1 },
        },
        result = xi.item.COMBATANTS_TORQUE,
        successRate = 90, -- 90% chance to succeed
    },
    {
        name = "Incanter's Torque",
        ingredients = {
            { id = xi.item.MELIC_TORQUE, qty = 1 },
            { id = xi.item.HENIC_TORQUE, qty = 1 },
            { id = xi.item.DECEIVERS_TORQUE, qty = 1 },
        },
        result = xi.item.INCANTERS_TORQUE,
        successRate = 90,
    },
    {
        name = "Beast Collar",
        ingredients = {
            { id = xi.item.CARVERS_TORQUE, qty = 1 },
            { id = xi.item.SMITHYS_TORQUE, qty = 1 },
            { id = xi.item.GOLDSMITHS_TORQUE, qty = 1 },
            { id = xi.item.WEAVERS_TORQUE, qty = 1 },
            { id = xi.item.TANNERS_TORQUE, qty = 1 },
            { id = xi.item.BONEWORKERS_TORQUE, qty = 1 },
            { id = xi.item.ALCHEMISTS_TORQUE, qty = 1 },
            { id = xi.item.CULINARIANS_TORQUE, qty = 1 },
        },
        result = xi.item.BEAST_COLLAR,
        successRate = 90,
        onSuccess = function(player)
            player:addItem({id=13121, signature="CraftMaster"})
        end,
    },
}

-- All Weapon Lists
local relicWeaponsListII = {
    { name = "Spharai (119 II)", id = xi.item.SPHARAI_119_II },
    { name = "Mandau (119 II)", id = xi.item.MANDAU_119_II },
    { name = "Excalibur (119 II)", id = xi.item.EXCALIBUR_119_II },
    { name = "Ragnarok (119 II)", id = xi.item.RAGNAROK_119_II },
    { name = "Guttler (119 II)", id = xi.item.GUTTLER_119_II },
    { name = "Bravura (119 II)", id = xi.item.BRAVURA_119_II },
    { name = "Apocalypse (119 II)", id = xi.item.APOCALYPSE_119_II },
    { name = "Gungnir (119 II)", id = xi.item.GUNGNIR_119_II },
    { name = "Kikoku (119 II)", id = xi.item.KIKOKU_119_II },
    { name = "Amanomurakumo (119 II)", id = xi.item.AMANOMURAKUMO_119_II },
    { name = "Mjollnir (119 II)", id = xi.item.MJOLLNIR_119_II },
    { name = "Claustrum (119 II)", id = xi.item.CLAUSTRUM_119_II },
    { name = "Yoichinoyumi (119 II)", id = xi.item.YOICHINOYUMI_119_II },
    { name = "Annihilator (119 II)", id = xi.item.ANNIHILATOR_119_II },
}

local relicWeaponsListIII = {
    { name = "Spharai (119 III)", id = xi.item.SPHARAI_119_III },
    { name = "Mandau (119 III)", id = xi.item.MANDAU_119_III },
    { name = "Excalibur (119 III)", id = xi.item.EXCALIBUR_119_III },
    { name = "Ragnarok (119 III)", id = xi.item.RAGNAROK_119_III },
    { name = "Guttler (119 III)", id = xi.item.GUTTLER_119_III },
    { name = "Bravura (119 III)", id = xi.item.BRAVURA_119_III },
    { name = "Apocalypse (119 III)", id = xi.item.APOCALYPSE_119_III },
    { name = "Gungnir (119 III)", id = xi.item.GUNGNIR_119_III },
    { name = "Kikoku (119 III)", id = xi.item.KIKOKU_119_III },
    { name = "Amanomurakumo (119 III)", id = xi.item.AMANOMURAKUMO_119_III },
    { name = "Mjollnir (119 III)", id = xi.item.MJOLLNIR_119_III },
    { name = "Claustrum (119 III)", id = xi.item.CLAUSTRUM_119_III },
    { name = "Yoichinoyumi (119 III)", id = xi.item.YOICHINOYUMI_119_III },
    { name = "Annihilator (119 III)", id = xi.item.ANNIHILATOR_119_III },
}

local empyreanWeaponsListII = {
    { name = "Verethragna (119 II)", id = xi.item.VERETHRAGNA_119_II },
    { name = "Twashtar (119 II)", id = xi.item.TWASHTAR_119_II },
    { name = "Almace (119 II)", id = xi.item.ALMACE_119_II },
    { name = "Caladbolg (119 II)", id = xi.item.CALADBOLG_119_II },
    { name = "Farsha (119 II)", id = xi.item.FARSHA_119_II },
    { name = "Ukonvasara (119 II)", id = xi.item.UKONVASARA_119_II },
    { name = "Redemption (119 II)", id = xi.item.REDEMPTION_119_II },
    { name = "Rhongomiant (119 II)", id = xi.item.RHONGOMIANT_119_II },
    { name = "Kannagi (119 II)", id = xi.item.KANNAGI_119_II },
    { name = "Masamune (119 II)", id = xi.item.MASAMUNE_119_II },
    { name = "Gambanteinn (119 II)", id = xi.item.GAMBANTEINN_119_II },
    { name = "Hvergelmir (119 II)", id = xi.item.HVERGELMIR_119_II },
    { name = "Gandiva (119 II)", id = xi.item.GANDIVA_119_II },
    { name = "Armageddon (119 II)", id = xi.item.ARMAGEDDON_119_II },
}

local empyreanWeaponsListIII = {
    { name = "Verethragna (119 III)", id = xi.item.VERETHRAGNA_119_III },
    { name = "Twashtar (119 III)", id = xi.item.TWASHTAR_119_III },
    { name = "Almace (119 III)", id = xi.item.ALMACE_119_III },
    { name = "Caladbolg (119 III)", id = xi.item.CALADBOLG_119_III },
    { name = "Farsha (119 III)", id = xi.item.FARSHA_119_III },
    { name = "Ukonvasara (119 III)", id = xi.item.UKONVASARA_119_III },
    { name = "Redemption (119 III)", id = xi.item.REDEMPTION_119_III },
    { name = "Rhongomiant (119 III)", id = xi.item.RHONGOMIANT_119_III },
    { name = "Kannagi (119 III)", id = xi.item.KANNAGI_119_III },
    { name = "Masamune (119 III)", id = xi.item.MASAMUNE_119_III },
    { name = "Gambanteinn (119 III)", id = xi.item.GAMBANTEINN_119_III },
    { name = "Hvergelmir (119 III)", id = xi.item.HVERGELMIR_119_III },
    { name = "Gandiva (119 III)", id = xi.item.GANDIVA_119_III },
    { name = "Armageddon (119 III)", id = xi.item.ARMAGEDDON_119_III },
}

local mythicWeaponsListII = {
    { name = "Glanzfaust (119 II)", id = xi.item.GLANZFAUST_119_II },
    { name = "Vajra (119 II)", id = xi.item.VAJRA_119_II },
    { name = "Murgleis (119 II)", id = xi.item.MURGLEIS_119_II },
    { name = "Burtgang (119 II)", id = xi.item.BURTGANG_119_II },
    { name = "Tizona (119 II)", id = xi.item.TIZONA_119_II },
    { name = "Aymur (119 II)", id = xi.item.AYMUR_119_II },
    { name = "Conqueror (119 II)", id = xi.item.CONQUEROR_119_II },
    { name = "Liberator (119 II)", id = xi.item.LIBERATOR_119_II },
    { name = "Ryunohige (119 II)", id = xi.item.RYUNOHIGE_119_II },
    { name = "Nagi (119 II)", id = xi.item.NAGI_119_II },
    { name = "Kogarasumaru (119 II)", id = xi.item.KOGARASUMARU_119_II },
    { name = "Yagrush (119 II)", id = xi.item.YAGRUSH_119_II },
    { name = "Laevateinn (119 II)", id = xi.item.LAEVATEINN_119_II },
    { name = "Nirvana (119 II)", id = xi.item.NIRVANA_119_II },
    { name = "Tupsimati (119 II)", id = xi.item.TUPSIMATI_119_II },
    { name = "Carnwenhan (119 II)", id = xi.item.CARNWENHAN_119_II },
    { name = "Gastraphetes (119 II)", id = xi.item.GASTRAPHETES_119_II },
    { name = "Death Penalty (119 II)", id = xi.item.DEATH_PENALTY_119_II },
    { name = "Kenkonken (119 II)", id = xi.item.KENKONKEN_119_II },
    { name = "Terpsichore (119 II)", id = xi.item.TERPSICHORE_119_II },
    { name = "Idris (119 II)", id = xi.item.IDRIS_119_II },
    { name = "Epeolatry (119 II)", id = xi.item.EPEOLATRY_119_II },
}

local mythicWeaponsListIII = {
    { name = "Glanzfaust (119 III)", id = xi.item.GLANZFAUST_119_III },
    { name = "Vajra (119 III)", id = xi.item.VAJRA_119_III },
    { name = "Murgleis (119 III)", id = xi.item.MURGLEIS_119_III },
    { name = "Burtgang (119 III)", id = xi.item.BURTGANG_119_III },
    { name = "Tizona (119 III)", id = xi.item.TIZONA_119_III },
    { name = "Aymur (119 III)", id = xi.item.AYMUR_119_III },
    { name = "Conqueror (119 III)", id = xi.item.CONQUEROR_119_III },
    { name = "Liberator (119 III)", id = xi.item.LIBERATOR_119_III },
    { name = "Ryunohige (119 III)", id = xi.item.RYUNOHIGE_119_III },
    { name = "Nagi (119 III)", id = xi.item.NAGI_119_III },
    { name = "Kogarasumaru (119 III)", id = xi.item.KOGARASUMARU_119_III },
    { name = "Yagrush (119 III)", id = xi.item.YAGRUSH_119_III },
    { name = "Laevateinn (119 III)", id = xi.item.LAEVATEINN_119_III },
    { name = "Nirvana (119 III)", id = xi.item.NIRVANA_119_III },
    { name = "Tupsimati (119 III)", id = xi.item.TUPSIMATI_119_III },
    { name = "Carnwenhan (119 III)", id = xi.item.CARNWENHAN_119_III },
    { name = "Gastraphetes (119 III)", id = xi.item.GASTRAPHETES_119_III },
    { name = "Death Penalty (119 III)", id = xi.item.DEATH_PENALTY_119_III },
    { name = "Kenkonken (119 III)", id = xi.item.KENKONKEN_119_III },
    { name = "Terpsichore (119 III)", id = xi.item.TERPSICHORE_119_III },
    { name = "Idris (119 III)", id = xi.item.IDRIS_119_III },
    { name = "Epeolatry (119 III)", id = xi.item.EPEOLATRY_119_III },
}

-- All Weapon II/III Maps (with nil checks)

local relicWeaponsII = {}
for _, v in ipairs(relicWeaponsListII) do
    if v.id ~= nil then
        relicWeaponsII[v.id] = true
    else
        print(string.format("Warning: Missing item ID for Relic Weapon II: %s", v.name))
    end
end

local relicWeaponsIII = {}
for _, v in ipairs(relicWeaponsListIII) do
    if v.id ~= nil then
        relicWeaponsIII[v.id] = true
    else
        print(string.format("Warning: Missing item ID for Relic Weapon III: %s", v.name))
    end
end

local empyreanWeaponsII = {}
for _, v in ipairs(empyreanWeaponsListII) do
    if v.id ~= nil then
        empyreanWeaponsII[v.id] = true
    else
        print(string.format("Warning: Missing item ID for Empyrean Weapon II: %s", v.name))
    end
end

local empyreanWeaponsIII = {}
for _, v in ipairs(empyreanWeaponsListIII) do
    if v.id ~= nil then
        empyreanWeaponsIII[v.id] = true
    else
        print(string.format("Warning: Missing item ID for Empyrean Weapon III: %s", v.name))
    end
end

local mythicWeaponsII = {}
for _, v in ipairs(mythicWeaponsListII) do
    if v.id ~= nil then
        mythicWeaponsII[v.id] = true
    else
        print(string.format("Warning: Missing item ID for Mythic Weapon II: %s", v.name))
    end
end

local mythicWeaponsIII = {}
for _, v in ipairs(mythicWeaponsListIII) do
    if v.id ~= nil then
        mythicWeaponsIII[v.id] = true
    else
        print(string.format("Warning: Missing item ID for Mythic Weapon III: %s", v.name))
    end
end

-- All Aggregate Weapon Maps

local relicWeapons = {}
for id, _ in pairs(relicWeaponsII) do relicWeapons[id] = true end
for id, _ in pairs(relicWeaponsIII) do relicWeapons[id] = true end

local empyreanWeapons = {}
for id, _ in pairs(empyreanWeaponsII) do empyreanWeapons[id] = true end
for id, _ in pairs(empyreanWeaponsIII) do empyreanWeapons[id] = true end

local mythicWeapons = {}
for id, _ in pairs(mythicWeaponsII) do mythicWeapons[id] = true end
for id, _ in pairs(mythicWeaponsIII) do mythicWeapons[id] = true end

local ambuscadeWeaponsList = {
    { name = "Karambit", id = xi.item.KARAMBIT },
    { name = "Tauret", id = xi.item.TAURET },
    { name = "Naegling", id = xi.item.NAEGLING },
    { name = "Nandaka", id = xi.item.NANDAKA },
    { name = "Dolichenus", id = xi.item.DOLICHENUS },
    { name = "Lycurgos", id = xi.item.LYCURGOS },
    { name = "Drepanum", id = xi.item.DREPANUM },
    { name = "Shining One", id = xi.item.SHINING_ONE },
    { name = "Gokotai", id = xi.item.GOKOTAI },
    { name = "Hachimonji", id = xi.item.HACHIMONJI },
    { name = "Maxentius", id = xi.item.MAXENTIUS },
    { name = "Xoanon", id = xi.item.XOANON },
    { name = "Ullr", id = xi.item.ULLR },
    { name = "Khonsu", id = xi.item.KHONSU },
}

local ambuscadeWeapons = {}
for _, v in ipairs(ambuscadeWeaponsList) do
    ambuscadeWeapons[v.id] = true
end

local adoulinRingsList = {
    { name = "Adoulin Ring +1", id = xi.item.ADOULIN_RING_P1 },
    { name = "Gorney Ring +1", id = xi.item.GORNEY_RING_P1 },
    { name = "Haverton Ring +1", id = xi.item.HAVERTON_RING_P1 },
    { name = "Janniston Ring +1", id = xi.item.JANNISTON_RING_P1 },
    { name = "Karieyh Ring +1", id = xi.item.KARIEYH_RING_P1 },
    { name = "Orvail Ring +1", id = xi.item.ORVAIL_RING_P1 },
    { name = "Renaye Ring +1", id = xi.item.RENAYE_RING_P1 },
    { name = "Shneddick Ring +1", id = xi.item.SHNEDDICK_RING_P1 },
    { name = "Thurandaut Ring +1", id = xi.item.THURANDAUT_RING_P1 },
    { name = "Vocane Ring +1", id = xi.item.VOCANE_RING_P1 },
    { name = "Weatherspoon Ring +1", id = xi.item.WEATHERSPOON_RING_P1 },
    { name = "Woltaris Ring +1", id = xi.item.WOLTARIS_RING_P1 },
}

local adoulinRings = {}
for _, v in ipairs(adoulinRingsList) do
    adoulinRings[v.id] = true
end

local showRingExchangeMenu
showRingExchangeMenu = function(player, page)
    local tradedItemId = player:getLocalVar("SynergyAdoulinRingTrade")

    local availableRings = {}
    for _, ring in ipairs(adoulinRingsList) do
        if ring.id ~= tradedItemId and not player:hasItem(ring.id) then
            table.insert(availableRings, ring)
        end
    end

    if #availableRings == 0 then
        player:printToPlayer("You already possess all available exchange rings.", xi.msg.channel.SYSTEM_3)
        if tradedItemId > 0 then
            npcUtil.giveItem(player, tradedItemId)
            player:setLocalVar("SynergyAdoulinRingTrade", 0)
        end
        return
    end

    page = page or 1
    local itemsPerPage = 3
    local totalItems = #availableRings
    local startIndex = (page - 1) * itemsPerPage + 1
    local endIndex = math.min(startIndex + itemsPerPage - 1, totalItems)

    local options = {}

    if page > 1 then
        table.insert(options, { 'Previous Page', function(pArg)
            pArg:timer(50, function(p) showRingExchangeMenu(p, page - 1) end)
        end })
    end

    for i = startIndex, endIndex do
        local ring = availableRings[i]
        table.insert(options, { ring.name, function(pArg)
            if npcUtil.giveItem(pArg, { { ring.id, 1 } }) then
                pArg:setLocalVar("SynergyAdoulinRingTrade", 0)
                pArg:setCharVar("AdoulinRingExchangeTally", NextConquestTally())
            else
                npcUtil.giveItem(pArg, pArg:getLocalVar("SynergyAdoulinRingTrade"))
                pArg:setLocalVar("SynergyAdoulinRingTrade", 0)
            end
        end })
    end

    if endIndex < totalItems then
        table.insert(options, { 'Next Page', function(pArg)
            pArg:timer(50, function(p) showRingExchangeMenu(p, page + 1) end)
        end })
    end

    table.insert(options, { 'Cancel', function(pArg)
        local returnedItem = pArg:getLocalVar("SynergyAdoulinRingTrade")
        if returnedItem > 0 then
            npcUtil.giveItem(pArg, returnedItem)
            pArg:setLocalVar("SynergyAdoulinRingTrade", 0)
        end
    end })

    player:customMenu({
        title = 'Select a ring to exchange for:',
        options = options,
        onCancelled = function(pArg)
            local returnedItem = pArg:getLocalVar("SynergyAdoulinRingTrade")
            if returnedItem > 0 then
                npcUtil.giveItem(pArg, returnedItem)
                pArg:setLocalVar("SynergyAdoulinRingTrade", 0)
            end
        end
    })
end

local showEmpyreanExchangeMenu
showEmpyreanExchangeMenu = function(player, page, weaponList, tier)
    local tradedItemId = player:getLocalVar("SynergyEmpyreanWeaponTrade")

    local availableWeapons = {}
    for _, weapon in ipairs(weaponList) do
        if weapon.id and weapon.id ~= tradedItemId and not player:hasItem(weapon.id) then
            table.insert(availableWeapons, weapon)
        end
    end

    if #availableWeapons == 0 then
        player:printToPlayer("You already possess all available exchange weapons.", xi.msg.channel.SYSTEM_3)
        if tradedItemId > 0 then
            npcUtil.giveItem(player, tradedItemId)
            player:setLocalVar("SynergyEmpyreanWeaponTrade", 0)
        end
        return
    end

    page = page or 1
    local itemsPerPage = 3
    local totalItems = #availableWeapons
    local startIndex = (page - 1) * itemsPerPage + 1
    local endIndex = math.min(startIndex + itemsPerPage - 1, totalItems)

    local options = {}

    if page > 1 then
        table.insert(options, { 'Previous Page', function(pArg)
            pArg:timer(50, function(p) showEmpyreanExchangeMenu(p, page - 1, weaponList, tier) end)
        end })
    end

    for i = startIndex, endIndex do
        local weapon = availableWeapons[i]
        table.insert(options, { weapon.name, function(pArg)
            if pArg:getGil() < 50000000 then
                pArg:printToPlayer("You do not have enough Gil.", xi.msg.channel.SYSTEM_3)
                npcUtil.giveItem(pArg, pArg:getLocalVar("SynergyEmpyreanWeaponTrade"))
                pArg:setLocalVar("SynergyEmpyreanWeaponTrade", 0)
                return
            end

            if npcUtil.giveItem(pArg, { { weapon.id, 1 } }) then
                pArg:delGil(50000000)
                pArg:setLocalVar("SynergyEmpyreanWeaponTrade", 0)
                pArg:setCharVar("REMAWeaponExchangeMonth", tonumber(os.date('%Y%m')))
            else
                npcUtil.giveItem(pArg, pArg:getLocalVar("SynergyEmpyreanWeaponTrade"))
                pArg:setLocalVar("SynergyEmpyreanWeaponTrade", 0)
            end
        end })
    end

    if endIndex < totalItems then
        table.insert(options, { 'Next Page', function(pArg)
            pArg:timer(50, function(p) showEmpyreanExchangeMenu(p, page + 1, weaponList, tier) end)
        end })
    end

    table.insert(options, { 'Cancel', function(pArg)
        local returnedItem = pArg:getLocalVar("SynergyEmpyreanWeaponTrade")
        if returnedItem > 0 then
            npcUtil.giveItem(pArg, returnedItem)
            pArg:setLocalVar("SynergyEmpyreanWeaponTrade", 0)
        end
    end })

    player:customMenu({
        title = string.format('Select an Empyrean weapon (Tier %s) to exchange:', tier),
        options = options,
        onCancelled = function(pArg)
            local returnedItem = pArg:getLocalVar("SynergyEmpyreanWeaponTrade")
            if returnedItem > 0 then
                npcUtil.giveItem(pArg, returnedItem)
                pArg:setLocalVar("SynergyEmpyreanWeaponTrade", 0)
            end
        end
    })
end

local showRelicExchangeMenu
showRelicExchangeMenu = function(player, page, weaponList, tier)
    local tradedItemId = player:getLocalVar("SynergyRelicWeaponTrade")

    local availableWeapons = {}
    for _, weapon in ipairs(weaponList) do
        if weapon.id and weapon.id ~= tradedItemId and not player:hasItem(weapon.id) then
            table.insert(availableWeapons, weapon)
        end
    end

    if #availableWeapons == 0 then
        player:printToPlayer("You already possess all available exchange weapons.", xi.msg.channel.SYSTEM_3)
        if tradedItemId > 0 then
            npcUtil.giveItem(player, tradedItemId)
            player:setLocalVar("SynergyRelicWeaponTrade", 0)
        end
        return
    end

    page = page or 1
    local itemsPerPage = 3
    local totalItems = #availableWeapons
    local startIndex = (page - 1) * itemsPerPage + 1
    local endIndex = math.min(startIndex + itemsPerPage - 1, totalItems)

    local options = {}

    if page > 1 then
        table.insert(options, { 'Previous Page', function(pArg)
            pArg:timer(50, function(p) showRelicExchangeMenu(p, page - 1, weaponList, tier) end)
        end })
    end

    for i = startIndex, endIndex do
        local weapon = availableWeapons[i]
        table.insert(options, { weapon.name, function(pArg)
            if pArg:getGil() < 50000000 then
                pArg:printToPlayer("You do not have enough Gil.", xi.msg.channel.SYSTEM_3)
                npcUtil.giveItem(pArg, pArg:getLocalVar("SynergyRelicWeaponTrade"))
                pArg:setLocalVar("SynergyRelicWeaponTrade", 0)
                return
            end

            if npcUtil.giveItem(pArg, { { weapon.id, 1 } }) then
                pArg:delGil(50000000)
                pArg:setLocalVar("SynergyRelicWeaponTrade", 0)
                pArg:setCharVar("REMAWeaponExchangeMonth", tonumber(os.date('%Y%m')))
            else
                npcUtil.giveItem(pArg, pArg:getLocalVar("SynergyRelicWeaponTrade"))
                pArg:setLocalVar("SynergyRelicWeaponTrade", 0)
            end
        end })
    end

    if endIndex < totalItems then
        table.insert(options, { 'Next Page', function(pArg)
            pArg:timer(50, function(p) showRelicExchangeMenu(p, page + 1, weaponList, tier) end)
        end })
    end

    table.insert(options, { 'Cancel', function(pArg)
        local returnedItem = pArg:getLocalVar("SynergyRelicWeaponTrade")
        if returnedItem > 0 then
            npcUtil.giveItem(pArg, returnedItem)
            pArg:setLocalVar("SynergyRelicWeaponTrade", 0)
        end
    end })

    player:customMenu({
        title = string.format('Select a Relic weapon (Tier %s) to exchange:', tier),
        options = options,
        onCancelled = function(pArg)
            local returnedItem = pArg:getLocalVar("SynergyRelicWeaponTrade")
            if returnedItem > 0 then
                npcUtil.giveItem(pArg, returnedItem)
                pArg:setLocalVar("SynergyRelicWeaponTrade", 0)
            end
        end
    })
end

local showMythicExchangeMenu
showMythicExchangeMenu = function(player, page, weaponList, tier)
    local tradedItemId = player:getLocalVar("SynergyMythicWeaponTrade")

    local availableWeapons = {}
    for _, weapon in ipairs(weaponList) do
         if weapon.id and weapon.id ~= tradedItemId and not player:hasItem(weapon.id) then
            table.insert(availableWeapons, weapon)
        end
    end

    if #availableWeapons == 0 then
        player:printToPlayer("You already possess all available exchange weapons.", xi.msg.channel.SYSTEM_3)
        if tradedItemId > 0 then
            npcUtil.giveItem(player, tradedItemId)
            player:setLocalVar("SynergyMythicWeaponTrade", 0)
        end
        return
    end

    page = page or 1
    local itemsPerPage = 3
    local totalItems = #availableWeapons
    local startIndex = (page - 1) * itemsPerPage + 1
    local endIndex = math.min(startIndex + itemsPerPage - 1, totalItems)

    local options = {}

    if page > 1 then
        table.insert(options, { 'Previous Page', function(pArg)
            pArg:timer(50, function(p) showMythicExchangeMenu(p, page - 1, weaponList, tier) end)
        end })
    end

    for i = startIndex, endIndex do
        local weapon = availableWeapons[i]
        table.insert(options, { weapon.name, function(pArg)
            if pArg:getGil() < 50000000 then
                pArg:printToPlayer("You do not have enough Gil.", xi.msg.channel.SYSTEM_3)
                npcUtil.giveItem(pArg, pArg:getLocalVar("SynergyMythicWeaponTrade"))
                pArg:setLocalVar("SynergyMythicWeaponTrade", 0)
                return
            end

            if npcUtil.giveItem(pArg, { { weapon.id, 1 } }) then
                pArg:delGil(50000000)
                pArg:setLocalVar("SynergyMythicWeaponTrade", 0)
                pArg:setCharVar("REMAWeaponExchangeMonth", tonumber(os.date('%Y%m')))
            else
                npcUtil.giveItem(pArg, pArg:getLocalVar("SynergyMythicWeaponTrade"))
                pArg:setLocalVar("SynergyMythicWeaponTrade", 0)
            end
        end })
    end

    if endIndex < totalItems then
        table.insert(options, { 'Next Page', function(pArg)
            pArg:timer(50, function(p) showMythicExchangeMenu(p, page + 1, weaponList, tier) end)
        end })
    end

    table.insert(options, { 'Cancel', function(pArg)
        local returnedItem = pArg:getLocalVar("SynergyMythicWeaponTrade")
        if returnedItem > 0 then
            npcUtil.giveItem(pArg, returnedItem)
            pArg:setLocalVar("SynergyMythicWeaponTrade", 0)
        end
    end })

    player:customMenu({
        title = string.format('Select a Mythic weapon (Tier %s) to exchange:', tier),
        options = options,
        onCancelled = function(pArg)
            local returnedItem = pArg:getLocalVar("SynergyMythicWeaponTrade")
            if returnedItem > 0 then
                npcUtil.giveItem(pArg, returnedItem)
                pArg:setLocalVar("SynergyMythicWeaponTrade", 0)
            end
        end
    })
end

local showWeaponExchangeMenu
showWeaponExchangeMenu = function(player, page)
    local tradedItemId = player:getLocalVar("SynergyAmbuscadeWeaponTrade")

    local availableWeapons = {}
    for _, weapon in ipairs(ambuscadeWeaponsList) do
        if weapon.id ~= tradedItemId and not player:hasItem(weapon.id) then
            table.insert(availableWeapons, weapon)
        end
    end

    if #availableWeapons == 0 then
        player:printToPlayer("You already possess all available exchange weapons.", xi.msg.channel.SYSTEM_3)
        if tradedItemId > 0 then
            npcUtil.giveItem(player, tradedItemId)
            player:setLocalVar("SynergyAmbuscadeWeaponTrade", 0)
        end
        return
    end

    page = page or 1
    local itemsPerPage = 3
    local totalItems = #availableWeapons
    local startIndex = (page - 1) * itemsPerPage + 1
    local endIndex = math.min(startIndex + itemsPerPage - 1, totalItems)

    local options = {}

    if page > 1 then
        table.insert(options, { 'Previous Page', function(pArg)
            pArg:timer(50, function(p) showWeaponExchangeMenu(p, page - 1) end)
        end })
    end

    for i = startIndex, endIndex do
        local weapon = availableWeapons[i]
        table.insert(options, { weapon.name, function(pArg)
            if npcUtil.giveItem(pArg, { { weapon.id, 1 } }) then
                pArg:setLocalVar("SynergyAmbuscadeWeaponTrade", 0)
            else
                npcUtil.giveItem(pArg, pArg:getLocalVar("SynergyAmbuscadeWeaponTrade"))
                pArg:setLocalVar("SynergyAmbuscadeWeaponTrade", 0)
            end
        end })
    end

    if endIndex < totalItems then
        table.insert(options, { 'Next Page', function(pArg)
            pArg:timer(50, function(p) showWeaponExchangeMenu(p, page + 1) end)
        end })
    end

    table.insert(options, { 'Cancel', function(pArg)
        local returnedItem = pArg:getLocalVar("SynergyAmbuscadeWeaponTrade")
        if returnedItem > 0 then
            npcUtil.giveItem(pArg, returnedItem)
            pArg:setLocalVar("SynergyAmbuscadeWeaponTrade", 0)
        end
    end })

    player:customMenu({
        title = 'Select a weapon to exchange for:',
        options = options,
        onCancelled = function(pArg)
            local returnedItem = pArg:getLocalVar("SynergyAmbuscadeWeaponTrade")
            if returnedItem > 0 then
                npcUtil.giveItem(pArg, returnedItem)
                pArg:setLocalVar("SynergyAmbuscadeWeaponTrade", 0)
            end
        end
    })
end

local function confirmRemaExchange(player, tradedItemId, weaponType, listII, listIII, mapII, mapIII, menuFunc)
    player:customMenu({
        title = 'This exchange costs 50,000,000 Gil. Proceed?',
        options = {
            { 'Yes', function(pArg)
                pArg:timer(50, function(p2)
                    if mapII[tradedItemId] then
                        menuFunc(p2, 1, listII, "II")
                    elseif mapIII[tradedItemId] then
                        menuFunc(p2, 1, listIII, "III")
                    end
                end)
            end },
            { 'No', function(pArg)
                local returnedItem = pArg:getLocalVar("Synergy" .. weaponType .. "WeaponTrade")
                if returnedItem > 0 then
                    npcUtil.giveItem(pArg, returnedItem)
                    pArg:setLocalVar("Synergy" .. weaponType .. "WeaponTrade", 0)
                end
            end }
        },
        onCancelled = function(pArg)
            local returnedItem = pArg:getLocalVar("Synergy" .. weaponType .. "WeaponTrade")
            if returnedItem > 0 then
                npcUtil.giveItem(pArg, returnedItem)
                pArg:setLocalVar("Synergy" .. weaponType .. "WeaponTrade", 0)
            end
        end
    })
end

entity.onTrade = function(player, npc, trade)
    -- Special menu intercept for Ambuscade Vouchers/Chits/Weapons
    if trade:getItemCount() == 1 then
        local tradedItemId = trade:getItemId(0)

        if empyreanWeapons[tradedItemId] then
            local currentMonth = tonumber(os.date('%Y%m'))
            if player:getCharVar("REMAWeaponExchangeMonth") == currentMonth then
                player:printToPlayer("You can only exchange a REMA weapon once per month.", xi.msg.channel.SYSTEM_3)
                return
            end

            if player:getGil() < 50000000 then
                player:printToPlayer("You need 50,000,000 Gil to exchange this weapon.", xi.msg.channel.SYSTEM_3)
                return
            end

            player:setLocalVar("SynergyEmpyreanWeaponTrade", tradedItemId)
            player:tradeComplete()
            
            player:timer(100, function(p)
                confirmRemaExchange(p, tradedItemId, "Empyrean", empyreanWeaponsListII, empyreanWeaponsListIII, empyreanWeaponsII, empyreanWeaponsIII, showEmpyreanExchangeMenu)
            end)
            return
        end

        if relicWeapons[tradedItemId] then
            local currentMonth = tonumber(os.date('%Y%m'))
            if player:getCharVar("REMAWeaponExchangeMonth") == currentMonth then
                player:printToPlayer("You can only exchange a REMA weapon once per month.", xi.msg.channel.SYSTEM_3)
                return
            end

            if player:getGil() < 50000000 then
                player:printToPlayer("You need 50,000,000 Gil to exchange this weapon.", xi.msg.channel.SYSTEM_3)
                return
            end

            player:setLocalVar("SynergyRelicWeaponTrade", tradedItemId)
            player:tradeComplete()
            
            player:timer(100, function(p)
                confirmRemaExchange(p, tradedItemId, "Relic", relicWeaponsListII, relicWeaponsListIII, relicWeaponsII, relicWeaponsIII, showRelicExchangeMenu)
            end)
            return
        end

        if mythicWeapons[tradedItemId] then
            local currentMonth = tonumber(os.date('%Y%m'))
            if player:getCharVar("REMAWeaponExchangeMonth") == currentMonth then
                player:printToPlayer("You can only exchange a REMA weapon once per month.", xi.msg.channel.SYSTEM_3)
                return
            end

            if player:getGil() < 50000000 then
                player:printToPlayer("You need 50,000,000 Gil to exchange this weapon.", xi.msg.channel.SYSTEM_3)
                return
            end

            player:setLocalVar("SynergyMythicWeaponTrade", tradedItemId)
            player:tradeComplete()
            
            player:timer(100, function(p)
                confirmRemaExchange(p, tradedItemId, "Mythic", mythicWeaponsListII, mythicWeaponsListIII, mythicWeaponsII, mythicWeaponsIII, showMythicExchangeMenu)
            end)
            return
        end

        if adoulinRings[tradedItemId] then
            local nextTally = player:getCharVar("AdoulinRingExchangeTally")
            if nextTally > os.time() then
                player:printToPlayer("You can only exchange an Adoulin ring once per conquest tally.", xi.msg.channel.SYSTEM_3)
                return
            end

            player:setLocalVar("SynergyAdoulinRingTrade", tradedItemId)
            player:tradeComplete()
            
            player:timer(100, function(p)
                showRingExchangeMenu(p, 1)
            end)
            return
        end
        
        if ambuscadeWeapons[tradedItemId] then
            player:setLocalVar("SynergyAmbuscadeWeaponTrade", tradedItemId)
            player:tradeComplete()
            
            player:timer(100, function(p)
                showWeaponExchangeMenu(p, 1)
            end)
            return
        end
        
        if ambuscadeItems[tradedItemId] then
            local rewardQty = ambuscadeItems[tradedItemId]
            player:setLocalVar("SynergyAmbuscadeTrade", tradedItemId)
            player:tradeComplete()
            
            player:timer(100, function(p)
                p:customMenu({
                    title = 'Select a reward for your Ambuscade item:',
                    options = {
                        { string.format('%dx Abdhaljs Metal', rewardQty), function(pArg)
                            if npcUtil.giveItem(pArg, { { xi.item.VIAL_OF_ABDHALJS_METAL, rewardQty } }) then
                                local hallmarkReward = rewardQty * 100
                                pArg:addCurrency('current_hallmarks', hallmarkReward)
                                pArg:printToPlayer(string.format("You receive %d hallmarks.", hallmarkReward), xi.msg.channel.SYSTEM_3)
                                pArg:setLocalVar("SynergyAmbuscadeTrade", 0)
                            else
                                npcUtil.giveItem(pArg, pArg:getLocalVar("SynergyAmbuscadeTrade"))
                                pArg:setLocalVar("SynergyAmbuscadeTrade", 0)
                            end
                        end },
                        { string.format('%dx Abdhaljs Fiber', rewardQty), function(pArg)
                            if npcUtil.giveItem(pArg, { { xi.item.LOOP_OF_ABDHALJS_FIBER, rewardQty } }) then
                                local hallmarkReward = rewardQty * 100
                                pArg:addCurrency('current_hallmarks', hallmarkReward)
                                pArg:printToPlayer(string.format("You receive %d hallmarks.", hallmarkReward), xi.msg.channel.SYSTEM_3)
                                pArg:setLocalVar("SynergyAmbuscadeTrade", 0)
                            else
                                npcUtil.giveItem(pArg, pArg:getLocalVar("SynergyAmbuscadeTrade"))
                                pArg:setLocalVar("SynergyAmbuscadeTrade", 0)
                            end
                        end },
                        { 'Cancel', function(pArg)
                            local returnedItem = pArg:getLocalVar("SynergyAmbuscadeTrade")
                            if returnedItem > 0 then
                                npcUtil.giveItem(pArg, returnedItem)
                                pArg:setLocalVar("SynergyAmbuscadeTrade", 0)
                            end
                        end },
                    },
                    onCancelled = function(pArg)
                        local returnedItem = pArg:getLocalVar("SynergyAmbuscadeTrade")
                        if returnedItem > 0 then
                            npcUtil.giveItem(pArg, returnedItem)
                            pArg:setLocalVar("SynergyAmbuscadeTrade", 0)
                        end
                    end
                })
            end)
            return
        end
    end

    local recipeMatched = nil
    
    -- Identify if trade matches any recipe exactly
    for _, recipe in ipairs(synergyRecipes) do
        local matched = true
        local totalReqQty = 0
        
        for _, req in ipairs(recipe.ingredients) do
            if not trade:hasItemQty(req.id, req.qty) then
                matched = false
                break
            end
            totalReqQty = totalReqQty + req.qty
        end
        
        -- Ensure the player isn't trading extra junk alongside the required items
        if matched and trade:getItemCount() == totalReqQty then
            recipeMatched = recipe
            break
        end
    end

    if recipeMatched then
        if player:hasItem(recipeMatched.result) then
            player:printToPlayer("You already possess the result of this synergy.", xi.msg.channel.SYSTEM_3)
            return
        end

        local roll = math.random(1, 100)
        
        if roll <= recipeMatched.successRate then
            -- Success! Consume all traded items and give the result
            player:tradeComplete()
            
            if recipeMatched.onSuccess then
                recipeMatched.onSuccess(player)
            else
                npcUtil.giveItem(player, recipeMatched.result)
            end
            
            player:printToPlayer(string.format("Synergy was successful! You obtained a %s!", recipeMatched.name), xi.msg.channel.SYSTEM_3)
        else
            -- Failure! Determine how many items are lost
            local numItems = #recipeMatched.ingredients
            
            -- Weighted random roll (Higher chance to lose fewer items)
            local totalWeight = (numItems * (numItems + 1)) / 2
            local lossRoll = math.random(1, totalWeight)
            local numLost = 1
            local currentWeight = 0
            
            for i = 1, numItems do
                local weightForThisItem = (numItems - i) + 1
                currentWeight = currentWeight + weightForThisItem
                if lossRoll <= currentWeight then
                    numLost = i
                    break
                end
            end
            
            -- Shuffle the ingredients to randomly pick which ones break
            local shuffledIngredients = {}
            for _, req in ipairs(recipeMatched.ingredients) do
                table.insert(shuffledIngredients, req)
            end
            
            for i = #shuffledIngredients, 2, -1 do
                local j = math.random(i)
                shuffledIngredients[i], shuffledIngredients[j] = shuffledIngredients[j], shuffledIngredients[i]
            end
            
            -- Confirm only the lost items to consume them; the rest are safely returned to the player
            for i = 1, numLost do
                trade:confirmItem(shuffledIngredients[i].id, shuffledIngredients[i].qty)
            end
            
            player:confirmTrade()
            player:printToPlayer(string.format("Synergy failed... You lost %d material(s) in the furnace.", numLost), xi.msg.channel.SYSTEM_3)
        end
    else
        player:printToPlayer("The furnace rejects your items. They do not match any known synergy recipe.", xi.msg.channel.SYSTEM_3)
    end
end

entity.onTrigger = function(player, npc)
    player:printToPlayer("The furnace hums with energy. Trade specific items to it to attempt Synergy.", xi.msg.channel.SYSTEM_3)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
