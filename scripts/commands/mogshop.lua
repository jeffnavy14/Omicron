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
        player:PrintToPlayer( "Merchant Moogle : 1: Crystals, 2: Meds, 3: Food, 4: Tools/Ammo, 5: Keys and Misc, 6: Attachments, 7: Mounts, 8: Pop Items", 0x1F);
		player:PrintToPlayer( "Merchant Moogle : 9: Beyond Infinity", 0x1F);
    elseif (page == 1) then -- HQ Crystals
        local stock_1 =
        {
            4238,   5000,   -- HQ Fire Crystal
            4239,   5000,   -- HQ Ice Crystal
            4240,   5000,   -- HQ Wind Crystal
            4241,   5000,   -- HQ Earth Crystal
            4242,   5000,   -- HQ Lightning Crystal
            4243,   5000,   -- HQ Water Crystal
            4244,   5000,   -- HQ Light Crystal
            4245,   5000    -- HQ Dark Crystal
        };
        xi.shop.general(player, stock_1);
        player:PrintToPlayer( "Merchant Moogle : Welcome to Crystal Depot Kupo!", 0x1F);
    elseif (page == 2) then -- Pharmacy
        local stock_2 =
        {
            4148,   450,     -- Antidote
            4154,   1000,    -- Holy Water
            4150,   2000,    -- Eye Drops
            4151,   2000,    -- Echo Drops
            4153,   2000,    -- Bottle of Antacid
            5418,   2000,    -- Tincture
            5328,   2000,    -- Hi-Potion Drop
            5358,   2000,    -- Hi-Ether Drop
            5356,   5000,    -- Remedy Ointment
            4202,   25000,   -- Daedalus Wing
            5876,   25000,   -- Petrify Screen
            5877,   25000,   -- Terror Screen
            5878,   25000,   -- Amnesia Screen
            5879,   25000,   -- Doom Screen
            5880,   25000    -- Poison Screen
        };
        xi.shop.general(player, stock_2);
        player:PrintToPlayer( "Merchant Moogle : Medicines for you, Kupo!", 0x1F);
    elseif (page == 3) then -- MogDonalds
        local stock_3 =
        {
			-- attack foods
            4271,   2499,   -- Rice Dumpling
            4381,   2100,   -- Meat Mithkabob
            4398,   2100,   -- Fish Mithkabob
            4457,   2100,   -- Eel Kabob
            5166,   2100,   -- Coeurl Sub Sandwich
            4355,   1450,   -- Salmon Sub Sandwich
            5686,   799,    -- Cheese Sandwich
            5561,   799,    -- Moogle Pie
            4270,   999,    -- Sweet Rice Cake
            5944,   2000,   -- Frontier Soda
            5932,   1600,   -- Kitron Juice
            4424,   1100,   -- Melon Juice
            4422,   499,    -- Orange Juice
			5710,	10000,	--berry_snow_cone
			5711,	10000,	--kitron_snow_cone
			5712,	10000,	--melon_snow_cone
			5713,	10000,	--orange_snow_cone
			6223,	10000,	--cehuetzi_snow_cone
			6224,	10000,	--apingaut_snow_cone
			6565,	10000,	--per._snow_cone
			6469,	5000,	--sublime sushi +1
			5685,	5000,	--Rabbit Pie
			6263,	5000,	--Kusamochi
			6344,	5000	--Grape Daifuku
        };
        xi.shop.general(player, stock_3);
        player:PrintToPlayer( "Merchant Moogle : Fresh food for your adventures, Kupo!", 0x1F);
    elseif (page == 4) then
        local stock_4 =
        {
            605,    499,     -- Pickaxe
            1021,   499,     -- Hatchet
            1020,   499,     -- Sickle
            4165,   1000,    -- Silent Oil
            4164,   1000,    -- Prism Powder
            5362,   2000,    -- Rainbow Powder
            5417,   9999,    -- Toolbag (Sanjaku-Tenugui)
            5319,   9999,    -- Toolbag (Shinobi-Tabi)
            5314,   5000,    -- Toolbag (Shihei)
            5867,   20000,   -- Toolbag (Inoshishinofuda)
            5868,   25000,   -- Toolbag (Shikanofuda)
            5869,   25000,   -- Toolbag (Chonofuda)
            1022,   5000     -- Thief's Tools
        };
        xi.shop.general(player, stock_4);
        player:PrintToPlayer( "Merchant Moogle : Tools and ammo just for you, Kupo!", 0x1F);
		elseif (page == 5) then
	    local stock_5 =
        {

			17583,   7000,		  -- Kgd. Signet Staff  
			17584,   7000,		  -- Rep. Signet Staff  
			17585,   7000,		  -- Fed. Signet Staff
			606,     2000,        -- Fetich Head
			607,     2000,        -- Fetich Torso
			608,     2000,        -- Fetich Arms
			609,     2000,        -- Fetich Legs


        };
        xi.shop.general(player, stock_5);
        player:PrintToPlayer("Merchant Moogle : Miscellaneous items Kupo!", 0x1F);

		elseif (page == 6) then
	    local stock_6 =
        {
            8513,     12000,    -- Accelerator
            8516,    32000,    -- Accelerator II
			8546,     11000,    -- Armor Plate
			8548,    22000,    -- Armor Plate II
			8641,    11000,    -- Auto-Repair Kit
			8644,    35000,    -- Auto-Repair Kit II
			8520,    12000,    -- Barrage Turbine
			8583,    12000,    -- Coiler
			8643,     12000,    -- Damage Gauge
			8517,    3000,    -- Drum Magazine
			8582,    11000,    -- Dynamo
			1050,    12000,    -- Flashbulb
			8642,    32000,    -- Hammermill
			8451,    12000,    -- Inhibitor
			8482,     12000,    -- Louxieaker I
			8484,    32000,    -- Louxieaker II
			8674,    12000,    -- Mana Converter
			8609,    12000,    -- Mana Jammer
			8612,     7000,    -- Mana Jammer II
			8673,     12000,    -- Mana Tank
			8676,    32000,    -- Mana Tank II
			8483,     12000,    -- Scanner
			8545,    16000,    -- Shock Absorber
			8577,     12000,    -- Stabilizer I
			8580,    12000,    -- Stabilizer II
			8449,     32000,    -- Strobe
			8450,     12000,    -- Tension Spring
			8452,    32000,    -- Tension Spring II
            8518,    92000     -- Tubro Charger


        };
        xi.shop.general(player, stock_6);
        player:PrintToPlayer("Merchant Moogle : Attachments Kupo", 0x1F);
		elseif (page == 7 and player:hasKeyItem(xi.ki.CHOCOBO_LICENSE)) then
	    local stock_7 =
        {
			10051,     50000,    -- Crab
			10050,     75000,    -- Tiger
			10053,     75000,    -- Bomb
			10056,     75000,    -- Crawler
			10058,     75000,    -- Beetle
        };
        xi.shop.general(player, stock_7);
        player:PrintToPlayer("Merchant Moogle : Mounts!!", 0x1F);
		elseif (page == 7 ) then
        player:PrintToPlayer("Merchant Moogle : Get KI's and Chocomounts to access this!", 0x1F);
	    elseif (page == 8) then
        local stock_8 =
        {
		    2580,    5000,    -- Hellcage Butterfly
		    2581,    5000,    -- Floral Nectar
		    2582,    5000,    -- Rodent Cheese
		    2590,    5000,    -- Shadeleaf
		    2591,    5000,    -- Pectin
            2592,    5000,    -- Cog Lubricant
            2600,    5000,    -- Golden Teeth
            2601,    5000,    -- Greenling
            2602,    5000,    -- Spoilt Blood
			3344, 150000,	 --Red Pond Weed
			3342, 150000,	 -- Savory Shank
			3339, 150000,	 -- Honey Tea
			3340, 150000,	-- Sweet Tea
			1418, 400000,    -- Gem Of The East
			1419, 250000,    -- Stone
			1420, 400000,    -- Gem of the South
			1421, 250000,    -- Stone
			1422, 400000,    -- Gem Of the West
			1423, 250000,    -- Stone
			1424, 400000,    -- Gem of the North
			1425, 250000,    -- Stone
        };
        xi.shop.general(player, stock_8);
        player:PrintToPlayer("Merchant Moogle : Pop items!", 0x1F);
        elseif (page == 9) then -- Beyond infinity
        local plevel = player:getMainLvl();
            if (plevel > 98) then
            local stock_9 =
            {
                3353,  50000,     -- Barbaric Bijou  
				3354,  50000,     -- Steelwall Bijou  
				3355,  50000,     -- Divine Bijou  
				3356,  50000,     -- Roving Bijou  
				3357,  50000,     -- Leering Bijou  
				3358,  50000,     -- Shrouded Bijou  
            };
            xi.shop.general(player, stock_9);
            player:PrintToPlayer( "Beyond Infinity: Welcome, Kupo!");
            else
                player:PrintToPlayer("Merchant Moogle : That store is not accessible yet Kupo", 0x1F);
            end


       else
        -- local Mog = 16982044;
        -- message = "Test!";
        -- SpoofSay(Mog,player:getID(),message);
        player:PrintToPlayer( string.format( "The MogShop catalog doesn't have a page %i, Kupo!", page ) );
    end
end;