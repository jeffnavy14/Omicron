-----------------------------------
-- (zone 123)
-- Relic Weapons
-----------------------------------
require("scripts/globals/shop")
require("scripts/globals/chocobo")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/zones/Attohwa_Chasm/Zone")
-----------------------------------
local m = Module:new("merlin")
m:setEnabled(true)

m:addOverride("xi.zones.Attohwa_Chasm.Zone.onInitialize", function(zone)

       super(zone)

    local fossal = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Merlin",
        look = 2430,

        x = 350.424,
        y = -21.803,
        z = -65.213,

        rotation = 28,

        widescan = 1,

        onTrade = function(player, npc, trade)
   
   ---Relic Weapon 99 > "+1" 119

    if (trade:hasItemQty(19746, 1)) then
	    player:tradeComplete();
	    player:addItem(20509, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20509);
		
	elseif (trade:hasItemQty(19747, 1)) then
	    player:tradeComplete();
	    player:addItem(20583, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20583);
		
	elseif (trade:hasItemQty(19748, 1)) then
	    player:tradeComplete();
	    player:addItem(20685, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20685);
		
	elseif (trade:hasItemQty(19749, 1)) then
	    player:tradeComplete();
	    player:addItem(21683, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21683);
		
	elseif (trade:hasItemQty(19750, 1)) then
	    player:tradeComplete();
	    player:addItem(21750, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21750);
		
	elseif (trade:hasItemQty(19751, 1)) then
	    player:tradeComplete();
	    player:addItem(21756, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21756);
		
	elseif (trade:hasItemQty(19752, 1)) then
	    player:tradeComplete();
	    player:addItem(21857, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21857);
		
	elseif (trade:hasItemQty(19753, 1)) then
	    player:tradeComplete();
	    player:addItem(21808, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21808);
		
	elseif (trade:hasItemQty(19754, 1)) then
	    player:tradeComplete();
	    player:addItem(21906, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21906);
		
	elseif (trade:hasItemQty(19755, 1)) then
	    player:tradeComplete();
	    player:addItem(21954, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21954);
		
	elseif (trade:hasItemQty(19756, 1)) then
	    player:tradeComplete();
	    player:addItem(21077, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21077);
		
	elseif (trade:hasItemQty(19757, 1)) then
	    player:tradeComplete();
	    player:addItem(22060, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 22060);
		
	elseif (trade:hasItemQty(19758, 1)) then
	    player:tradeComplete();
	    player:addItem(22115, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 22115);
		
	elseif (trade:hasItemQty(19759, 1)) then
	    player:tradeComplete();
	    player:addItem(21261, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21261);
		
		
	end
        end,

        onTrigger = function(player, npc)
		local scyld = player:getCurrency("scyld") 
          player:PrintToPlayer("STAND BACK! Be silent! Be still!... That's it... and look upon this moment.", 0, npc:getPacketName())
		
		end,
    })


    utils.unused(horro)

end)

return m
