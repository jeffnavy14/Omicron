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
       GetServerVariable("[Egg]") > 0 then
       SetServerVariable("[Egg]", 0)
	end



	if
       GetServerVariable("[Hatched]") > 0 then
       SetServerVariable("[Hatched]", 0)
	end
end)

m:addOverride("xi.zones.Escha_ZiTah.Zone.onZoneTick", function(zone)
    super(zone)


	if 
	  	GetServerVariable("[Egg]") == 0 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SetServerVariable("[Egg]", math.random(1,12))
	end



	if 
	  	GetServerVariable("[Egg]") == 1 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986695)
     SetServerVariable("[Hatched]", 1)
	elseif
	  	GetServerVariable("[Egg]") == 2 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986696)
     SetServerVariable("[Hatched]", 1)
	elseif
	  	GetServerVariable("[Egg]") == 3 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986697)
     SetServerVariable("[Hatched]", 1)
	elseif
	  	GetServerVariable("[Egg]") == 4 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986698)
     SetServerVariable("[Hatched]", 1)
	elseif
	  	GetServerVariable("[Egg]") == 5 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986699)
     SetServerVariable("[Hatched]", 1)
	elseif
	  	GetServerVariable("[Egg]") == 6 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986700)
     SetServerVariable("[Hatched]", 1)
	elseif
	  	GetServerVariable("[Egg]") == 7 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986701)
     SetServerVariable("[Hatched]", 1)
	elseif
	  	GetServerVariable("[Egg]") == 8 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986702)
     SetServerVariable("[Hatched]", 1)
	elseif
	  	GetServerVariable("[Egg]") == 9 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986703)
     SetServerVariable("[Hatched]", 1)

	elseif
	  	GetServerVariable("[Egg]") == 10 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986704)
     SetServerVariable("[Hatched]", 1)

	elseif
	  	GetServerVariable("[Egg]") == 11 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986705)
     SetServerVariable("[Hatched]", 1)

	elseif
	  	GetServerVariable("[Egg]") == 12 and             
        	GetServerVariable("[Hatched]") == 0 
	then
		SpawnMob(16986706)
     SetServerVariable("[Hatched]", 1)
	end



end)



return m