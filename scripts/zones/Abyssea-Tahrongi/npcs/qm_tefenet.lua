-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_tefenet (???)
-- Spawns Tefenet
-- !pos -127 15 239 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm10.lua
require('scripts/globals/abyssea')
require('scripts/globals/items')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
require("scripts/globals/items")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_tefenet.lua
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm10.lua
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.TEFNET, { xi.items.SHOCKING_WHISKER })
=======
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.TEFENET, { xi.items.SHOCKING_WHISKER })
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_tefenet.lua
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.SHOCKING_WHISKER })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
