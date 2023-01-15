-----------------------------------
-- Island Reive Quest Giver and Spawners
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require('scripts/globals/npc_util')
require("scripts/globals/alitems")
-----------------------------------

local m = Module:new("ElTaz")
m:setEnabled(true)
		
m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)

	local ElTaz = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Yota Leheho",
        look = 1004,
        x = 609.127,
        y = -3.145,
        z = -3.803,
        rotation = 200,
	

	onTrigger = function(player, npc, status)
		
		if (player:getCharVar("Mission3State") == 1) then
			player:PrintToPlayer("Sadly still no word on the chapters I'm missing... my research is at a standstill for now...", 0, npc:getPacketName())
			--player:PrintToPlayer("If you come across any Fiendish Tome Chapters after chapter 25, I would very much like to have them", 13) -- rem'd out until all pages drop
            player:PrintToPlayer("If you come across Fiendish Tome Chapter 26, I'd love to have it", 13) -- until all pages drop
		elseif (player:getCharVar("Mission3State") == 2) and (os.time() > player:getCharVar("YotaTime")) then
			player:PrintToPlayer("I have come across a great many things in my preliminary studies of those dark texts you provided", 0, npc:getPacketName())
			player:PrintToPlayer("It seems the leader of the invasions, a man known as Teodor was not truly himself...", 13)
			player:timer(2000, function(player)
				player:PrintToPlayer("He was under the control of a creature, part of something called the Xol Triumvirate.", 13)
				player:PrintToPlayer("As the name implies, there are 3 creatures listed in the time.", 13)
			end)
			player:timer(4000, function(player)
				player:PrintToPlayer("Dhokmak the Brash, Ashrakk the Duskbrood, and Balamor the Deathborne.", 0, npc:getPacketName())
				player:PrintToPlayer("Of these three, Balamor seems to be the most likely to have possessed someone.", 13)
				player:PrintToPlayer("I'll see if I can muster up something about tracking one down.", 13)
			end)
			player:setCharVar("Mission3State", 3)
			player:setCharVar("YotaTimeB", getVanaMidnight())
		elseif (player:getCharVar("Mission3State") == 3) and (os.time() < player:getCharVar("YotaTimeB")) then
			player:PrintToPlayer("Sorry I haven't come up with anything as yet.", 0, npc:getPacketName())
		elseif (player:getCharVar("Mission3State") == 3) and (os.time() > player:getCharVar("YotaTimeB")) then
			player:PrintToPlayer("It seems these creatures reside in a realm known as Ra'Kaznar...", 0, npc:getPacketName())
			player:PrintToPlayer("I can provide the means... I'll need a bottle of distilled water, a dark crystal, and a piece of rotten meat.", 13)
			player:setCharVar("Mission3State", 4)
		elseif (player:getCharVar("Mission3State") == 4) then
			player:PrintToPlayer("To reach that realm I'll need a bottle of distilled water, a dark crystal, and a piece of rotten meat.", 0, npc:getPacketName())
		elseif (player:getCharVar("Mission3State") == 5) then
			player:PrintToPlayer("Take it to the center of the island, it should take you to the Vagarous realm of the Xol.", 0, npc:getPacketName())
		elseif (player:getCharVar("Mission3State") == 6) then
			player:PrintToPlayer("Interesting... if you provide those items again I can make more items for entry...", 0, npc:getPacketName())
			player:PrintToPlayer("Oh! A note came that invited you to re-enter again...signed by Balamor...", 13)
			player:PrintToPlayer("Please be careful if you do decide to do so.", 13)
			player:setCharVar("Mission3State", 7)
		elseif (player:getCharVar("Mission3State") == 7) then
			player:PrintToPlayer("I'll need a bottle of distilled water, a dark crystal, and a piece of rotten meat to make what you need.", 0, npc:getPacketName())
		elseif (player:getCharVar("Mission3State") == 8) then
			player:PrintToPlayer("Take it to the center of the island, it should take you to the Vagarous realm of the Xol.", 0, npc:getPacketName())
		elseif (player:getCharVar("Mission2State") == 3) and (player:getCharVar("Mission3State") == 0) then
			player:PrintToPlayer("Hello young one, I have traveled far to reach this island. Seeking answers into various things is why I came.", 0, npc:getPacketName())
			player:PrintToPlayer("Questions like; these Naakuals of Mid's. Why did nature's protectors come here and become so violent...", 13)
			player:timer(2000, function(player)
				player:PrintToPlayer("Then there is the invasion that you relived thanks to your sparkling friend on the beach....", 13)
				player:PrintToPlayer("So many questions, and at this time so few answers... however I do believe we have a start point.", 13)
			end)
			player:timer(4000, function(player)
				player:PrintToPlayer("I was conducting research into the Fiendish Tome which gave hints into the seventh Naakual.", 0, npc:getPacketName())
				player:PrintToPlayer("However I'm missing the contents after chapter 25, so if you happen upon the remaining please may I have them?", 13)
			end)
			player:setCharVar("Mission3State", 1)
		else
			player:PrintToPlayer("So much research, so few books.", 0, npc:getPacketName())
		end
		
    end,
	
	onTrade = function(player, npc, trade)
		
		if (player:getCharVar("Mission3State") == 1) and
		  (trade:hasItemQty(3429, 1)) --[[and 
		  (trade:hasItemQty(3430, 1)) and
		  (trade:hasItemQty(3431, 1)) and 
		  (trade:hasItemQty(3432, 1)) and 
		  (trade:hasItemQty(3433, 1)) rest not required until all pages drop]] 
		then
			player:setCharVar("YotaTime", getVanaMidnight())
			player:PrintToPlayer("This will take me some time to go through, come see again much later.", 0, npc:getPacketName())
			player:PrintToPlayer("Hopefully this will lead us to answers, to lead us to saving our realm.", 13)
			player:setCharVar("Mission3State", 2)
			player:tradeComplete()
		elseif (player:getCharVar("Mission3State") == 4) and
		  (trade:hasItemQty(4509, 1)) and
		  (trade:hasItemQty(4103, 1)) and
		  (trade:hasItemQty(16995, 1))
		then
			player:PrintToPlayer("Excellent, just a moment...", 0, npc:getPacketName())
			player:addItem(9008)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 9008)
			player:PrintToPlayer("Here you go.", 0, npc:getPacketName())
			player:PrintToPlayer("Take it to the center of the island, it should take you to the Vagarous realm of the Xol.", 13)
			player:setCharVar("Mission3State", 5)
			player:tradeComplete()
		elseif (player:getCharVar("Mission3State") == 7) and
		  (trade:hasItemQty(4509, 1)) and
		  (trade:hasItemQty(4103, 1)) and
		  (trade:hasItemQty(16995, 1))
		then
			player:PrintToPlayer("Excellent, just a moment...", 0, npc:getPacketName())
			player:addItem(9008)
			player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 9008)
			player:PrintToPlayer("Here you go.", 0, npc:getPacketName())
			player:PrintToPlayer("Take it to the center of the island, it should take you to the Vagarous realm of the Xol.", 13)
			player:tradeComplete()
		else
			player:PrintToPlayer("Thank you for the offer, but I must pass.", 0, npc:getPacketName())
		end
		
	end,

})

	utils.unused(ElTaz)	
	
end)

return m
