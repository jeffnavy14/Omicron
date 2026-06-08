-----------------------------------
-- Area: Escha - Zi'RuAun (289)
-- NPC: Dremi
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.geasFeteNPC.npcOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.geasFeteNPC.npcOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.geasFeteNPC.npcOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.geasFeteNPC.npcOnEventFinish(player, csid, option, npc)
end

return entity
