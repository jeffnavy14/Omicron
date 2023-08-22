-----------------------------------
-- Return NPC (zone 43) relocate and add the initiating code
-----------------------------------
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
require("scripts/zones/Diorama_Abdhaljs-Ghelsba/Zone")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------
local entity = {}
------------------
	entity.onSpawn = function(npc)
		npc:renameEntity("Return Waypoint")
	end
	
	entity.onTrigger = function(player, npc, playerArg)
	
		npc:facePlayer(player)
		if player:getCharVar("Mission4State") == 1 then
			player:PrintToPlayer("Balamor: This is the last of the beastmen strongholds in this version of Abyssea. Its was hard on them, as you can imagine.", 13)
			player:PrintToPlayer("However, they ultimatly lost their battle, but you may be able to turn the tide to survivable for the survivors of your island.", 13)
			player:PrintToPlayer("The rest I'll leave to you... Have fun! Toodles!", 13)
			player:setCharVar("Mission4State", 2)
		elseif player:getCharVar("Mission4State") > 1 then
			
			local party = player:getParty()
			local MenuOpen = 1	
				local menu =
				{
					title = "Return to the Island?",
					onStart = function(playerArg)
					end,
				options =
				{
				
					{
						"Not yet",
						function(playerArg)
						end,
					},
					
					{
						"Begin",
						function(playerArg)
							if GetServerVariable("Decent") > 1 and os.time() > GetServerVariable("DecentTime") then
								SetServerVariable("Decent", 0)
							end
							if GetServerVariable("Decent") == 0 then
								--Spawn Wave 1
								local decentP1id = 16953349 -- Wave 1 Wanderers
								repeat
									SpawnMob(decentP1id)
									decentP1id = decentP1id + 1
								until decentP1id == 16953361
								SpawnMob(16953379) -- Recepticle 1
								SetServerVariable("Decent", 1)
								SetServerVariable("DecentTime", os.time() + 3600)
								local DecentTimer = GetServerVariable("DecentTime")
								--Set Party Variables and warp to start point
								GetNPCByID(16953347):setStatus(xi.status.INVISIBLE)
								GetNPCByID(16953348):setStatus(xi.status.INVISIBLE)
								for i, partyMember in pairs(party) do
									if partyMember:isPC() and partyMember:getCharVar("Mission4State") > 0 then
										partyMember:PrintToPlayer("Balamor: Time to invade the invaders! Aaaaand here we gooooo!", 13)
										partyMember:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
										partyMember:timer(2000, function(player)
											partyMember:setPos(-30,0,-15,0)
											partyMember:setCharVar("DecentGroup", 1)
											partyMember:changeMusic(0, 52)
											partyMember:changeMusic(1, 52)
											partyMember:changeMusic(2, 52)
											partyMember:changeMusic(3, 52)
											partyMember:changeMusic(4, 52)
											partyMember:timer(3600000, function(player)
												if partyMember:getCharVar("DecentGroup") == 1 then
													SetServerVariable("Decent", 0)
													partyMember:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
													partyMember:setPos(180,-20,183,120)
													partyMember:setCharVar("DecentGroup", 0)
													partyMember:changeMusic(0, 33)
													partyMember:changeMusic(1, 33)
													partyMember:changeMusic(2, 33)
													partyMember:changeMusic(3, 33)
													partyMember:changeMusic(4, 33)
													partyMember:PrintToPlayer("Balamor's enchantment has expired.", 13)
												end
											end)
										end)
									end
								end
							elseif GetServerVariable("Decent") > 0 and player:getCharVar("DecentGroup") == 1 then
								local DecentTimer = GetServerVariable("Decent") - os.time()
								player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
								player:setPos(-30,0,-15,0)
								player:timer(DecentTimer, function(player)
									if player:getCharVar("DecentGroup") == 1 then
										player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
										player:setPos(180,-20,183,120)
										player:changeMusic(0, 33)
										player:changeMusic(1, 33)
										player:changeMusic(2, 33)
										player:changeMusic(3, 33)
										player:changeMusic(4, 33)
										player:PrintToPlayer("Balamor's enchantment has expired.", 13)
									end
								end)
							elseif GetServerVariable("Decent") > 0 and player:getCharVar("DecentGroup") ~= 1 then
								player:PrintToPlayer("Seems there's already some activity in there, best to wait a bit", 13)
							end
						end,
							
					},
					
					{
						"Leave.",
						function(playerArg)
							player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
							player:timer(2000, function(player)
								player:setPos(591,-3,224,0,44)
							end)
						end,
					},
					{
						"About here",
						function(playerArg)
							player:PrintToPlayer("Balamor: This is the last of the beastmen strongholds in this version of Abyssea. Its was hard on them, as you can imagine.", 13)
							player:PrintToPlayer("However, they ultimatly lost their battle, but you may be able to turn the tide to survivable for the survivors of your island.", 13)
							player:PrintToPlayer("The rest I'll leave to you... Have fun! Toodles!", 13)
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
		
	end
	
return entity