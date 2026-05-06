-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm7 (???)
-- Spawns Veri Selen
-- !pos 13 -140 470 253
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ULEGUERAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.VERI_SELEN, { xi.item.ICE_WYVERN_SCALE})
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.ICE_WYVERN_SCALE})
end

return entity