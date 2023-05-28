-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_chloris (???)
-- Spawns Chloris
-- !pos 160 0 -15 45
-- !pos 160 0 0 45
-- !pos 160 0 -30 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm13.lua
require('scripts/globals/abyssea')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_chloris.lua
require('scripts/globals/keyitems')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm13.lua
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.CHLORIS, { xi.ki.VEINOUS_HECTEYES_EYELID, xi.ki.TORN_BAT_WING, xi.ki.GORY_SCORPION_CLAW, xi.ki.MOSSY_ADAMANTOISE_SHELL })
=======
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.CHLORIS_1, { xi.ki.TORN_BAT_WING, xi.ki.VEINOUS_HECTEYES_EYELID, xi.ki.MOSSY_ADAMANTOISE_SHELL, xi.ki.GORY_SCORPION_CLAW })
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_chloris.lua
end

entity.onEventUpdate = function(player, csid, option)
    xi.abyssea.qmOnEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.abyssea.qmOnEventFinish(player, csid, option)
end

return entity
