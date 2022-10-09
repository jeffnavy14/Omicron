-----------------------------------
-- AF Upgrade +1 to +2 NPC
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
-----------------------------------
local m = Module:new("Polly")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)
	
	local Polly = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Polly",
        look = 3613,
        x = 576.000,
        y = -1.000,
        z = 50.000,
		
		widescan = 1,
		
	onTrade = function(player, npc, trade)
		--WAR
		if (trade:hasItemQty(27684,1)) and (trade:hasItemQty(9281,8)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23040,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23040);

		elseif (trade:hasItemQty(27828,1)) and (trade:hasItemQty(9281,10)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8986,1)) then
			player:tradeComplete();
			player:addItem(23107,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23107);

		elseif (trade:hasItemQty(27828,1)) and (trade:hasItemQty(9281,10)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8986,1)) then
			player:tradeComplete();
			player:addItem(23107,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23107);

		elseif (trade:hasItemQty(27964,1)) and (trade:hasItemQty(9281,7)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8979,1)) then
			player:tradeComplete();
			player:addItem(23174,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23174);

		elseif (trade:hasItemQty(28111,1)) and (trade:hasItemQty(9281,9)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8988,1)) then
			player:tradeComplete();
			player:addItem(23241,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23241);

		elseif (trade:hasItemQty(28244,1)) and (trade:hasItemQty(9281,6)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8981,1)) then
			player:tradeComplete();
			player:addItem(23308,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23308);

		--MNK
		elseif (trade:hasItemQty(27685,1)) and (trade:hasItemQty(9282,8)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23041,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23041);

		elseif (trade:hasItemQty(27829,1)) and (trade:hasItemQty(9282,10)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23108,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23108);

		elseif (trade:hasItemQty(27965,1)) and (trade:hasItemQty(9282,7)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23175,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23175);

		elseif (trade:hasItemQty(28112,1)) and (trade:hasItemQty(9282,9)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23242,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23242);

		elseif (trade:hasItemQty(28245,1)) and (trade:hasItemQty(9282,6)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23309,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23309,1);

		--WHM
		elseif (trade:hasItemQty(27686,1)) and (trade:hasItemQty(9283,8)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23042,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23042);

		elseif (trade:hasItemQty(27830,1)) and (trade:hasItemQty(9283,10)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23109,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23109);

		elseif (trade:hasItemQty(27966,1)) and (trade:hasItemQty(9283,7)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23176,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23176);

		elseif (trade:hasItemQty(28113,1)) and (trade:hasItemQty(9283,9)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23243,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23243);

		elseif (trade:hasItemQty(28246,1)) and (trade:hasItemQty(9283,6)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23310,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23310);

		--BLM
		elseif (trade:hasItemQty(27687,1)) and (trade:hasItemQty(9284,8)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23043,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23043);

		elseif (trade:hasItemQty(27831,1)) and (trade:hasItemQty(9284,10)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23110,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23110);

		elseif (trade:hasItemQty(27967,1)) and (trade:hasItemQty(9284,7)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23177,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23177);

		elseif (trade:hasItemQty(28114,1)) and (trade:hasItemQty(9284,9)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23244,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23244);

		elseif (trade:hasItemQty(28247,1)) and (trade:hasItemQty(9284,6)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23311,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23311);

		--RDM
		elseif (trade:hasItemQty(27688,1)) and (trade:hasItemQty(9285,8)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23044,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23044);

		elseif (trade:hasItemQty(27832,1)) and (trade:hasItemQty(9285,10)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23111,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23111);

		elseif (trade:hasItemQty(27968,1)) and (trade:hasItemQty(9285,7)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23178,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23178);

		elseif (trade:hasItemQty(28115,1)) and (trade:hasItemQty(9285,9)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23245,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23245);

		elseif (trade:hasItemQty(28248,1)) and (trade:hasItemQty(9285,6)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23312,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23312);

		--THF
		elseif (trade:hasItemQty(27689,1)) and (trade:hasItemQty(9286,8)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23045,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23045);

		elseif (trade:hasItemQty(27833,1)) and (trade:hasItemQty(9286,10)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23112,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23112);

		elseif (trade:hasItemQty(27969,1)) and (trade:hasItemQty(9286,7)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23179,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23179);

		elseif (trade:hasItemQty(28116,1)) and (trade:hasItemQty(9286,9)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23246,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23246);

		elseif (trade:hasItemQty(28249,1)) and (trade:hasItemQty(9286,6)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23313,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23313);

		--PLD
		elseif (trade:hasItemQty(27690,1)) and (trade:hasItemQty(9287,8)) and (trade:hasItemQty(9249,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23046,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23046);

		elseif (trade:hasItemQty(27834,1)) and (trade:hasItemQty(9287,10)) and (trade:hasItemQty(9249,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23113,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23113);

		elseif (trade:hasItemQty(27970,1)) and (trade:hasItemQty(9287,7)) and (trade:hasItemQty(9249,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23180,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23180);

		elseif (trade:hasItemQty(28117,1)) and (trade:hasItemQty(9287,9)) and (trade:hasItemQty(9249,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23247,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23247);

		elseif (trade:hasItemQty(28250,1)) and (trade:hasItemQty(9287,6)) and (trade:hasItemQty(9249,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23314,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23314);
		--DRK

		elseif (trade:hasItemQty(27691,1)) and (trade:hasItemQty(9288,8)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23047,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23047);

		elseif (trade:hasItemQty(27835,1)) and (trade:hasItemQty(9288,10)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23114,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23114);

		elseif (trade:hasItemQty(27971,1)) and (trade:hasItemQty(9288,7)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23181,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23181);

		elseif (trade:hasItemQty(28118,1)) and (trade:hasItemQty(9288,9)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23248,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23248);

		elseif (trade:hasItemQty(28251,1)) and (trade:hasItemQty(9288,6)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23315,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23315);

		--BST
		elseif (trade:hasItemQty(27692,1)) and (trade:hasItemQty(9289,8)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23048,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23048);

		elseif (trade:hasItemQty(27836,1)) and (trade:hasItemQty(9289,10)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23115,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23115);

		elseif (trade:hasItemQty(27972,1)) and (trade:hasItemQty(9289,7)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23182,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23182);

		elseif (trade:hasItemQty(28119,1)) and (trade:hasItemQty(9289,9)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23249,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23249);

		elseif (trade:hasItemQty(28252,1)) and (trade:hasItemQty(9289,6)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23316,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23316);

		--BRD
		elseif (trade:hasItemQty(27693,1)) and (trade:hasItemQty(9290,8)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23049,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23049);

		elseif (trade:hasItemQty(27837,1)) and (trade:hasItemQty(9290,10)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23116,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23116);

		elseif (trade:hasItemQty(27973,1)) and (trade:hasItemQty(9290,7)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23183,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23183);

		elseif (trade:hasItemQty(28120,1)) and (trade:hasItemQty(9290,9)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23250,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23250);

		elseif (trade:hasItemQty(28253,1)) and (trade:hasItemQty(9290,6)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23317,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23317);

		--RNG
		elseif (trade:hasItemQty(27694,1)) and (trade:hasItemQty(9291,8)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23050,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23050);

		elseif (trade:hasItemQty(27838,1)) and (trade:hasItemQty(9291,10)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23117,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23117);

		elseif (trade:hasItemQty(27974,1)) and (trade:hasItemQty(9291,7)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23184,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23184);

		elseif (trade:hasItemQty(28121,1)) and (trade:hasItemQty(9291,9)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23251,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23251);

		elseif (trade:hasItemQty(28254,1)) and (trade:hasItemQty(9291,6)) and (trade:hasItemQty(9253,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23318,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23318);

		--SAM
		elseif (trade:hasItemQty(27695,1)) and (trade:hasItemQty(9292,8)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23051,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23051);

		elseif (trade:hasItemQty(27839,1)) and (trade:hasItemQty(9292,10)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23118,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23118);

		elseif (trade:hasItemQty(27975,1)) and (trade:hasItemQty(9292,7)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23185,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23185);

		elseif (trade:hasItemQty(28122,1)) and (trade:hasItemQty(9292,9)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23252,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23252);

		elseif (trade:hasItemQty(28255,1)) and (trade:hasItemQty(9292,6)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23319,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23319);
		--NIN

		elseif (trade:hasItemQty(27696,1)) and (trade:hasItemQty(9293,8)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23052,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23052);

		elseif (trade:hasItemQty(27840,1)) and (trade:hasItemQty(9293,10)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23119,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23119);

		elseif (trade:hasItemQty(27976,1)) and (trade:hasItemQty(9293,7)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23186,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23186);

		elseif (trade:hasItemQty(28123,1)) and (trade:hasItemQty(9293,9)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23253,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23253);

		elseif (trade:hasItemQty(28256,1)) and (trade:hasItemQty(9293,6)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23320,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23320);

		--DRG
		elseif (trade:hasItemQty(27697,1)) and (trade:hasItemQty(9294,8)) and (trade:hasItemQty(9249,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23053,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23053);

		elseif (trade:hasItemQty(27841,1)) and (trade:hasItemQty(9294,10)) and (trade:hasItemQty(9249,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23120,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23120);

		elseif (trade:hasItemQty(27956,1)) and (trade:hasItemQty(9294,7)) and (trade:hasItemQty(9249,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23187,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23187);

		elseif (trade:hasItemQty(28124,1)) and (trade:hasItemQty(9294,9)) and (trade:hasItemQty(9249,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23254,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23254);

		elseif (trade:hasItemQty(28257,1)) and (trade:hasItemQty(9294,6)) and (trade:hasItemQty(9249,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23321,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23321);

		--SMN
		elseif (trade:hasItemQty(27698,1)) and (trade:hasItemQty(9295,8)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23054,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23054);

		elseif (trade:hasItemQty(27842,1)) and (trade:hasItemQty(9295,10)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23121,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23121);

		elseif (trade:hasItemQty(27978,1)) and (trade:hasItemQty(9295,7)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23188,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23188);

		elseif (trade:hasItemQty(28125,1)) and (trade:hasItemQty(9295,9)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23255,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23255);

		elseif (trade:hasItemQty(28258,1)) and (trade:hasItemQty(9295,6)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23322,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23322);

		--BLU
		elseif (trade:hasItemQty(27699,1)) and (trade:hasItemQty(9296,8)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23055,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23055);

		elseif (trade:hasItemQty(27843,1)) and (trade:hasItemQty(9296,10)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23122,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23122);

		elseif (trade:hasItemQty(27979,1)) and (trade:hasItemQty(9296,7)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23189,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23189);

		elseif (trade:hasItemQty(28126,1)) and (trade:hasItemQty(9296,9)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23256,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23256);

		elseif (trade:hasItemQty(28259,1)) and (trade:hasItemQty(9296,6)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23323,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23323);
		--COR

		elseif (trade:hasItemQty(27700,1)) and (trade:hasItemQty(9297,8)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23056,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23056);

		elseif (trade:hasItemQty(27844,1)) and (trade:hasItemQty(9297,10)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23123,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23123);

		elseif (trade:hasItemQty(27980,1)) and (trade:hasItemQty(9297,7)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23190,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23190);

		elseif (trade:hasItemQty(28127,1)) and (trade:hasItemQty(9297,9)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23257,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23257);

		elseif (trade:hasItemQty(28260,1)) and (trade:hasItemQty(9297,6)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23324,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23324);

		--PUP
		elseif (trade:hasItemQty(27701,1)) and (trade:hasItemQty(9298,8)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23057,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23057);

		elseif (trade:hasItemQty(27845,1)) and (trade:hasItemQty(9298,10)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23124,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23124);

		elseif (trade:hasItemQty(27981,1)) and (trade:hasItemQty(9298,7)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23191,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23191);

		elseif (trade:hasItemQty(28128,1)) and (trade:hasItemQty(9298,9)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23258,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23258);

		elseif (trade:hasItemQty(28270,1)) and (trade:hasItemQty(9298,6)) and (trade:hasItemQty(9257,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23325,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23325);

		--DNC M
		elseif (trade:hasItemQty(27702,1)) and (trade:hasItemQty(9299,8)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23058,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23058);

		elseif (trade:hasItemQty(27846,1)) and (trade:hasItemQty(9299,10)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23125,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23125);

		elseif (trade:hasItemQty(27982,1)) and (trade:hasItemQty(9299,7)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23192,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23192);

		elseif (trade:hasItemQty(28129,1)) and (trade:hasItemQty(9299,9)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23259,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23259);

		elseif (trade:hasItemQty(28262,1)) and (trade:hasItemQty(9299,6)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23326,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23326);

		--DNM F
		elseif (trade:hasItemQty(27703,1)) and (trade:hasItemQty(9299,8)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23059,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23059);

		elseif (trade:hasItemQty(27847,1)) and (trade:hasItemQty(9299,10)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23126,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23126);

		elseif (trade:hasItemQty(27983,1)) and (trade:hasItemQty(9299,7)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23193,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23193);

		elseif (trade:hasItemQty(28130,1)) and (trade:hasItemQty(9299,9)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23260,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23260);

		elseif (trade:hasItemQty(28263,1)) and (trade:hasItemQty(9299,6)) and (trade:hasItemQty(9245,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23327,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23327);

		--SCH
		elseif (trade:hasItemQty(27704,1)) and (trade:hasItemQty(9300,8)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23060,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23060);

		elseif (trade:hasItemQty(27848,1)) and (trade:hasItemQty(9300,10)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23127,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23127);

		elseif (trade:hasItemQty(27984,1)) and (trade:hasItemQty(9300,7)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23194,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23194);

		elseif (trade:hasItemQty(28131,1)) and (trade:hasItemQty(9300,9)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23261,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23261);

		elseif (trade:hasItemQty(28273,1)) and (trade:hasItemQty(9300,6)) and (trade:hasItemQty(9255,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23328,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23328);

		--GEO
		elseif (trade:hasItemQty(27705,1)) and (trade:hasItemQty(9301,8)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23061,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23061);

		elseif (trade:hasItemQty(27849,1)) and (trade:hasItemQty(9301,10)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23128,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23128);

		elseif (trade:hasItemQty(28985,1)) and (trade:hasItemQty(9301,7)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23195,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23195);

		elseif (trade:hasItemQty(28132,1)) and (trade:hasItemQty(9301,9)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23262,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23262);

		elseif (trade:hasItemQty(28265,1)) and (trade:hasItemQty(9301,6)) and (trade:hasItemQty(9251,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23329,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23329);

		--RUN
		elseif (trade:hasItemQty(27706,1)) and (trade:hasItemQty(9302,8)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8983,1)) then 
			player:tradeComplete();
			player:addItem(23062,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23062);

		elseif (trade:hasItemQty(27850,1)) and (trade:hasItemQty(9302,10)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8986,1)) then 
			player:tradeComplete();
			player:addItem(23129,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23129);

		elseif (trade:hasItemQty(27986,1)) and (trade:hasItemQty(9302,7)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8979,1)) then 
			player:tradeComplete();
			player:addItem(23196,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23196);

		elseif (trade:hasItemQty(28133,1)) and (trade:hasItemQty(9302,9)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8988,1)) then 
			player:tradeComplete();
			player:addItem(23263,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23263);

		elseif (trade:hasItemQty(28266,1)) and (trade:hasItemQty(9302,6)) and (trade:hasItemQty(9248,1)) and (trade:hasItemQty(8981,1)) then 
			player:tradeComplete();
			player:addItem(23330,1);
			player:PrintToPlayer( "Fine... I'll improve its power...", 0xd );
			player:messageSpecial(ID.text.ITEM_OBTAINED, 23330);
			
		end
		
	end,

    onTrigger = function(player, npc)
		player:PrintToPlayer("Don't you dare offer a cracker? Fine... if you bring me the right materials, I'll improve the power of certain gear.", 0, npc:getPacketName())
		player:PrintToPlayer("A piece of artifact gear, some paragon cards, a guild item, and an item from around this crud hole.", 0, npc:getPacketName())
	end,
    
	})

    utils.unused(polly)

end)

return m