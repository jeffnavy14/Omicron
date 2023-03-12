--------------------------------------------------------------
-- func: @mogshop <page number>
-- desc: opens the custom moogle shop menu anywhere in the world
--------------------------------------------------------------
require("scripts/globals/keyitems");

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player,page)
local level = player:getMainLvl();

-- printf("%s just triggered Mogshop", player:getName());

    if (page == 0 or page == nil) then
        player:PrintToPlayer( "Merchant Moogle : 1: Woodworking, 2: Smithing, 3: Goldsmithing, 4: Clothcraft, 5: Leathercraft, 6: Bonecraft, 7: Alchemy, 8: Cooking", 0x1F);

        elseif (page == 1) then -- Woodworking
        local stock_1 =
        {
            8805,  300, -- Wood. kit 5
            8806,  400, -- Wood. kit 10
            8807,  650, -- Wood. kit 15
            8808,  1050, -- Wood. kit 20
	        8809,  1600, -- Wood. kit 25
	        8810,  2300, -- Wood. kit 30
        	8811,  3150, -- Wood. kit 35
        	8812,  4150, -- Wood. kit 40
        	8813,  5300, -- Wood. kit 45
        	8814,  7600, -- Wood. kit 50
        	8815,  9150, -- Wood. kit 55
        	8816,  11300, -- Wood. kit 60
        	8817,  13000, -- Wood. kit 65
        	8818,  15300, -- Wood. kit 71
        	9484,  17150, -- Wood. kit 74
	        9485,  20000, -- Wood. kit 81
	        9486,  25000, -- Wood. kit 84
	        9487,  28000, -- Wood. kit 90
	        9488,  30000, -- Wood. kit 94
        };
        xi.shop.general(player, stock_1);
        player:PrintToPlayer( "Merchant Moogle : Welcome to Woodworking, Kupo!", 0x1F);
        elseif (page == 2) then -- Smithing
        local stock_2 =
        {
            8819,  300, -- Smith. kit 5
            8820,  400, -- Smith kit 10
            8821,  650, -- Smith. kit 15
            8822,  1050, -- Smith. kit 20
	        8823,  1600, -- Smith. kit 25
	        8824,  2300, -- Smith. kit 30
	        8825,  3150, -- Smith. kit 35
	        8826,  4150, -- Smith. kit 40
	        8827,  5300, -- Smith. kit 45
	        8828,  7600, -- Smith. kit 50
	        8829,  9150, -- Smith. kit 55
	        8830,  11300, -- Smith. kit 60
	        8831,  13000, -- Smith. kit 65
	        8832,  15300, -- Smith. kit 70
	        9489,  17150, -- Smith. kit 76
	        9490,  20000, -- Smith. kit 80
	        9491,  25000, -- Smith. kit 84
	        9492,  28000, -- Smith. kit 91
	        9493,  30000, -- Smith. kit 94
        };
        xi.shop.general(player, stock_2);
        player:PrintToPlayer( "Merchant Moogle : Welcome to Smithing, Kupo!", 0x1F);
        elseif (page == 3) then -- Goldsmithing
        local stock_3 =
        {
			8833,  300, -- Gold. kit 5
            8834,  400, -- Gold. kit 10
            8835,  650, -- Gold. kit 15
            8836,  1050, -- Gold. kit 20
	        8837,  1600, -- Gold. kit 25
	        8838,  2300, -- Gold. kit 30
	        8839,  3150, -- Gold. kit 35
	        8840,  4150, -- Gold. kit 40
	        8841,  5300, -- Gold. kit 45
	        8842,  7600, -- Gold. kit 50
	        8843,  9150, -- Gold. kit 55
	        8844,  11300, -- Gold. kit 60
	        8845,  13000, -- Gold. kit 65
	        8846,  15300, -- Gold. kit 70
	        9494,  17150, -- Gold. kit 75
	        9495,  20000, -- Gold. kit 80
	        9496,  25000, -- Gold. kit 85
	        9497,  28000, -- Gold. kit 90
	        9498,  30000, -- Gold. kit 95
        };
        xi.shop.general(player, stock_3);
        player:PrintToPlayer( "Merchant Moogle : Welcome to Goldsmithing, Kupo!", 0x1F);
        elseif (page == 4) then -- Clothcraft
        local stock_4 =
        {
           8847,  300, -- Cloth. kit 5
           8848,  400, -- Cloth. kit 10
           8849,  650, -- Cloth kit 15
           8850,  1050, -- Cloth. kit 20
	       8851,  1600, -- Cloth. kit 25
	       8852,  2300, -- Cloth. kit 30
	       8853,  3150, -- Cloth. kit 35
	       8854,  4150, -- Cloth. kit 40
	       8855,  5300, -- Cloth. kit 45
	       8856,  7600, -- Cloth. kit 50
	       8857,  9150, -- Cloth. kit 55
	       8858,  11300, -- Cloth. kit 60
	       8859,  13000, -- Cloth. kit 64
	       8860,  15300, -- Cloth. kit 70
	       9499,  17150, -- Cloth. kit 75
	       9500,  20000, -- Cloth. kit 80
	       9501,  25000, -- Cloth. kit 85
	       9502,  28000, -- Cloth. kit 90
	       9503,  30000, -- Cloth. kit 95
        };
        xi.shop.general(player, stock_4);
        player:PrintToPlayer( "Merchant Moogle : Welcome to Clothcraft, Kupo!", 0x1F);
		elseif (page == 5) then -- Leathercraft
	    local stock_5 =
        {
			8861,  300, -- Leath. kit 5
            8862,  400, -- Leath. kit 10
            8863,  650, -- Leath. kit 15
            8864,  1050, -- Leath. kit 20
	        8865,  1600, -- Leath. kit 25
	        8866,  2300, -- Leath. kit 30
	        8867,  3150, -- Leath. kit 35
	        8868,  4150, -- Leath. kit 40
	        8869,  5300, -- Leath. kit 45
	        8870,  7600, -- Leath. kit 50
	        8871,  9150, -- Leath. kit 55
	        8872,  11300, -- Leath. kit 60
	        8873,  13000, -- Leath. kit 66
	        8874,  15300, -- Leath. kit 70
	        9504,  17150, -- Leath. kit 75
	        9505,  20000, -- Leath. kit 79
	        9506,  25000, -- Leath. kit 85
	        9507,  28000, -- Leath. kit 90
	        9508,  30000, -- Leath. kit 95


        };
        xi.shop.general(player, stock_5);
        player:PrintToPlayer("Merchant Moogle : Welcome to Leathercraft, Kupo!", 0x1F);
		elseif (page == 6) then -- Bonecraft
	    local stock_6 =
        {
            8875,  300, -- Bone. kit 5
            8876,  400, -- Bone. kit 10
            8877,  650, -- Bone. kit 15
            8878,  1050, -- Bone. kit 20
	        8879,  1600, -- Bone. kit 25
	        8880,  2300, -- Bone. kit 30
	        8881,  3150, -- Bone. kit 35
	        8882,  4150, -- Bone. kit 40
	        8883,  5300, -- Bone. kit 45
	        8884,  7600, -- Bone. kit 50
	        8885,  9150, -- Bone. kit 55
	        8886,  11300, -- Bone. kit 60
	        8887,  13000, -- Bone. kit 65
	        8888,  15300, -- Bone. kit 70
	        9509,  17150, -- Bone. kit 75
	        9510,  20000, -- Bone. kit 80
	        9511,  25000, -- Bone. kit 85
	        9512,  28000, -- Bone. kit 90
	        9513,  30000, -- Bone. kit 95


        };
        xi.shop.general(player, stock_6);
        player:PrintToPlayer( "Merchant Moogle : Welcome to Bonecraft, Kupo!", 0x1F);
		elseif (page == 7) then -- Alchemy
	    local stock_7 =
        {
			8889,  300, -- Alch. kit 5
            8890,  400, -- Alch. kit 10
            8891,  650, -- Alch. kit 15
            8892,  1050, -- Alch. kit 20
	        8893,  1600, -- Alch. kit 25
	        8894,  2300, -- Alch. kit 30
	        8895,  3150, -- Alch. kit 35
	        8896,  4150, -- Alch. kit 40
	        8897,  5300, -- Alch. kit 45
	        8898,  7600, -- Alch. kit 50
	        8899,  9150, -- Alch. kit 55
	        8900,  11300, -- Alch. kit 60
	        8901,  13000, -- Alch. kit 65
	        8902,  15300, -- Alch. kit 70
	        9514,  17150, -- Alch. kit 75
	        9515,  20000, -- Alch. kit 80
	        9516,  25000, -- Alch. kit 85
	        9517,  28000, -- Alch. kit 90
	        9518,  30000, -- Alch. kit 95
        };
        xi.shop.general(player, stock_7);
        player:PrintToPlayer( "Merchant Moogle : Welcome to Alchemy, Kupo!", 0x1F);
		elseif (page == 8) then -- Cooking
	    local stock_8 =
        {
		   8903,  300, -- Cook. kit 5
           8904,  400, -- Cook. kit 10
           8905,  650, -- Cook. kit 15
           8906,  1050, -- Cook. kit 20
	       8907,  1600, -- Cook. kit 25
	       8908,  2300, -- Cook. kit 30
	       8909,  3150, -- Cook. kit 35
	       8910,  4150, -- Cook. kit 40
	       8911,  5300, -- Cook. kit 45
	       8912,  7600, -- Cook. kit 50
	       8913,  9150, -- Cook. kit 55
	       8914,  11300, -- Cook. kit 60
	       8915,  13000, -- Cook. kit 65
	       8916,  15300, -- Cook. kit 70
	       9519,  17150, -- Cook. kit 75
	       9520,  20000, -- Cook. kit 80
	       9521,  25000, -- Cook. kit 85
	       9522,  28000, -- Cook. kit 90
	       9523,  30000, -- Cook. kit 95
        };
        xi.shop.general(player, stock_8);
		player:PrintToPlayer( "Merchant Moogle : Welcome to Cooking, Kupo!", 0x1F);
        -- local Mog = 16982044;
        -- message = "Test!";
        -- SpoofSay(Mog,player:getID(),message);
    end
end;