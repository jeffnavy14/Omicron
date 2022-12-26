-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm12 (???)
-- Spawns Gnawtooth Gary
-- !pos -343 -39 -644 217
-----------------------------------
require('scripts/globals/abyssea')
require('scripts/globals/items')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.GNAWTOOTH_GARY, { xi.items.HQ_RABBIT_HIDE })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.HQ_RABBIT_HIDE })
end


entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
