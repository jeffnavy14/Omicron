-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm12 (???)
-- Spawns Apademak
-- !pos -332 -155 361 253
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ULEGUERAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.APADEMAK_OFFSET, { xi.ki.TORN_KHIMAIRA_WING })
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity