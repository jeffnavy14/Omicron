-----------------------------------
-- func: retail speed 
-- desc: Sets the players speed to retail.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!retailspeed')
end

commandObj.onTrigger = function(player)
    if player:getSpeed() == 80 then
       player:printToPlayer('Your Speed has been reset to the Default LD speed')
       player:setMod(xi.mod.MOVE_SPEED_OVERRIDE, 0)
       player:recalculateStats()
    else
       player:printToPlayer('Your Speed has been reset to retail')
       player:setMod(xi.mod.MOVE_SPEED_OVERRIDE, 80)
       player:recalculateStats()
    end
end
return commandObj
