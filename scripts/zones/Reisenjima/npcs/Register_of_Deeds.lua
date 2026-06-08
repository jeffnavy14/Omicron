-----------------------------------
-- Area: Reisenjima (291)
-- NPC: Register of Deeds
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    
end

entity.onTrigger = function(player, npc)
    xi.registerOfDeeds.npcOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    
end

entity.onEventFinish = function(player, csid, option, npc)
    
end

return entity
