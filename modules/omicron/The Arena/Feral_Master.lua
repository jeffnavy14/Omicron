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
	player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
	player:timer(2000, function(player)
		player:setPos(40,0,250,63.75)
	end)
    player:changeMusic(0, 85)
	player:changeMusic(1, 85)
	player:changeMusic(2, 85)
	player:changeMusic(3, 85)
	player:changeMusic(4, 85)
	if GetServerVariable("[Arena]FightMonth") == 3 then
		SpawnMob(17068033)
	elseif GetServerVariable("[Arena]FightMonth") == 4 then
		SpawnMob(17068038)
	end
	--[[ for testing
		SpawnMob()
	]]
end
-----------------------------------
-----------------------------------

local T2MobFight = function(player, npc, zone)
	player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
	player:timer(2000, function(player)
		player:setPos(40,0,-250,180.25)
	end)
    player:changeMusic(0, 85)
	player:changeMusic(1, 85)
	player:changeMusic(2, 85)
	player:changeMusic(3, 85)
	player:changeMusic(4, 85)
	if GetServerVariable("[Arena]FightMonth") == 3 then
		SpawnMob(17068034)
	elseif GetServerVariable("[Arena]FightMonth") == 4 then	
		SpawnMob(17068039)
	end
	--[[ for testing
		SpawnMob()
	]]
end
-----------------------------------
-----------------------------------

local T3MobFight = function(player, npc, zone)
	player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
	player:timer(2000, function(player)
		player:setPos(-40,0,-250,180.25)
	end)
    player:changeMusic(0, 85)
	player:changeMusic(1, 85)
	player:changeMusic(2, 85)
	player:changeMusic(3, 85)
	player:changeMusic(4, 85)
	if GetServerVariable("[Arena]FightMonth") == 3 then	
		SpawnMob(17068035)
	elseif GetServerVariable("[Arena]FightMonth") == 4 then	
		SpawnMob(17068040)
	end
	--[[ for testing
		SpawnMob()
	]]
end
-----------------------------------
-----------------------------------

local T4MobFight = function(player, npc, zone)
	player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
	player:timer(2000, function(player)
		player:setPos(-40,0,250,63.75)
	end)
    player:changeMusic(0, 85)
	player:changeMusic(1, 85)
	player:changeMusic(2, 85)
	player:changeMusic(3, 85)
	player:changeMusic(4, 85)
	
	if GetServerVariable("[Arena]FightMonth") == 3 then
		SpawnMob(17068036)
	elseif GetServerVariable("[Arena]FightMonth") == 4 then	
		SpawnMob(17068041)
	end
	--[[ for testing
		SpawnMob()
	]]
end
-----------------------------------
-----------------------------------

local T5MobFight = function(player, npc, zone)
	player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
	player:timer(2000, function(player)
		player:setPos(40,0,310,180.25)
	end)
    player:changeMusic(0, 85)
	player:changeMusic(1, 85)
	player:changeMusic(2, 85)
	player:changeMusic(3, 85)
	player:changeMusic(4, 85)
	if GetServerVariable("[Arena]FightMonth") == 3 then
		SpawnMob(17068037)
	elseif GetServerVariable("[Arena]FightMonth") == 4 then	
		SpawnMob(17068042)
	end
	--[[ for testing 
		SpawnMob()
	]]
end
-----------------------------------
-----------------------------------

---------------------------------------
-- End of March Monsters
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
										SetServerVariable("[Arena]T1active", 1)
									elseif PlayerTier == 2 and GetServerVariable("[Arena]T2active") == 0 then
										T2MobFight(player, npc, zone)
										SetServerVariable("[Arena]T2active", 1)
									elseif PlayerTier == 3 and GetServerVariable("[Arena]T3active") == 0  then
										T3MobFight(player, npc, zone)
										SetServerVariable("[Arena]T3active", 1)
									elseif PlayerTier == 4 and GetServerVariable("[Arena]T4active") == 0 then
										T4MobFight(player, npc, zone)
										SetServerVariable("[Arena]T4active", 1)
									elseif PlayerTier == 5 and GetServerVariable("[Arena]T5active") == 0 then
										T5MobFight(player, npc, zone)
										SetServerVariable("[Arena]T5active", 1)
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