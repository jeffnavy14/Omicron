-----------------------------------
-- func: turn off Signet
-- desc: Toggles on the player, granting them several special abilities.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'i'
}


commandObj.onTrigger = function(player, tier)
    player:delStatusEffect(xi.effect.SIGNET)
    player:delStatusEffect(xi.effect.SIGIL)
    player:delStatusEffect(xi.effect.SANCTION)
    player:delStatusEffect(xi.effect.IONIS)
end

return commandObj