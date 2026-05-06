-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm1 (???)
-- Spawns Minax Bugard
-- !pos 520 15 -268 216
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_MISAREAUX]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.MINAX_BUGARD, { xi.item.BEWITCHING_TUSK })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.BEWITCHING_TUSK })
end

return entity
