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
						if AlexStored >= 30000 then
							player:addItem(3443)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 3443)
							player:setCharVar("AlexStored", AlexStored - 30000)
						else
							player:PrintToPlayer("Insufficent Alexandrite stored.", 29)
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
						if (player:getCurrency("jetton")) >= 100000 then
							player:addItem(2571)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 2571)
							player:delCurrency("jetton", 100000)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"Tinnin's Fang 10000 Jetton",
					function(playerArg)
						if (player:getCurrency("jetton")) >= 10000 then
							player:addItem(2609)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 2609)
							player:delCurrency("jetton", 10000)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"Sarameya's Hide 10000 Jetton",
					function(playerArg)
						if (player:getCurrency("jetton")) >= 10000 then
							player:addItem(2619)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 2619)
							player:delCurrency("jetton", 10000)
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
						if (player:getCurrency("jetton")) >= 10000 then
							player:addItem(2629)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 2629)
							player:delCurrency("jetton", 10000)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"Beitetsu 50 Jetton",
					function(playerArg)
						if (player:getCurrency("jetton")) >= 50 then
							player:addItem(4060)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 21066)
							player:delCurrency("jetton", 50)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"Trial Wand 1000 Jetton",
					function(playerArg)
						if (player:getCurrency("jetton")) >= 1000 then
							player:addItem(21066)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 21066)
							player:delCurrency("jetton", 1000)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"Trial Blade 1000 Jetton",
					function(playerArg)
						if (player:getCurrency("jetton")) >= 1000 then
							player:addItem(20749)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 20749)
							player:delCurrency("jetton", 1000)
						else
							player:PrintToPlayer("Insufficent jettons.", 29)
						end
					end,
				},
				{
					"Rune Weave 3000 Jetton",
					function(playerArg)
						if (player:getCurrency("jetton")) >= 3000 then
							player:addItem(4029)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 4029)
							player:delCurrency("jetton", 3000)
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
