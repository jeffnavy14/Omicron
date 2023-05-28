-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_abas (???)
-- Spawns Abas
-- !pos 407 -16 -397 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm8.lua
require('scripts/globals/abyssea')
require('scripts/globals/items')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
require("scripts/globals/items")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_abas.lua
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm8.lua
    local ID = zones[player:getZoneID()]
=======
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_abas.lua
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.ABAS, { xi.items.EFT_EGG })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.EFT_EGG })
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm8.lua
end 
=======
end
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_abas.lua

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
