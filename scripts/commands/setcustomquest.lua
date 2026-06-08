-----------------------------------
-- func: setcustomquest
-- desc: Sets a custom quest based on quest id for GM use testing
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 3,
    parameters = 'i'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!setcustomquest <questId>')
    return
end

commandObj.onTrigger = function(player, questId)
    if questId == nil or
        questId < 89 or questId > 925 then
        player:printToPlayer('Please select a valid quest Id')
        return
    else
        xi.custom_quest.setCurrentQuest(player, questId)
    end
end

return commandObj
