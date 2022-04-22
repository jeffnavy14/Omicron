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
		
		end

		onEventUpdate = function(player,csid,option)
  
		end

    })
    utils.unused(smalls)

end)

return m
