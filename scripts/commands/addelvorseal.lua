-----------------------------------
-- func: addelvorseal
-----------------------------------
local controller = require("scripts/globals/di_controller")
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!addelvorseal (player)')
end

commandObj.onTrigger = function(player, target)
    player:addStatusEffect(xi.effect.ELVORSEAL, {
        power = 1,
        origin = player,
        duration = 0,
        flag = xi.effectFlag.CONFRONTATION
    })
end

return commandObj
