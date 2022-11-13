-----------------------------------
-- for testing
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Bastok_Mines/Zone")
require("scripts/zones/Northern_San_dOria/Zone")
require("scripts/zones/Port_Windurst/Zone")
require("scripts/zones/Xarcabard/Zone")
-----------------------------------
local m = Module:new("XMasPeople")
m:setEnabled(true)

m:addOverride("xi.zones.Bastok_Mines.Zone.onInitialize", function(zone)

    super(zone)
	
	local Mogger = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Mogger",
        look = 2360,
		x = 56.000,
		y = 0.000,
		z = -84.053,
        rotation = 200,
		
		onTrigger = function(player, npc)
			XMas = player:getCharVar("AliXmas2022")
			KMP = player:getCharVar("KupoMasPoints")
			if XMas == 1 then
				player:PrintToPlayer("The thief was last seen in Xarcabard, around (G-8).", 0, npc:getPacketName())
			elseif XMas == 2 then
				player:PrintToPlayer("Well, there are many more presents that thief has stolen...", 0, npc:getPacketName())
				player:PrintToPlayer("if you do get more, just bring them to me but one at a time so its easier to keep track kupo.", 13)
				player:PrintToPlayer(string.format("Your KupoMas Points total sits at: %u", player:getCharVar("KupoMasPoints")), 13)
			else
				player:PrintToPlayer("Oh!!! Kupo!!! Thank Altana, great and terrible things have happened!", 0, npc:getPacketName())
				player:PrintToPlayer("Something called the Krampus has come and taken all the gifts from under the trees!", 13)
				player:PrintToPlayer("Like some sort of grinch, scrouge, witch!", 13)
				player:timer(2000, function(player)
					player:PrintToPlayer("Now as a recipient of the M.H.M.U. benefits I now deputize you to get that sneaky thief, kupo!", 0, npc:getPacketName())
					player:PrintToPlayer("NO OBJECTIONS! Besides... you do so well have bringing low the vile creatures,", 13)
					player:PrintToPlayer("so this should be a piece of cake for you.", 13)
				end)
				player:timer(5000, function(player)
					player:PrintToPlayer("Now somewhere in the cold reaches of Xarcabard is where you'll need to go.", 0, npc:getPacketName())
					player:PrintToPlayer("You'll need something to draw him out...", 13)
					player:PrintToPlayer("Kupo! Kupo! Kupo! Ginger cookies, you'll need 6 at least I think.", 13)
				end)
				player:timer(5000, function(player)
					player:PrintToPlayer("Now off you get kupo!", 0, npc:getPacketName())
					player:setCharVar("AliXmas2022", 1)
					
				end)
			
			end
		end,

		onTrade = function(player, npc, trade)
			XMas = player:getCharVar("AliXmas2022")
			KMP = player:getCharVar("KupoMasPoints")
			if (trade:hasItemQty(1745, 1)) then
				if XMas == 0 then
					player:PrintToPlayer("Kupo? Oh that's not mine, thank you kupo.", 0, npc:getPacketName())
				elseif XMas == 1 then
					player:PrintToPlayer("Kup~ooo! How wonderful! We'll have the M.H.M.U. get this back to where it belongs.", 0, npc:getPacketName())
					player:PrintToPlayer("For your help, I give you 10 KupoMas points!", 13)
					player:PrintToPlayer("You recieved 10 KupoMas points.", 29)
					player:setCharVar("AliXmas2022", 2)
					player:setCharVar("KupoMasPoints", KMP + 10)
					Player:tradeComplete();
				elseif XMas == 2 then
					player:PrintToPlayer("Oh~hoh~hoh! Kupo! Got another one I see, I'll get that taken care of.", 0, npc:getPacketName())
					player:PrintToPlayer("For your help, I give you 10 KupoMas points!", 13)
					player:PrintToPlayer("You recieved 10 KupoMas points.", 29)
					player:setCharVar("AliXmas2022", 2)
					player:setCharVar("KupoMasPoints", KMP + 10)
					player:tradeComplete();
				end
			else
				player:PrintToPlayer("Ummmmm.... that's not mine", 0, npc:getPacketName())
			end
		end,
		
    })

	utils.unused(Mogger)		

