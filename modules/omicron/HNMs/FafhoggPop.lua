-----------------------------------
require("modules/module_utils")
require("scripts/zones/Dragons_Aery/Zone")
-----------------------------------
local m = Module:new("FafHoggPop")

m:addOverride("xi.zones.Dragons_Aery.Zone.onInitialize", function(zone)
       super(zone)

local nidpop = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "??",
		look = 2445,
        x = 88.7748,
        y = 4,
        z = 23.1736,
        rotation = 180,

        onTrigger = function(player, npc)
            if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		       SetServerVariable("[EschanNid]", 1)
            end
        end,			
        onTrade = function(player, npc, trade)	
		    if GetServerVariable("[EschanNid]") == 0 and player:hasKeyItem(xi.ki.KUPOFRIEDS_MEDALLION) and (trade:hasItemQty(3339,1)) then -- Pond Weed
                player:tradeComplete()
				player:delKeyItem(xi.ki.KUPOFRIEDS_MEDALLION)
                SetServerVariable("[EschanNid]", 1) 
			end
		end,
	})

local fafpop = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "???",
		look = 2445,
        x = 93.4929,
        y = 4,
        z = 28.1736,
        rotation = 150,

        onTrigger = function(player, npc)
            if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		       SetServerVariable("[EschanFaf]", 1)
            end
        end,		
        onTrade = function(player, npc, trade)	
		    if GetServerVariable("[EschanFaf]") == 0 and player:hasKeyItem(xi.ki.KUPOFRIEDS_MEDALLION) and player:hasItem(3340,1) then -- Pond Weed
                player:delItem(3340,1)
				player:delKeyItem(xi.ki.KUPOFRIEDS_MEDALLION)
                SetServerVariable("[EschanFaf]", 1) 
			end
		end,
	})

end)

return m