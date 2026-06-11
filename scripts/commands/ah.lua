-----------------------------------
-- func: ah
-- desc: opens the Auction House menu anywhere in the world
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

commandObj.onTrigger = function(player)
    -- LOCKOUT CHECK
    if player:getCharVar("ratio") == 1 then
        player:printToPlayer("Access Denied: You are currently locked out of this command.")
        return
    end

    player:sendMenu(xi.menuType.AUCTION)
end

return commandObj