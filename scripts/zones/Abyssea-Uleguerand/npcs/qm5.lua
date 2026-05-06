-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm5 (???)
-- Spawns Koghatu
-- !pos -108 -175 4 253
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ULEGUERAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.KOGHATU, { xi.item.HELICAL_GEAR})
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.HELICAL_GEAR})
end

return entity
