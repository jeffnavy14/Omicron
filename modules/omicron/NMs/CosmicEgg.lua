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
    local Egghunt = math.random (16986829, 16986840)

	if 
	  	GetServerVariable("[EggHunt]") == 0 and             
        GetServerVariable("[Hatch]") == 0 
	then
		SetServerVariable("[EggHunt]", Egghunt)
	end

	if 
	  	GetServerVariable("[EggHunt]") == Egghunt and             
        GetServerVariable("[Hatch]") == 0 
	then
		SpawnMob(Egghunt)
    end
end)

return m