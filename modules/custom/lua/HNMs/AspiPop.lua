-----------------------------------
require("modules/module_utils")
require("scripts/zones/Valley_of_Sorrows/Zone")
require("scripts/globals/keyitems")
-----------------------------------
local m = Module:new("AspiPop")

m:addOverride("xi.zones.Valley_of_Sorrows.Zone.onInitialize", function(zone)
       super(zone)

local aspi = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "???",
		look = 2445,
        x = 12.7279,
        y = -1.8153,
        z = -41.1921,
        rotation = 180,

        onTrigger = function(player, npc)
            if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		       SetServerVariable("[EschanAspi]", 1)
            end
        end,			
        onTrade = function(player, npc, trade)	
		    if GetServerVariable("[EschanAspi]") == 0 and player:hasKeyItem(xi.ki.KUPOFRIEDS_MEDALLION) and (trade:hasItemQty(3344,1)) then -- Pond Weed
                player:tradeComplete()
				player:delKeyItem(xi.ki.KUPOFRIEDS_MEDALLION)
                SetServerVariable("[EschanAspi]", 1) 
			end
		end,
	})
end)

return m