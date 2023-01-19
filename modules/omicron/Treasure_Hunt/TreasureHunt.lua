----------------------------------
-- Egg Spawner 
----------------------------------
require("scripts/globals/status")
require("modules/module_utils")
require("scripts/zones/Wajaom_Woodlands/Zone")
-----------------------------------
local m = Module:new("treasurehunt")
m:setEnabled(true)

m:addOverride("xi.zones.Wajaom_Woodlands.Zone.onInitialize", function(zone)
    super(zone)

	if
       GetServerVariable("[TreasureHunt]") > 0 then
       SetServerVariable("[TreasureHunt]", 0)
	end

	if
       GetServerVariable("[Found]") > 0 then
       SetServerVariable("[Found]", 0)
	end
end)

m:addOverride("xi.zones.Wajaom_Woodlands.Zone.onZoneTick", function(zone)
    super(zone)
    local TreasureHunt = math.random (16986851, 16986862)

	if 
	  	GetServerVariable("[TreasureHunt]") == 0 and             
        GetServerVariable("[Found]") == 0 
	then
		SetServerVariable("[TreasureHunt]", TreasureHunt)
	end

	if 
	  	GetServerVariable("[TreasureHunt]") == TreasureHunt and             
        GetServerVariable("[Found]") == 0 
	then
		SpawnMob(TreasureHunt)
    end
end)

return m