---------------------------------------

local Moggy = zone:insertDynamicEntity({

	objtype = xi.objType.NPC,
    name = "Moggy",
   	look = 2359,
	x = 61.000,
	y = 0.000,
	z = -84.053,
	rotation = 200,
		
		onTrigger = function(player, npc)
			KMP = player:getCharVar("KupoMasPoints")
			local menu =
				{
				title = "What would you like?",
				onStart = function(playerArg)
				end,
				options =
					{
						{
						"100 KMP: Starlight Cake",
						function(playerArg)
							if KMP >=100 then
								player:setCharVar("KupoMasPoints", KMP - 100)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(3634)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"250 KMP: Dream Bell +1",
						function(playerArg)
							if player:hasItem(18864) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=250 then
								player:setCharVar("KupoMasPoints", KMP - 250)
								player:PrintToPlayer("Here you go")
								player:addItem(18864)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"600 KMP: Dream Boots +1",
						function(playerArg)
							if player:hasItem(15753) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=600 then
								player:setCharVar("KupoMasPoints", KMP - 600)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(15753)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"800 KMP: Dream Hat +1",
						function(playerArg)
							if player:hasItem(15179) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=800 then
								player:setCharVar("KupoMasPoints", KMP - 800)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(15179)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"1000 KMP: Dream Robe +1",
						function(playerArg)
							if player:hasItem(14520) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=1000 then
								player:setCharVar("KupoMasPoints", KMP - 1000)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(14520)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"None",
						function(playerArg)
						end,
						},
					},
				}
				player:customMenu(menu)
		end,

    })

	utils.unused(Moggy)		

---------------------------------------
		
end)

---------------------------------------
---------------------------------------

m:addOverride("xi.zones.Northern_San_dOria.Zone.onInitialize", function(zone)

    super(zone)
	
	local Mogger2 = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Mogger",
        look = 2360,
		x = 64.000,
		y = 0.000,
		z = 19.000,
		rotation = 223,
		
		onTrigger = function(player, npc)
			XMas = player:getCharVar("AliXmas2022")
			KMP = player:getCharVar("KupoMasPoints")
			if XMas == 1 then
				player:PrintToPlayer("The thief was last seen in Xarcabard, around (G-8).", 0, npc:getPacketName())
			elseif XMas == 2 then
				player:PrintToPlayer("Well, there are many more presents that thief has stolen...", 0, npc:getPacketName())
				player:PrintToPlayer("if you do get more, just bring them to me but one at a time so its easier to keep track kupo.", 13)
				player:PrintToPlayer(string.format("Your KupoMas Points total sits at: %u", player:getCharVar("KupoMasPoints")), 13)
			else
				player:PrintToPlayer("Oh!!! Kupo!!! Thank Altana, great and terrible things have happened!", 0, npc:getPacketName())
				player:PrintToPlayer("Something called the Krampus has come and taken all the gifts from under the trees!", 13)
				player:PrintToPlayer("Like some sort of grinch, scrouge, witch!", 13)
				player:timer(2000, function(player)
					player:PrintToPlayer("Now as a recipient of the M.H.M.U. benefits I now deputize you to get that sneaky thief, kupo!", 0, npc:getPacketName())
					player:PrintToPlayer("NO OBJECTIONS! Besides... you do so well have bringing low the vile creatures,", 13)
					player:PrintToPlayer("so this should be a piece of cake for you.", 13)
				end)
				player:timer(5000, function(player)
					player:PrintToPlayer("Now somewhere in the cold reaches of Xarcabard is where you'll need to go.", 0, npc:getPacketName())
					player:PrintToPlayer("You'll need something to draw him out...", 13)
					player:PrintToPlayer("Kupo! Kupo! Kupo! Ginger cookies, you'll need 6 at least I think.", 13)
				end)
				player:timer(5000, function(player)
					player:PrintToPlayer("Now off you get kupo!", 0, npc:getPacketName())
					player:setCharVar("AliXmas2022", 1)
					
				end)
			
			end
		end,

		onTrade = function(player, npc, trade)
			XMas = player:getCharVar("AliXmas2022")
			KMP = player:getCharVar("KupoMasPoints")
			if (trade:hasItemQty(1745, 1)) then
				if XMas == 0 then
					player:PrintToPlayer("Kupo? Oh that's not mine, thank you kupo.", 0, npc:getPacketName())
				elseif XMas == 1 then
					player:PrintToPlayer("Kup~ooo! How wonderful! We'll have the M.H.M.U. get this back to where it belongs.", 0, npc:getPacketName())
					player:PrintToPlayer("For your help, I give you 10 KupoMas points!", 13)
					player:PrintToPlayer("You recieved 10 KupoMas points.", 29)
					player:setCharVar("AliXmas2022", 2)
					player:setCharVar("KupoMasPoints", KMP + 10)
					Player:tradeComplete();
				elseif XMas == 2 then
					player:PrintToPlayer("Oh~hoh~hoh! Kupo! Got another one I see, I'll get that taken care of.", 0, npc:getPacketName())
					player:PrintToPlayer("For your help, I give you 10 KupoMas points!", 13)
					player:PrintToPlayer("You recieved 10 KupoMas points.", 29)
					player:setCharVar("AliXmas2022", 2)
					player:setCharVar("KupoMasPoints", KMP + 10)
					player:tradeComplete();
				end
			else
				player:PrintToPlayer("Ummmmm.... that's not mine", 0, npc:getPacketName())
			end
		end,
		
    })

	utils.unused(Mogger2)		

