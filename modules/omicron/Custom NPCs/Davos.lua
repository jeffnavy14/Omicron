-----------------------------------
-- NPC: Davos
-- GEO AF
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("Davos")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)

	
local Davos = zone:insertDynamicEntity({

    objtype = xi.objType.NPC,
    name = "Davos",
    look = 2730,
    x = 610,
    y = -2,
    z = 64,
	rotation = 195,	
	widescan = 1,

    onTrade = function(player, npc, trade)
		if player:getCharVar("GeoAF") == 1 and
			trade:hasItemQty(4042, 3) and
			player:getFreeSlotsCount() > 0
		then
			player:PrintToPlayer("Well done, here you are.", 0, npc:getPacketName())
			player:PrintToPlayer("There we go, one pair of Geomancy Mitaines. Enjoy.", 13)
			player:addItem(28066)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 28066)
			player:setCharVar("GeoAF", 2)
			player:tradeComplete()
		elseif player:getCharVar("GeoAF") == 3 and
			trade:hasItemQty(1294, 12) and
			player:getFreeSlotsCount() > 0
		then 
			player:PrintToPlayer("Well done, here you are.", 0, npc:getPacketName())
			player:PrintToPlayer("There we go, a pair of Geomancy Pants. Enjoy.", 13)
			player:addItem(28206)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 28206)
			player:setCharVar("GeoAF", 4)
			player:tradeComplete()
		elseif player:getCharVar("GeoAF") == 5 and
			trade:hasItemQty(4045, 1) and
			trade:hasItemQty(850, 1) and
			trade:hasItemQty(823, 1) and
			trade:hasItemQty(4027, 1) and
			player:getCurrency("infamy") >99 and
			player:getFreeSlotsCount() > 0
		then
			player:delCurrency("infamy", 100)
			player:PrintToPlayer("Well done, here you are.", 0, npc:getPacketName())
			player:PrintToPlayer("There we go, one pair of Geomancy Sandals. Enjoy.", 13)
			player:addItem(28346)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 28346)
			player:tradeComplete()
			player:setCharVar("GeoAF", 6)
		elseif player:getCharVar("GeoAF") == 7 and
			trade:hasItemQty(4044, 1) and
			trade:hasItemQty(3927, 1) and
			trade:hasItemQty(4027, 1) and
			trade:hasItemQty(4030, 1) and
			player:getCurrency("infamy") >124 and
			player:getFreeSlotsCount() > 0
		then
			player:delCurrency("infamy", 125)
			player:PrintToPlayer("Well done, here you are.", 0, npc:getPacketName())
			player:PrintToPlayer("There we go, one Geomancy Galero. Enjoy.", 13)
			player:addItem(27786)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27786)
			player:tradeComplete()
			player:setCharVar("GeoAF", 8)
		elseif player:getCharVar("GeoAF") == 9 and
			trade:hasItemQty(4043, 1) and
			trade:hasItemQty(4027, 1) and
			trade:hasItemQty(4028, 1) and
			trade:hasItemQty(829, 1) and
			player:getCurrency("infamy") >149 and
			player:getFreeSlotsCount() > 0
		then
			player:delCurrency("infamy", 150)
			player:PrintToPlayer("Well done, here you are.", 0, npc:getPacketName())
			player:PrintToPlayer("Your final piece, a Geomancy Tunic. Enjoy.", 13)
			player:addItem(27926)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27926)
			player:tradeComplete()
			player:setCharVar("GeoAF", 10)
		elseif player:getFreeSlotsCount() == 0 then
			player:PrintToPlayer("You need more inventory space!", 29)
		end
	end,
	
	onTrigger = function(player, npc, status)
		if player:getMainJob() == 21 and
            player:getMainLvl() >= 90 and
			player:getCharVar("GeoAF") <1
		then
			player:PrintToPlayer("Word on the sands is that you're looking for some geomancer gear.", 0, npc:getPacketName())
			player:PrintToPlayer("If you bring me 3 acuex ores I can finish up a pair of gloves for you.", 13)
			player:setCharVar("GeoAF", 1)
		elseif 	player:getCharVar("GeoAF") == 1 then
			player:PrintToPlayer("For the gloves I need 3 acuex ores.", 0, npc:getPacketName())
			
		elseif 	player:getCharVar("GeoAF") == 2 then
			player:PrintToPlayer("Ready for the next piece I see.", 0, npc:getPacketName())
			player:PrintToPlayer("For the next piece I still need 12 spools of arachne thread.", 13)
			player:setCharVar("GeoAF", 3)
		elseif 	player:getCharVar("GeoAF") == 3 then
			player:PrintToPlayer("Please bring 12 spools of arachne thread.", 0, npc:getPacketName())
			
		elseif 	player:getCharVar("GeoAF") == 4 then
			player:PrintToPlayer("For your next piece, we shall need a few things.",0,npc:getPacketName())
			player:PrintToPlayer("We need some cyclone cotton, a sheep leather, a gold ingot, and an akaso thread with 100 infamy",13)
			player:setCharVar("GeoAF", 5)
		elseif 	player:getCharVar("GeoAF") == 5 then
			player:PrintToPlayer("We need some cyclone cotton, a sheep leather, a gold ingot, and an akaso thread with 100 infamy",0,npc:getPacketName())
			
		elseif 	player:getCharVar("GeoAF") == 6 then
			player:PrintToPlayer("Your next piece needs atramenterrane, urunday lumber, more akaso thread, and a sekishitsu with 125 infamy",0,npc:getPacketName())
			player:setCharVar("GeoAF", 7)
		elseif 	player:getCharVar("GeoAF") == 7 then
			player:PrintToPlayer("Your next piece needs atramenterrane, urunday lumber, more akaso thread, and a sekishitsu with 125 infamy",0,npc:getPacketName())
			player:PrintToPlayer("along with 100 infamy for this one.", 13)
			
		elseif 	player:getCharVar("GeoAF") == 8 then
			player:PrintToPlayer("Alright 1 last piece.", 0, npc:getPacketName())
			player:PrintToPlayer("Going to need a lavarion, some silk cloth, a bolt of akaso Cloth, and akaso Thread with 150 infamy",13)
			player:setCharVar("GeoAF", 9)
		elseif 	player:getCharVar("GeoAF") == 9 then
			player:PrintToPlayer("Going to need a lavarion, some silk cloth, a bolt of akaso Cloth, and akaso Thread with 150 infamy",0,npc:getPacketName())
			
		elseif 	player:getCharVar("GeoAF") == 10 then
			player:PrintToPlayer("Well thats all the geomancer gear I can make for you, treat it well.", 0, npc:getPacketName())
		end	
	end,
	
    })
    utils.unused(Davos)
end)

return m