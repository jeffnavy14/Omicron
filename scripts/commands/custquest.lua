-----------------------------------
-- custom quest infomration 
-----------------------------------
local commandObj = {}
commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!custquest')
end

commandObj.onTrigger = function(player)
    xi.custom_quest.getQuestInfo(player)
end
return commandObj