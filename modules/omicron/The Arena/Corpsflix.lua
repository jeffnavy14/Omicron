-----------------------------------
-- Gatekeeper
-----------------------------------
require("modules/module_utils")
--require("scripts/zones/The_Colosseum/Zone")
-----------------------------------
local m = Module:new("Corpsflix")
m:setEnabled(true)

m:addOverride("xi.zones.The_Colosseum.Zone.onInitialize", function(zone)

    super(zone)
	
	local Corpsflix = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Corpsflix",
        look = 128,
        x = -590.000,
        y = 0.000,
        z = 40.000,
        rotation = 0,
		
		onTrigger = function(player, npc)
			
		local menu =
		{
			title = "Hmm? ",
			onStart = function(playerArg)
			end,
			options =
			{
				{
					"What's with the shovel",
					function(playerArg)
					player:PrintToPlayer("Corpsflix: To bury the dead, and clean poop.", xi.msg.channel.NS_SAY)
					end,
				},
				{
					"What's with the cage",
					function(playerArg)
					player:PrintToPlayer("Corpsflix: That's for new monsters and training.", xi.msg.channel.NS_SAY)
					end,
				},
				{
					"What's going on?",
					function(playerArg)
					player:PrintToPlayer("Corpsflix: Its an arena, and this is the lobby. I understand they are rewarding people gems to use for something, and other stuff to.", xi.msg.channel.NS_SAY)
					player:PrintToPlayer("Probably best for you to talk to the Registrar.", xi.msg.channel.NS_SAY)
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

	utils.unused(Corpsflix)	

end)

return m	
