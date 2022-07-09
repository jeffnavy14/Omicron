----------------------------------
-- Egg Spawner 
----------------------------------
require("scripts/globals/status")
require("modules/module_utils")
require("scripts/zones/Wajaom_Woodlands/Zone")
-----------------------------------
local m = Module:new("egghunt")
m:setEnabled(true)


m:addOverride("xi.zones.Wajaom_Woodlands.Zone.onInitialize", function(zone)
    super(zone)

	if
       GetServerVariable("[EggHunt]") > 0 then
       SetServerVariable("[EggHunt]", 0)
	end

	if
       GetServerVariable("[Hatch]") > 0 then
       SetServerVariable("[Hatch]", 0)
	end
end)

m:addOverride("xi.zones.Wajaom_Woodlands.Zone.onZoneTick", function(zone)
    super(zone)


	if 
	  	GetServerVariable("[EggHunt]") == 0 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SetServerVariable("[EggHunt]", math.random(1,12))
	end


	if 
	  	GetServerVariable("[EggHunt]") == 1 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986695)

	elseif
	  	GetServerVariable("[EggHunt]") == 2 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986696)

	elseif
	  	GetServerVariable("[EggHunt]") == 3 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986697)

	elseif
	  	GetServerVariable("[EggHunt]") == 4 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986698)

	elseif
	  	GetServerVariable("[EggHunt]") == 5 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986699)

	elseif
	  	GetServerVariable("[EggHunt]") == 6 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986700)

	elseif
	  	GetServerVariable("[EggHunt]") == 7 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986701)

	elseif
	  	GetServerVariable("[EggHunt]") == 8 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986702)

	elseif
	  	GetServerVariable("[EggHunt]") == 9 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986703)

	elseif
	  	GetServerVariable("[EggHunt]") == 10 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986704)


	elseif
	  	GetServerVariable("[EggHunt]") == 11 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986705)


	elseif
	  	GetServerVariable("[EggHunt]") == 12 and             
        	GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(16986706)

	end



end)



return m