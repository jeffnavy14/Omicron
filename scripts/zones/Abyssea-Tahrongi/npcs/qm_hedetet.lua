-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_hedetet (???)
-- Spawns Hedetet
-- !pos -279 7 126 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm7.lua
require('scripts/globals/abyssea')
require('scripts/globals/items')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
require("scripts/globals/items")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_hedetet.lua
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm7.lua
    local ID = zones[player:getZoneID()]
=======
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_hedetet.lua
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.HEDETET, { xi.items.VENOMOUS_SCORPION_STINGER, xi.items.CLUMP_OF_ACIDIC_HUMUS })
end

entity.onTrigger = function(player, npc)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm7.lua
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.VENOMOUS_SCORPION_STINGER, xi.items.CLUMP_OF_ACIDIC_HUMUS  })
=======
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.VENOMOUS_SCORPION_STINGER, xi.items.CLUMP_OF_ACIDIC_HUMUS })
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_hedetet.lua
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
