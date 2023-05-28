-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_ophanim (???)
-- Spawns Ophanim
-- !pos -195 -16 -165 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm3.lua
require('scripts/globals/abyssea')
require('scripts/globals/items')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
require("scripts/globals/items")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_ophanim.lua
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm3.lua
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.OPHANIM, { xi.items.BLOODSHOT_HECTEYE, xi.items.SHRIVELED_WING, xi.items.TARNISHED_PINCER  })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.BLOODSHOT_HECTEYE, xi.items.SHRIVELED_WING, xi.items.TARNISHED_PINCER  })
=======
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.OPHANIM, { xi.items.SHRIVELED_WING, xi.items.TARNISHED_PINCER, xi.items.BLOODSHOT_HECTEYE })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.SHRIVELED_WING, xi.items.TARNISHED_PINCER, xi.items.BLOODSHOT_HECTEYE })
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_ophanim.lua
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
