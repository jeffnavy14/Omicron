-----------------------------------
-- Area: Port Jeuno
--  NPC: Synergy Furnace
-- !pos  -52 0 -11 246
-----------------------------------
require("scripts/globals/synergy")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.synergy.furnace.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.synergy.furnace.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
    xi.synergy.furnace.onEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.synergy.furnace.onEventFinish(player, csid, option)
end

return entity