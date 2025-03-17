/*
===========================================================================

  Copyright (c) 2025 LandSandBoat Dev Teams

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

// 2.5 tick/updates per second
static constexpr auto kServerTickRate = 2.5f;

// Tick/update every 400ms
static constexpr auto kServerTickInterval = 1000.0f / kServerTickRate;

// Check Trigger Areas every 200ms
static constexpr auto kServerTriggerAreaInterval = kServerTickInterval / 2.0f;

// Packet & networking constants
static constexpr auto kMaxBufferSize           = 2500U;
static constexpr auto kMaxPacketPerCompression = 32U;
static constexpr auto kMaxPacketBacklogSize    = kMaxPacketPerCompression * 6U; // If we hit this number, things are going very very badly.

using NetworkBuffer = std::array<uint8, kMaxBufferSize>;
