-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm9 (???)
-- Spawns Chillwing Hwitti
-- !pos -484 -20 -85 253
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ULEGUERAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.CHILLWING_HWITTI, { xi.item.IMP_SENTRYS_HORN})
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.IMP_SENTRYS_HORN})
end

return entity
