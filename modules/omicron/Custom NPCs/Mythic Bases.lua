-----------------------------------
require("scripts/globals/shop")
require("scripts/globals/chocobo")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/zones/Bastok_Mines/Zone")
-----------------------------------
local m = Module:new("Ranga")
m:setEnabled(true)

m:addOverride("xi.zones.Bastok_Mines.Zone.onInitialize", function(zone)

       super(zone)

    local gabiru = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Ranga",
        look = 792,

        x = 71.2250,
        y = 0.0,
        z = -63.8885,

        rotation = 30,

        widescan = 1,

        onTrade = function(player, npc, trade)

if (trade:hasItemQty(18002,1)) and (trade:hasItemQty(1848,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18969,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17586,1)) and (trade:hasItemQty(1848,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18970,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(18217,1)) and (trade:hasItemQty(1849,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18971,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17509,1)) and (trade:hasItemQty(1848,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18972,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17541,1)) and (trade:hasItemQty(1847,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18973,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17586,1)) and (trade:hasItemQty(1847,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18974,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17699,1)) and (trade:hasItemQty(1848,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18975,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(18002,1)) and (trade:hasItemQty(1847,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18976,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17699,1)) and (trade:hasItemQty(1849,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18977,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(18053,1)) and (trade:hasItemQty(1849,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18978,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17944,1)) and (trade:hasItemQty(1848,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18979,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(18002,1)) and (trade:hasItemQty(1849,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18980,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17207,1)) and (trade:hasItemQty0(1847,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18981,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17827,1)) and (trade:hasItemQty(1848,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18982,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17793,1)) and (trade:hasItemQty(1849,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18983,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(18097,1)) and (trade:hasItemQty(1849,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18984,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17586,1)) and (trade:hasItemQty(1849,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18985,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17699,1)) and (trade:hasItemQty(1847,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18986,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17275,1)) and (trade:hasItemQty(1847,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18987,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

elseif (trade:hasItemQty(17509,1)) and (trade:hasItemQty(1847,1)) and (trade:hasItemQty(4061,100)) and (trade:hasItemQty(4059,100)) and (trade:hasItemQty(4060,100)) then player:tradeComplete(); player:addItem(18988,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);

	end
        end,

        onTrigger = function(player, npc)
          player:PrintToPlayer("Did you bring more gifts for my master?", 0, npc:getPacketName())
		
		end,
    })


    utils.unused(horro)

end)

return m
