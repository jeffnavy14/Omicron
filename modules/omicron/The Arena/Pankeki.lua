-----------------------------------
-- Gatekeeper, teleporter and random filler NPCs
-----------------------------------
require("modules/module_utils")
require("scripts/zones/The_Colosseum/Zone")
require('scripts/globals/npc_util')
-----------------------------------
local m = Module:new("Pankeki")
m:setEnabled(true)

m:addOverride("xi.zones.The_Colosseum.Zone.onInitialize", function(zone)

    super(zone)
	
	local Pankeki = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Pankeki",
        look = 100,
        x = -580.000,
        y = 0.000,
        z = 21.000,
        rotation = 180.250,
		
		onTrigger = function(player, npc)
			local AlexStored = player:getCharVar("AlexStored")
			local Jettons = player:getCurrency("jetton")
			local menu  = {}
			local page1 = {}
			local page2 = {}
			local page3 = {}
			local page4 = {}
			
			local delaySendMenu = function(player)
				player:timer(50, function(playerArg)
					playerArg:customMenu(menu)
				end)
			end

			menu =
			{
				title = "Pankeiki's Shop",
				options = {},
			}

			page1 =
			{
				{
					"Explanation please",
					function(playerArg)
						player:PrintToPlayer("Well its really quite simple, I can store your Alexandrite until you have enough to get a Cat's Eye", 13)
						player:PrintToPlayer("Also you can get some items with your earned jettons if you'd like.", 13)
					end,
				},
				{
					"Stored Alexandrite",
					function(playerArg)
						player:PrintToPlayer(string.format("Pankeki: The total stored Alexandrite sits at: %u", player:getCharVar("AlexStored")), 13)
					end,
				},
				{
					"Catseye  30000 Alexandrite",
					function(playerArg)
						if player:hasItem(3443) then
							player:PrintToPlayer("You already have one!", 29)
						elseif AlexStored >= 30000 and
							player:getFreeSlotsCount() > 0
						then
							player:addItem(3443)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 3443)
							player:setCharVar("AlexStored", AlexStored - 30000)
						elseif player:getFreeSlotsCount() == 0 then
							player:PrintToPlayer("You need more inventory space!", 29)
						else
							player:PrintToPlayer("Insufficent Alexandrite stored.", 29)
						end
					end,
				},
				{
					"Wyrmseeker Areuhat 150000 Tokens",
					function(playerArg)
						if player:hasItem(2489) then
							player:PrintToPlayer("You already have one!", 29)
						elseif (player:getCurrency("nyzul_isle_assault_point")) >= 150000 and
							player:getFreeSlotsCount() > 0
						then
							player:addItem(2489)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 2489)
							player:delCurrency("nyzul_isle_assault_point", 150000)
						elseif player:getFreeSlotsCount() == 0 then
							player:PrintToPlayer("You need more inventory space!", 29)
						else
							player:PrintToPlayer("Insufficent tokens.", 29)
						end
					end,
				},
				{
					"Jetton Items",
					function(playerArg)
						menu.options = page2
						delaySendMenu(playerArg)
					end,
				},
			}
			
			page2 =
			{
				{
					"Balrahn's Eyepatch 100000 jetton",
					function(playerArg)
						if player:hasItem(2571) then
							player:PrintToPlayer("You already have one!", 29)
						elseif (player:getCurrency("jetton")) >= 100000 and
							player:getFreeSlotsCount() > 0
						then
							player:addItem(2571)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 2571)
							player:delCurrency("jetton", 100000)
						elseif player:getFreeSlotsCount() == 0 then
							player:PrintToPlayer("You need more inventory space!", 29)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"Tinnin's Fang 10000 Jetton",
					function(playerArg)
						if player:hasItem(2609) then
							player:PrintToPlayer("You already have one!", 29)
						elseif (player:getCurrency("jetton")) >= 10000 and
							player:getFreeSlotsCount() > 0
						then
							player:addItem(2609)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 2609)
							player:delCurrency("jetton", 10000)
						elseif player:getFreeSlotsCount() == 0 then
							player:PrintToPlayer("You need more inventory space!", 29)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"Sarameya's Hide 10000 Jetton",
					function(playerArg)
						if player:hasItem(2619) then
							player:PrintToPlayer("You already have one!", 29)
						elseif (player:getCurrency("jetton")) >= 10000 and
							player:getFreeSlotsCount() > 0
						then
							player:addItem(2619)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 2619)
							player:delCurrency("jetton", 10000)
						elseif player:getFreeSlotsCount() == 0 then
							player:PrintToPlayer("You need more inventory space!", 29)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"<<",
					function(playerArg)
						menu.options = page1
						delaySendMenu(playerArg)
					end,
				},
				{
					">>",
					function(playerArg)
						menu.options = page3
						delaySendMenu(playerArg)
					end,
				},
			}

			page3 =
			{
				{
					"Tyger's Tail 10000 Jetton",
					function(playerArg)
						if player:hasItem(2629) then
							player:PrintToPlayer("You already have one!", 29)
						elseif (player:getCurrency("jetton")) >= 10000 and
							player:getFreeSlotsCount() > 0
						then
							player:addItem(2629)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 2629)
							player:delCurrency("jetton", 10000)
						elseif player:getFreeSlotsCount() == 0 then
							player:PrintToPlayer("You need more inventory space!", 29)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"Beitetsu 50 Jetton",
					function(playerArg)
						if player:getFreeSlotsCount() > 0 then
							menu.options = page4
							delaySendMenu(playerArg)
						else
							player:PrintToPlayer("You need more inventory space!", 29)
						end
					end,
				},
				{
					"Trial Wand 1000 Jetton",
					function(playerArg)
						if player:hasItem(21066) then
							player:PrintToPlayer("You already have one!", 29)
						elseif (player:getCurrency("jetton")) >= 1000 and
							player:getFreeSlotsCount() > 0 then
							player:addItem(21066)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 21066)
							player:delCurrency("jetton", 1000)
						elseif player:getFreeSlotsCount() == 0 then
							player:PrintToPlayer("You need more inventory space!", 29)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"Trial Blade 1000 Jetton",
					function(playerArg)
						if player:hasItem(20749) then
							player:PrintToPlayer("You already have one!", 29)
						elseif (player:getCurrency("jetton")) >= 1000 and
							player:getFreeSlotsCount() > 0
						then
							player:addItem(20749)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 20749)
							player:delCurrency("jetton", 1000)
						elseif player:getFreeSlotsCount() == 0 then
							player:PrintToPlayer("You need more inventory space!", 29)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"Rune Weave 3000 Jetton",
					function(playerArg)
						if (player:getCurrency("jetton")) >= 3000 and
							player:getFreeSlotsCount() > 0
						then
							player:addItem(4029)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 4029)
							player:delCurrency("jetton", 3000)
						elseif player:getFreeSlotsCount() == 0 then
							player:PrintToPlayer("You need more inventory space!", 29)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"<<",
					function(playerArg)
						menu.options = page2
						delaySendMenu(playerArg)
					end,
				},
			}
			
			page4 =
			{
				{
					"1",
					function(playerArg)
						if (player:getCurrency("jetton")) >= 50 then
							player:addItem(4060)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 4060)
							player:delCurrency("jetton", 50)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"10",
					function(playerArg)
						if (player:getCurrency("jetton")) >= 500 then
							player:addItem(4060, 10)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 4060)
							player:delCurrency("jetton", 500)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"50",
					function(playerArg)
						if (player:getCurrency("jetton")) >= 2500 then
							player:addItem(4060, 50)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 4060)
							player:delCurrency("jetton", 2500)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"100",
					function(playerArg)
						if (player:getCurrency("jetton")) >= 5000 and
							player:getFreeSlotsCount() > 1
						then
							player:addItem(4060, 100)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 4060)
							player:delCurrency("jetton", 5000)
						elseif player:getFreeSlotsCount() < 2 then
							player:PrintToPlayer("You need more inventory space!", 29)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"<<",
					function(playerArg)
						menu.options = page3
						delaySendMenu(playerArg)
					end,
				},
			}
			menu.options = page1
			delaySendMenu(player)
		
		end,

		onTrade = function(player, npc, trade)
			local AlexStored = player:getCharVar("AlexStored")
			if AlexStored < 1 then
				AlexStored = 0
			end
			local count = trade:getItemCount()
			if trade:hasItemQty(2488, count) then
				player:setCharVar("AlexStored", AlexStored + count)
				player:PrintToPlayer(string.format("Pankeki: The total stored Alexandrite sits at: %u", player:getCharVar("AlexStored")), 13)
				player:tradeComplete();
			end
		end,
		
    })

	utils.unused(Pankeki)		

end)

return m
