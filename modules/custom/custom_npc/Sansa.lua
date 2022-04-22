-----------------------------------
-- Add some test NPCs to GM_HOME (zone 210)
-----------------------------------
require("modules/module_utils")
require("scripts/zones/GM_Home/Zone")
-----------------------------------
local m = Module:new("Sansa")
m:setEnabled(true)

m:addOverride("xi.zones.GM_Home.Zone.onInitialize", function(zone)

    super(zone)

     local sansa = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Sansa",
        look = "010000027710652000300b400350006000700000",
        x = 25.000,
        y = 0.000,
        z = 0.000,
        rotation = 128,
        widescan = 1,


        onTrade = function(player, npc, trade)
        end,

        onTrigger = function(player, npc)
			player:PrintToPlayer("Your future segway to augmented AF +1 gear!", 0, npc:getPacketName())
		end,
    })

    utils.unused(sansa_one)
end)

return m
