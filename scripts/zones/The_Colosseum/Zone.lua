-----------------------------------
-- Zone: The_Colosseum
-----------------------------------
local ID = require('scripts/zones/The_Colosseum/IDs')
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
	SetServerVariable("[Arena}T1active", 0)
	SetServerVariable("[Arena}T2active", 0)
	SetServerVariable("[Arena}T3active", 0)
	SetServerVariable("[Arena}T4active", 0)
	SetServerVariable("[Arena}T5active", 0)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1
	if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-600, 0, 40)
    end
    return cs
end

zone_object.afterZoneIn = function(player)
    
	player:changeMusic(0, 70) -- Monstrosity
	player:changeMusic(1, 70) -- Monstrosity
	player:PrintToPlayer("There's a need to fight in the air..." ,13)
	
end

zone_object.onRegionEnter = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
end

return zone_object
