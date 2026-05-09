-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm3 (???)
-- Spawns Blanga
-- !pos -615.221 -39.768 -16.079 253
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ULEGUERAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.BLANGA, { xi.item.BENUMBED_EYE, xi.item.RIMED_WING})
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.BENUMBED_EYE, xi.item.RIMED_WING})
end

return entity
