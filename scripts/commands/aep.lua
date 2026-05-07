-----------------------------------
-- func: aep
-- desc: Grants alter ego points to the player issuing the command. GM only.
-- usage: !aep <amount>
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}

commandObj.onTrigger = function(player, amount)
    if not amount then
        player:printToPlayer('Usage: !aep <amount>')
        return
    end

    player:addCurrency('alter_ego_points', amount, 65535)
    player:printToPlayer(string.format('Granted %d alter ego points. New total: %d',
        amount, player:getCurrency('alter_ego_points')))
end

return commandObj
