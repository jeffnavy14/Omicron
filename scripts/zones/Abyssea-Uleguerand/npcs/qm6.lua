-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm6 (???)
-- Spawns Upas-Kamuy
-- !pos -212 -184 449 253
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ULEGUERAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.UPAS_KAMUY, { xi.item.GELID_ARM})
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.GELID_ARM})
end

return entity
