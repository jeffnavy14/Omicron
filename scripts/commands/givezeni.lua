-----------------------------------
-- func: givegil <amount> <player>
-- desc: Gives the specified amount of zeni to GM or target player.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!givezeni <amount> (player)')
end

commandObj.onTrigger = function(player, amount, target)
    -- validate amount
    local zeni = player:getCurrency('zeni_point')
    if amount == nil or amount < 1 then
        error(player, 'Invalid amount of zeni.')
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
    targ:addCurrency('zeni_point', amount)
    player:printToPlayer(string.format('Gave %i zeni to %s.  They now have %i zeni.', amount, targ:getName(), targ:getCurrency('zeni_point')))
end

return commandObj
