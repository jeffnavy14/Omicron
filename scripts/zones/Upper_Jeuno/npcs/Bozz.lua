-----------------------------------
-- Area: Upper Jeuno
--  NPC: Bozz
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
        player:setCharVar("[QUEST]FullSpeedAhead", 0)
        player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.FULL_SPEED_AHEAD)
        npcUtil.giveKeyItem(player, xi.ki.TRAINERS_WHISTLE)
        npcUtil.giveKeyItem(player, xi.ki.RAPTOR_COMPANION)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
