---------------------------------------
-- Feral Master
-- Starts fights
---------------------------------------
require("modules/module_utils")
require("scripts/zones/The_Colosseum/Zone")
require('scripts/globals/npc_util')
---------------------------------------

local m = Module:new("Feral_Master")
m:setEnabled(true)

local T1MobFight = function(player, npc, zone)
	
	local ArenaMonth = GetServerVariable("[Arena]FightMonth")
	local PlayerMonth = player:getCharVar("[Arena]month")
	local PlayerTier = player:getCharVar("[Arena]tier")
	local party = player:getParty()
	
	if party ~= nil then
		
		for i, v in pairs(player:getParty()) do
			if not (v:getCharVar("[Arena]month") == ArenaMonth) and
				not (v:getCharVar("[Arena]tier") == 1) then
					player:PrintToPlayer("One or more members do not meet the requirements, all members must select the same tier.", 29)
				return
			end
		end
		
		if GetServerVariable("[Arena]T1active") ~= 1 then
			for i, partyMember in pairs(party) do
				
				if partyMember:isPC() and partyMember:getCharVar("[Arena]tier") == 1 then
					partyMember:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
					partyMember:timer(2000, function(player)
						player:setPos(40,0,250,63.75)
					end)
					partyMember:changeMusic(0, 85)
					partyMember:changeMusic(1, 85)
					partyMember:changeMusic(2, 85)
					partyMember:changeMusic(3, 85)
					partyMember:changeMusic(4, 85)
					
					--[[ for testing
						SpawnMob()
					]]
					--
					if GetServerVariable("[Arena]FightMonth") == 1 then
						SpawnMob(17068038, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 2 then
						SpawnMob(17068038, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 3 then
						SpawnMob(17068033, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 4 then
						SpawnMob(17068038, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 5 then
						SpawnMob(17068053, 1800)
						SpawnMob(17068058, 1800)
						SpawnMob(17068059, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 6 then
						SpawnMob(17068071, 1800)
						SpawnMob(17068076, 1800)
						SpawnMob(17068077, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 7 then
						SpawnMob(17068088, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 8 then
						SpawnMob(17068038, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 9 then
						SpawnMob(17068038, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 10 then
						SpawnMob(17068038, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 11 then
						SpawnMob(17068071, 1800)
						SpawnMob(17068076, 1800)
						SpawnMob(17068077, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 12 then
						SpawnMob(17068038, 1800) -- temp filler
					end
					--]]
					
					SetServerVariable("[Arena]T1active", 1)
				else
					player:PrintToPlayer("One of your party members is registered for a different tier, and was not transported.", 13)
				end				
			end	
		end
	end
	
end
-----------------------------------
-----------------------------------

local T2MobFight = function(player, npc, zone)
	
	local ArenaMonth = GetServerVariable("[Arena]FightMonth")
	local PlayerMonth = player:getCharVar("[Arena]month")
	local PlayerTier = player:getCharVar("[Arena]tier")
	local party = player:getParty()
	
	if party ~= nil then
		
		for i, v in pairs(player:getParty()) do
			if not (v:getCharVar("[Arena]month") == ArenaMonth) and (v:getCharVar("[Arena]tier") ~= 2) then
				player:PrintToPlayer("One or more members do not meet the requirements.", 13)
				return
			end
		end
		
		if GetServerVariable("[Arena]T2active") ~= 1 then
			for i, partyMember in pairs(party) do
				
				if partyMember:isPC() and partyMember:getCharVar("[Arena]tier") == 2 then
					partyMember:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
					partyMember:timer(2000, function(player)
						player:setPos(40,0,-250,180.25)
					end)
					partyMember:changeMusic(0, 85)
					partyMember:changeMusic(1, 85)
					partyMember:changeMusic(2, 85)
					partyMember:changeMusic(3, 85)
					partyMember:changeMusic(4, 85)
					
					--[[ for testing
						SpawnMob()
					]]
					--
					if GetServerVariable("[Arena]FightMonth") == 1 then
						SpawnMob(17068034, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 2 then
						SpawnMob(17068034, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 3 then
						SpawnMob(17068034, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 4 then
						SpawnMob(17068039, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 5 then
						SpawnMob(17068054, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 6 then
						SpawnMob(17068072, 1800)
						SpawnMob(17068078, 1800)
						SpawnMob(17068079, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 7 then
						SpawnMob(17068089, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 8 then
						SpawnMob(17068034, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 9 then
						SpawnMob(17068034, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 10 then
						SpawnMob(17068034, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 11 then
						SpawnMob(17068072, 1800)
						SpawnMob(17068078, 1800)
						SpawnMob(17068079, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 12 then
						SpawnMob(17068034, 1800) -- temp filler
					end
					--]]
					
					SetServerVariable("[Arena]T2active", 1)
				else
					player:PrintToPlayer("One of your party members is registered for a different tier, and was not transported.", 13)
				end		
			end	
		end
	end
	
end
-----------------------------------
-----------------------------------
local T3MobFight = function(player, npc, zone)
	
	local ArenaMonth = GetServerVariable("[Arena]FightMonth")
	local PlayerMonth = player:getCharVar("[Arena]month")
	local PlayerTier = player:getCharVar("[Arena]tier")
	local party = player:getParty()
	
	if party ~= nil then
		
		for i, v in pairs(player:getParty()) do
			if not (v:getCharVar("[Arena]month") == ArenaMonth) and (v:getCharVar("[Arena]tier") ~= 3) then
				player:PrintToPlayer("One or more members do not meet the requirements.", 13)
				return
			end
		end
		
		if GetServerVariable("[Arena]T3active") ~= 1 then
			for i, partyMember in pairs(party) do
				
				if partyMember:isPC() and partyMember:getCharVar("[Arena]tier") == 3 then
					partyMember:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
					partyMember:timer(2000, function(player)
						player:setPos(-40,0,-250,180.25)
					end)
					partyMember:changeMusic(0, 85)
					partyMember:changeMusic(1, 85)
					partyMember:changeMusic(2, 85)
					partyMember:changeMusic(3, 85)
					partyMember:changeMusic(4, 85)
					--[[ for testing
						SpawnMob(17068055)
					]]
					--
					if GetServerVariable("[Arena]FightMonth") == 1 then
						SpawnMob(17068055, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 2 then
						SpawnMob(17068055, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 3 then
						SpawnMob(17068035, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 4 then
						SpawnMob(17068040, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 5 then
						SpawnMob(17068055, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 6 then
						SpawnMob(17068073, 1800)
						SpawnMob(17068080, 1800)
						SpawnMob(17068081, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 7 then
						SpawnMob(17068090, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 8 then
						SpawnMob(17068055, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 9 then
						SpawnMob(17068055, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 10 then
						SpawnMob(17068055, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 11 then
						SpawnMob(17068073, 1800)
						SpawnMob(17068080, 1800)
						SpawnMob(17068081, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 12 then
						SpawnMob(17068055, 1800) -- temp filler
					end
					--]]
					
					SetServerVariable("[Arena]T3active", 1)
				else
					player:PrintToPlayer("One of your party members is registered for a different tier, and was not transported.", 13)
				end		
			end	
		end
	end	
end
-----------------------------------
-----------------------------------
local T4MobFight = function(player, npc, zone)
	
	local ArenaMonth = GetServerVariable("[Arena]FightMonth")
	local PlayerMonth = player:getCharVar("[Arena]month")
	local PlayerTier = player:getCharVar("[Arena]tier")
	local party = player:getParty()
	
	if party ~= nil then
		
		for i, v in pairs(player:getParty()) do
			if not (v:getCharVar("[Arena]month") == ArenaMonth) and (v:getCharVar("[Arena]tier") ~= 4) then
				player:PrintToPlayer("One or more members do not meet the requirements.", 13)
				return
			end
		end
		
		if GetServerVariable("[Arena]T4active") ~= 1 then
			for i, partyMember in pairs(party) do
				
				if partyMember:isPC() and partyMember:getCharVar("[Arena]tier") == 4 then
					partyMember:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
					partyMember:timer(2000, function(player)
						player:setPos(-40,0,250,63.75)
					end)
					partyMember:changeMusic(0, 85)
					partyMember:changeMusic(1, 85)
					partyMember:changeMusic(2, 85)
					partyMember:changeMusic(3, 85)
					partyMember:changeMusic(4, 85)
					--[[ for testing
						SpawnMob(17068056)
					]]
					--
					if GetServerVariable("[Arena]FightMonth") == 1 then
						SpawnMob(17068036, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 2 then
						SpawnMob(17068036, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 3 then
						SpawnMob(17068036, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 4 then
						SpawnMob(17068041, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 5 then
						SpawnMob(17068056, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 6 then
						SpawnMob(17068074, 1800)
						SpawnMob(17068082, 1800)
						SpawnMob(17068083, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 7 then
						SpawnMob(17068091, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 8 then
						SpawnMob(17068036, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 9 then
						SpawnMob(17068036, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 10 then
						SpawnMob(17068036, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 11 then
						SpawnMob(17068074, 1800)
						SpawnMob(17068082, 1800)
						SpawnMob(17068083, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 12 then
						SpawnMob(17068036, 1800) -- temp filler
					end
					--]]
					partyMember:timer(1800000, function(player)
						if GetServerVariable("[Arena]T4active") == 1 then
							SetServerVariable("[Arena]T4active, 0")
						end
					end)
					SetServerVariable("[Arena]T4active", 1)
				else
					player:PrintToPlayer("One of your party members is registered for a different tier, and was not transported.", 13)
				end		
			end	
		end
	end
	
end
-----------------------------------
-----------------------------------
local T5MobFight = function(player, npc, zone)
	
	local ArenaMonth = GetServerVariable("[Arena]FightMonth")
	local PlayerMonth = player:getCharVar("[Arena]month")
	local PlayerTier = player:getCharVar("[Arena]tier")
	local party = player:getParty()
	
	if party ~= nil then
		
		for i, v in pairs(player:getParty()) do
			if not (v:getCharVar("[Arena]month") == ArenaMonth) and (v:getCharVar("[Arena]tier") ~= 5) then
				player:PrintToPlayer("One or more members do not meet the requirements.", 13)
				return
			end
		end
		
		if GetServerVariable("[Arena]T5active") ~= 1 then
			for i, partyMember in pairs(party) do
				
				if partyMember:isPC() and partyMember:getCharVar("[Arena]tier") == 5 then
					partyMember:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
					partyMember:timer(2000, function(player)
						player:setPos(40,0,310,180.25)
					end)
					partyMember:changeMusic(0, 85)
					partyMember:changeMusic(1, 85)
					partyMember:changeMusic(2, 85)
					partyMember:changeMusic(3, 85)
					partyMember:changeMusic(4, 85)
					--[[ for testing
						SpawnMob(17068057)
					]]
					--
					if GetServerVariable("[Arena]FightMonth") == 1 then
						SpawnMob(17068057, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 2 then
						SpawnMob(17068057, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 3 then
						SpawnMob(17068037, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 4 then
						SpawnMob(17068042, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 5 then
						SpawnMob(17068057, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 6 then
						SpawnMob(17068075, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 7 then
						SpawnMob(17068092, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 8 then
						SpawnMob(17068057, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 9 then
						SpawnMob(17068057, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 10 then
						SpawnMob(17068057, 1800) -- temp filler
					elseif GetServerVariable("[Arena]FightMonth") == 11 then
						SpawnMob(17068075, 1800)
					elseif GetServerVariable("[Arena]FightMonth") == 12 then
						SpawnMob(17068057, 1800) -- temp filler
					end
					--]]
					SetServerVariable("[Arena]T5active", 1)
				else
					player:PrintToPlayer("One of your party members is registered for a different tier, and was not transported.", 13)
				end		
			end	
		end
	end
	
end
-----------------------------------
-----------------------------------

---------------------------------------
-- End of Monster Spawner
---------------------------------------

m:addOverride("xi.zones.The_Colosseum.Zone.onInitialize", function(zone)

    super(zone)

		local Feral_Master = zone:insertDynamicEntity({

			objtype = xi.objType.NPC,
			name = "Feral Master",
			look = 2256,
			x = -585.000,
			y = 0.000,
			z = 21.000,
			rotation = 180.25,
			
			
			onTrigger = function(player, npc)
			npc:facePlayer(player)
			local menu =
			{
				title = "Hmm? ",
				onStart = function(playerArg)
				end,
				options =
				{
			
					{
						"A little help please.",
						function(playerArg)
							player:PrintToPlayer("Feral Master: Well to put as simple as possible, you get to fight for prizes here.", xi.msg.channel.NS_SAY)
							player:PrintToPlayer("First go see the Registrar to sign up for a tier, then come to me and I'll send you to your fight.", xi.msg.channel.NS_SAY)
							player:PrintToPlayer("At the end you get your prize depending on the tier you chose.", xi.msg.channel.NS_SAY)
							
						end,
					},
					
					{
						"Ready to Fight!",
						function(playerArg)
							local ArenaMonth = GetServerVariable("[Arena]FightMonth")
							local PlayerMonth = player:getCharVar("[Arena]month")
							local PlayerTier = player:getCharVar("[Arena]tier")
							if PlayerTier > 0 then
								if PlayerMonth == ArenaMonth then
									player:PrintToPlayer("Feral Master: Alright, one moment and I'll send you on your way. You've got 30 minutes with the wee one.", xi.msg.channel.NS_SAY)
									if PlayerTier == 1 and GetServerVariable("[Arena]T1active") == 0 then
										T1MobFight(player, npc, zone)
									elseif PlayerTier == 2 and GetServerVariable("[Arena]T2active") == 0 then
										T2MobFight(player, npc, zone)
									elseif PlayerTier == 3 and GetServerVariable("[Arena]T3active") == 0  then
										T3MobFight(player, npc, zone)
									elseif PlayerTier == 4 and GetServerVariable("[Arena]T4active") == 0 then
										T4MobFight(player, npc, zone)
									elseif PlayerTier == 5 and GetServerVariable("[Arena]T5active") == 0 then
										T5MobFight(player, npc, zone)
									else
										player:PrintToPlayer("Feral Master: Oh sorry it looks like you'll need to wait a bit before starting, or try another tier.", xi.msg.channel.NS_SAY)
									end
									
								else
									player:PrintToPlayer("Feral Master: Seems you don't have a current registration, see the Registrar and she'll fix you right up.", xi.msg.channel.NS_SAY)
									
								end
							else
								player:PrintToPlayer("Feral Master: Looks like you haven't registered yet, just speak with the Registrar to fix that.", xi.msg.channel.NS_SAY)
								
							end
						end,
					},
					
					{
						"Nevermind",
						function(playerArg)
						
						end,
					},
				
				},
				onCancelled = function(playerArg)
				end,
				onEnd = function(playerArg)
				end,
			}
			player:customMenu(menu)
			
		end
		
	})

	utils.unused(Feral_Master)	

end)

return m
