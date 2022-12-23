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

local NibAug = function(player, itemid, npc)
	if (player:getCharVar("NibReward")) == 1 then
		player:addItem(20524, 1, 23, 24, 44, 2, 34, 19) -- Nibiru Sainti (h2h) ACC +25 STP/SubtleBlow +3 EVA +20
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 20524)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 2 then
		player:addItem(20600, 1, 23, 19, 31, 19, 37, 19) -- Nibiru Knife (DAG) ACC +20 EVA +20 MEVA +20
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 20600)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 3 then
		player:addItem(20710, 1, 23, 19, 35, 14, 143, 2) -- Nibiru Blade (SWD) ACC 20 MAC 15 DblAtk 3
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 20710)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 4 then
		player:addItem(20801, 1, 23, 14, 25, 19, 109, 2) -- Nibiru Tabar (AXE) ATK +20 ACC +15 Pet:DblAtk/Crit +3
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 20801)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 5 then
		player:addItem(20848, 1, 512, 9, 514, 9, 143, 2) -- Nibiru Chopper (GAX) STR +10 VIT +10 DblAtk +3
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 20848)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 6 then
		player:addItem(20895, 1, 512, 9, 35, 14, 133, 14) -- Nibiru Sickle (SCY) STR +10 MAC +20 MAB +15
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 20895)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 7 then
		player:addItem(20939, 1, 512, 9, 100, 19, 121, 4) -- Nibiru Lance (POL) STR +10 PetMAcc +20 PetBreath 5
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 20939)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 8 then
		player:addItem(20983, 1, 34, 19, 37, 19, 140, 4) -- Mijin (KAT) EVA +20 MEVA +20 FC +5
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 20983)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 9 then
		player:addItem(21031, 1, 513, 6, 23, 19, 142, 4) -- Sensui (GKA) DEX +7 ACC 20 STP 5
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 21031)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 10 then
		player:addItem(21092, 1, 133, 14, 516, 9, 142, 3) -- Nibiru Crudgel (CLB) MAB 15 INT 10 FC 3
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 21092)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 11 then
		player:addItem(21216, 1, 69, 19, 212, 14, 142, 4) -- Nibiru Bow (ARC) RAC/RAT +20, Recycle +15, STP +5
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 21216)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 12 then
		player:addItem(21699, 1, 23, 19, 140, 4, 143, 4) -- Nibiru Faussar (GSD) ACC +20 FC 3 DblAtk 5
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 21699)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 13 then
		player:addItem(21273, 1, 69, 19, 139, 9, 515, 9) -- Nibiru Gun (MAR) RAC/RAT +20, Rapid Shot +10, AGI +10
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 21273)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 14 then
		player:addItem(21399, 1, 67, 1, 35, 9, 518, 9) -- Nibiru Harp (STR) All Songs +2 MAC +10 CHR +10 
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 21399)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 15 then
		player:addItem(21156, 1, 133, 24, 110, 1, 101, 24) -- Nibiru Staff (STF) MAB +25 Pet: Regen +2 Pet: MAB +25
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 21156)
		player:setCharVar("NibReward", 0)
	elseif (player:getCharVar("NibReward")) == 16 then
		player:addItem(27642, 1, 39, 6, 142, 6, 71, 4) -- Nibiru Shield (SLD) Enmity +7 FC 7 DT 5
		player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27642)
		player:setCharVar("NibReward", 0)
	end
end
		
