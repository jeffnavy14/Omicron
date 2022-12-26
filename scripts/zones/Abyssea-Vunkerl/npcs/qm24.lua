-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm24 (???)
-- Spawns Karkadann
-- !pos -157 -31 88 217
-----------------------------------
require('scripts/globals/abyssea')
require('scripts/globals/keyitems')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- xi.abyssea.qmOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.KARKADANN_2, { xi.ki.WARPED_SMILODON_CHOKER, xi.ki.MALODOROUS_MARID_FUR })
end


entity.onEventUpdate = function(player, csid, option)
    xi.abyssea.qmOnEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.abyssea.qmOnEventFinish(player, csid, option)
end

return entity
