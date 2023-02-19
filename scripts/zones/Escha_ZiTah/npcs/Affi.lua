-----------------------------------
-- Area: Escha - Zi'Tah Island (288)
--  NPC: Affi
-- !pos --355.5378 0.1542 -170.2213 288
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
	if 
		(trade:hasItemQty(654, 2)) or -- Darksteel Ingot x2
		(trade:hasItemQty(717, 3)) or -- Mahogany Lumber x3
		(trade:hasItemQty(829, 2)) or -- Silk cloth x2
		(trade:hasItemQty(1629, 2)) or -- Buffalo Leather x2
		(trade:hasItemQty(745, 2)) or -- Gold Ingot x2
		(trade:hasItemQty(13091, 1)) or -- Carapace Gorget
		(trade:hasItemQty(16564, 1)) or -- Flame Blade
		(trade:hasItemQty(16581, 1)) or -- Holy Sword
		(trade:hasItemQty(4398, 6)) -- Fish Mithkabob x6
	then
		player:PrintToPlayer("Which grissly trinket you want eh?", xi.msg.channel.NS_SAY)
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
			title = "Plenty to go around.",
			options = {},
		}

		page1 =
		{
			{
				"Not now",
				function(playerArg)
				end,
			},
			{
				"Aglaophotis' Bud", -- Aglaophotis KI 2897
				function(playerArg)
					player:addKeyItem(xi.ki.AGLAOPHOTIS_BUD)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.AGLAOPHOTIS_BUD)
					player:tradeComplete()
				end,
			},
			{
				"Angrboda's Necklace",
				function(playerArg) -- Angrboda KI 2901
					player:addKeyItem(xi.ki.ANGRBODAS_NECKLACE)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.ANGRBODAS_NECKLACE)
					player:tradeComplete()
				end,
			},
			{
				"Cunnast's Talon",
				function(playerArg) -- Cunnast KI 2902
					player:addKeyItem(xi.ki.CUNNASTS_TALON)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.CUNNASTS_TALON)
					player:tradeComplete()
				end,
			},
			{
				"Ferrodon's Scale",
				function(playerArg) -- Ferrodon KI 2904
					player:addKeyItem(xi.ki.FERRODONS_SCALE)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.FERRODONS_SCALE)
					player:tradeComplete()
				end,
			},
			{
				"Gestalt's Retina",
				function(playerArg) -- Gestalt KI 2900
					player:addKeyItem(xi.ki.GESTALTS_RETINA)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.GESTALTS_RETINA)
					player:tradeComplete()
				end,
			},
			{
				"Gulltop's Shell",
				function(playerArg) -- Gulltop KI 2905
					player:addKeyItem(xi.ki.GULLTOPS_SHELL)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.GULLTOPS_SHELL)
					player:tradeComplete()
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
				"Lydia's Vine",
				function(playerArg) -- Lustful Lydia KI 2896
					player:addKeyItem(xi.ki.LYDIAS_VINE)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.LYDIAS_VINE)
					player:tradeComplete()
				end,
			},
			{
				"Revetaur;s Horn",
				function(playerArg) -- Revetaur KI 2903
					player:addKeyItem(xi.ki.REVETAURS_HORN)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.REVETAURS_HORN)
					player:tradeComplete()
				end,
			},
			{
				"Tangata's Wing",
				function(playerArg) -- Tangata Manu KI 2898
					player:addKeyItem(xi.ki.TANGATAS_WING)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TANGATAS_WING)
					player:tradeComplete()
				end,
			},
			{
				"Vidala's Claw",
				function(playerArg) -- Vidala KI 2899
					player:addKeyItem(xi.ki.VIDALAS_CLAW)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.VIDALAS_CLAW)
					player:tradeComplete()
				end,
			},
			{
				"Vyala's Prey",
				function(playerArg) -- Vyala KI 2906
					player:addKeyItem(xi.ki.VYALAS_PREY)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.VYALAS_PREY)
					player:tradeComplete()
				end,
			},
			{
				"Wepwaet's Tooth",
				function(playerArg) -- Wepwaet KI 2895
					player:addKeyItem(xi.ki.WEPWAWETS_TOOTH)
					player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.WEPWAWETS_TOOTH)
					player:tradeComplete()
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
	end
	
	if (trade:hasItemQty(9060, 5)) then-- Ethereal Insence x5
		local menu2 =
		{
			title = "Plenty to go around.",
			onStart = function(playerArg)
			
				playerArg:PrintToPlayer("Which grissly trinket you want eh?", xi.msg.channel.NS_SAY)
			end,
			options =
			{
				{
					"Brittlis' Ring",
					function(playerArg) -- Brittlis KI 2914
						player:addKeyItem(xi.ki.BRITTLISS_RING)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.BRITTLISS_RING)
						player:tradeComplete()
					end,
				},
				{
					"Sandy's Lasher",
					function(playerArg) -- Sensual Sandy KI 2912
						player:addKeyItem(xi.ki.SANDYS_LASHER)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.SANDYS_LASHER)
						player:tradeComplete()
					end,
				},
				{
					"Umdhlebi's Flower",
					function(playerArg) -- Umdhlebi KI 2916
						player:addKeyItem(xi.ki.UMDHLEBIS_FLOWER)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.UMDHLEBIS_FLOWER)
						player:tradeComplete()
					end,
				},
				
				{
					"None",
					function(playerArg)
					end,
				},

			},
			onCancelled = function(playerArg)
			end,
			onEnd = function(playerArg)
			end,
		}
			player:customMenu(menu2)	
	
	end
	
	if (trade:hasItemQty(9057, 5)) then -- Ayapec's Shell x5		
		local menu3 =
		{
			title = "Plenty to go around.",
			onStart = function(playerArg)
			
				playerArg:PrintToPlayer("Which grissly trinket you want eh?", xi.msg.channel.NS_SAY)
			end,
			options =
			{
				{
					"Ionos' Webbing",
					function(playerArg) -- Ionos KI 2911
						player:addKeyItem(xi.ki.IONOSS_WEBBING)
						 player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.IONOSS_WEBBING)
						player:tradeComplete()
					end,
				},
				{
					"Kamohoalii's Fin",
					function(playerArg) -- Kamohoalii KI 2915
						player:addKeyItem(xi.ki.KAMOHOALIIS_FIN)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.KAMOHOALIIS_FIN)
						player:tradeComplete()
					end,
				},
				{
					"Nosoi's Feather",
					function(playerArg) -- Nosoi KI 2913
						player:addKeyItem(xi.ki.NOSOIS_FEATHER)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.NOSOIS_FEATHER)
						player:tradeComplete()
					end,
				},
				
				{
					"None",
					function(playerArg)
					end,
				},

			},
			onCancelled = function(playerArg)
			end,
			onEnd = function(playerArg)
			end,
		}
			player:customMenu(menu3)
		
	end		
	if (trade:hasItemQty(4061, 5)) then -- Riftborn Boulder x5 -- FLEETSTALKERS_CLAW 2917
		player:addKeyItem(xi.ki.FLEETSTALKERS_CLAW)
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.FLEETSTALKERS_CLAW)
		player:tradeComplete()
	elseif (trade:hasItemQty(4060, 5)) then -- Beitetsu x5 -- SHOCKMAWS_BLUBBER 2918
		player:addKeyItem(xi.ki.SHOCKMAWS_BLUBBER)
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.SHOCKMAWS_BLUBBER)
		player:tradeComplete()
	elseif (trade:hasItemQty(4059, 5)) then -- Pluton x5 -- URMAHLULLUS_ARMOR KI 2919
		player:addKeyItem(xi.ki.URMAHLULLUS_ARMOR)
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.URMAHLULLUS_ARMOR)
		player:tradeComplete()
	elseif (trade:hasItemQty(9078, 1)) and (trade:hasItemQty(9076, 1)) then -- Ashweed and Gravewood Log -- COVENS_DUST KI 2908
		player:addKeyItem(xi.ki.COVENS_DUST)
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.COVENS_DUST)
		player:tradeComplete()
	elseif (trade:hasItemQty(9076, 1)) and (trade:hasItemQty(9077, 1)) then -- Gravewood log and Duskcrawler -- BLAZEWINGS_PINCER KI 2907
		player:addKeyItem(xi.ki.BLAZEWINGS_PINCER)
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.BLAZEWINGS_PINCER)
		player:tradeComplete()
	elseif (trade:hasItemQty(9078, 1)) and (trade:hasItemQty(9077, 1)) then -- Ashweed and Duskcrawler -- PAZUZUS_BLADE_HILT KI 2909
		player:addKeyItem(xi.ki.PAZUZUS_BLADE_HILT)
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.PAZUZUS_BLADE_HILT)
		player:tradeComplete()
	elseif (trade:hasItemQty(9078, 1)) and (trade:hasItemQty(9076, 1)) and (trade:hasItemQty(9077, 1)) then -- Ashweed, Gravewood log and Duskcrawler -- WRATHARES_CARROT 2910
		player:addKeyItem(xi.ki.WRATHARES_CARROT)
		player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.WRATHARES_CARROT)
		player:tradeComplete()
	else
		player:PrintToPlayer("What am I suppose to do with that?", npc:getPacketName())
	end

end

entity.onTrigger = function(player, npc)
	
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    
end

return entity