---------------------------------------

local Moggy2 = zone:insertDynamicEntity({

	objtype = xi.objType.NPC,
    name = "Moggy",
   	look = 2359,
	x = 59.000,
		y = 0.000,
		z = 24.000,
	rotation = 223,
		
		onTrigger = function(player, npc)
			KMP = player:getCharVar("KupoMasPoints")
			local menu =
				{
				title = "What would you like?",
				onStart = function(playerArg)
				end,
				options =
					{
						{
						"100 KMP: Starlight Cake",
						function(playerArg)
							if KMP >=100 then
								player:setCharVar("KupoMasPoints", KMP - 100)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(3634)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"250 KMP: Dream Bell +1",
						function(playerArg)
							if player:hasItem(18864) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=250 then
								player:setCharVar("KupoMasPoints", KMP - 250)
								player:PrintToPlayer("Here you go")
								player:addItem(18864)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"600 KMP: Dream Boots +1",
						function(playerArg)
							if player:hasItem(15753) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=600 then
								player:setCharVar("KupoMasPoints", KMP - 600)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(15753)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"800 KMP: Dream Hat +1",
						function(playerArg)
							if player:hasItem(15179) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=800 then
								player:setCharVar("KupoMasPoints", KMP - 800)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(15179)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"1000 KMP: Dream Robe +1",
						function(playerArg)
							if player:hasItem(14520) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=1000 then
								player:setCharVar("KupoMasPoints", KMP - 1000)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(14520)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"None",
						function(playerArg)
						end,
						},
					},
				}
				player:customMenu(menu)
		end,

    })

	utils.unused(Moggy2)		

---------------------------------------
		
end)

---------------------------------------
---------------------------------------

