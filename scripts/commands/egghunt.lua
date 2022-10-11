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

	if GetServerVariable("[EggHunt]") == 1 then
		player:goToEntity(16986829)
	elseif
        GetServerVariable("[EggHunt]") == 2 then
		player:goToEntity(16986830)
	elseif
	  	GetServerVariable("[EggHunt]") == 3 then
		player:goToEntity(16986831)
	elseif
	  	GetServerVariable("[EggHunt]") == 4 then
		player:goToEntity(16986832)
	elseif
	  	GetServerVariable("[EggHunt]") == 5 then
		player:goToEntity(16986833)
	elseif
	  	GetServerVariable("[EggHunt]") == 6 then
		player:goToEntity(16986834) 
	elseif
	  	GetServerVariable("[EggHunt]") == 7 then
		player:goToEntity(16986835)
	elseif
	  	GetServerVariable("[EggHunt]") == 8 then
		player:goToEntity(16986836)
	elseif
	  	GetServerVariable("[EggHunt]") == 9 then
		player:goToEntity(16986837)
	elseif
	  	GetServerVariable("[EggHunt]") == 10 then
		player:goToEntity(16986838)
	elseif
	  	GetServerVariable("[EggHunt]") == 11 then
		player:goToEntity(16986839)
    elseif
	  	GetServerVariable("[EggHunt]") == 12 then
		player:goToEntity(16986840)
	end
end