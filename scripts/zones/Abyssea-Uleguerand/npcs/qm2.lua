-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm2 (???)
-- Spawns Dhorme Khimaira
-- !pos -281.411 -155.568 267.682 253
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ULEGUERAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.DHORME_KHIMIRA, { xi.item.SNOW_GOD_CORE, xi.item.SISYPHUS_FRAGMENT, xi.item.HIGH_QUALITY_MARID_HIDE})
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.SNOW_GOD_CORE, xi.item.SISYPHUS_FRAGMENT, xi.item.HIGH_QUALITY_MARID_HIDE})
end

return entity
