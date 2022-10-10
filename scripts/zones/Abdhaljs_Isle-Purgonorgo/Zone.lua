-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-----------------------------------
local ID = require('scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs')
require('scripts/globals/keyitems')
-----------------------------------
local zone_Object = {}

zone_Object.onInitialize = function(zone)
end

zone_Object.onZoneIn = function(player, prevZone)
    local cs = -1
    player:addKeyItem(xi.ki.MAP_OF_ABDH_ISLE_PURGONORGO)

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(521.600, -3.000, 563.000, 64)
    end
    return cs
	
end

<<<<<<< Updated upstream
zone_object.afterZoneIn = function(player)
		player:ChangeMusic(0, 200)
		player:ChangeMusic(1, 200)
		player:ChangeMusic(2, 200)
		player:ChangeMusic(3, 200)
		player:ChangeMusic(4, 200)
		player:PrintToPlayer("The air feels stagnant..." ,13)
=======
zone_Object.afterZoneIn = function(player)
	player:ChangeMusic(0, 200)
	player:ChangeMusic(1, 200)
	player:ChangeMusic(2, 200)
	player:ChangeMusic(3, 200)
	player:ChangeMusic(4, 200)
	player:PrintToPlayer("The air feels stagnant..." ,13)
>>>>>>> Stashed changes
end

zone_Object.onRegionEnter = function(player, region)
end

zone_Object.onEventUpdate = function(player, csid, option)
end

zone_Object.onEventFinish = function(player, csid, option)
end

return zone_Object
