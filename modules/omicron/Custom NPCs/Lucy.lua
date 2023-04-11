-----------------------------------
-- NPC: Lucy
-- RUN Relic
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("Lucy")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)

	
local Lucy = zone:insertDynamicEntity({

    objtype = xi.objType.NPC,
    name = "Lucy",
    look = 2031,
    x = 600,
    y = -1.40,
    z = 60,
	rotation = 65,
	
	widescan = 1,

    onTrade = function(player, npc, trade)
		if player:getCharVar("GeoEmpy") == 1 and
			trade:hasItemQty(3288, 1) and -- Dragua Scale
			trade:hasItemQty(1313, 1) and -- Siren's Hair
			trade:hasItemQty(685, 1) and -- Khroma Ore
			player:getCurrency("infamy") > 199
		then
			player:delCurrency("infamy", 200)
			player:setCharVar("GeoEmpy", 2)
			player:PrintToPlayer("Right-o, be uno momento.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:timer(4000, function(player)
				player:PrintToPlayer("Ooooh, well ain't ya precious. Lookin' good thar.", 13)
				player:addItem(26780)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 26780)
				player:tradeComplete()
			end)
		elseif player:getCharVar("GeoEmpy") == 3 and
			trade:hasItemQty(3288, 1) and -- Dragua Scale
			trade:hasItemQty(685, 1) and -- Khroma Ore
			trade:hasItemQty(1294, 1) and -- Arachne Thread
			player:getCurrency("infamy") > 199
		then 
			player:delCurrency("infamy", 200)
			player:setCharVar("GeoEmpy", 4)
			player:PrintToPlayer("Right-o, be uno momento.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:timer(4000, function(player)
				player:PrintToPlayer("Ooooh, well ain't ya precious. Lookin' good thar.", 13)
				player:addItem(26938)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 26938)
				player:tradeComplete()
			end)	
		elseif player:getCharVar("GeoEmpy") == 5 and
			trade:hasItemQty(3288, 1) and -- Dragua Scale
			trade:hasItemQty(1313, 1) and -- Siren's Hair
			trade:hasItemQty(2189, 1) and -- Fiendish Skin
			player:getCurrency("infamy") > 149
		then
			player:delCurrency("infamy", 150)
			player:setCharVar("GeoEmpy", 6)
			player:PrintToPlayer("Right-o, be uno momento.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:timer(4000, function(player)
				player:PrintToPlayer("Ooooh, well ain't ya precious. Lookin' good thar.", 13)
				player:addItem(27092)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27092)
				player:tradeComplete()
			end)
		elseif player:getCharVar("GeoEmpy") == 7 and
			trade:hasItemQty(3288, 1) and -- Dragua Scale
			trade:hasItemQty(1313, 1) and -- Siren's Hair
			trade:hasItemQty(1294, 1) and -- Arachne Thread
			player:getCurrency("infamy") > 99
		then
			player:delCurrency("infamy", 100)
			player:setCharVar("GeoEmpy", 8)
			player:PrintToPlayer("Right-o, be uno momento.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:timer(4000, function(player)
				player:PrintToPlayer("Ooooh, well ain't ya precious. Lookin' good thar.", 13)
				player:addItem(27277)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27277)
				player:tradeComplete()
			end)
		elseif player:getCharVar("GeoEmpy") == 9 and
			trade:hasItemQty(3288, 1) and -- Dragua Scale
			trade:hasItemQty(2189, 1) and -- Fiendish Skin
			trade:hasItemQty(1294, 1) and -- Arachne Thread
			player:getCurrency("infamy") > 249
		then
			player:delCurrency("infamy", 250)
			player:setCharVar("GeoEmpy", 10)
			player:PrintToPlayer("Right-o, be uno momento.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:timer(4000, function(player)
				player:PrintToPlayer("Ooooh, well ain't ya precious. Lookin' good thar.", 13)
				player:addItem(27451)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27451)
				player:tradeComplete()
			end)
		end
	end,
	
	onTrigger = function(player, npc, status)
		if player:getCharVar("GeoEmpy") == 1 then
			player:PrintToPlayer("Why hello again darlin', be needin' a refresher I take it.", 0, npc:getPacketName())
			player:PrintToPlayer("I be rightly needing a dragua scale, siren hair, khroma ore, and 200 infamy. Scoot along now.", 13)
		elseif player:getCharVar("GeoEmpy") == 2 then
			player:PrintToPlayer("Why hello again darlin', I see y'be ready for the next'n.", 0, npc:getPacketName())
			player:PrintToPlayer("I be rightly needing a dragua scale, arachne thread, khroma ore, and 200 infamy. Scoot along now.", 13)
			player:setCharVar("GeoEmpy", 3)
		elseif player:getCharVar("GeoEmpy") == 3 then
			player:PrintToPlayer("Why hello again darlin', be needin' a refresher I take it.", 0, npc:getPacketName())
			player:PrintToPlayer("I be rightly needing a dragua scale, arachne thread, khroma ore, and 200 infamy. Scoot along now.", 13)
		elseif player:getCharVar("GeoEmpy") == 4 then
			player:PrintToPlayer("Why hello again darlin', I see y'be ready for the next'n.", 0, npc:getPacketName())
			player:PrintToPlayer("I be rightly needing a dragua scale, siren hair, fiendish skin, and 150 infamy. Scoot along now.", 13)
			player:setCharVar("GeoEmpy", 5)
		elseif player:getCharVar("GeoEmpy") == 5 then
			player:PrintToPlayer("Why hello again darlin', be needin' a refresher I take it.", 0, npc:getPacketName())
			player:PrintToPlayer("I be rightly needing a dragua scale, siren hair, fiendish skin, and 150 infamy. Scoot along now.", 13)
		elseif player:getCharVar("GeoEmpy") == 6 then
			player:PrintToPlayer("Why hello again darlin', I see y'be ready for the next'n.", 0, npc:getPacketName())
			player:PrintToPlayer("I be rightly needing a dragua scale, siren hair, arachne thread, and 100 infamy. Scoot along now.", 13)
			player:setCharVar("GeoEmpy", 7)
		elseif player:getCharVar("GeoEmpy") == 7 then
			player:PrintToPlayer("Why hello again darlin', be needin' a refresher I take it.", 0, npc:getPacketName())
			player:PrintToPlayer("I be rightly needing a dragua scale, siren hair, arachne thread, and 100 infamy. Scoot along now.", 13)
		elseif player:getCharVar("GeoEmpy") == 8 then
			player:PrintToPlayer("Why hello again darlin', I see y'be ready for the last'n.", 0, npc:getPacketName())
			player:PrintToPlayer("I be rightly needing a dragua scale, fiendish skin, arachne thread, and 250 infamy. Scoot along now.", 13)
			player:setCharVar("GeoEmpy", 9)
		elseif player:getCharVar("GeoEmpy") == 9 then
			player:PrintToPlayer("Why hello again darlin', be needin' a refresher I take it.", 0, npc:getPacketName())
			player:PrintToPlayer("I be rightly needing a dragua scale, fiendish skin, arachne thread, and 250 infamy. Scoot along now.", 13)
		elseif player:getCharVar("GeoEmpy") == 10 then
			player:PrintToPlayer("Hi-ya there darlin', I do be rightly sorry but that was all I can do for ya.", 0, npc:getPacketName())
		elseif player:getCharVar("GeoAF") < 10 then
			player:PrintToPlayer("Well ain't you a purdy lil' thang, be careful out there y'hear.", 0, npc:getPacketName())
		else
			player:PrintToPlayer("We~ell hell~o thar darlin', I see y'be fancyin' yerself to be a fine Geomancer now, ain't ya.", 0, npc:getPacketName())
			player:PrintToPlayer("Good thang y'came by then darlin'. Just be needin' a few things and I can make ya some fine thangs.", 13)
			player:PrintToPlayer("I be rightly needing a Dragua Scale, Siren hair, Khroma Ore, and 200 infamy. Scoot along now.", 13)
			player:setCharVar("GeoEmpy", 1)
		end		
	end,  
	
    })
    utils.unused(Lucy)
end)

return m