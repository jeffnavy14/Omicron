----------------------------------
-- Mimic Spawner 
----------------------------------
require("scripts/globals/status")
require("modules/module_utils")
require("scripts/zones/Escha_ZiTah/Zone")
-----------------------------------
local m = Module:new("mimic")
m:setEnabled(true)


m:addOverride("xi.zones.Escha_ZiTah.Zone.onInitialize", function(zone)
    super(zone)

	if
       GetServerVariable("[Mimic]") > 0 then
       SetServerVariable("[Mimic]", math.random(1,9))
	end



	if
       GetServerVariable("[Spawned]") > 0 then
       SetServerVariable("[Spawned]", 0)
	end
end)

m:addOverride("xi.zones.Escha_ZiTah.Zone.onZoneTick", function(zone)
    super(zone)


	if 
	  	GetServerVariable("[Mimic]") == 0 and             
        	GetServerVariable("[Spawned]") == 0 
	then
		SetServerVariable("[WaitTime]", os.time() + 30)
	end
	

	if
		os.time() > GetServerVariable("[WaitTime]")
	then
		SetServerVariable("[Mimic]", math.random(1,9))
	end



	if 
	  	GetServerVariable("[Mimic]") == 1 and             
        	GetServerVariable("[Spawned]") == 0 
	then
		SpawnMob(17957504)
	elseif
	  	GetServerVariable("[Mimic]") == 2 and             
        	GetServerVariable("[Spawned]") == 0 
	then
		SpawnMob(17957505)
	elseif
	  	GetServerVariable("[Mimic]") == 3 and             
        	GetServerVariable("[Spawned]") == 0 
	then
		SpawnMob(17957506)
	elseif
	  	GetServerVariable("[Mimic]") == 4 and             
        	GetServerVariable("[Spawned]") == 0 
	then
		SpawnMob(17961854)
	elseif
	  	GetServerVariable("[Mimic]") == 5 and             
        	GetServerVariable("[Spawned]") == 0 
	then
		SpawnMob(17961855)
	elseif
	  	GetServerVariable("[Mimic]") == 6 and             
        	GetServerVariable("[Spawned]") == 0 
	then
		SpawnMob(17961856)
	elseif
	  	GetServerVariable("[Mimic]") == 7 and             
        	GetServerVariable("[Spawned]") == 0 
	then
		SpawnMob(17970003)
	elseif
	  	GetServerVariable("[Mimic]") == 8 and             
        	GetServerVariable("[Spawned]") == 0 
	then
		SpawnMob(17970004)
	elseif
	  	GetServerVariable("[Mimic]") == 9 and             
        	GetServerVariable("[Spawned]") == 0 
	then
		SpawnMob(17970005)
	end

end)



return m