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
	    player:addItem(20481, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20481);
		
	elseif (trade:hasItemQty(19747, 1)) then
	    player:tradeComplete();
	    player:addItem(20556, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20556);
		
	elseif (trade:hasItemQty(19748, 1)) then
	    player:tradeComplete();
	    player:addItem(20646, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20646);
		
	elseif (trade:hasItemQty(19749, 1)) then
	    player:tradeComplete();
	    player:addItem(20746, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20746);
		
	elseif (trade:hasItemQty(19750, 1)) then
	    player:tradeComplete();
	    player:addItem(20791, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20791);
		
	elseif (trade:hasItemQty(19751, 1)) then
	    player:tradeComplete();
	    player:addItem(20836, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20836);
		
	elseif (trade:hasItemQty(19752, 1)) then
	    player:tradeComplete();
	    player:addItem(20881, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20881);
		
	elseif (trade:hasItemQty(19753, 1)) then
	    player:tradeComplete();
	    player:addItem(20926, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20926);
		
	elseif (trade:hasItemQty(19754, 1)) then
	    player:tradeComplete();
	    player:addItem(20971, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20971);
		
	elseif (trade:hasItemQty(19755, 1)) then
	    player:tradeComplete();
	    player:addItem(21016, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21016);
		
	elseif (trade:hasItemQty(19756, 1)) then
	    player:tradeComplete();
	    player:addItem(21061, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21061);
		
	elseif (trade:hasItemQty(19757, 1)) then
	    player:tradeComplete();
	    player:addItem(21136, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21136);
		
	elseif (trade:hasItemQty(19758, 1)) then
	    player:tradeComplete();
	    player:addItem(21211, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Anal nathrak uthvas bethud do che-ol di-enve.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21211);
		
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
