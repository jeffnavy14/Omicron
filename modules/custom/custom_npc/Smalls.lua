-----------------------------------
-- Add some test NPCs to Port_Bastok (zone 210)
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Port_Bastok/Zone")
require("scripts/settings/main")
local ID = require("scripts/zones/Port_Bastok/IDs");
-----------------------------------
local m = Module:new("Smalls")
m:setEnabled(true)

m:addOverride("xi.zones.Port_Bastok.Zone.onInitialize", function(zone)

    -- Call the zone's original function for onInitialize
    super(zone)

    -- Insert NPC into zone
    local smalls = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Smalls",
        look = 2430,
        x = 63.574,
        y = 8.500,
        z = -242.485,
        rotation = 128,
        widescan = 1,

        -- The entity will not be "triggerable" unless you populate onTrigger
        ontrade = function(player, npc)
		
		end
		
		onTrigger = function(player, npc)
			  local menu =
    {
        title = "Test Menu (Play Effect)",
        onStart = function(playerArg)
            -- NOTE: This could be used to lock the player in place
            playerArg:PrintToPlayer("Test Menu Opening", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
                "Option 1: Hearts",
                function(playerArg)
                    playerArg:PrintToPlayer("Option 1 Selected", xi.msg.channel.NS_SAY)
                    playerArg:independentAnimation(playerArg, 251, 4) -- Hearts
                end,
            },
            {
                "Option 2: Music Notes",
                function(playerArg)
                    playerArg:PrintToPlayer("Option 2 Selected", xi.msg.channel.NS_SAY)
                    playerArg:independentAnimation(playerArg, 252, 4) -- Music Notes
                end,
            },
            {
                "Option 3: Next",
                function(playerArg)
					break
					
  local menu =
    {
        title = "Test Menu (Play Effect)",
        onStart = function(playerArg)
            -- NOTE: This could be used to lock the player in place
            playerArg:PrintToPlayer("Test Menu Opening", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
                "Option 1: Hearts",
                function(playerArg)
                    playerArg:PrintToPlayer("Option 1 Selected", xi.msg.channel.NS_SAY)
                    playerArg:independentAnimation(playerArg, 251, 4) -- Hearts
                end,
            },
            {
                "Option 2: Music Notes",
                function(playerArg)
                    playerArg:PrintToPlayer("Option 2 Selected", xi.msg.channel.NS_SAY)
                    playerArg:independentAnimation(playerArg, 252, 4) -- Music Notes
                end,
            },
            {
                "Option 3: Lightbulb",
                function(playerArg)
                    playerArg:PrintToPlayer("Option 3 Selected", xi.msg.channel.NS_SAY)
                    playerArg:independentAnimation(playerArg, 250, 4) -- Lightbulb
                end,
            },
        },
        onCancelled = function(playerArg)
            playerArg:PrintToPlayer("Test Menu Cancelled", xi.msg.channel.NS_SAY)
        end,
        onEnd = function(playerArg)
            -- NOTE: This could be used to release a locked player,
            playerArg:PrintToPlayer("Test Menu Closing", xi.msg.channel.NS_SAY)
        end,
    }
    player:customMenu(menu)
                end,
            },
        },
        onCancelled = function(playerArg)
            playerArg:PrintToPlayer("Test Menu Cancelled", xi.msg.channel.NS_SAY)
        end,
        onEnd = function(playerArg)
            -- NOTE: This could be used to release a locked player,
            playerArg:PrintToPlayer("Test Menu Closing", xi.msg.channel.NS_SAY)
        end,
    }
    player:customMenu(menu)
		end

		onEventUpdate = function(player,csid,option)
  
		end

    })
    utils.unused(smalls)

end)

return m
