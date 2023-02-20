-----------------------------------
-- Geas Fete Zitah (zone 288)
-- NPC: ???
-----------------------------------
require("modules/module_utils")
require('scripts/globals/keyitems')
require("scripts/zones/Escha_ZiTah/Zone")
require('scripts/globals/npc_util')
require("scripts/globals/alitems")
require("scripts/globals/zone")
-----------------------------------

local m = Module:new("GFZitah")
m:setEnabled(true)

m:addOverride("xi.zones.Escha_ZiTah.Zone.onInitialize", function(zone)

    super(zone)
---------------------------------------
--Spawner player:delkeyitem(x) to be added to each
---------------------------------------

local Spawner = zone:insertDynamicEntity({

    objtype = xi.objType.NPC,
    name = " ",
    look = '0x0000150400000000000000000000000000000000',
    x = 84,
    y = 0,
    z = -153,
    rotation = 0,
	
onTrigger = function(player, npc)
	player:PrintToPlayer("You sense you could lure something out here...", xi.msg.channel.NS_SAY)
	local gfZitahNPC = npc:getID()
	SetServerVariable("GFZitahNPC", gfZitahNPC)
	local menu  = {}
	local page1 = {}
	local page2 = {}
	local page3 = {}
	local page4 = {}
	local page5 = {}
	
	--menu to show all mobs, choose w/o KI list what KI needed, else confirm then pop
	local delaySendMenu = function(player)
		player:timer(50, function(playerArg)
			playerArg:customMenu(menu)
		end)
	end

	menu =
	{
		title = "Which one will you lure?",
		options = {},
	}

	page1 =
	{
		{
			"Not now",
			function(playerArg)
			end,
		},
		-- T1
		-- Aglaophotis
		{
			"Aglaophotis",
			function(playerArg)
				if player:hasKeyItem(xi.ki.AGLAOPHOTIS_BUD) and -- KI 2897
					not GetMobByID(17957304):isSpawned()
				then
					player:delKeyItem(xi.ki.AGLAOPHOTIS_BUD)
					SpawnMob(17957304):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Aglaophotis Bud from Affi", 13)
				end
			end,
		},
		-- Angrboda
		{
			"Angrboda",
			function(playerArg)
				if player:hasKeyItem(xi.ki.ANGRBODAS_NECKLACE) then -- KI 2901
					player:delKeyItem(xi.ki.ANGRBODAS_NECKLACE)
					SpawnMob(17957316):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need Angrboda's Necklace from Affi", 13)
				end
			end,
		},
		-- Cunnast
		{
			"Cunnast",
			function(playerArg)
				if player:hasKeyItem(xi.ki.CUNNASTS_TALON) then -- KI 2902
					player:delKeyItem(xi.ki.CUNNASTS_TALON)
					SpawnMob(17957319):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Cunnast Talon from Affi", 13)
				end
			end,
		},
		-- Ferrodon
		{
			"Ferrodon", -- <-- RETEST
			function(playerArg)
				if player:hasKeyItem(xi.ki.FERRODONS_SCALE) then -- KI 2904
					player:delKeyItem(xi.ki.FERRODONS_SCALE)
					SpawnMob(17957325):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Ferroden Scale from Affi", 13)
				end
			end,
		},
		-- Gestalt
		{
			"Gestalt",
			function(playerArg)
				if player:hasKeyItem(xi.ki.GESTALTS_RETINA) then -- KI 2900
					player:delKeyItem(xi.ki.GESTALTS_RETINA)
					SpawnMob(17957313):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Gestalt's Retina from Affi", 13)
				end
			end,
		},
		-- Gulltop
		{
			"Gulltop",
			function(playerArg)
				if player:hasKeyItem(xi.ki.GULLTOPS_SHELL) then -- KI 2905
					player:delKeyItem(xi.ki.GULLTOPS_SHELL)
					SpawnMob(17957328):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Gulltop Shell from Affi", 13)
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
		-- Lustful Lydia
		{
			"Lustful Lydia",
			function(playerArg)
				if player:hasKeyItem(xi.ki.LYDIAS_VINE) then -- KI 2896
					player:delKeyItem(xi.ki.LYDIAS_VINE)
					SpawnMob(17957301):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Lydia's Vine from Affi", 13)
				end
			end,
		},
		-- Revetaur
		{
			"Revetaur", -- <-- RETEST
			function(playerArg)
				if player:hasKeyItem(xi.ki.REVETAURS_HORN) then -- KI 2903
					player:delKeyItem(xi.ki.REVETAURS_HORN)
					SpawnMob(17957322):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Revataur's Horn from Affi", 13)
				end
			end,
		},
		-- Tangata Manu
		{
			"Tangata Manu",
			function(playerArg)
				if player:hasKeyItem(xi.ki.TANGATAS_WING) then -- KI 2898
					player:delKeyItem(xi.ki.TANGATAS_WING)
					SpawnMob(17957307):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Tangatas Wing from Affi", 13)
				end
			end,
		},
		-- Vidala
		{
			"Vidala",
			function(playerArg)
				if player:hasKeyItem(xi.ki.VIDALAS_CLAW) then -- KI 2899
					player:delKeyItem(xi.ki.VIDALAS_CLAW)
					SpawnMob(17957310):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Vidala's Claw from Affi", 13)
				end
			end,
		},
		-- Vyala
		{
			"Vyala",
			function(playerArg)
				if player:hasKeyItem(xi.ki.VYALAS_PREY) then -- KI 2906
					player:delKeyItem(xi.ki.VYALAS_PREY)
					SpawnMob(17957331):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need some of Vyala's Prey from Affi", 13)
				end
			end,
		},
		-- Wepwaet
		{
			"Wepwaet",
			function(playerArg)
				if player:hasKeyItem(xi.ki.WEPWAWETS_TOOTH) then -- KI 2895
					player:delKeyItem(xi.ki.WEPWAWETS_TOOTH)
					SpawnMob(17957298):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Wepwaet's Tooth from Affi", 13)
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
		-- Ionos
		{
			"Ionos",
			function(playerArg)
				if player:hasKeyItem(xi.ki.IONOSS_WEBBING) then -- KI 2911
					player:delKeyItem(xi.ki.IONOSS_WEBBING)
					SpawnMob(17957352):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Ionos's Webbing from Affi", 13)
				end
			end,
		},
		-- Sensual Sandy
		{
			"Sensual Sandy",
			function(playerArg)
				if player:hasKeyItem(xi.ki.SANDYS_LASHER) then -- KI 2912
					player:delKeyItem(xi.ki.SANDYS_LASHER)
					SpawnMob(17957355):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Sandy's Lasher from Affi", 13)
				end
			end,
		},
		-- Nosoi
		{
			"Nosoi",
			function(playerArg)
				if player:hasKeyItem(xi.ki.NOSOIS_FEATHER) then -- KI 2913
					player:delKeyItem(xi.ki.NOSOIS_FEATHER)
					SpawnMob(17957358):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Nosois Feather from Affi", 13)
				end
			end,
		},
		-- Brittlis
		{
			"Brittlis",
			function(playerArg)
				if player:hasKeyItem(xi.ki.BRITTLISS_RING) then -- KI 2914
					player:delKeyItem(xi.ki.BRITTLISS_RING)
					SpawnMob(17957361):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Brittlis Ring from Affi", 13)
				end
			end,
		},
		-- Kamohoalii
		{
			"Kamohoalii",
			function(playerArg)
				if player:hasKeyItem(xi.ki.KAMOHOALIIS_FIN) then -- KI 2915
					player:delKeyItem(xi.ki.KAMOHOALIIS_FIN)
					SpawnMob(17957364):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Kamohoalii Fin from Affi", 13)
				end
			end,
		},
		-- Umdhlebi
		{
			"Umdhlebi",
			function(playerArg)
				if player:hasKeyItem(xi.ki.UMDHLEBIS_FLOWER) then -- KI 2916
					player:delKeyItem(xi.ki.UMDHLEBIS_FLOWER)
					SpawnMob(17957367):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Umdhlebi Flower from Affi", 13)
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
		-- T3
		-- Fleetstalker -- FLEETSTALKERS_CLAW 2917
		{
			"Fleetstalker",
			function(playerArg)
				if player:hasKeyItem(xi.ki.FLEETSTALKERS_CLAW) then -- KI 
					player:delKeyItem(xi.ki.FLEETSTALKERS_CLAW)
					SpawnMob(17957370):updateEnmity(player)					
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need some *** from Affi", 13)
				end
			end,
		},
		-- Shockmaw -- SHOCKMAWS_BLUBBER 2918
		{
			"Shockmaw",
			function(playerArg)
				if player:hasKeyItem(xi.ki.SHOCKMAWS_BLUBBER) then -- KI 2918
					player:delKeyItem(xi.ki.SHOCKMAWS_BLUBBER)
					SpawnMob(17957373):updateEnmity(player)					
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need some Shockmaw's Blubber from Affi", 13)
				end
			end,
		},
		-- Urmahlulu -- URMAHLULLUS_ARMOR KI 2919
		{
			"Urmahlulu",
			function(playerArg)
				if player:hasKeyItem(xi.ki.URMAHLULLUS_ARMOR) then -- KI 2919
					player:delKeyItem(xi.ki.URMAHLULLUS_ARMOR)
					SpawnMob(17957376):updateEnmity(player)					
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need some Urmahlulu' Armor from Affi", 13)
				end
			end,
		},
		-- HELM
		-- Alpluachra, Bucca, Puca -- COVENS_DUST KI 2908
		{
			"Alpluachra",
			function(playerArg)
				if player:hasKeyItem(xi.ki.COVENS_DUST) then -- KI 2908
					player:delKeyItem(xi.ki.COVENS_DUST)
					SpawnMob(17957388):updateEnmity(player)
					SpawnMob(17957382):updateEnmity(player)
					SpawnMob(17957385):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need some Coven's Dust from Affi", 13)
				end
			end,
		},
		-- Blazewing -- BLAZEWINGS_PINCER KI 2907
		{
			"Blazewing",
			function(playerArg)
				if player:hasKeyItem(xi.ki.BLAZEWINGS_PINCER) then -- KI 2907
					player:delKeyItem(xi.ki.BLAZEWINGS_PINCER)
					SpawnMob(17957379):updateEnmity(player)					
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Blazewing's Pincer from Affi", 13)
				end
			end,
		},
		-- Pazuzu -- PAZUZUS_BLADE_HILT KI 2909
		{
			"Pazuzu",
			function(playerArg)
				if player:hasKeyItem(xi.ki.PAZUZUS_BLADE_HILT) then -- KI 2909
					player:delKeyItem(xi.ki.PAZUZUS_BLADE_HILT)
					SpawnMob(17957391):updateEnmity(player)					
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need a Pazuzu's Blade Hilt from Affi", 13)
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
	-- Wrathare -- WRATHARES_CARROT 2910
		{
			"Wrathare",
			function(playerArg)
				if player:hasKeyItem(xi.ki.WRATHARES_CARROT) then -- KI 2910
					player:delKeyItem(xi.ki.WRATHARES_CARROT)
					SpawnMob(17957394):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need some a Wrathare's Carrot from Affi", 13)
				end
			end,
		},
	--[[	 The secret domain invasion dragon, might have to use CharVar
		{
			"?????",
			function(playerArg)
				if player:hasKeyItem(xi.ki.) then -- KI 2910
					player:delKeyItem(xi.ki.)
					SpawnMob(17957394):updateEnmity(player)
					GetNPCByID(gfZitahNPC):setStatus(xi.status.INVISIBLE)
				else
					player:PrintToPlayer("You need some a Wrathare's Carrot from Affi", 13)
				end
			end,
		},
		]]
		{
			"<<",
			function(playerArg)
				menu.options = page4
				delaySendMenu(playerArg)
			end,
		},
	}
		menu.options = page1
		delaySendMenu(player)
						
end

})

	utils.unused(Alf)	
	
end)

return m