------------------------------------
require("modules/module_utils")
require("scripts/zones/Behemoths_Dominion/Zone")
-----------------------------------
local m = Module:new("KBPop")

m:addOverride("xi.zones.Behemoths_Dominion.Zone.onInitialize", function(zone)
       super(zone)

local kbpop = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "???",
		look = 2445,
        x = -267.4073,
        y = -19.5450,
        z = 81.4810,
        rotation = 28,

        onTrigger = function(player, npc)
            if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		       SetServerVariable("[EschanKB]", 1)
            end
        end,
		
        onTrade = function(player, npc, trade)	
		    if GetServerVariable("[EschanKB]") == 0 and player:hasKeyItem(xi.ki.KUPOFRIEDS_MEDALLION) and (trade:hasItemQty(3342,1)) then -- Pond Weed
                player:tradeComplete()
				player:delKeyItem(xi.ki.KUPOFRIEDS_MEDALLION)
                SetServerVariable("[EschanKB]", 1) 
			end
		end,
	})
end)

return m