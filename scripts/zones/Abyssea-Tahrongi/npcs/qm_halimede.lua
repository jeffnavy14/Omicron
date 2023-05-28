-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_halimede (???)
-- Spawns Halimede
-- !pos -234 15 -603 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm1.lua
require('scripts/globals/abyssea')
require('scripts/globals/items')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
require("scripts/globals/items")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_halimede.lua
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm1.lua
    local ID = zones[player:getZoneID()]
=======
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_halimede.lua
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.HALIMEDE, { xi.items.HIGH_QUALITY_CLIONID_WING })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.HIGH_QUALITY_CLIONID_WING })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
