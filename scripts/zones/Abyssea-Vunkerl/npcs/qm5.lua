-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm5 (???)
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_VUNKERL]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.KADRAETH_THE_HATESPAWN, { xi.item.STIFFENED_TENTACLE })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.STIFFENED_TENTACLE })
end

return entity