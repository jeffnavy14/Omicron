---------------------------------------------------------------------------------------------------
-- func: EggHunt
-- desc: Sends you to the next Egg
---------------------------------------------------------------------------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}

commandObj.onTrigger = function(player, target)
    local egghunt = GetServerVariable("[EggHunt]")
	
	player:goToEntity(egghunt)

end

return commandObj