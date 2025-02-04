-----------------------------------
-- Area: Davoi
--  NPC: ??? (qm1)
-- Involved in Quest: To Cure a Cough
-- !pos -115.830 -0.427 -184.289 149
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(xi.questLog.SANDORIA, xi.quest.id.sandoria.TO_CURE_A_COUGH) == xi.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(xi.ki.THYME_MOSS)
    then
        npcUtil.giveKeyItem(player, xi.ki.THYME_MOSS)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
