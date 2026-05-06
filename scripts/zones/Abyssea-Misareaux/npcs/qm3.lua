-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm3 (???)
-- Spawns Funeral Apkallu
-- !pos 209 -23 321 216
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_MISAREAUX]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.FUNEREAL_APKALLU, { xi.item.HANDFUL_OF_APKALLU_DOWN })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.HANDFUL_OF_APKALLU_DOWN })
end

return entity

