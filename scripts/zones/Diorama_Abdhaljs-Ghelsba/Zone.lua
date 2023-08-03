-----------------------------------
-- Zone: Diorama_Abdhaljs-Ghelsba
-----------------------------------
local ID = require('scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs')
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
end

zone_object.onZoneIn = function(player, prevZone)
	
    local cs = -1

    return cs
end

zone_object.afterZoneIn = function(player)
	local DecentStage = GetServerVariable("Decent")
	local DecentTimer = GetServerVariable("DecentTime") - os.time()
	if player:hasKeyItem(xi.ki.LIMIT_BREAKER) then
		player:changeMusic(0, 33) -- Voracious Resurgence Unknown 7
		player:changeMusic(1, 33)
		player:changeMusic(2, 33)
		player:changeMusic(3, 33)
		player:changeMusic(4, 33)
        player:PrintToPlayer("The air feels stagnant..." ,13)
	end
	if player:getCharVar("DecentGroup") == 1 and DecentStage > 0 and os.time() < GetServerVariable("DecentTime") then
		if DecentStage == 1 then
			player:changeMusic(0, 52)
			player:changeMusic(1, 52)
			player:changeMusic(2, 52)
			player:changeMusic(3, 52)
			player:changeMusic(4, 52)
		elseif DecentStage == 2 then
			player:changeMusic(0, 36)
			player:changeMusic(1, 36)
			player:changeMusic(2, 36)
			player:changeMusic(3, 36)
			player:changeMusic(4, 36)
		elseif DecentStage == 3 then
			player:changeMusic(0, 30)
			player:changeMusic(1, 30)
			player:changeMusic(2, 30)
			player:changeMusic(3, 30)
			player:changeMusic(4, 30)
		elseif DecentStage == 4 then
			player:changeMusic(0, 37)
			player:changeMusic(1, 37)
			player:changeMusic(2, 37)
			player:changeMusic(3, 37)
			player:changeMusic(4, 37)
		end
		player:timer(DecentTimer, function(player)
			if player:getCharVar("DecentGroup") == 1 then
				player:setPos(180,-20,183,120)
				player:changeMusic(0, 33)
				player:changeMusic(1, 33)
				player:changeMusic(2, 33)
				player:changeMusic(3, 33)
				player:changeMusic(4, 33)
			end
		end)
	end
end

zone_object.onZoneTick = function(zone, player)
	
end

zone_object.onTriggerAreaEnter = function(player, triggerArea)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
end

return zone_object
