-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm8 (???)
-- Spawns Avalerion
-- !pos 41 -16 81 216
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_MISAREAUX]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.AVALERION, { xi.item.MOCKING_BEAK })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.MOCKING_BEAK })
end

return entity

