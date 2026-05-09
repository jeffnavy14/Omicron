-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm17 (???)
-- Spawns Cirein-Croin
-- !pos 54 -15 520 216
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_MISAREAUX]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.CIREIN_CROIN_OFFSET, { xi.ki.GLISTENING_OROBON_LIVER, xi.ki.DOFFED_POROGGO_HAT })
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity

