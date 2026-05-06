-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm2 (???)
-- Spawns Sirrush
-- !pos 346 15 -437 216
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_MISAREAUX]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.SIRRUSH, { xi.item.HANDFUL_OF_MOLT_SCRAPS })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.HANDFUL_OF_MOLT_SCRAPS })
end

return entity

