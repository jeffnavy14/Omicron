-----------------------------------
-- Area: Escha RuAun (289)
-- NPC: qm
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    
end

entity.onTrigger = function(player, npc)
    xi.geasFete.qmOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.geasFete.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.geasFete.qmOnEventFinish(player, csid, option, npc)
end

return entity
