local m = Module:new("Registrar")
m:setEnabled(true)

m:addOverride("xi.zones.The_Colosseum.Zone.onInitialize", function(zone)

    super(zone)
	
	local Registrar = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Registrar",
        look = 2262,
        x = -583.000,
        y = 0.000,
        z = 59.000,
        rotation = 63.750,
		
		onTrigger = function(player, npc)
									
			player:PrintToPlayer("Well howdy thar! I'ma hoping you're lookin' for a rip roarin' good ol' time!", xi.msg.channel.NS_SAY)
			-- player:PrintToPlayer(string.format("The last month you registered: %u", player:getCharVar("[Arena]month")), 13) left in for testing purposes
			
			local menu  = {}
			local page1 = {}
			local page2 = {}
			local page3 = {}
			SetServerVariable("[Arena]FightMonth", tonumber(os.date("%m")))
			local month = GetServerVariable("[Arena]FightMonth")
			--menu to show all mobs, choose w/o KI list what KI needed, else confirm then pop
			local delaySendMenu = function(player)
				player:timer(50, function(playerArg)
					playerArg:customMenu(menu)
				end)
			end

			menu =
			{
				title = "What'cha looking' into?",
				options = {},
			}

			page1 =
			{
				-- This option for testing purposes only
				--[[
				{
					"Print Variable",
					function(playerArg)
						player:PrintToPlayer(string.format("Player Month: %u", player:getCharVar("[Arena]Month")), 13)
						player:PrintToPlayer(string.format("Server Month: %u", GetServerVariable("[Arena]FightMonth")), 13)
						player:PrintToPlayer(string.format("Player Tier: %u", player:getCharVar("[Arena]tier")), 13)
						player:PrintToPlayer(string.format("Tier 1 Active: %u", GetServerVariable("[Arena]T1active")), 13)
						player:PrintToPlayer(string.format("Tier 2 Active: %u", GetServerVariable("[Arena]T2active")), 13)
						player:PrintToPlayer(string.format("Tier 3 Active: %u", GetServerVariable("[Arena]T3active")), 13)
						player:PrintToPlayer(string.format("Tier 4 Active: %u", GetServerVariable("[Arena]T4active")), 13)
						player:PrintToPlayer(string.format("Tier 5 Active: %u", GetServerVariable("[Arena]T5active")), 13)
					end,
				},
				]]
				{
					"What's going on here?",
					function(playerArg)
						player:PrintToPlayer("Registrar: Well to be puttin' 'er strait as it is, this here be a fightin' arena.", xi.msg.channel.NS_SAY)
						player:PrintToPlayer("Yeh just gotta pick a tier, we send you to 'er and you bash 'em", xi.msg.channel.NS_SAY)
						player:PrintToPlayer("Aftah that yeh get a nice reward, have an imperial coffee or 30, and then do 'er again.", xi.msg.channel.NS_SAY)
					end,
				},
				{
					"Reward?",
					function(playerArg)
						player:PrintToPlayer("Registrar: We be givin' out some shiny alexandrites, and jettons. That's the money in here see?.", xi.msg.channel.NS_SAY)
						player:PrintToPlayer("Get enough of that alexandrite, then you can use it to get a purdy like weapon.", xi.msg.channel.NS_SAY)
						player:PrintToPlayer("Tiny can tell you more on that.", xi.msg.channel.NS_SAY)
					end,
				},
				{
					"Looking for a fight!",
					function(playerArg)
						menu.options = page2
						delaySendMenu(playerArg)
					end,
				},
			}
			
			page2 =
			{
				{
					"Tier 1",
					function(playerArg)
						if player:getCharVar("[Arena]tier") == 0 or
							not player:getCharVar("[Arena]month") == month
						then
							player:PrintToPlayer("Alrighty! I'll get that paper done, let that thar Feral Master know when you're ready to begin!", xi.msg.channel.NS_SAY)
							player:setCharVar("[Arena]tier", 1)
							player:setCharVar("[Arena]month", month)
						elseif player:getCharVar("[Arena]tier") == 1 and
							player:getCharVar("[Arena]month") == month
						then
							player:PrintToPlayer("Oh! Yah be a'ready signed up fer that thar tier. Off to the Feral Master for you", xi.msg.channel.NS_SAY)
						else
							player:PrintToPlayer("Alrighty! Well it be lookin' like ye've alredy got a registered tier, want to change it?", xi.msg.channel.NS_SAY)
							player:setCharVar("MaybeTier", 1)
							menu.options = page3
							delaySendMenu(playerArg)
						end
					end,
				},
				{
					"Tier 2",
					function(playerArg)
						if player:getCharVar("[Arena]tier") == 0 or
							not player:getCharVar("[Arena]month") == month
						then
							player:PrintToPlayer("Alrighty! I'll get that paper done, let that thar Feral Master know when you're ready to begin!.", xi.msg.channel.NS_SAY)
							player:setCharVar("[Arena]tier", 2)
							player:setCharVar("[Arena]month", month)
						elseif player:getCharVar("[Arena]tier") == 2 and
							player:getCharVar("[Arena]month") == month
						then
							player:PrintToPlayer("Oh! Yah be a'ready signed up fer that thar tier. Off to the Feral Master for you", xi.msg.channel.NS_SAY)
						else
							player:PrintToPlayer("Oh! Yah be a'ready signed up fer that thar tier. Off to the Feral Master for you", xi.msg.channel.NS_SAY)
							player:PrintToPlayer("Alrighty! Well it be lookin' like ye've alredy got a registered tier, want to change it?", xi.msg.channel.NS_SAY)
							player:setCharVar("MaybeTier", 2)
							menu.options = page3
							delaySendMenu(playerArg)
						end
					end,
				},
				{
					"Tier 3",
					function(playerArg)
						if player:getCharVar("[Arena]tier") == 0 or
							not player:getCharVar("[Arena]month") == month
						then
							player:PrintToPlayer("Alrighty! I'll get that paper done, let that thar Feral Master know when you're ready to begin!.", xi.msg.channel.NS_SAY)
							player:setCharVar("[Arena]tier", 3)
							player:setCharVar("[Arena]month", month)
						elseif player:getCharVar("[Arena]tier") == 3 and
							player:getCharVar("[Arena]month") == month
						then
							player:PrintToPlayer("Oh! Yah be a'ready signed up fer that thar tier. Off to the Feral Master for you", xi.msg.channel.NS_SAY)
						else
							player:PrintToPlayer("Alrighty! Well it be lookin' like ye've alredy got a registered tier, want to change it?", xi.msg.channel.NS_SAY)
								player:setCharVar("MaybeTier", 3)
							menu.options = page3
							delaySendMenu(playerArg)
						end
					end,
				},
				{
					"Tier 4",
					function(playerArg)
						if player:getCharVar("[Arena]tier") == 0 or
							not player:getCharVar("[Arena]month") == month
						then
							player:PrintToPlayer("Alrighty! I'll get that paper done, let that thar Feral Master know when you're ready to begin!.", xi.msg.channel.NS_SAY)
							player:setCharVar("[Arena]tier", 4)
							player:setCharVar("[Arena]month", month)
						elseif player:getCharVar("[Arena]tier") == 4 and
							player:getCharVar("[Arena]month") == month
						then
							player:PrintToPlayer("Oh! Yah be a'ready signed up fer that thar tier. Off to the Feral Master for you", xi.msg.channel.NS_SAY)
						else
							player:PrintToPlayer("Alrighty! Well it be lookin' like ye've alredy got a registered tier, want to change it?", xi.msg.channel.NS_SAY)
							player:setCharVar("MaybeTier", 4)
							menu.options = page3
							delaySendMenu(playerArg)
						end
					end,
				},
				{
					"Tier 5",
					function(playerArg)
						if player:getCharVar("[Arena]tier") == 0 or
							not player:getCharVar("[Arena]month") == month
						then
							player:PrintToPlayer("Alrighty! I'll get that paper done, let that thar Feral Master know when you're ready to begin!.", xi.msg.channel.NS_SAY)
							player:setCharVar("[Arena]tier", 5)
							player:setCharVar("[Arena]month", month)
						elseif player:getCharVar("[Arena]tier") == 5 and
							player:getCharVar("[Arena]month") == month
						then
							player:PrintToPlayer("Oh! Yah be a'ready signed up fer that thar tier. Off to the Feral Master for you", xi.msg.channel.NS_SAY)
						else
							player:PrintToPlayer("Alrighty! Well it be lookin' like ye've alredy got a registered tier, want to change it?", xi.msg.channel.NS_SAY)
							local MaybeTier = 5
							menu.options = page3
							delaySendMenu(playerArg)
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
			
			page3 =
			{
				{
					"On second thought...",
					function(playerArg)
						player:PrintToPlayer("Alrighty! Well get on over tah Feral Master know when you're ready to begin!.", xi.msg.channel.NS_SAY)
					end,
				},
				{
					"Yes!",
					function(playerArg)
						local MaybeTier = player:getCharVar("MaybeTier")
						player:setCharVar("[Arena]tier", MaybeTier)
						player:setCharVar("MaybeTier", 0)
						player:setCharVar("[Arena]month", month)
						player:PrintToPlayer("Alrighty! I'll get that paper done, let that thar Feral Master know when you're ready to begin!.", xi.msg.channel.NS_SAY)
					end,
				},
			
			}
			menu.options = page1
			delaySendMenu(player)
		end
		
	})

	utils.unused(Registrar)	

end)

return m