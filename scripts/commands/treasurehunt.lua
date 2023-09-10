---------------------------------------------------------------------------------------------------
-- func: treasurehunt
-- desc: Sends you to the next Egg
---------------------------------------------------------------------------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}

commandObj.onTrigger = function(player, target)
    local treasurehunt = GetServerVariable("[TreasureHunt]")
	
	player:goToEntity(treasurehunt)

end

return commandObj