m:addOverride("xi.zones.Port_Windurst.Zone.onInitialize", function(zone)

    super(zone)
	
	local Mogger3 = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Mogger",
        look = 2360,
		x = 216.000,
		y = -12.000,
		z = 228.000,
		rotation = 88.75,
		
		onTrigger = function(player, npc)
			XMas = player:getCharVar("AliXmas2022")
			KMP = player:getCharVar("KupoMasPoints")
			if XMas == 1 then
				player:PrintToPlayer("The thief was last seen in Xarcabard, around (G-8).", 0, npc:getPacketName())
			elseif XMas == 2 then
				player:PrintToPlayer("Well, there are many more presents that thief has stolen...", 0, npc:getPacketName())
				player:PrintToPlayer("if you do get more, just bring them to me but one at a time so its easier to keep track kupo.", 13)
				player:PrintToPlayer(string.format("Your KupoMas Points total sits at: %u", player:getCharVar("KupoMasPoints")), 13)
			else
				player:PrintToPlayer("Oh!!! Kupo!!! Thank Altana, great and terrible things have happened!", 0, npc:getPacketName())
				player:PrintToPlayer("Something called the Krampus has come and taken all the gifts from under the trees!", 13)
				player:PrintToPlayer("Like some sort of grinch, scrouge, witch!", 13)
				player:timer(2000, function(player)
					player:PrintToPlayer("Now as a recipient of the M.H.M.U. benefits I now deputize you to get that sneaky thief, kupo!", 0, npc:getPacketName())
					player:PrintToPlayer("NO OBJECTIONS! Besides... you do so well have bringing low the vile creatures,", 13)
					player:PrintToPlayer("so this should be a piece of cake for you.", 13)
				end)
				player:timer(5000, function(player)
					player:PrintToPlayer("Now somewhere in the cold reaches of Xarcabard is where you'll need to go.", 0, npc:getPacketName())
					player:PrintToPlayer("You'll need something to draw him out...", 13)
					player:PrintToPlayer("Kupo! Kupo! Kupo! Ginger cookies, you'll need 6 at least I think.", 13)
				end)
				player:timer(5000, function(player)
					player:PrintToPlayer("Now off you get kupo!", 0, npc:getPacketName())
					player:setCharVar("AliXmas2022", 1)
					
				end)
			
			end
		end,

		onTrade = function(player, npc, trade)
			XMas = player:getCharVar("AliXmas2022")
			KMP = player:getCharVar("KupoMasPoints")
			if (trade:hasItemQty(1745, 1)) then
				if XMas == 0 then
					player:PrintToPlayer("Kupo? Oh that's not mine, thank you kupo.", 0, npc:getPacketName())
				elseif XMas == 1 then
					player:PrintToPlayer("Kup~ooo! How wonderful! We'll have the M.H.M.U. get this back to where it belongs.", 0, npc:getPacketName())
					player:PrintToPlayer("For your help, I give you 10 KupoMas points!", 13)
					player:PrintToPlayer("You recieved 10 KupoMas points.", 29)
					player:setCharVar("AliXmas2022", 2)
					player:setCharVar("KupoMasPoints", KMP + 10)
					Player:tradeComplete();
				elseif XMas == 2 then
					player:PrintToPlayer("Oh~hoh~hoh! Kupo! Got another one I see, I'll get that taken care of.", 0, npc:getPacketName())
					player:PrintToPlayer("For your help, I give you 10 KupoMas points!", 13)
					player:PrintToPlayer("You recieved 10 KupoMas points.", 29)
					player:setCharVar("AliXmas2022", 2)
					player:setCharVar("KupoMasPoints", KMP + 10)
					player:tradeComplete();
				end
			else
				player:PrintToPlayer("Ummmmm.... that's not mine", 0, npc:getPacketName())
			end
		end,
		
    })

	utils.unused(Mogger3)		

---------------------------------------

local Moggy3 = zone:insertDynamicEntity({

	objtype = xi.objType.NPC,
    name = "Moggy",
   	look = 2359,
	x = 211.000,
	y = -12.000,
	z = 228.000,
	rotation = 88.75,
		
		onTrigger = function(player, npc)
			KMP = player:getCharVar("KupoMasPoints")
			local menu =
				{
				title = "What would you like?",
				onStart = function(playerArg)
				end,
				options =
					{
						{
						"100 KMP: Starlight Cake",
						function(playerArg)
							if KMP >=100 then
								player:setCharVar("KupoMasPoints", KMP - 100)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(3634)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"250 KMP: Dream Bell +1",
						function(playerArg)
							if player:hasItem(18864) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=250 then
								player:setCharVar("KupoMasPoints", KMP - 250)
								player:PrintToPlayer("Here you go")
								player:addItem(18864)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"600 KMP: Dream Boots +1",
						function(playerArg)
							if player:hasItem(15753) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=600 then
								player:setCharVar("KupoMasPoints", KMP - 600)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(15753)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"800 KMP: Dream Hat +1",
						function(playerArg)
							if player:hasItem(15179) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=800 then
								player:setCharVar("KupoMasPoints", KMP - 800)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(15179)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"1000 KMP: Dream Robe +1",
						function(playerArg)
							if player:hasItem(14520) then
								player:PrintToPlayer("You have that already", 0, npc:getPacketName())
							elseif KMP >=1000 then
								player:setCharVar("KupoMasPoints", KMP - 1000)
								player:PrintToPlayer("Here you go", 0, npc:getPacketName())
								player:addItem(14520)
							else
								player:PrintToPlayer("You need more KupoMas Points...", 0, npc:getPacketName())
							end
						end,
						},
						{
						"None",
						function(playerArg)
						end,
						},
					},
				}
				player:customMenu(menu)
		end,

    })

	utils.unused(Moggy3)		

