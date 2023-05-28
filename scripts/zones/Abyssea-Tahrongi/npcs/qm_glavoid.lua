-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_glavoid (???)
-- Spawns Glavoid
-- !pos 196 32 400 45
-- !pos 196 34 415 45
-- !pos 211 33 400 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm17.lua
require('scripts/globals/abyssea')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_glavoid.lua
require('scripts/globals/keyitems')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm17.lua
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.GLAVOID_1, { xi.ki.FAT_LINED_COCKATRICE_SKIN, xi.ki.SODDEN_SANDWORM_HUSK, xi.ki.LUXURIANT_MANTICORE_MANE, xi.ki.STICKY_GNAT_WING })
=======
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.GLAVOID_1, { xi.ki.LUXURIANT_MANTICORE_MANE, xi.ki.FAT_LINED_COCKATRICE_SKIN, xi.ki.STICKY_GNAT_WING, xi.ki.SODDEN_SANDWORM_HUSK })
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_glavoid.lua
end

entity.onEventUpdate = function(player, csid, option)
    xi.abyssea.qmOnEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.abyssea.qmOnEventFinish(player, csid, option)
end

return entity
