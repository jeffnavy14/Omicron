-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm9 (???)
-- Spawns Karkatakam
-- !pos 200 -15 519 216
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_MISAREAUX]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.KARKATAKAM, { xi.item.SLICE_OF_HIGH_QUALITY_CRAB_MEAT, xi.item.CHUNK_OF_HIGH_QUALITY_ROCK_SALT })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.SLICE_OF_HIGH_QUALITY_CRAB_MEAT, xi.item.CHUNK_OF_HIGH_QUALITY_ROCK_SALT })
end

return entity