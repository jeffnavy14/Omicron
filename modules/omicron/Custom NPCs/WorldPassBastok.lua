-----------------------------------
-- Gatekeeper, teleporter and random filler NPCs
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Port_Bastok/Zone")
require("scripts/zones/Port_San_dOria/Zone")
require("scripts/zones/Heavens_Tower/Zone")
-----------------------------------
local m = Module:new("WorldPassBastok")
m:setEnabled(true)

m:addOverride("xi.zones.Port_Bastok.Zone.onInitialize", function(zone)

    super(zone)
	
	local Dorry = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Dorry",
        look = 100,
        x = 116.005,
        y = 8.457,
        z = -28.964,
        rotation = 63.75,
		
		onTrigger = function(player, npc)
				-- Forward declarations (required)
			local menu  = {}
			local page1 = {}
			local page2 = {}

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
							player:delCurrency("login_points" - 400)
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
							player:delCurrency("login_points" - 400)
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
							player:delCurrency("login_points" - 700)
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
							player:delCurrency("login_points" - 1000)
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
							player:delCurrency("login_points" - 3650)
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
							player:delCurrency("login_points" - 3650)
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
							player:delCurrency("login_points" - 400)
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
							player:delCurrency("login_points" - 700)
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
							player:delCurrency("login_points" - 400)
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
			}

			
				menu.options = page1
				delaySendMenu(player)
		
		end,

		onTrade = function(player, npc, trade)
			player:PrintToPlayer("That's pretty and all, but I don't need that right now. Thanks.", 0, npc:getPacketName())
		end,
		
    })

	utils.unused(Dorry)		

end)

return m