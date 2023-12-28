---------------------------------------------------------------------------------------------------
-- func: MimicHunt
-- desc: Sends you to the next Egg
---------------------------------------------------------------------------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}

commandObj.onTrigger = function(player, target)
    local MimicHunt = GetServerVariable("[MimicHunt]")
	
	if GetServerVariable("[Found]") == 0 then
	player:printToPlayer('Mimic is not spawned.')
	end
	
	player:goToEntity(MimicHunt)

end
return commandObj