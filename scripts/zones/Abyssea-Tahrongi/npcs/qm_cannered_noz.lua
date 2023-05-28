-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_cannered_noz (???)
-- Spawns Cannered Noz
-- !pos -355 4 251 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm4.lua
require('scripts/globals/abyssea')
require('scripts/globals/items')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
require("scripts/globals/items")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_cannered_noz.lua
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm4.lua
    local ID = zones[player:getZoneID()]
=======
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_cannered_noz.lua
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.CANNERED_NOZ, { xi.items.BALEFUL_SKULL })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.BALEFUL_SKULL })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
