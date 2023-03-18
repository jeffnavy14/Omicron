-----------------------------------
-- Escape NPCs
-----------------------------------
require("modules/module_utils")
require("scripts/zones/The_Colosseum/Zone")
require('scripts/globals/npc_util')
-----------------------------------
local m = Module:new("TieredExits")
m:setEnabled(true)

m:addOverride("xi.zones.The_Colosseum.Zone.onInitialize", function(zone)

    super(zone)
	
	local Exit1 = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Tier 1 Exit",
        look = 2404,
		
        x = 40.000,
        y = 0.000,
        z = 250.000,
        rotation = 63.75,

		onTrigger = function(player, npc)
			local menu  = {}
			local page1 = {}
			local page2 = {}
			
			local delaySendMenu = function(player)
				player:timer(50, function(playerArg)
					playerArg:customMenu(menu)
				end)
			end

			menu =
			{
				title = "Leave the fight?",
				options = {},
			}

			page1 =
			{
			
				{
					"Stay",
					function(playerArg)
					end,
				},
				{
					"Leave",
					function(playerArg)
						menu.options = page2
						delaySendMenu(playerArg)
					end,
				},
			}
			page2 =
			{
				{
					"No stay",
					function(playerArg)
					end,
				},
				{
					"Yes leave",
					function(playerArg)
						player:setCharVar("[Arena]tier", 0)
						SetServerVariable("[Arena]T1Active", 0)
						player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
						player:timer(2000, function(player)
							player:setPos(-600,0,40, 0)
						end)
						player:changeMusic(0, 70)
						player:changeMusic(1, 70)
						player:changeMusic(2, 70)
						player:changeMusic(3, 70)
						player:changeMusic(4, 70)
					end,
				},
			}
			menu.options = page1
			delaySendMenu(player)

		end,

    })

	utils.unused(Exit1)	
---------------------------------------

local Exit2 = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Tier 2 Exit",
        look = 2404,
		
        x = 40.000,
        y = 0.000,
        z = -250.000,
        rotation = 180.25,

		onTrigger = function(player, npc)
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
				title = "Leave the fight?",
				options = {},
			}

			page1 =
			{
				{
					"Stay",
					function(playerArg)
					end,
				},
				{
					"Leave",
					function(playerArg)
						menu.options = page2
						delaySendMenu(playerArg)
					end,
				},
			}
			
			page2 =
			{
				{
					"No stay",
					function(playerArg)
					end,
				},
				{
					"Yes leave",
					function(playerArg)
						player:setCharVar("[Arena]tier", 0)
						SetServerVariable("[Arena]T2Active", 0)
						player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
						player:timer(2000, function(player)
							player:setPos(-600,0,40, 0)
						end)
						player:changeMusic(0, 70)
						player:changeMusic(1, 70)
						player:changeMusic(2, 70)
						player:changeMusic(3, 70)
						player:changeMusic(4, 70)
					end,
				},
			}
			menu.options = page1
			delaySendMenu(player)
		
		end,
    })

	utils.unused(Exit2)	
---------------------------------------
local Exit3 = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Tier 3 Exit",
        look = 2404,
		
        x = -40.000,
        y = 0.000,
        z = -250.000,
        rotation = 180.25,

		onTrigger = function(player, npc)
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
				title = "Leave the fight?",
				options = {},
			}

			page1 =
			{
				{
					"Stay",
					function(playerArg)
					end,
				},
				{
					"Leave",
					function(playerArg)
						menu.options = page2
						delaySendMenu(playerArg)
					end,
				},
			}
			
			page2 =
			{
				{
					"No stay",
					function(playerArg)
					end,
				},
				{
					"Yes leave",
					function(playerArg)
						player:setCharVar("[Arena]tier", 0)
						SetServerVariable("[Arena]T3Active", 0)
						player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
						player:timer(2000, function(player)
							player:setPos(-600,0,40, 0)
						end)
						player:changeMusic(0, 70)
						player:changeMusic(1, 70)
						player:changeMusic(2, 70)
						player:changeMusic(3, 70)
						player:changeMusic(4, 70)
					end,
				},
			}
			menu.options = page1
			delaySendMenu(player)
		
		end,
    })

	utils.unused(Exit3)	
---------------------------------------
local Exit4 = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Tier 4 Exit",
        look = 2404,
		
        x = -40.000,
        y = 0.000,
        z = 250.000,
        rotation = 63.75,
		
		onTrigger = function(player, npc)
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
				title = "Leave the fight?",
				options = {},
			}

			page1 =
			{
				{
					"Stay",
					function(playerArg)
					end,
				},
				{
					"Leave",
					function(playerArg)
						menu.options = page2
						delaySendMenu(playerArg)
					end,
				},
			}
			
			page2 =
			{
				{
					"No stay",
					function(playerArg)
					end,
				},
				{
					"Yes leave",
					function(playerArg)
						player:setCharVar("[Arena]tier", 0)
						SetServerVariable("[Arena]T4Active", 0)
						player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
						player:timer(2000, function(player)
							player:setPos(-600,0,40, 0)
						end)
						player:changeMusic(0, 70)
						player:changeMusic(1, 70)
						player:changeMusic(2, 70)
						player:changeMusic(3, 70)
						player:changeMusic(4, 70)
					end,
				},
			}
			menu.options = page1
			delaySendMenu(player)
		
		end,
    })

	utils.unused(Exit4)	
---------------------------------------
local Exit5 = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Tier 5 Exit",
        look = 2404,
		
        x = 40.000,
        y = 0.000,
        z = 310.000,
        rotation = 180.25,
		
		onTrigger = function(player, npc)
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
				title = "Leave the fight?",
				options = {},
			}

			page1 =
			{
				{
					"Stay",
					function(playerArg)
					end,
				},
				{
					"Leave",
					function(playerArg)
						menu.options = page2
						delaySendMenu(playerArg)
					end,
				},
			}
			
			page2 =
			{
				{
					"No stay",
					function(playerArg)
					end,
				},
				{
					"Yes leave",
					function(playerArg)
						player:setCharVar("[Arena]tier", 0)
						SetServerVariable("[Arena]T5Active", 0)
						player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
						player:timer(2000, function(player)
							player:setPos(-600,0,40, 0)
						end)
						player:changeMusic(0, 70)
						player:changeMusic(1, 70)
						player:changeMusic(2, 70)
						player:changeMusic(3, 70)
						player:changeMusic(4, 70)
					end,
				},
			}
				menu.options = page1
				delaySendMenu(player)
		
		end,
    })

	utils.unused(Exit5)	
---------------------------------------

end)

return m
