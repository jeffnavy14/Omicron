-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm12 (???)
-- Spawns Npfundlwa
-- !pos 412 -7 50 216
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_MISAREAUX]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.NPFUNDLWA, { xi.item.BLACK_RABBIT_TAIL })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.BLACK_RABBIT_TAIL })
end

return entity

