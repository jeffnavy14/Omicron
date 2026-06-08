-----------------------------------
-- func: delconfrontation
-- desc: Removes CONFRONTATION effect from target
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

commandObj.onTrigger = function(player, target)
    local targ

    if target == nil then
        targ = player:getCursorTarget()
    else
        targ = GetPlayerByName(target)
    end

    if targ == nil then
        player:printToPlayer('You must have a target.')
        return
    end

    targ:delStatusEffect(xi.effect.CONFRONTATION)
    player:printToPlayer('Removed Confrontation effect from ' .. targ:getName() .. '.')
end

return commandObj