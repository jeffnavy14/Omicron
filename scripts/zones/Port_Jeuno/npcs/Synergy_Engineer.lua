-----------------------------------
-- Area: Port Jeuno
--  NPC: Synergy_Engineer
-- !pos  -52 0 -11 246
-----------------------------------
require("scripts/globals/synergy")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.synergy.engineer.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.synergy.engineer.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
    xi.synergy.engineer.onEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.synergy.engineer.onEventFinish(player, csid, option)
end

return entity