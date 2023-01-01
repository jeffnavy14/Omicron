-----------------------------------
--
-----------------------------------
local entity = {}

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
			"Leave",
			function(playerArg)
				player:setPos(0,0,0)
				player:changeMusic(0, 73)
				player:changeMusic(1, 73)
				player:changeMusic(2, 73)
				player:changeMusic(3, 73)
				player:changeMusic(4, 73)
				local path = player:getCharVar("VagPathActive")
				if path == 1 then
					player:setCharVar("VagPathActive", 0)
					SetServerVariable("Vag1Active", 0)
				elseif path == 2 then
					player:setCharVar("VagPathActive", 0)
					SetServerVariable("Vag2Active", 0)
				elseif path == 3 then
					player:setCharVar("VagPathActive", 0)
					SetServerVariable("Vag3Active", 0)
				end
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
