-----------------------------------
-- Area: Newton_Movalpolos
--  NPC: ??? for Goblin Collector
-----------------------------------
local ID = zones[xi.zone.NEWTON_MOVALPOLOS]
require("scripts/globals/npc_util")
-----------------------------------

local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHasExactly(trade, xi.items.PREMIUM_BAG) and
        npcUtil.popFromQM(player, npc, ID.mob.GOBLIN_COLLECTOR)
    then
        player:confirmTrade()
    end
end

return entity
