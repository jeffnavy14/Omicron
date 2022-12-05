-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: Neraf-Najiruf
-- Involved in Quests: Save my Sister
-- !pos -36 2 60 243
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/quests")
local ID = require("scripts/zones/RuLude_Gardens/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local saveMySister = player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.SAVE_MY_SISTER)

    if
        saveMySister == QUEST_AVAILABLE and
        player:getCharVar("saveMySisterVar") == 3
    then
        player:startEvent(98) -- Real start of this quest (with addquest)

    elseif saveMySister == QUEST_ACCEPTED then
        player:startEvent(99) -- During quest

    elseif
        saveMySister == QUEST_COMPLETED and
        player:hasKeyItem(xi.ki.DUCAL_GUARDS_LANTERN)
    then
        player:startEvent(97) -- last CS (after talk with baudin)

    else
        player:startEvent(156) -- Standard dialog
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 98 then
        player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.SAVE_MY_SISTER)
        player:setCharVar("saveMySisterVar", 0)
        player:addKeyItem(xi.ki.DUCAL_GUARDS_LANTERN)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.DUCAL_GUARDS_LANTERN)
    elseif csid == 97 then
        player:delKeyItem(xi.ki.DUCAL_GUARDS_LANTERN)
        player:setCharVar("saveMySisterFireLantern", 0)
    end
end

return entity
