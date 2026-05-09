-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm1 (???)
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_VUNKERL]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.KHALKOTAUR, { xi.item.GNARLED_TAURUS_HORN })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.GNARLED_TAURUS_HORN })
end

return entity