-----------------------------------
-- Add some test NPCs to Yuhtunga_Jungle (zone 123)
-- AF+2 RNG - SCH
-----------------------------------
local ID = require("scripts/zones/Norg/IDs")
require("scripts/globals/shop")
require("scripts/globals/chocobo")
require("scripts/globals/keyitems")
require("scripts/settings/main")
require("scripts/globals/status")
require("scripts/zones/Yuhtunga_Jungle/Zone")
-----------------------------------
local m = Module:new("gearen")
m:setEnabled(true)

m:addOverride("xi.zones.Yuhtunga_Jungle.Zone.onInitialize", function(zone)

       super(zone)

    local gearen = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Gearen",
        look = 199,

        x = 497.964,
        y = 20.884,
        z = 308.303,

        rotation = 128,

        widescan = 1,

        onTrade = function(player, npc, trade)
    local scyld = player:getCurrency("scyld") 
 ---Rng

    if (trade:hasItemQty(27694, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	   	player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23050, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23050);
		
	elseif (trade:hasItemQty(27838, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23117, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23117);
		
	elseif (trade:hasItemQty(27974, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23184, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23184);
		
	elseif (trade:hasItemQty(28121, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23251, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23251);
		
	elseif (trade:hasItemQty(28254, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23318, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23318);
		
	---Sam

    elseif (trade:hasItemQty(27695, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23051, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23051);
		
	elseif (trade:hasItemQty(27839, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23118, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23118);
		
	elseif (trade:hasItemQty(27975, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23185, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23185);
		
	elseif (trade:hasItemQty(28122, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23252, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23252);
		
	elseif (trade:hasItemQty(28255, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23319, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23319);	
		
	---nin

    elseif (trade:hasItemQty(27696, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23052, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23052);
		
	elseif (trade:hasItemQty(27840, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23119, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23119);
		
	elseif (trade:hasItemQty(27976, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23186, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23186);
		
	elseif (trade:hasItemQty(28123, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23253, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23253);
		
	elseif (trade:hasItemQty(28256, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23320, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23320);

    ---Drg

    elseif (trade:hasItemQty(27697, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23053, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23053);
		
	elseif (trade:hasItemQty(27841, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23120, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23120);
		
	elseif (trade:hasItemQty(27977, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23187, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23187);
		
	elseif (trade:hasItemQty(28124, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23254, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23254);
		
	elseif (trade:hasItemQty(28257, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23321, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23321);	

    ---Smn

    elseif (trade:hasItemQty(27698, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23054, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23054);
		
	elseif (trade:hasItemQty(27842, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23121, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23121);
		
	elseif (trade:hasItemQty(27978, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23188, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23188);
		
	elseif (trade:hasItemQty(28125, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23255, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23255);
		
	elseif (trade:hasItemQty(28258, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23322, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23322);

    ---Blu

    elseif (trade:hasItemQty(27699, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23055, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23055);
		
	elseif (trade:hasItemQty(27843, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23122, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23122);
		
	elseif (trade:hasItemQty(27979, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23189, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23189);
		
	elseif (trade:hasItemQty(28126, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23256, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23256);
		
	elseif (trade:hasItemQty(28259, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23323, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23323);	

---Cor

    elseif (trade:hasItemQty(27700, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23056, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23056);
		
	elseif (trade:hasItemQty(27844, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23123, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23123);
		
	elseif (trade:hasItemQty(27980, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23190, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23190);
		
	elseif (trade:hasItemQty(28127, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23257, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23257);
		
	elseif (trade:hasItemQty(28260, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23324, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23324);		
		
	---pup

    elseif (trade:hasItemQty(27701, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23057, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23057);
		
	elseif (trade:hasItemQty(27845, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23124, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23124);
		
	elseif (trade:hasItemQty(27981, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23191, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23191);
		
	elseif (trade:hasItemQty(28128, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23258, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23258);
		
	elseif (trade:hasItemQty(28261, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23325, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23325);	

---Dnc

    --- male
   

    elseif (trade:hasItemQty(27702, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23058, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23058);
		
	elseif (trade:hasItemQty(27846, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23125, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23125);
		
	elseif (trade:hasItemQty(27982, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23192, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23192);
		
	elseif (trade:hasItemQty(28129, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23259, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23259);
		
	elseif (trade:hasItemQty(28262, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23326, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23326);	
		
	--- female
		
	elseif (trade:hasItemQty(27703, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23059, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23059);
		
	elseif (trade:hasItemQty(27847, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23125, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23125);
		
	elseif (trade:hasItemQty(27983, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23193, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23193);
		
	elseif (trade:hasItemQty(28130, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23260, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23260);
		
	elseif (trade:hasItemQty(28263, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23327, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23327);	


---Sch

    elseif (trade:hasItemQty(27704, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23060, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23060);
		
	elseif (trade:hasItemQty(27848, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23126, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23126);
		
	elseif (trade:hasItemQty(27984, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23194, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23194);

	elseif (trade:hasItemQty(28131, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23261, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23261);
		
	elseif (trade:hasItemQty(28264, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	   	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23328, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23328);		
		elseif (scyld <=200) then
	player:PrintToPlayer( "Your broke get more scyld....", 0xd )	
	end
        end,

        onTrigger = function(player, npc)
		local scyld = player:getCurrency("scyld") 
        if (scyld >= 200) then
		  player:PrintToPlayer("I see you have some Scyld's trade me some stuff with your currency and I will give you what you came for!", 0, npc:getPacketName())
        elseif (scyld <= 200) then
		  player:PrintToPlayer("You do not cool enough to talk to me, come back when you have some Scyld!", 0, npc:getPacketName())
		end
		end,
    })


    utils.unused(horro)

end)

return m
