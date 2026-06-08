-----------------------------------
-- complete custom quest if stuck
-- GM Command
-----------------------------------
local commandObj = {}
commandObj.cmdprops =
{
    permission = 3,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!completecustquest')
end

commandObj.onTrigger = function(player, target)
    local targ
    local cursorTarget = player:getCursorTarget()

    if target then
        targ = GetPlayerByName(target)
        if not targ then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    elseif cursorTarget and not cursorTarget:isNPC() then
        targ = cursorTarget
    else
        targ = player
    end
    xi.custom_quest.completeCurrentQuest(targ)
end
return commandObj
