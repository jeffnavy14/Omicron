-----------------------------------
-- Gatekeeper, teleporter and random filler NPCs
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Port_Bastok/Zone")
require("scripts/zones/Port_San_dOria/Zone")
require("scripts/zones/Heavens_Tower/Zone")
-----------------------------------
local m = Module:new("WorldPassSandy")
m:setEnabled(true)

m:addOverride("xi.zones.Port_San_dOria.Zone.onInitialize", function(zone)

    super(zone)
---------------------------------------

local Borry = zone:insertDynamicEntity({

	objtype = xi.objType.NPC,
    name = "Borry",
    look = 101,
    x = -35,
    y = -4,
    z = -76,
    rotation = 127.5,
		
		onTrigger = function(player, npc)
				-- Forward declarations (required)
			local menu  = {}
			local page1 = {}
			local page2 = {}
			local page3 = {}
			local page4 = {}
			local page5 = {}
			local page6 = {}
			local page7 = {}
			local page8 = {}
			local page9 = {}
			
			
			-- We need just a tiny delay to let the previous menu context be cleared out
			-- "New pages" are actually just whole new menus!
			local delaySendMenu = function(player)
				player:timer(50, function(playerArg)
					playerArg:customMenu(menu)
				end)
			end

			menu =
			{
				title = "World Pass Loot",
				options = {},
			}

			page1 =
			{
				{
					"Guide Beret 400 Login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 400 then
							player:addItem(15199)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 15199)
							player:delCurrency("login_points", 400)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Mandragora Beret 400 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 400 then
							player:addItem(15204)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 15204)
							player:delCurrency("login_points", 400)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Detonator Belt 700 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 700 then
							player:addItem(15921)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 15921)
							player:delCurrency("login_points", 700)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Timepiece 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(88)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 88)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Miniature Airship 3650 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 3650 then
							player:addItem(154)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 154)
							player:delCurrency("login_points", 3650)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					">>",
					function(playerArg)
						menu.options = page2
						delaySendMenu(playerArg)
					end,
				},
			}

			page2 =
			{
				{
					"Gold Mog. Belt 3650 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 3650 then
							player:addItem(13216)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 13216)
							player:delCurrency("login_points", 3650)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Sprout Beret 400 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 400 then
							player:addItem(15198)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 15198)
							player:delCurrency("login_points", 400)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Astral Cube 700 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 700 then
							player:addItem(6413)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 6413)
							player:delCurrency("login_points", 700)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"10 Copper Vouchers 400 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 400 then
							player:addItem(8711, 10)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 8711, 10)
							player:delCurrency("login_points", 400)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
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
					"Rvg. Calligae 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12088)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12088)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Tantra Gaiters 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12089)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12089)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Orsn. Duckbills 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12090)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12090)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
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
				{
					">>",
					function(playerArg)
						menu.options = page4
						delaySendMenu(playerArg)
					end,
				},
			}
			page4 =
			{
				{
					"Goetia Sabots 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12091)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12091)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Estq. Houseaux 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12092)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12092)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				
				{
					"Raid. Poulaines 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12093)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12093)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
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
				{
					">>",
					function(playerArg)
						menu.options = page5
						delaySendMenu(playerArg)
					end,
				},
			}
			
			page5 =
			{
				{
					"Creed Sabotons 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12094)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12094)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Bale Sollerets 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12095)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12095)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Ferine Ocreae 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12096)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12096)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"<<",
					function(playerArg)
						menu.options = page4
						delaySendMenu(playerArg)
					end,
				},
				{
					">>",
					function(playerArg)
						menu.options = page6
						delaySendMenu(playerArg)
					end,
				},
			}
			page6 =
			{
				{
					"Aoido. Cothrn. 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12097)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12097)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				
				{
					"Sylvan Bottln. 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12098)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12098)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Unkai Sune-Ate 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12099)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12099)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"<<",
					function(playerArg)
						menu.options = page5
						delaySendMenu(playerArg)
					end,
				},
				{
					">>",
					function(playerArg)
						menu.options = page7
						delaySendMenu(playerArg)
					end,
				},
			}
			page7 =
			{
				{
					"Iga Kyahan 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12100)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12100)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Lncr. Schynbld. 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12101)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12101)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Caller's Pgch. 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12102)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12102)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"<<",
					function(playerArg)
						menu.options = page6
						delaySendMenu(playerArg)
					end,
				},
				{
					">>",
					function(playerArg)
						menu.options = page8
						delaySendMenu(playerArg)
					end,
				},
			}
			page8 =
			{
				{
					"Mavi Basmak 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12103)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12103)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Nvrch. Bottes 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12104)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12104)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Cirque Scarpe 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12105)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12105)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"<<",
					function(playerArg)
						menu.options = page7
						delaySendMenu(playerArg)
					end,
				},
				{
					">>",
					function(playerArg)
						menu.options = page9
						delaySendMenu(playerArg)
					end,
				},
			}
			page9 =
			{
				{
					"Charis Shoes 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12106)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12106)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"Svnt. Loafers 1000 login",
					function(playerArg)
						if (player:getCurrency("login_points")) >= 1000 then
							player:addItem(12107)
							player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 12107)
							player:delCurrency("login_points", 1000)
						else
							player:PrintToPlayer("Insufficent Login Points.", 29)
						end
					end,
				},
				{
					"<<",
					function(playerArg)
						menu.options = page8
						delaySendMenu(playerArg)
					end,
				},

			}
				menu.options = page1
				delaySendMenu(player)
		
		end,

		onTrade = function(player, npc, trade)
			player:PrintToPlayer("That's pretty and all, but I don't need that right now. Thanks.", 0, npc:getPacketName())
		end,
		
    })

	utils.unused(Borry)		

end)

return m
