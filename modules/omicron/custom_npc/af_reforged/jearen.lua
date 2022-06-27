-----------------------------------
-- (zone 123)
-- AF+2 War - Brd
-----------------------------------
local ID = require("scripts/zones/Norg/IDs")
require("scripts/globals/shop")
require("scripts/globals/chocobo")
require("scripts/globals/keyitems")

require("scripts/globals/status")
require("scripts/zones/Yuhtunga_Jungle/Zone")
-----------------------------------
local m = Module:new("jearen")
m:setEnabled(true)

m:addOverride("xi.zones.Yuhtunga_Jungle.Zone.onInitialize", function(zone)

       super(zone)

    local jearen = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Jearen",
        look = 7,

        x = 453.903,
        y = 21.000,
        z = 376.331,

        rotation = 28,

        widescan = 1,

        onTrade = function(player, npc, trade)
   local scyld = player:getCurrency("scyld")
   ---War

    if (trade:hasItemQty(27684, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23040, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23040);
		
	elseif (trade:hasItemQty(27828, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23107, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23107);
		
	elseif (trade:hasItemQty(27964, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	    player:tradeComplete(); 
		player:delCurrency("scyld", 200)
	    player:addItem(23174, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23174);
		
	elseif (trade:hasItemQty(28111, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23241, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23241);
		
	elseif (trade:hasItemQty(28244, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23308, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23308);
		
	---mnk

    elseif  (trade:hasItemQty(27685, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23041, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23041);
		
	elseif (trade:hasItemQty(27829, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	    player:tradeComplete(); 
		player:delCurrency("scyld", 200)
	    player:addItem(23108, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23108);
		
	elseif (trade:hasItemQty(27965, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	    player:tradeComplete(); 
		player:delCurrency("scyld", 200)
	    player:addItem(23175, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23175);
		
	elseif (trade:hasItemQty(28112, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	    player:tradeComplete(); 
		player:delCurrency("scyld", 200)
	    player:addItem(23242, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23242);
		
	elseif (trade:hasItemQty(28245, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23309, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23309);
		
	---Wht

    elseif  (trade:hasItemQty(27686, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23042, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23042);
		
	elseif (trade:hasItemQty(27830, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23109, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23109);
		
	elseif (trade:hasItemQty(27966, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23176, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23176);
		
	elseif (trade:hasItemQty(28113, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23243, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23243);
		
	elseif (trade:hasItemQty(28246, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	    player:tradeComplete(); 
		player:delCurrency("scyld", 200)
	    player:addItem(23310, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23310);
		
	---Blm

    elseif  (trade:hasItemQty(27687, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	    player:tradeComplete(); 
		player:delCurrency("scyld", 200)
	    player:addItem(23043, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23043);
		
	elseif (trade:hasItemQty(27831, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23110, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23110);
		
	elseif (trade:hasItemQty(27967, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	    player:tradeComplete(); 
		player:delCurrency("scyld", 200)
	    player:addItem(23177, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23177);
		
	elseif (trade:hasItemQty(28114, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23244, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23244);
		
	elseif (trade:hasItemQty(28247, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	    player:tradeComplete(); 
		player:delCurrency("scyld", 200)
	    player:addItem(23311, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23311);
		
	---Rdm

    elseif  (trade:hasItemQty(27688, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23044, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23044);
		
	elseif (trade:hasItemQty(27832, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23111, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23111);
		
	elseif (trade:hasItemQty(27968, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23178, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23178);
		
	elseif (trade:hasItemQty(28115, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23245, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23245);
		
	elseif (trade:hasItemQty(28248, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23312, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23312);
		
	---Thf

    elseif  (trade:hasItemQty(27689, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23045, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23045);
		
	elseif (trade:hasItemQty(27833, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23112, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23112);
		
	elseif (trade:hasItemQty(27969, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23179, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23179);
		
	elseif (trade:hasItemQty(28116, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23246, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23246);
		
	elseif (trade:hasItemQty(28249, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23313, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23313);
		
	---Pld

    elseif  (trade:hasItemQty(27690, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23046, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23046);
		
	elseif (trade:hasItemQty(27834, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23113, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23113);
		
	elseif (trade:hasItemQty(27970, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23180, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23180);
		
	elseif (trade:hasItemQty(28117, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23247, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23247);
		
	elseif (trade:hasItemQty(28250, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23314, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23314);
		
	---Drk

    elseif  (trade:hasItemQty(27691, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23047, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23047);
		
	elseif (trade:hasItemQty(27835, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23114, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23114);
		
	elseif (trade:hasItemQty(27971, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23181, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23181);
		
	elseif (trade:hasItemQty(28118, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23248, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23248);
		
	elseif (trade:hasItemQty(28251, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23315, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23315);
		
	---Bst

    elseif (trade:hasItemQty(27692, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23048, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23048);
		
	elseif (trade:hasItemQty(27836, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23115, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23115);
		
	elseif (trade:hasItemQty(27972, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	    player:tradeComplete(); 
		player:delCurrency("scyld", 200)
	    player:addItem(23182, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23182);
		
	elseif (trade:hasItemQty(28119, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23249, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23249);
		
	elseif (trade:hasItemQty(28252, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23316, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23316);
		
	---Brd

    elseif (trade:hasItemQty(27693, 1)) and (trade:hasItemQty(15508, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23049, 1); --Head
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23049);
		
	elseif (trade:hasItemQty(27837, 1)) and (trade:hasItemQty(15514, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23116, 1); --body
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23116);
		
	elseif (trade:hasItemQty(27973, 1)) and (trade:hasItemQty(15510, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23183, 1); --Hands
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23183);
		
	elseif (trade:hasItemQty(28120, 1)) and (trade:hasItemQty(15512, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23250, 1); --Legs
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23250);
		
	elseif (trade:hasItemQty(28253, 1)) and (trade:hasItemQty(15509, 1)) and (scyld >= 200) then
	    player:tradeComplete();
		player:delCurrency("scyld", 200)
	    player:addItem(23317, 1); --Feet
		-- Message to player.
	    player:PrintToPlayer( "Thank you for the requested items here is your reward.", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 23317);
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
