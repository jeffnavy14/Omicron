-----------------------------------
-- NPC: Geralt
-- RUN Relic
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("Geralt")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)

	
local Geralt = zone:insertDynamicEntity({

    objtype = xi.objType.NPC,
    name = "Geralt",
    look = 2713,
    x = 611,
    y = 0,
    z = 53,
	rotation = 63.75,
	
	widescan = 1,

    onTrade = function(player, npc, trade)
		if player:getCharVar("RunRelic") == 1 and
			trade:hasItemQty(1461, 1) and -- Wootz ingot
			trade:hasItemQty(2275, 1) and -- Scintillant Ingot
			trade:hasItemQty(4024, 1) and -- Snowsteel
			trade:hasItemQty(4405, 1) and -- Rice Ball
			player:getCurrency("infamy") > 199 and
			player:getFreeSlotsCount() > 0
		then
			player:delCurrency("infamy", 200)
			player:setCharVar("RunRelic", 2)
			player:PrintToPlayer("Gimme a sec. *hic*", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:injectActionPacket(player:getID(), 11, 795, 0, 0, 0, 10, 1)
			player:timer(4000, function(player)
				player:PrintToPlayer("There ya go, now for my snack and drink. *hic*", 13)
				player:addItem(26666)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 26666)
				player:tradeComplete()
			end)
		elseif player:getCharVar("RunRelic") == 3 and
			trade:hasItemQty(1461, 1) and -- Wootz ingot
			trade:hasItemQty(1993, 1) and -- Ether Leather
			trade:hasItemQty(4029, 1) and -- Runeweave
			trade:hasItemQty(4396, 1) and -- Sausage Roll
			player:getCurrency("infamy") > 199 and
			player:getFreeSlotsCount() > 0
		then 
			player:delCurrency("infamy", 200)
			player:setCharVar("RunRelic", 4)
			player:PrintToPlayer("Gimme a sec *hic*.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:injectActionPacket(player:getID(), 11, 795, 0, 0, 0, 10, 1)
			player:timer(4000, function(player)
				player:PrintToPlayer("There ya go, now for my snack and drink. *hic*", 13)
				player:addItem(26842)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 26842)
				player:tradeComplete()
			end)
		elseif player:getCharVar("RunRelic") == 5 and
			trade:hasItemQty(1461, 1) and -- Wootz ingot
			trade:hasItemQty(8708, 1) and -- Raaz Leather
			trade:hasItemQty(4029, 1) and -- Runeweave
			trade:hasItemQty(4415, 1) and -- Roasted Corn
			player:getCurrency("infamy") > 199 and
			player:getFreeSlotsCount() > 0
		then
			player:delCurrency("infamy", 200)
			player:setCharVar("RunRelic", 6)
			player:PrintToPlayer("Gimme a sec *hic*.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:injectActionPacket(player:getID(), 11, 795, 0, 0, 0, 10, 1)
			player:timer(4000, function(player)
				player:PrintToPlayer("There ya go, now for my snack and drink. *hic*", 13)
				player:addItem(27018)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27018)
				player:tradeComplete()
			end)
		elseif player:getCharVar("RunRelic") == 7 and
			trade:hasItemQty(1461, 1) and -- Wootz ingot
			trade:hasItemQty(1992, 1) and -- Holy Leather
			trade:hasItemQty(4029, 1) and -- Runeweave
			trade:hasItemQty(5943, 1) and -- Smoked Makeral
			player:getCurrency("infamy") > 199 and
			player:getFreeSlotsCount() > 0
		then
			player:delCurrency("infamy", 200)
			player:setCharVar("RunRelic", 8)
			player:PrintToPlayer("Gimme a sec *hic*.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:injectActionPacket(player:getID(), 11, 795, 0, 0, 0, 10, 1)
			player:timer(4000, function(player)
				player:PrintToPlayer("There ya go, now for my snack and drink. *hic*", 13)				
				player:addItem(27194)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27194)
				player:tradeComplete()
			end)
		elseif player:getCharVar("RunRelic") == 9 and
			trade:hasItemQty(1461, 1) and -- Wootz ingot
			trade:hasItemQty(1992, 1) and -- Holy Leather
			trade:hasItemQty(2199, 1) and -- Sparkstrand
			trade:hasItemQty(4444, 1) and -- Rarrib Tail
			player:getCurrency("infamy") > 199 and
			player:getFreeSlotsCount() > 0
		then
			player:delCurrency("infamy", 200)
			player:setCharVar("RunRelic", 10)
			player:PrintToPlayer("Gimme a sec *hic*.", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:injectActionPacket(player:getID(), 11, 795, 0, 0, 0, 10, 1)
			player:timer(4000, function(player)
				player:PrintToPlayer("There ya go, now for my snack and drink. *hic*", 13)
				player:addItem(27370)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27370)
				player:tradeComplete()
			end)
		elseif player:getFreeSlotsCount() == 0 then
			player:PrintToPlayer("You need more inventory space!", 29)
		end
	end,
	
	onTrigger = function(player, npc, status)
		if player:getCharVar("RunRelic") == 1 then
			player:PrintToPlayer("*hic*... I nee' mor' booze... what... oh yea...", 0, npc:getPacketName())
			player:PrintToPlayer("Gimme a wootz ingot, scintillant ingot, snowsteel... an' a rice ball. Oh an' it's gonna cost ya 200 infamy. *hic*", 13)
		elseif player:getCharVar("RunRelic") == 2 then
			player:PrintToPlayer("...", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:PrintToPlayer("Right! Wootz ingot, ether leather, runeweave, sausage roll... mmmm sausage... and 200 infamy. *hic*", 13)
			player:setCharVar("RunRelic", 3)
		elseif player:getCharVar("RunRelic") == 3 then
			player:PrintToPlayer("*hic*... uuuuuh... wootz ingot, ether leather, runeweave, *hic* a sausage roll... so hungry... and 200 infamy. *hic*", 0, npc:getPacketName())
		elseif player:getCharVar("RunRelic") == 4 then
			player:PrintToPlayer("*hic*... oooo my stomach hurts... but hungry... and why is the rum always gone...",0,npc:getPacketName())
			player:PrintToPlayer("ANOTHER WOOTZ INGOT! uuuugh, raaz leather, runeweave, and... oh yea roasted corn with 200 in*hic* infamy.",13)
			player:setCharVar("RunRelic", 5)
		elseif player:getCharVar("RunRelic") == 5 then
			player:PrintToPlayer("Wootz ingot, raaz leather, runeweave, and roasted corn with, mmmmm.... and 200 in*hic* infamy.", 0, npc:getPacketName())
		elseif player:getCharVar("RunRelic") == 6 then
			player:PrintToPlayer("Mooooo~re? Awww man, I was about to go have drinks with the wife... fine...",0,npc:getPacketName())
			player:PrintToPlayer("Yes another wootz ingot, deal with it. Holy leather, runeweave, yes again. 200 Infamy.",13)
			player:PrintToPlayer("While you're at it, a smoked makeral to go with the keg I found.", 13)
			player:setCharVar("RunRelic", 7)
		elseif player:getCharVar("RunRelic") == 7 then
			player:PrintToPlayer("Another wootz ingot,, holy leather, runeweave, 200 Infamy.", 0, npc:getPacketName())
			player:PrintToPlayer("While you're at it, a smoked makeral to go with the keg I found.", 13)
		elseif player:getCharVar("RunRelic") == 8 then
			player:PrintToPlayer("Last... one...", 0, npc:getPacketName())
			player:PrintToPlayer("The wootz ingot, holy leather, a sparkstrand along with a rarab tail. The usual 200 infamy",13)
			player:setCharVar("RunRelic", 9)
		elseif player:getCharVar("RunRelic") == 9 then
			player:PrintToPlayer("The wootz ingot, holy leather, a sparkstrand along with a rarab tail. The usual 200 infamy", 0, npc:getPacketName())
		elseif player:getCharVar("RunRelic") == 10 then
			player:PrintToPlayer("Lets see how this goes...", 0, npc:getPacketName())
			player:PrintToPlayer("casts Rumga...?", 8, npc:getPacketName())
			player:timer(3000, function(player)
				npc:injectActionPacket(npc:getID(), 4, 820, 0, 0, 0, 10, 1)
			end)
			player:timer(6000, function(player)
				player:PrintToPlayer("okay THAT's more refreshing than I wanted!", 0, npc:getPacketName())
			end)
		elseif player:getCharVar("RunAF") < 10 then
			player:PrintToPlayer("Lets see how this goes...", 0, npc:getPacketName())
			player:PrintToPlayer("casts Rumga...? (We're confused to.)", 8, npc:getPacketName())
			player:timer(3000, function(player)
				npc:injectActionPacket(npc:getID(), 4, 998, 0, 0, 0, 10, 1)
			end)
			player:timer(6000, function(player)
				player:PrintToPlayer("owwwwwwwwww...", 13)
			end)
		else
			player:PrintToPlayer("*hic* I saw d'kids o'er thar maked y'some fancy fance things... I ken I do more for ya.", 0, npc:getPacketName())
			player:PrintToPlayer("Gimme a wootz ingot, scintillant ingot, snowsteel... an' a rice ball. Oh an' it's gonna cost ya 200 infamy. *hic*", 13)
			player:setCharVar("RunRelic", 1)
		end
	end,  
	
    })
    utils.unused(Geralt)
end)

return m