-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm10 (???)
-- Spawns Nonno
-- !pos 719 1 -486 216
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_MISAREAUX]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.NONNO, { xi.item.WORM_EATEN_BUD })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.WORM_EATEN_BUD })
end

return entity

