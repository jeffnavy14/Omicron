-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_lachrymater (???)
-- Spawns Lachrymater
-- !pos -220 -1 -299 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm12.lua
require('scripts/globals/abyssea')
require('scripts/globals/items')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
require("scripts/globals/items")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_lachrymater.lua
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm12.lua
    local ID = zones[player:getZoneID()]
=======
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_lachrymater.lua
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.LACHRYMATER, { xi.items.MOANING_VESTIGE })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.MOANING_VESTIGE })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
