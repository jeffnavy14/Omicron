-----------------------------------
-- func: addmightyguard
-- desc: Adds all valid spells EXCEPT TRUSTS to the given target. If no target then to the current player.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!addmightyguard (player)')
end

commandObj.onTrigger = function(player, target)

    if not player:hasSpell(750) then 
        player:addSpell(750, false, true, true)
        player:printToPlayer(string.format('%s now has learned mighty guard.', player:getName()))
    else
        player:printToPlayer(string.format('%s has already learned mighty guard.', player:getName()))
    end

end

return commandObj
