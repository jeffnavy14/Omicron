-----------------------------------
-- func: checkconfrontation
-- desc: Checks the confrontation number for the target entity.
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

    local effect = targ:getStatusEffect(xi.effect.CONFRONTATION)
    if effect then
        local power = effect:getPower()
        local msg = string.format('Target %s has Confrontation ID: %d', targ:getName(), power)
        print(msg) -- Server debug
        player:printToPlayer(msg)
    else
        local msg = string.format('Target %s does not have the Confrontation effect.', targ:getName())
        print(msg) -- Server debug
        player:printToPlayer(msg)
    end
end

return commandObj