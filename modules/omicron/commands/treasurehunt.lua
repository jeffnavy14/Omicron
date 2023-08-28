---------------------------------------------------------------------------------------------------
-- func: treasurehunt
-- desc: Sends you to the next Egg
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player, target)
    local treasurehunt = GetServerVariable("[TreasureHunt]")
	
	player:goToEntity(treasurehunt)

end