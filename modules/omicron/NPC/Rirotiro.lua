-----------------------------------
-- Obi NPC
-----------------------------------
require("scripts/zones/Port_Windurst/Zone")
require("scripts/globals/npc_util")
-----------------------------------
local m = Module:new("Rirotiro")
m:setEnabled(true)

m:addOverride("xi.zones.Port_Windurst.Zone.onInitialize", function(zone)

    super(zone)

	local Rirotiro = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Rirotiro",
        look = 190,
        x = 63.691,
        y = -5.000,
        z = 137.869,
		rotation = 65,
		widescan = 1,
	
    onTrade = function(player, npc, trade)
        if (trade:hasItemQty(15495,1) and trade:hasItemQty(15496,1) and trade:hasItemQty(15497,1) and trade:hasItemQty(15498,1)
                and trade:hasItemQty(15499,1) and trade:hasItemQty(15500,1) and trade:hasItemQty(15501,1) and trade:hasItemQty(15502,1)) then
                player:tradeComplete()
                player:messageSpecial(zones[xi.zone.PORT_WINDURST].text.ITEM_OBTAINED, 27510)
                player:addItem(27510)
        end
        if (trade:hasItemQty(15435,1) and trade:hasItemQty(15436,1) and trade:hasItemQty(15437,1) and trade:hasItemQty(15438,1)
                and trade:hasItemQty(15439,1) and trade:hasItemQty(15440,1) and trade:hasItemQty(15441,1) and trade:hasItemQty(15442,1)) then
                player:tradeComplete()
                player:messageSpecial(zones[xi.zone.PORT_WINDURST].text.ITEM_OBTAINED, 28419)
                player:addItem(28419)
        end		
        if (trade:hasItemQty(18617,1) and trade:hasItemQty(2858,2) and trade:hasItemQty(2859,1)) then
        		player:tradeComplete()
                player:messageSpecial(zones[xi.zone.PORT_WINDURST].text.ITEM_OBTAINED, 18603)
                player:addItem(18603)
		end	
        if (trade:hasItemQty(19162,1) and trade:hasItemQty(2858,3) and trade:hasItemQty(2859,1)) then
        		player:tradeComplete()
                player:messageSpecial(zones[xi.zone.PORT_WINDURST].text.ITEM_OBTAINED, 19159)
                player:addItem(19159)
		end		
        if (trade:hasItemQty(19307,1) and trade:hasItemQty(2858,2) and trade:hasItemQty(2859,1)) then
        		player:tradeComplete()
                player:messageSpecial(zones[xi.zone.PORT_WINDURST].text.ITEM_OBTAINED, 19304)
                player:addItem(19304)
		end		
        if (trade:hasItemQty(17767,1) and trade:hasItemQty(2858,2) and trade:hasItemQty(2859,2)) then
        		player:tradeComplete()
                player:messageSpecial(zones[xi.zone.PORT_WINDURST].text.ITEM_OBTAINED, 17765)
                player:addItem(17765)
        end
		if (trade:hasItemQty(19128,1) and trade:hasItemQty(2858,1) and trade:hasItemQty(2859,2)) then
        		player:tradeComplete()
                player:messageSpecial(zones[xi.zone.PORT_WINDURST].text.ITEM_OBTAINED, 19118)
                player:addItem(19118)
        end
        
	end,
	
	onTrigger = function(player, npc, status)
    	if (player:hasItem(15495) or player:hasItem(15496) or player:hasItem(15497) or player:hasItem(15498) or player:hasItem(15499) or
            player:hasItem(15500) or player:hasItem(15501) or player:hasItem(15502)) then -- Gorget
    		player:PrintToPlayer("Rirotiro : Hey, I can upgrade those Gorget's for you. Bring me all 8 I will give you a Cool Gorget!", 0xD)
    	
    	elseif (player:hasItem(15435) or player:hasItem(15436) or player:hasItem(15437) or player:hasItem(15438) or player:hasItem(15439) or
            player:hasItem(15440) or player:hasItem(15441) or player:hasItem(15442)) then --No Obi
    		player:PrintToPlayer("Rirotiro : Hey, I can upgrade those Obi's for you. Bring me all 8 I will give you a Cool Obi!", 0xD)
    	
    	elseif (player:hasItem(18617)) then -- Majestas
    		player:PrintToPlayer("Rirotiro : That Cracked Staff looks like junk, bring me a few things and I can make it better!", 0xD)
    		player:PrintToPlayer("Rirotiro : I need the Cracked Staff, Wolfram Steel x2 and a Cobalt Ore.", 0xD)
    	elseif (player:hasItem(19162)) then -- Galatyn
    		player:PrintToPlayer("Rirotiro : That Dull Claymore looks like junk, bring me a few things and I can make it better!", 0xD)
    		player:PrintToPlayer("Rirotiro : I need the Dull Claymore, Wolfram Steel x3 and a Cobalt Ore.", 0xD)	
    	elseif (player:hasItem(19307)) then -- Sarissa
    		player:PrintToPlayer("Rirotiro : That Blunt Lance looks like junk, bring me a few things and I can make it better!", 0xD)
    		player:PrintToPlayer("Rirotiro : I need the Blunt Lance, Wolfram Steel x2 and a Cobalt Ore.", 0xD)
    	elseif (player:hasItem(17767)) then -- Concordia
    		player:PrintToPlayer("Rirotiro : That Chipped Scimitar looks like junk, bring me a few things and I can make it better!", 0xD)
    		player:PrintToPlayer("Rirotiro : I need the Chipped Scimitar, Wolfram Steel x2 and Cobalt Ore x2.", 0xD)
    	elseif (player:hasItem(19128)) then -- Machismo
    		player:PrintToPlayer("Rirotiro : That Edgeless Knife looks like junk, bring me a few things and I can make it better!", 0xD)
    		player:PrintToPlayer("Rirotiro : I need the Edgeless Knife, Wolfram Steel x1 and Cobalt Ore x2.", 0xD)	
    
    
    
        else
              player:PrintToPlayer("Rirotiro : I'm a jack of all trades and a master of none.", 0xD)
			  player:PrintToPlayer("Rirotiro : Come back if you have anything of importance.", 0xD)
    
        end
    end,  
	
    })
    utils.unused(pollyB)
end)

return m