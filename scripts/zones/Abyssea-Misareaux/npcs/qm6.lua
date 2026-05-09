-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm6 (???)
-- Spawns Ironclad Observer
-- !pos -198.742 -32.162 77.431 216
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_MISAREAUX]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.IRONCLAD_OBSERVER, { xi.item.SPHEROID_PLATE })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.SPHEROID_PLATE })
end

return entity