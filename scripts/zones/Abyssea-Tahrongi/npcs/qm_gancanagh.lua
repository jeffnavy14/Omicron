-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_gancanagh (???)
-- Spawns Gancanagh
-- !pos 74 11 -51 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm6.lua
require('scripts/globals/abyssea')
require('scripts/globals/items')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
require("scripts/globals/items")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_gancanagh.lua
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm6.lua
    local ID = zones[player:getZoneID()]
=======
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_gancanagh.lua
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.GANCANAGH, { xi.items.CLUMP_OF_ALKALINE_HUMUS })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.CLUMP_OF_ALKALINE_HUMUS })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
