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

#pragma once

#include "common/cbasetypes.h"

#include "common/blowfish.h"
#include "common/kernel.h"
#include "common/md52.h"
#include "common/mmo.h"
#include "common/sql.h"
#include "common/taskmgr.h"
#include "common/xirand.h"

#include <list>
#include <map>

#include "command_handler.h"
#include "map_constants.h"
#include "map_session.h"
#include "map_session_container.h"
#include "map_socket.h"
#include "zone.h"

//
// Exposed globals
//

// TODO: These will eventually be members of the MapServer class
extern MapSessionContainer            gMapSessions;
extern IPP                            gMapIPP;
extern std::unique_ptr<SqlConnection> _sql;
extern bool                           gLoadAllLua;
extern std::unique_ptr<MapSocket>     gMapSocket;

//
// Networking
//

// TODO: Pass around std::span<uint8> instead of uint8* and size_t*
// TODO: Stop changing the buffsize size_t as we go along
// TODO: Replace bool with named enum class
int32 map_decipher_packet(uint8*, size_t, MapSession*, blowfish_t*); // Decipher packet
int32 recv_parse(uint8*, size_t*, MapSession*);                      // main function to parse recv packets
int32 parse(uint8*, size_t*, MapSession*);                           // main function parsing the packets
int32 send_parse(uint8*, size_t*, MapSession*, bool);                // main function is building big packet

//
// Maintenance
//

int32 map_cleanup(time_point tick, CTaskMgr::CTask* PTask); // Clean up timed out players
int32 map_garbage_collect(time_point tick, CTaskMgr::CTask* PTask);
