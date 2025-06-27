-----------------------------------
-- func: sleep
-- desc: inject an artificial delay of 1 second (FOR LOCAL PERFORMANCE TESTING ONLY)
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

commandObj.onTrigger = function(player)
player:delStatusEffect(xi.effect.ELVORSEAL)
end

return commandObj