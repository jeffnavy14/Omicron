---------------------------------------------------------------------------------------------------
-- func: MimicHunt
-- desc: Sends you to the next Egg
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player, target)
    local MimicHunt = GetServerVariable("[MimicHunt]")
	
	if GetServerVariable("[Found]") == 0 then
	player:PrintToPlayer('Mimic is not spawned.')
	end
	
	player:goToEntity(MimicHunt)

end