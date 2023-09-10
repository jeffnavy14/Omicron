-----------------------------------
-- func: elvorseal
-- desc: Casts elvorseal on the player.
-----------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 3,
    parameters = 'i'
}

commandObj.onTrigger = function(player)
    player:PrintToPlayer("Elvorseal has been applied")
    player:addStatusEffect(xi.effect.ELVORSEAL, 1, 0, 0)
end
return commandObj