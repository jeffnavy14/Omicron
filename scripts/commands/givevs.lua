-----------------------------------
-- func: givegil <amount> <player>
-- desc: Gives the specified amount of voidstones to GM or target player.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!givevs <amount> (player)')
end

commandObj.onTrigger = function(player, amount, target)
    -- validate amount
    local voidstones = player:getCurrency('voidstones')
    if amount == nil or amount < 1 then
        error(player, 'Invalid amount of voidstones.')
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
    targ:addCurrency('voidstones', amount)
    player:printToPlayer(string.format('Gave %i sparks to %s.  They now have %i voidstones.', amount, targ:getName(), targ:getCurrency('voidstones')))
end

return commandObj 
