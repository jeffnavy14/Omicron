-----------------------------------
require("scripts/globals/shop")
require("scripts/globals/chocobo")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/zones/Bastok_Mines/Zone")
-----------------------------------
local m = Module:new("Gabiru")
m:setEnabled(true)

m:addOverride("xi.zones.Bastok_Mines.Zone.onInitialize", function(zone)

       super(zone)

    local gabiru = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Gabiru",
        look = 1639,

        x = 74.6952,
        y = 0.0,
        z = -63.4711,

        rotation = 45,

        widescan = 1,

        onTrade = function(player, npc, trade)

if (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3110,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3210,12)) and (trade:hasItemQty(2929,1)) then player:tradeComplete(); player:addItem(26741,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3111,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3212,12)) and (trade:hasItemQty(2962,1)) then player:tradeComplete(); player:addItem(26743,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3112,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3210,12)) and (trade:hasItemQty(3287,1)) then player:tradeComplete(); player:addItem(26745,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3113,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3211,12)) and (trade:hasItemQty(2927,1)) then player:tradeComplete(); player:addItem(26747,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3114,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3212,12)) and (trade:hasItemQty(2965,1)) then player:tradeComplete(); player:addItem(26749,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3115,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3210,12)) and (trade:hasItemQty(3291,1)) then player:tradeComplete(); player:addItem(26751,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3116,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3213,12)) and (trade:hasItemQty(2932,1)) then player:tradeComplete(); player:addItem(26753,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3117,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3211,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(26755,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3118,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3211,12)) and (trade:hasItemQty(3288,1)) then player:tradeComplete(); player:addItem(26757,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3119,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3210,12)) and (trade:hasItemQty(2963,1)) then player:tradeComplete(); player:addItem(26759,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3120,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3210,12)) and (trade:hasItemQty(3289,1)) then player:tradeComplete(); player:addItem(26761,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3121,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3212,12)) and (trade:hasItemQty(2966,1)) then player:tradeComplete(); player:addItem(26763,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3122,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3211,12)) and (trade:hasItemQty(3292,1)) then player:tradeComplete(); player:addItem(26765,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3123,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3213,12)) and (trade:hasItemQty(2929,1)) then player:tradeComplete(); player:addItem(26767,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3124,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3211,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(26769,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3125,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3213,12)) and (trade:hasItemQty(3290,1)) then player:tradeComplete(); player:addItem(26771,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3126,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3212,12)) and (trade:hasItemQty(2964,1)) then player:tradeComplete(); player:addItem(26773,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3127,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3212,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(26775,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3128,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3213,12)) and (trade:hasItemQty(2928,1)) then player:tradeComplete(); player:addItem(26777,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4064,10)) and (trade:hasItemQty(3129,10)) and (trade:hasItemQty(844,1)) and (trade:hasItemQty(4069,10)) and (trade:hasItemQty(9007,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3213,12)) and (trade:hasItemQty(2967,1)) then player:tradeComplete(); player:addItem(26779,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3130,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3214,12)) and (trade:hasItemQty(2929,1)) then player:tradeComplete(); player:addItem(26899,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3131,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3216,12)) and (trade:hasItemQty(2962,1)) then player:tradeComplete(); player:addItem(27001,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3132,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3214,12)) and (trade:hasItemQty(3287,1)) then player:tradeComplete(); player:addItem(27003,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3133,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3215,12)) and (trade:hasItemQty(2927,1)) then player:tradeComplete(); player:addItem(27005,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3134,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3216,12)) and (trade:hasItemQty(2965,1)) then player:tradeComplete(); player:addItem(27007,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3135,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3215,12)) and (trade:hasItemQty(3291,1)) then player:tradeComplete(); player:addItem(27009,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3136,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3214,12)) and (trade:hasItemQty(2932,1)) then player:tradeComplete(); player:addItem(27011,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3137,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3215,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27013,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3138,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3217,12)) and (trade:hasItemQty(3288,1)) then player:tradeComplete(); player:addItem(27015,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3139,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3214,12)) and (trade:hasItemQty(2963,1)) then player:tradeComplete(); player:addItem(27017,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3140,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3215,12)) and (trade:hasItemQty(3289,1)) then player:tradeComplete(); player:addItem(27019,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3141,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3216,12)) and (trade:hasItemQty(2966,1)) then player:tradeComplete(); player:addItem(27021,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3142,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3214,12)) and (trade:hasItemQty(3292,1)) then player:tradeComplete(); player:addItem(27023,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3143,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3217,12)) and (trade:hasItemQty(2929,1)) then player:tradeComplete(); player:addItem(27025,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3144,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3215,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27027,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3145,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3214,12)) and (trade:hasItemQty(3290,1)) then player:tradeComplete(); player:addItem(27029,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3146,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3215,12)) and (trade:hasItemQty(2964,1)) then player:tradeComplete(); player:addItem(27031,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3147,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3216,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27033,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3148,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3216,12)) and (trade:hasItemQty(2928,1)) then player:tradeComplete(); player:addItem(27035,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4065,10)) and (trade:hasItemQty(3149,10)) and (trade:hasItemQty(837,1)) and (trade:hasItemQty(4070,10)) and (trade:hasItemQty(9062,1)) and (trade:hasItemQty(9009,25)) and (trade:hasItemQty(3217,12)) and (trade:hasItemQty(2967,1)) then player:tradeComplete(); player:addItem(27037,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3150,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3218,12)) and (trade:hasItemQty(2929,1)) then player:tradeComplete(); player:addItem(27053,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3151,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3220,12)) and (trade:hasItemQty(2962,1)) then player:tradeComplete(); player:addItem(27055,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3152,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3219,12)) and (trade:hasItemQty(3287,1)) then player:tradeComplete(); player:addItem(27057,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3153,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3220,12)) and (trade:hasItemQty(2927,1)) then player:tradeComplete(); player:addItem(27059,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3154,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3218,12)) and (trade:hasItemQty(2965,1)) then player:tradeComplete(); player:addItem(27061,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3155,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3218,12)) and (trade:hasItemQty(3291,1)) then player:tradeComplete(); player:addItem(27063,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3156,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3221,12)) and (trade:hasItemQty(2932,1)) then player:tradeComplete(); player:addItem(27065,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3157,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3219,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27067,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3158,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3218,12)) and (trade:hasItemQty(3288,1)) then player:tradeComplete(); player:addItem(27069,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3159,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3220,12)) and (trade:hasItemQty(2963,1)) then player:tradeComplete(); player:addItem(27071,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3160,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3219,12)) and (trade:hasItemQty(3289,1)) then player:tradeComplete(); player:addItem(27073,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3161,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3220,12)) and (trade:hasItemQty(2966,1)) then player:tradeComplete(); player:addItem(27075,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3162,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3221,12)) and (trade:hasItemQty(3292,1)) then player:tradeComplete(); player:addItem(27077,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3163,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3221,12)) and (trade:hasItemQty(2929,1)) then player:tradeComplete(); player:addItem(27079,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3164,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3210,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27081,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3165,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3219,12)) and (trade:hasItemQty(3290,1)) then player:tradeComplete(); player:addItem(27083,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3166,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3221,12)) and (trade:hasItemQty(2964,1)) then player:tradeComplete(); player:addItem(27085,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3167,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3221,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27087,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3168,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3219,12)) and (trade:hasItemQty(2928,1)) then player:tradeComplete(); player:addItem(27089,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4066,10)) and (trade:hasItemQty(3169,10)) and (trade:hasItemQty(1110,1)) and (trade:hasItemQty(4071,10)) and (trade:hasItemQty(9005,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3218,12)) and (trade:hasItemQty(2967,1)) then player:tradeComplete(); player:addItem(27091,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3170,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3222,12)) and (trade:hasItemQty(2929,1)) then player:tradeComplete(); player:addItem(27238,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3171,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3224,12)) and (trade:hasItemQty(2962,1)) then player:tradeComplete(); player:addItem(27240,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3172,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3225,12)) and (trade:hasItemQty(3287,1)) then player:tradeComplete(); player:addItem(27242,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3173,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3222,12)) and (trade:hasItemQty(2927,1)) then player:tradeComplete(); player:addItem(27244,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3174,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3223,12)) and (trade:hasItemQty(2965,1)) then player:tradeComplete(); player:addItem(27246,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3175,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3223,12)) and (trade:hasItemQty(3291,1)) then player:tradeComplete(); player:addItem(27248,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3176,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3225,12)) and (trade:hasItemQty(2932,1)) then player:tradeComplete(); player:addItem(27250,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3177,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3223,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27252,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3178,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3224,12)) and (trade:hasItemQty(3288,1)) then player:tradeComplete(); player:addItem(27254,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3179,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3223,12)) and (trade:hasItemQty(2963,1)) then player:tradeComplete(); player:addItem(27256,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3180,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3224,12)) and (trade:hasItemQty(3289,1)) then player:tradeComplete(); player:addItem(27258,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3181,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3224,12)) and (trade:hasItemQty(2966,1)) then player:tradeComplete(); player:addItem(27260,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3182,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3222,12)) and (trade:hasItemQty(3292,1)) then player:tradeComplete(); player:addItem(27262,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3183,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3225,12)) and (trade:hasItemQty(2929,1)) then player:tradeComplete(); player:addItem(27264,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3184,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3225,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27266,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3185,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3222,12)) and (trade:hasItemQty(3290,1)) then player:tradeComplete(); player:addItem(27268,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3186,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3225,12)) and (trade:hasItemQty(2964,1)) then player:tradeComplete(); player:addItem(27270,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3187,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3222,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27272,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3188,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3225,12)) and (trade:hasItemQty(2928,1)) then player:tradeComplete(); player:addItem(27274,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4067,10)) and (trade:hasItemQty(3189,10)) and (trade:hasItemQty(836,1)) and (trade:hasItemQty(4072,10)) and (trade:hasItemQty(9064,1)) and (trade:hasItemQty(9009,20)) and (trade:hasItemQty(3224,12)) and (trade:hasItemQty(2967,1)) then player:tradeComplete(); player:addItem(27276,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3190,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3226,12)) and (trade:hasItemQty(2929,1)) then player:tradeComplete(); player:addItem(27412,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3191,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3227,12)) and (trade:hasItemQty(2962,1)) then player:tradeComplete(); player:addItem(27414,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3192,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3228,12)) and (trade:hasItemQty(3287,1)) then player:tradeComplete(); player:addItem(27416,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3193,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3229,12)) and (trade:hasItemQty(2927,1)) then player:tradeComplete(); player:addItem(27418,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3194,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3226,12)) and (trade:hasItemQty(2965,1)) then player:tradeComplete(); player:addItem(27420,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3195,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3228,12)) and (trade:hasItemQty(3291,1)) then player:tradeComplete(); player:addItem(27422,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3196,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3226,12)) and (trade:hasItemQty(2932,1)) then player:tradeComplete(); player:addItem(27424,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3197,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3227,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27426,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3198,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3229,12)) and (trade:hasItemQty(3288,1)) then player:tradeComplete(); player:addItem(27428,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3199,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3228,12)) and (trade:hasItemQty(2963,1)) then player:tradeComplete(); player:addItem(27430,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3200,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3229,12)) and (trade:hasItemQty(3289,1)) then player:tradeComplete(); player:addItem(27432,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3201,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3228,12)) and (trade:hasItemQty(2966,1)) then player:tradeComplete(); player:addItem(27434,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3202,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3229,12)) and (trade:hasItemQty(3292,1)) then player:tradeComplete(); player:addItem(27436,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3203,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3229,12)) and (trade:hasItemQty(2929,1)) then player:tradeComplete(); player:addItem(27438,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3204,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3226,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27440,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3205,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3227,12)) and (trade:hasItemQty(3290,1)) then player:tradeComplete(); player:addItem(27442,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3206,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3227,12)) and (trade:hasItemQty(2964,1)) then player:tradeComplete(); player:addItem(27444,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3207,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3228,12)) and (trade:hasItemQty(2930,1)) then player:tradeComplete(); player:addItem(27446,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3208,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3226,12)) and (trade:hasItemQty(2928,1)) then player:tradeComplete(); player:addItem(27448,1);
	    player:PrintToPlayer( "Thank You for contributing to the Monster Federation", 0xd );
	    player:messageSpecial(ID.text.ITEM_OBTAINED, 8289);
elseif (trade:hasItemQty(4068,10)) and (trade:hasItemQty(3209,10)) and (trade:hasItemQty(1311,1)) and (trade:hasItemQty(4073,10)) and (trade:hasItemQty(9002,1)) and (trade:hasItemQty(9009,15)) and (trade:hasItemQty(3227,12)) and (trade:hasItemQty(2967,1)) then player:tradeComplete(); player:addItem(27450,1);
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
