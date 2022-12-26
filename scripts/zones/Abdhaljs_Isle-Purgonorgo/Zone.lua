-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-----------------------------------
local ID = require('scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs')
require('scripts/globals/keyitems')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1
    player:addKeyItem(xi.ki.MAP_OF_ABDH_ISLE_PURGONORGO)

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(521.600, -3.000, 563.000, 64)
    end

    return cs
	
end

zone_object.afterZoneIn = function(player)
    if player:hasKeyItem(xi.ki.LIMIT_BREAKER) then
		player:changeMusic(0, 33) -- Voracious Resurgence Unknown 7
		player:changeMusic(1, 33)
		player:changeMusic(2, 33)
		player:changeMusic(3, 33)
		player:changeMusic(4, 33)
        -- For invasion use 30 Oddysey, Bumba
		player:PrintToPlayer("The air feels stagnant..." ,13)
	end
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
