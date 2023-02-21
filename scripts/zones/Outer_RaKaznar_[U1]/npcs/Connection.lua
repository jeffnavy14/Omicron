-----------------------------------
--
-----------------------------------
local entity = {}
local GetOut = function(player, npc, actionId, animationId, speceffect, reaction, message)
	player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
	player:timer(2000, function(player)
		player:setPos(0,0,0)
	end)
end


entity.onInitialize = function(player, npc, trade)
	GetNPCByID(17904623):setStatus(xi.status.NORMAL)
	GetNPCByID(17904624):setStatus(xi.status.NORMAL)
	GetNPCByID(17904625):setStatus(xi.status.NORMAL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local party = player:getParty()
	local MenuOpen = 1	
	local menu =
	{
		title = "Into the mists?",
		onStart = function(playerArg)
		end,
	options =
	{
		{
			"Stay",
			function(playerArg)
			end,
		},
		{
			"Leave (This will end your part in the claim.)",
			function(playerArg)
				player:changeMusic(0, 73)
				player:changeMusic(1, 73)
				player:changeMusic(2, 73)
				player:changeMusic(3, 73)
				player:changeMusic(4, 73)
				local path = player:getCharVar("VagPathActive")
				if path == 1 then
					player:setCharVar("VagPathActive", 0)
					if party ~= nil then
						SetServerVariable("Vag1Active", 0)
					end
				elseif path == 2 then
					player:setCharVar("VagPathActive", 0)
					if party ~= nil then
						SetServerVariable("Vag2Active", 0)
					end
				elseif path == 3 then
					player:setCharVar("VagPathActive", 0)
					if party ~= nil then	
						SetServerVariable("Vag3Active", 0)
					end
				end
				GetOut(player, npc, actionId, animationId, speceffect, reaction, message)
			end,
		},
	},
	onCancelled = function(playerArg)
		local MenuOpen = 0
	end,
	onEnd = function(playerArg)
		local MenuOpen = 0
	end,
	}
	player:timer(50, function(playerArg)
	playerArg:customMenu(menu)
	end)
			

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
