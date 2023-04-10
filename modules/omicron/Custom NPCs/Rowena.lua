-----------------------------------
-- NPC: Rowena
-- RUN Relic
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("Rowena")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)

	
local Rowena = zone:insertDynamicEntity({

    objtype = xi.objType.NPC,
    name = "Rowena",
    look = 2715,
    x = 600,
    y = -1.20,
    z = 58,
	rotation = 180.25,
	
	widescan = 1,

    onTrade = function(player, npc, trade)
		if player:getCharVar("GeoRelic") == 1 and
			trade:hasItemQty(1459, 1) and -- Griffon Leather
			trade:hasItemQty(4030, 1) and -- Sekishitsu
			trade:hasItemQty(8708, 1) and -- Raaz Leather
			trade:hasItemQty(5944, 1) and -- Frontier Soda
			player:getCurrency("infamy") > 199
		then
			player:delCurrency("infamy", 200)
			player:setCharVar("GeoRelic", 2)
			player:PrintToPlayer("Do... not... move...", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:injectActionPacket(player:getID(), 11, 795, 0, 0, 0, 10, 1)
			player:timer(4000, function(player)
				player:PrintToPlayer("There, a perfect fit. Pleasure doing business.", 13)
				player:addItem(26664)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 26664)
				player:tradeComplete()
			end)
		elseif player:getCharVar("GeoRelic") == 3 and
			trade:hasItemQty(1459, 1) and -- Griffon Leather
			trade:hasItemQty(1993, 1) and -- Ether Leather
			trade:hasItemQty(4028, 1) and -- Akaso Cloth
			trade:hasItemQty(5775, 1) and -- Chocolate Crepe
			player:getCurrency("infamy") > 199
		then 
			player:delCurrency("infamy", 200)
			player:setCharVar("GeoRelic", 4)
			player:PrintToPlayer("Do... not... move...", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:injectActionPacket(player:getID(), 11, 795, 0, 0, 0, 10, 1)
			player:timer(4000, function(player)
				player:PrintToPlayer("There, a perfect fit. Pleasure doing business.", 13)			
				player:addItem(26840)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 26840)
				player:tradeComplete()
			end)
		elseif player:getCharVar("GeoRelic") == 5 and
			trade:hasItemQty(1459, 1) and -- Griffon Leather
			trade:hasItemQty(4095, 1) and -- Bismuth Sheet
			trade:hasItemQty(4027, 1) and -- Akaso Thread
			trade:hasItemQty(5941, 1) and -- Campfire Chocolate
			player:getCurrency("infamy") > 199
		then
			player:delCurrency("infamy", 200)
			player:setCharVar("GeoRelic", 6)
			player:PrintToPlayer("Do... not... move...", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:injectActionPacket(player:getID(), 11, 795, 0, 0, 0, 10, 1)
			player:timer(4000, function(player)
				player:PrintToPlayer("There, a perfect fit. Pleasure doing business.", 13)
				player:addItem(27016)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27016)
				player:tradeComplete()
			end)
		elseif player:getCharVar("GeoRelic") == 7 and
			trade:hasItemQty(1459, 1) and -- Griffon Leather
			trade:hasItemQty(1994, 1) and -- Ether Cotton
			trade:hasItemQty(4028, 1) and -- Akaso Cloth
			trade:hasItemQty(5942, 1) and -- Cascade Candy
			player:getCurrency("infamy") > 199
		then
			player:delCurrency("infamy", 200)
			player:setCharVar("GeoRelic", 8)
			player:PrintToPlayer("Do... not... move...", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:injectActionPacket(player:getID(), 11, 795, 0, 0, 0, 10, 1)
			player:timer(4000, function(player)
				player:PrintToPlayer("There, a perfect fit. Pleasure doing business.", 13)
				player:addItem(27192)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27192)
				player:tradeComplete()
			end)
		elseif player:getCharVar("GeoRelic") == 9 and
			trade:hasItemQty(1459, 1) and -- Griffon Leather
			trade:hasItemQty(1994, 1) and -- Ether Cotton
			trade:hasItemQty(2199, 1) and -- Sparkstrand
			trade:hasItemQty(5940, 1) and -- Trail Cookie
			player:getCurrency("infamy") > 199
		then
			player:delCurrency("infamy", 200)
			player:setCharVar("GeoRelic", 10)
			player:PrintToPlayer("Do... not... move...", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:injectActionPacket(player:getID(), 11, 795, 0, 0, 0, 10, 1)
			player:timer(4000, function(player)
				player:PrintToPlayer("There, a perfect fit. Pleasure doing business.", 13)
				player:addItem(27368)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27368)
				player:tradeComplete()
			end)
		end
	end,
	
	onTrigger = function(player, npc, status)
		if player:getCharVar("GeoRelic") == 1 then
			player:PrintToPlayer("Ugh... my husband Gerolt is drunk... again...", 0, npc:getPacketName())
			player:PrintToPlayer("Sorry, with the 200 infamy I'll need the griffon leather, sekishitsu, raaz leather, and then for me a Frontier Soda", 0, npc:getPacketName())
		elseif player:getCharVar("GeoRelic") == 2 then
			player:PrintToPlayer("Hello again, ready for the next I see.", 0, npc:getPacketName())
			player:PrintToPlayer("We'll need the usual 200 infamy and a griffon leather.", 13)
			player:PrintToPlayer("This time we'll also need an ether leather, akaso cloth. As before a treat for me, this time a Chocolate Crepe.", 13)
			player:setCharVar("GeoRelic", 3)
		elseif player:getCharVar("GeoRelic") == 3 then
			player:PrintToPlayer("We'll need the usual 200 infamy and a griffon leather.", 0, npc:getPacketName())
			player:PrintToPlayer("This time we'll also need an ether leather, akaso cloth. As before a treat for me, this time a Chocolate Crepe.", 13)
		elseif player:getCharVar("GeoRelic") == 4 then
			player:PrintToPlayer("Some gloves this time", 0, npc:getPacketName())
			player:PrintToPlayer("We'll need the usual 200 infamy and a griffon leather.", 13)
			player:PrintToPlayer("A sheet of bismuth, some akaso thread, and my treat will be a campfire chocolae.",13)
			player:setCharVar("GeoRelic", 5)
		elseif player:getCharVar("GeoRelic") == 5 then
			player:PrintToPlayer("We'll need the usual 200 infamy and a griffon leather.", 13)
			player:PrintToPlayer("A sheet of bismuth, some akaso thread, and my treat will be a campfire chocolae.",13)
		elseif player:getCharVar("GeoRelic") == 6 then
			player:PrintToPlayer("Ahh yes, the fourth piece now.", 0, npc:getPacketName())
			player:PrintToPlayer("Yes another Griffon Leather and 200 infamy as usual.",13)
			player:PrintToPlayer("Some ether cotton, akaso cloth, and the treat... cascade candy... yes...", 13)
			player:PrintToPlayer("eyes glisten with hunger and joy...", 8, npc:getPacketName())
			player:setCharVar("GeoRelic", 7)
		elseif player:getCharVar("GeoRelic") == 7 then
			player:PrintToPlayer("Yes another Griffon Leather and 200 infamy as usual.", 0, npc:getPacketName())
			player:PrintToPlayer("Some ether cotton, akaso cloth, and the treat... cascade candy... yes...", 13)
		elseif player:getCharVar("GeoRelic") == 8 then
			player:PrintToPlayer("Time for that final piece.", 0, npc:getPacketName())
			player:PrintToPlayer("The Griffon Leather, and 200 infamy. For this we'll also need ether cotton, sparkstrand, and a trail cookie",13)
			player:setCharVar("GeoRelic", 9)
		elseif player:getCharVar("GeoRelic") == 9 then
			player:PrintToPlayer("The Griffon Leather, and 200 infamy. For this we'll also need ether cotton, sparkstrand, and a trail cookie",13)
		elseif player:getCharVar("GeoRelic") == 10 then
			player:PrintToPlayer("ugh... he's still drunk...", 0, npc:getPacketName())
		elseif player:getCharVar("RunAF") < 10 then
			player:PrintToPlayer("Need to get him to stop drinking... wonder if there's any Allagan Tomes here...", 0, npc:getPacketName())
		else
			player:PrintToPlayer("Oh a trained Geomancer. I can make you some equipment actually, I'll just need a few things and a treat.", 0, npc:getPacketName())
			player:PrintToPlayer("Food's scarce here sorry.", 13)
			player:PrintToPlayer("Anyways, with the 200 infamy I'll need the griffon leather, sekishitsu, raaz leather, and then for me a Frontier Soda", 13)
			player:setCharVar("GeoRelic", 1)
		end		
	end,  
	
    })
    utils.unused(Rowena)
end)

return m