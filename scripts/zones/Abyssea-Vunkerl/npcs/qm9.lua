-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm9 (???)
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_VUNKERL]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.CHHIR_BATTI, { xi.item.VIAL_OF_DJINN_ASHES })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.VIAL_OF_DJINN_ASHES })
end

return entity