---------------------------------------
		
end)

---------------------------------------
---------------------------------------
m:addOverride("xi.zones.Xarcabard.Zone.onInitialize", function(zone)

    super(zone)
	
	if GetServerVariable("KrampusUp") == 1 then
	    SetServerVariable("KrampusUp", 0)
	end
	
	local Lair = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "???",
        look = 2339,
		x = 31.000,
		y = -23.000,
		z = -61.000,
        rotation = 0,
		
		onTrigger = function(player, npc)
			player:PrintToPlayer("Sparkles, and ribbon everywhere, along with cookie crumbs...", 13)
		end,
		
		onTrade = function(player, npc, trade)
			XMas = player:getCharVar("AliXmas2022")
			if (trade:hasItemQty(4394, 6)) and
				XMas >= 1
			then
				if GetServerVariable("KrampusUp") == 0 then
					
					KrampusILevel = player:getAverageItemLevel()
					KrampusLevel = player:getMainLvl()
					
					if KrampusILevel >= 100 then
						KrampusLevel = KrampusILevel
					end
					
					SetServerVariable("KrampusUp", 1)
					player:tradeComplete()
					player:PrintToPlayer("The Krampus approaches!!!", 13)
					
					local mob = zone:insertDynamicEntity({
					objtype = xi.objType.MOB,
					name = "Krampus",
					look = 3634,
					x = 33.000,
					y = -23.000,
					z = -61.000,
					rotation = 100,
					widescan = 1,
			
					groupId = 65,
					groupZoneId = 135,
					
					onMobSpawn = function(mob)
						SetServerVariable("Blah", 0)
					end,
					
					onMobEngaged = function(mob, target)
						player:PrintToPlayer("Krampus: These presents are mine!", 13)
					end,
					
					onMobFight = function(mob, target)
						lifeRem = mob:getHPP()
						if lifeRem < 70 and getServerVariable("Blah") == 0 then
							player:PrintToPlayer("Krampus: Why won't you people just let me have my fun??!!", 13)
							SetServerVariable("Blah", 1)
						elseif lifeRem < 45 and getServerVariable("Blah") == 1 then
							player:PrintToPlayer("Krampus: These are mine I said!!", 13)
							SetServerVariable("Blah", 2)
						elseif lifeRem < 5 and getServerVariable("Blah") == 2 then
							player:PrintToPlayer("Krampus: Noo! All I wanted was a pony!", 13)
							SetServerVariable("Blah", 3)
						end					
					end,
				
					onMobDeath = function(mob, player, isKiller, noKiller)
						player:addItem(1745)
						player:PrintToPlayer("You found a package... take it to Mogger quickly!", 13)
						SetServerVariable("KrampusUp", 0)
					end,
					
					})
					
					mob:setSpawn(33, -23, -61)
					mob:setMobLevel(KrampusLevel)
					mob:updateEnmity(player)
					mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
					mob:setDropID(0)
					mob:spawn()	
					
					utils.unused(Krampus)
				
				elseif GetServerVariable("KrampusUp") == 1 then
					player:PrintToPlayer("Seems this was recently used, maybe wait a bit more", 13)
				end
			end
		end,

    })

	utils.unused(TheLair)		

end)

return m
