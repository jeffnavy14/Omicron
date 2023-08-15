-----------------------------------
-- NPC to give initial missions for Chapter 4
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("BrokenWaypoint")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)
	local BrokenWapoint = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Broken Waypoint",
        look = 2420,
        x = 592.000,
        y = -3.000,
        z = 227.000,
		rotation = 95.25,
		
		widescan = 1,
		
	onTrigger = function(player, npc, playerArg)
		npc:facePlayer(player)
		if player:getCharVar("Mission4State") > 0 then
			player:PrintToPlayer("Balamor: Oh jeeze, nearly dropped my Frapachino... All set I assume?", 13)
			
			local party = player:getParty()
			local MenuOpen = 1	
				local menu =
				{
					title = "Go on a trip?",
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
						"Proceed",
						function(playerArg)
							for i, partyMember in pairs(party) do
								if partyMember:isPC() and partyMember:getCharVar("Mission4State") > 0 then
									partyMember:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
									partyMember:timer(2000, function(player)
										player:setPos(180,-20,183,120,43)
									end)
								else
									player:PrintToPlayer("One of you isn't ready for this yet", 13)
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
		elseif player:getCharVar("VagPath3Win") == 1 then
			player:PrintToPlayer("Mysterious voice: Well, well you have been a busy little bee haven't you?", 13)
			player:PrintToPlayer("Balamor: Allow me to introduce myself, I am none other than the glourious Balamor. A pleasure to meet a celebrity such as me I am sure.", 13)
			player:PrintToPlayer("This device is one from this world's far western continent of Ulbaka, its not a fully functional device to be honest, I outfitted it with a linkpearl.", 13)
			player:timer(3000, function(player)
				player:PrintToPlayer("Balamor: I am sure you have many questions about this pseudo-Abyssean land you have found yourself in, of which I will glady answer.", 13)
				player:PrintToPlayer(" ", 13)
				player:PrintToPlayer("Eventually. First you have a mighty task ahead of you, one that does need tending to right away to be true.", 13)
			end)
			player:timer(6000, function(player)
				player:PrintToPlayer("Balamor: There is a region, where the true Abyssean wars have been getting waged. Far worse than what dear ol' Hades tried to do here.", 13)
				player:PrintToPlayer("The last safehold of the Shadow Lord's armies.", 13)
				player:PrintToPlayer("Get some snacks, bring some friends, and pray you can do what needs to be done. You see, if you do not... all will be undone. This I have seen before,", 13)
				player:PrintToPlayer("other realms and such. When you are ready, away I can send you.", 13)
			end)
			player:setCharVar("Mission4State", 1)	
		end	
	end,
	
	    })
    utils.unused(BrokenWapoint)
end)

return m