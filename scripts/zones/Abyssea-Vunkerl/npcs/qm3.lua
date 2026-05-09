-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm3 (???)
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_VUNKERL]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.IKU_TURSO, { xi.item.MOONBEAM_CLAM })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.MOONBEAM_CLAM })
end

return entity