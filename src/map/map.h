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

#ifndef _MAP_H
#define _MAP_H

#include "common/cbasetypes.h"

#include "common/blowfish.h"
#include "common/kernel.h"
#include "common/md52.h"
#include "common/mmo.h"
#include "common/socket.h"
#include "common/sql.h"
#include "common/taskmgr.h"
#include "common/xirand.h"

#include <list>
#include <map>

#include "command_handler.h"
#include "map_constants.h"
#include "map_session.h"
#include "map_session_container.h"
#include "zone.h"

//
// Exposed globals
//

extern MapSessionContainer            gMapSessions;
extern IPP                            gMapIPP;
extern std::unique_ptr<SqlConnection> _sql;
extern bool                           gLoadAllLua;

//=======================================================================

int32 recv_parse(uint8* buff, size_t* buffsize, sockaddr_in* from, MapSession*);                      // main function to parse recv packets
int32 parse(uint8* buff, size_t* buffsize, sockaddr_in* from, MapSession*);                           // main function parsing the packets
int32 send_parse(uint8* buff, size_t* buffsize, sockaddr_in* from, MapSession*, bool usePreviousKey); // main function is building big packet

int32 map_cleanup(time_point tick, CTaskMgr::CTask* PTask); // Clean up timed out players

int32 map_garbage_collect(time_point tick, CTaskMgr::CTask* PTask);

#endif //_MAP_H