m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)

	local ElTaz = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "El'Taz",
        look = 971,
        x = 599.013,
        y = -1.666,
        z = 17.937,
        rotation = 200,
	

	onTrigger = function(player, npc, status)

		if player:getCharVar("NibState") == 8 then
			NibAug(player, itemid, npc)
			player:setCharVar("NibState", 0)
		elseif player:getCharVar("NibState") == 7 then
			player:PrintToPlayer("Alright, so I need 3 Cehuetzi Claws. Take care now.", 0, npc:getPacketName())
		elseif player:getCharVar("NibState") == 6 then
			player:PrintToPlayer("We're almost there, 4 Waktza Rostrums are on the list now.", 0, npc:getPacketName())
		elseif player:getCharVar("NibState") == 5 then
			player:PrintToPlayer("Hmmm? Oh yes, 4 Gabbrath Horns please.", 0, npc:getPacketName())
		elseif player:getCharVar("NibState") == 4 then
			player:PrintToPlayer("Finally our last ingredient... 3 Rockfin Fins... almost bit my toungue there...",0, npc:getPacketName())
		elseif player:getCharVar("NibState") == 3 then
			player:PrintToPlayer("Next I am needin 4 Yggdreant Boles. Off you go now.", 0, npc:getPacketName())
		elseif player:getCharVar("NibState") == 2 then
			player:PrintToPlayer("Firstly I shall need 3 Bztavian Stingers. Well? Hop-to!", 0, npc:getPacketName())
		elseif player:getCharVar("Mission2State") == 3 then
			player:PrintToPlayer("Oho~ho! Looky here, someone that can not only hold their own here, but also excel in their own right!",0 , npc:getPacketName())
			player:PrintToPlayer("Now some of the others have spoken to me, and tell me you're looking into who was behind the old invasions, and causing other issues.", 13)
			player:PrintToPlayer("Bring me a weapon from this island and I'll be able to make it helpful in your task.", 13)
			player:setCharVar("NibState", 1)
		else
			player:PrintToPlayer("Looking for someone that's proven themselves to offer-aru my services to... thats not you at this time-aru", 0, npc:getPacketName())
       	end

    end,
	
	onTrade = function(player, npc, trade)

		if (player:getCharVar("NibState")) == 1 then
			if (trade:hasItemQty(20524, 1)) then
				player:setCharVar("NibReward", 1)
				player:tradeComplete()
			elseif (trade:hasItemQty(20600, 1)) then
				player:setCharVar("NibReward", 2)
				player:tradeComplete()
			elseif (trade:hasItemQty(20710, 1)) then
				player:setCharVar("NibReward", 3)
				player:tradeComplete()
			elseif (trade:hasItemQty(20801, 1)) then
				player:setCharVar("NibReward", 4)
				player:tradeComplete()
			elseif (trade:hasItemQty(20848, 1)) then
				player:setCharVar("NibReward", 5)
				player:tradeComplete()
			elseif (trade:hasItemQty(20895, 1)) then
				player:setCharVar("NibReward", 6)
				player:tradeComplete()
			elseif (trade:hasItemQty(20939, 1)) then
				player:setCharVar("NibReward", 7)
				player:tradeComplete()
			elseif (trade:hasItemQty(20983, 1)) then
				player:setCharVar("NibReward", 8)
				player:tradeComplete()
			elseif (trade:hasItemQty(21031, 1)) then
				player:setCharVar("NibReward", 9)
				player:tradeComplete()
			elseif (trade:hasItemQty(21092, 1)) then
				player:setCharVar("NibReward", 10)
				player:tradeComplete()
			elseif (trade:hasItemQty(21216, 1)) then
				player:setCharVar("NibReward", 11)
				player:tradeComplete()
			elseif (trade:hasItemQty(21699, 1)) then
				player:setCharVar("NibReward", 12)
				player:tradeComplete()
			elseif (trade:hasItemQty(21273, 1)) then
				player:setCharVar("NibReward", 13)
				player:tradeComplete()
			elseif (trade:hasItemQty(21399, 1)) then
				player:setCharVar("NibReward", 14)
				player:tradeComplete()
			elseif (trade:hasItemQty(21156, 1)) then
				player:setCharVar("NibReward", 15)
				player:tradeComplete()
			elseif (trade:hasItemQty(27642, 1)) then
				player:setCharVar("NibReward", 16)
				player:tradeComplete()
			end
			player:PrintToPlayer("Excellent, now I shall need 3 Bztavian Stingers to begin the process.", 0, npc:getPacketName())
			player:setCharVar("NibState", 2)
			player:tradeComplete()
		elseif (trade:hasItemQty(3980, 3)) and (player:getCharVar("NibState")) == 2 then
			player:PrintToPlayer("Mmmm, perfect for the first step, now we need 4 Yggdreant Boles.", 0, npc:getPacketName())
			player:setCharVar("NibState", 3)
			player:tradeComplete()
		elseif (trade:hasItemQty(4014, 4)) and (player:getCharVar("NibState")) == 3 then
			player:PrintToPlayer("Well done. Now for 3 Rockfin Fins...",0, npc:getPacketName())
			player:PrintToPlayer("... ow... jus' bih mah 'oungue...", 13)
			player:setCharVar("NibState", 4)
			player:tradeComplete()
		elseif (trade:hasItemQty(3978, 3)) and (player:getCharVar("NibState")) == 4 then
			player:PrintToPlayer("Thank you, thats half of what we need. Please get 4 Gabbrath Horns next.", 0, npc:getPacketName())
			player:setCharVar("NibState", 5)
			player:tradeComplete()
		elseif (trade:hasItemQty(3977, 4)) and (player:getCharVar("NibState")) == 5 then 
			player:PrintToPlayer("Almost there, time for you to get me 4 Waktza Rostrums if you'll be so kind.", 0, npc:getPacketName())
			player:setCharVar("NibState", 6)
			player:tradeComplete()
		elseif (trade:hasItemQty(4012, 4)) and (player:getCharVar("NibState")) == 6 then
			player:PrintToPlayer("Excellent, 1 ingredient left. 3 Cehuetzi Claws, then I'll have your weapon ready", 0, npc:getPacketName())
			player:setCharVar("NibState", 7)
			player:tradeComplete()
		elseif (trade:hasItemQty(8752, 3)) and (player:getCharVar("NibState")) == 7 then
			player:PrintToPlayer("Excellent! Now give me just a moment and this will be ready for you.", 0, npc:getPacketName())
			player:setCharVar("NibState", 8)
			player:tradeComplete()
		else
			player:PrintToPlayer("Thats quite nice, but not what I'm working on at the moment~aru.", 0, npc:getPacketName())
		end
		
	end,

})

	utils.unused(ElTaz)	
	
end)

return m