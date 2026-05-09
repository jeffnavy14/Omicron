-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm1 (???)
-- Spawns Ironclad Triturator
-- !pos -10 -175 56 253
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ULEGUERAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.IRONCLAD_TRITURATOR, { xi.item.BEVEL_GEAR, xi.item.VIAL_OF_GEAR_FLUID})
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.BEVEL_GEAR, xi.item.VIAL_OF_GEAR_FLUID})
end

return entity
