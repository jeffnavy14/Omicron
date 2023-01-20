---------------------------------------------------------------------------------------------------
-- func: EggHunt
-- desc: Sends you to the next Egg
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player, target)
    local egghunt = GetServerVariable("[EggHunt]")
	
	player:goToEntity(egghunt)

end