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
local m = Module:new("fossal")
m:setEnabled(true)

m:addOverride("xi.zones.Attohwa_Chasm.Zone.onInitialize", function(zone)

       super(zone)

    local fossal = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Fossal",
        look = 3037,

        x = 350.424,
        y = -21.803,
        z = -65.213,

        rotation = 28,

        widescan = 1,

        onTrade = function(player, npc, trade)
   
   ---Relic Weapon 99 > "+1" 119

    if (trade:hasItemQty(19839, 1)) and (trade:hasItemQty(1272, 1)) and (trade:hasItemQty(909, 1)) then
	    player:tradeComplete();
	    player:addItem(20480, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20480);
		
	elseif (trade:hasItemQty(19840, 1)) and (trade:hasItemQty(909, 1)) and (trade:hasItemQty(2833, 1)) then
	    player:tradeComplete();
	    player:addItem(20555, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20555);
		
	elseif (trade:hasItemQty(19841, 1)) and (trade:hasItemQty(2833, 1)) and (trade:hasItemQty(1276, 1)) then
	    player:tradeComplete();
	    player:addItem(20645, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20645);
		
	elseif (trade:hasItemQty(19842, 1)) and (trade:hasItemQty(1276, 1)) and (trade:hasItemQty(1282, 1)) then
	    player:tradeComplete();
	    player:addItem(20745, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20745);
		
	elseif (trade:hasItemQty(19843, 1)) and (trade:hasItemQty(1282, 1)) and (trade:hasItemQty(1293, 1)) then
	    player:tradeComplete();
	    player:addItem(20790, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20790);
		
	elseif (trade:hasItemQty(19844, 1)) and (trade:hasItemQty(1293, 1)) and (trade:hasItemQty(2849, 1)) then
	    player:tradeComplete();
	    player:addItem(20835, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20835);
		
	elseif (trade:hasItemQty(19846, 1)) and (trade:hasItemQty(2849, 1)) and (trade:hasItemQty(1272, 1)) then
	    player:tradeComplete();
	    player:addItem(20880, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20880);
		
	elseif (trade:hasItemQty(19845, 1)) and (trade:hasItemQty(1272, 1)) and (trade:hasItemQty(909, 1)) then
	    player:tradeComplete();
	    player:addItem(20925, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20925);
		
	elseif (trade:hasItemQty(19847, 1)) and (trade:hasItemQty(909, 1)) and (trade:hasItemQty(2833, 1)) then
	    player:tradeComplete();
	    player:addItem(20970, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20970);
		
	elseif (trade:hasItemQty(19848, 1)) and (trade:hasItemQty(2833, 1)) and (trade:hasItemQty(1276, 1)) then
	    player:tradeComplete();
	    player:addItem(21015, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21015);
		
	elseif (trade:hasItemQty(19849, 1)) and (trade:hasItemQty(1276, 1)) and (trade:hasItemQty(1282, 1)) then
	    player:tradeComplete();
	    player:addItem(21060, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21060);
		
	elseif (trade:hasItemQty(19850, 1)) and (trade:hasItemQty(1282, 1)) and (trade:hasItemQty(1293, 1)) then
	    player:tradeComplete();
	    player:addItem(21135, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21135);
		
	elseif (trade:hasItemQty(19852, 1)) and (trade:hasItemQty(1293, 1)) and (trade:hasItemQty(2849, 1)) then
	    player:tradeComplete();
	    player:addItem(21210, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21210);
		
	elseif (trade:hasItemQty(19851, 1)) and (trade:hasItemQty(2849, 1)) and (trade:hasItemQty(1272, 1)) then
	    player:tradeComplete();
	    player:addItem(21260, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21260);
		
	-- "+1" > "+2"
	
	elseif (trade:hasItemQty(20480, 1)) and (trade:hasItemQty(1556, 1)) then
	    player:tradeComplete();
	    player:addItem(20481, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20481);
		
	elseif (trade:hasItemQty(20555, 1)) and (trade:hasItemQty(1557, 1)) then
	    player:tradeComplete();
	    player:addItem(20556, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20556);
		
	elseif (trade:hasItemQty(20645, 1)) and (trade:hasItemQty(1558, 1)) then
	    player:tradeComplete();
	    player:addItem(20646, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20646);
		
	elseif (trade:hasItemQty(20745, 1)) and (trade:hasItemQty(1559, 1)) then
	    player:tradeComplete();
	    player:addItem(20746, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20746);
		
	elseif (trade:hasItemQty(20790, 1)) and (trade:hasItemQty(1560, 1)) then
	    player:tradeComplete();
	    player:addItem(20791, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20791);
		
	elseif (trade:hasItemQty(20835, 1)) and (trade:hasItemQty(1561, 1)) then
	    player:tradeComplete();
	    player:addItem(20836, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20836);
		
	elseif (trade:hasItemQty(20880, 1)) and (trade:hasItemQty(1562, 1)) then
	    player:tradeComplete();
	    player:addItem(20881, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20881);
		
	elseif (trade:hasItemQty(20925, 1)) and (trade:hasItemQty(1563, 1)) then
	    player:tradeComplete();
	    player:addItem(20926, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20926);
		
	elseif (trade:hasItemQty(20970, 1)) and (trade:hasItemQty(1564, 1)) then
	    player:tradeComplete();
	    player:addItem(20971, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 20971);
		
	elseif (trade:hasItemQty(21015, 1)) and (trade:hasItemQty(1565, 1)) then
	    player:tradeComplete();
	    player:addItem(21016, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21016);
		
	elseif (trade:hasItemQty(21060, 1)) and (trade:hasItemQty(1566, 1)) then
	    player:tradeComplete();
	    player:addItem(21061, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21061);
		
	elseif (trade:hasItemQty(21135, 1)) and (trade:hasItemQty(1567, 1)) then
	    player:tradeComplete();
	    player:addItem(21136, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21136);
		
	elseif (trade:hasItemQty(21210, 1)) and (trade:hasItemQty(1568, 1)) then
	    player:tradeComplete();
	    player:addItem(21211, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21211);
		
	elseif (trade:hasItemQty(21260, 1)) and (trade:hasItemQty(1570, 1)) then
	    player:tradeComplete();
	    player:addItem(21261, 1); 
		-- Message to player.
	    player:PrintToPlayer( "Oh yea thats what I was supposed to do! Here is your reward!.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 21261);
		
		
	end
        end,

        onTrigger = function(player, npc)
		local scyld = player:getCurrency("scyld") 
          player:PrintToPlayer("Where am I at? What am I doing? Please help me remember!", 0, npc:getPacketName())
		
		end,
    })


    utils.unused(horro)

end)

return m
