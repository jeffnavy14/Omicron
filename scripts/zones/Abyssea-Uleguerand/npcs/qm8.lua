-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm8 (???)
-- Spawns Anemic Aloysius
-- !pos 440 -51 142 253
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ULEGUERAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.ANEMIC_ALOYSIUS, { xi.item.HANDFUL_OF_WHITEWORM_CLAY })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.HANDFUL_OF_WHITEWORM_CLAY })
end

return entity
