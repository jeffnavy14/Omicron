-----------------------------------
-- NPC: Rasalea
-- RUN AF
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("Rasalea")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)

	
local Rasalea = zone:insertDynamicEntity({

    objtype = xi.objType.NPC,
    name = "Rasalea",
    look = 2731,
    x = 610,
    y = -2,
    z = 69,
	rotation = 65,
	
	widescan = 1,

    onTrade = function(player, npc, trade)
		if player:getCharVar("RunAF") == 1 and
			trade:hasItemQty(3520, 3) and
			trade:hasItemQty(830, 1) and
			player:getFreeSlotsCount() > 0
		then
			player:PrintToPlayer("Excellent, and in return... one moment.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:PrintToPlayer("There we go, one Runeist Coat just for you.", 13)
			player:addItem(27927)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27927)
			player:setCharVar("RunAF", 2)
			player:tradeComplete()
		elseif player:getCharVar("RunAF") == 3 and
			trade:hasItemQty(3520, 1) and
			trade:hasItemQty(3521, 1) and
			trade:hasItemQty(3522, 1) and
			trade:hasItemQty(3523, 1) and
			trade:hasItemQty(3524, 1) and
			trade:hasItemQty(3525, 1) and
			player:getFreeSlotsCount() > 0
		then 
			player:PrintToPlayer("Excellent, and in return... one moment.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:PrintToPlayer("There we go, one Runeist Trousers just for you.", 13)
			player:addItem(28207)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 28207)
			player:setCharVar("RunAF", 4)
			player:tradeComplete()
		elseif player:getCharVar("RunAF") == 5 and
			trade:hasItemQty(4047, 1) and
			trade:hasItemQty(4029, 1) and
			trade:hasItemQty(1618, 1) and
			trade:hasItemQty(855, 1) and
			player:getCurrency("infamy") >99 and
			player:getFreeSlotsCount() > 0
		then
			player:delCurrency("infamy", 100)
			player:PrintToPlayer("Excellent, and in return... one moment.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:PrintToPlayer("There we go, one pair of Runeist Bottes just for you.", 13)
			player:addItem(28347)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 28347)
			player:tradeComplete()
			player:setCharVar("RunAF", 6)
		elseif player:getCharVar("RunAF") == 7 and
			trade:hasItemQty(4047, 1) and
			trade:hasItemQty(4029, 1) and
			trade:hasItemQty(3923, 1) and
			trade:hasItemQty(823, 1) and
			player:getCurrency("infamy") >99 and
			player:getFreeSlotsCount() > 0
		then
			player:delCurrency("infamy", 100)
			player:PrintToPlayer("Excellent, and in return... one moment.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:PrintToPlayer("There we go, one pair of Runeist Mitons.", 13)
			player:addItem(28067)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 28067)
			player:tradeComplete()
			player:setCharVar("RunAF", 8)
		elseif player:getCharVar("RunAF") == 9 and
			trade:hasItemQty(4046, 1) and
			trade:hasItemQty(3923, 2) and
			trade:hasItemQty(1813, 1) and
			player:getCurrency("infamy") >124 and
			player:getFreeSlotsCount() > 0
		then
			player:delCurrency("infamy", 125)
			player:PrintToPlayer("Excellent, and in return... one moment.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:PrintToPlayer("Aaaand finally the crowning piece, the Runeist Bandeau.",13)
			player:addItem(27787)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27787)
			player:tradeComplete()
			player:setCharVar("RunAF", 10)
		elseif player:getFreeSlotsCount() == 0
			player:PrintToPlayer("You need more inventory space!", 29)
		end
	end,
	
	onTrigger = function(player, npc, status)
		if player:getMainJob() == 22 and
            player:getMainLvl() >= 90 and
			player:getCharVar("RunAF") <1
		then
			player:PrintToPlayer("I heard in the linkshell you were looking for some Runefencer gear.", 0, npc:getPacketName())
			player:PrintToPlayer("Let us begin with a pretty little coat for you. I will need 3 ifritite, and a rainbow cloth.", 13)
			player:setCharVar("RunAF", 1)
		elseif 	player:getCharVar("RunAF") == 1 then
			player:PrintToPlayer("Please bring me 3 ifritite, and a rainbow cloth", 0, npc:getPacketName())
		elseif 	player:getCharVar("RunAF") == 2 then
			player:PrintToPlayer("Oh your wanting more of that gear I see, well alright then...", 0, npc:getPacketName())
			player:PrintToPlayer("Now for some fancy pants to go with that fancy coat.", 13)
			player:PrintToPlayer("Since we need high elemental mataerials I need an imbued stone with power of each Celestial Avatar.", 13)
			player:setCharVar("RunAF", 3)
		elseif 	player:getCharVar("RunAF") == 3 then
			player:PrintToPlayer("Please bring me materials imbued with power of each Celestial Avatar.", 0, npc:getPacketName())
		elseif 	player:getCharVar("RunAF") == 4 then
			player:PrintToPlayer("For your next piece, we shall need a few things. These will be used for your boots.",0,npc:getPacketName())
			player:PrintToPlayer("I'll need a spool of redoubtable silk thread, some runeweave, an uragnite shell...",13)
			player:PrintToPlayer("A sheet of tiger leather and 100 infamy.", 13)
			player:setCharVar("RunAF", 5)
		elseif 	player:getCharVar("RunAF") == 5 then
			player:PrintToPlayer("I'll need a spool of redoubtable silk thread, some runeweave, an uragnite shell...",0, npc:getPacketName())
			player:PrintToPlayer("A sheet of tiger leather and 100 infamy.", 13)
		elseif 	player:getCharVar("RunAF") == 6 then
			player:PrintToPlayer("I suppose you want to get more of this set.",0,npc:getPacketName())
			player:PrintToPlayer("I'll need a spool of redoubtable Silk Thread, more runeweave, a rhodium Ingot, and a spool of Gold Thread ...",13)
			player:PrintToPlayer("I'll also need 100 infamy for this one.", 13)
			player:setCharVar("RunAF", 7)
		elseif 	player:getCharVar("RunAF") == 7 then
			player:PrintToPlayer("I'll need a spool of redoubtable Silk Thread, more runeweave, a rhodium Ingot, and a spool of Gold Thread ...",0,npc:getPacketName())
			player:PrintToPlayer("along with 100 infamy for this one.", 13)
		elseif 	player:getCharVar("RunAF") == 8 then
			player:PrintToPlayer("More? Alright 1 last piece.", 0, npc:getPacketName())
			player:PrintToPlayer("Bring me a corroded ore, 2 rhodium ingots and a bottle of vermilion Lacquer",13)
			player:setCharVar("RunAF", 9)
		elseif 	player:getCharVar("RunAF") == 9 then
			player:PrintToPlayer("Bring me a corroded ore, 2 rhodium ingots and a bottle of vermilion Lacquer", 0, npc:getPacketName())
		elseif 	player:getCharVar("RunAF") == 10 then
			player:PrintToPlayer("Thats everything I can make for you, I hope it serves you well", 0, npc:getPacketName())
		end
		
	end,  
	
    })
    utils.unused(Rasalea)
end)

return m