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
		npc:renameEntity("Check Point")
	end
	
	entity.onTrigger = function(player, npc, playerArg)
	
		npc:facePlayer(player)
			local party = player:getParty()
			local MenuOpen = 1	
				local menu =
				{
					title = "End the Invasion?",
					onStart = function(playerArg)
					end,
				options =
				{
				
					{
						"Fight on!",
						function(playerArg)
						end,
					},
				
					{ 
						"All Retreat",
						function(playerArg)
							for i, partyMember in pairs(party) do
								if partyMember:isPC() then
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
	
return entity