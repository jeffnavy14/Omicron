-----------------------------------
-- func: givegil <amount> <player>
-- desc: Gives the specified amount of sparks to GM or target player.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!givesparks <amount> (player)')
end

commandObj.onTrigger = function(player, amount, target)
    -- validate amount
    local sparks = player:getCurrency('spark_of_eminence')
    if amount == nil or amount < 1 then
        error(player, 'Invalid amount of sparks.')
        return
    end

    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- give gil to target
    targ:addCurrency('spark_of_eminence', amount)
    player:printToPlayer(string.format('Gave %i sparks to %s.  They now have %i sparks.', amount, targ:getName(), targ:getCurrency('spark_of_eminence')))
end

return commandObj
