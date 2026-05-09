-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm10 (???)
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_VUNKERL]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.ARMILLARIA, { xi.item.SHOCKSHROOM })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.SHOCKSHROOM })
end

return entity