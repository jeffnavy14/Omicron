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
					if not player:hasKeyItem(xi.ki.AGLAOPHOTIS_BUD) then
						player:addKeyItem(xi.ki.AGLAOPHOTIS_BUD)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.AGLAOPHOTIS_BUD)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.AGLAOPHOTIS_BUD)
					end
				end,
			},
			{
				"Angrboda's Necklace",
				function(playerArg) -- Angrboda KI 2901
					if not player:hasKeyItem(xi.ki.ANGRBODAS_NECKLACE) then
						player:addKeyItem(xi.ki.ANGRBODAS_NECKLACE)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.ANGRBODAS_NECKLACE)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.ANGRBODAS_NECKLACE)
					end
				end,
			},
			{
				"Cunnast's Talon",
				function(playerArg) -- Cunnast KI 2902
					if not player:hasKeyItem(xi.ki.CUNNASTS_TALON) then
						player:addKeyItem(xi.ki.CUNNASTS_TALON)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.CUNNASTS_TALON)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.CUNNASTS_TALON)
					end
				end,
			},
			{
				"Ferrodon's Scale",
				function(playerArg) -- Ferrodon KI 2904
					if not player:hasKeyItem(xi.ki.FERRODONS_SCALE) then
						player:addKeyItem(xi.ki.FERRODONS_SCALE)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.FERRODONS_SCALE)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.FERRODONS_SCALE)
					end
				end,
			},
			{
				"Gestalt's Retina",
				function(playerArg) -- Gestalt KI 2900
					if not player:hasKeyItem(xi.ki.GESTALTS_RETINA) then	
						player:addKeyItem(xi.ki.GESTALTS_RETINA)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.GESTALTS_RETINA)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.GESTALTS_RETINA)
					end
				end,
			},
			{
				"Gulltop's Shell",
				function(playerArg) -- Gulltop KI 2905
					if not player:hasKeyItem(xi.ki.GULLTOPS_SHELL) then	
						player:addKeyItem(xi.ki.GULLTOPS_SHELL)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.GULLTOPS_SHELL)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.GULLTOPS_SHELL)
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
				"Lydia's Vine",
				function(playerArg) -- Lustful Lydia KI 2896
					if not player:hasKeyItem(xi.ki.LYDIAS_VINE) then
						player:addKeyItem(xi.ki.LYDIAS_VINE)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.LYDIAS_VINE)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.LYDIAS_VINE)
					end
				end,
			},
			{
				"Revetaur;s Horn",
				function(playerArg) -- Revetaur KI 2903
					if not player:hasKeyItem(xi.ki.REVETAURS_HORN) then	
						player:addKeyItem(xi.ki.REVETAURS_HORN)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.REVETAURS_HORN)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.REVETAURS_HORN)
					end
				end,
			},
			{
				"Tangata's Wing",
				function(playerArg) -- Tangata Manu KI 2898
					if not player:hasKeyItem(xi.ki.TANGATAS_WING) then
						player:addKeyItem(xi.ki.TANGATAS_WING)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TANGATAS_WING)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.TANGATAS_WING)
					end
				end,
			},
			{
				"Vidala's Claw",
				function(playerArg) -- Vidala KI 2899
					if not player:hasKeyItem(xi.ki.VIDALAS_CLAW) then
						player:addKeyItem(xi.ki.VIDALAS_CLAW)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.VIDALAS_CLAW)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED), xi.ki.VIDALAS_CLAW)
					end
				end,
			},
			{
				"Vyala's Prey",
				function(playerArg) -- Vyala KI 2906
					if not player:hasKeyItem(xi.ki.VYALAS_PREY) then
						player:addKeyItem(xi.ki.VYALAS_PREY)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.VYALAS_PREY)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.VYALAS_PREY)
					end
				end,
			},
			{
				"Wepwaet's Tooth",
				function(playerArg) -- Wepwaet KI 2895
					if not player:hasKeyItem(xi.ki.WEPWAWETS_TOOTH) then
						player:addKeyItem(xi.ki.WEPWAWETS_TOOTH)
						player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.WEPWAWETS_TOOTH)
						player:tradeComplete()
					else
						player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.WEPWAWETS_TOOTH)
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
						if not player:hasKeyItem(xi.ki.BRITTLISS_RING) then
							player:addKeyItem(xi.ki.BRITTLISS_RING)
							player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.BRITTLISS_RING)
							player:tradeComplete()
						else
							player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.BRITTLISS_RING)
						end
					end,
				},
				{
					"Sandy's Lasher",
					function(playerArg) -- Sensual Sandy KI 2912
						if not player:hasKeyItem(xi.ki.SANDYS_LASHER) then
							player:addKeyItem(xi.ki.SANDYS_LASHER)
							player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.SANDYS_LASHER)
							player:tradeComplete()
						else
							player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.SANDYS_LASHER)
						end
					end,
				},
				{
					"Umdhlebi's Flower",
					
					function(playerArg) -- Umdhlebi KI 2916
						if not player:hasKeyItem(xi.ki.UMDHLEBIS_FLOWER) then
							player:addKeyItem(xi.ki.UMDHLEBIS_FLOWER)
							player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.UMDHLEBIS_FLOWER)
							player:tradeComplete()
						else
							player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.UMDHLEBIS_FLOWER)
						end
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
						if not player:hasKeyItem(xi.ki.IONOSS_WEBBING) then
							player:addKeyItem(xi.ki.IONOSS_WEBBING)
							player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.IONOSS_WEBBING)
							player:tradeComplete()
						else
							player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.IONOSS_WEBBING)
						end
					end,
				},
				{
					"Kamohoalii's Fin",
					
					function(playerArg) -- Kamohoalii KI 2915
						if not player:hasKeyItem(xi.ki.KAMOHOALIIS_FIN) then
							player:addKeyItem(xi.ki.KAMOHOALIIS_FIN)
							player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.KAMOHOALIIS_FIN)
							player:tradeComplete()
						else
							player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.KAMOHOALIIS_FIN)
						end
					end,
				},
				{
					"Nosoi's Feather",
					
					function(playerArg) -- Nosoi KI 2913
						if not player:hasKeyItem(xi.ki.NOSOIS_FEATHER) then
							player:addKeyItem(xi.ki.NOSOIS_FEATHER)
							player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.NOSOIS_FEATHER)
							player:tradeComplete()
						else
							player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.NOSOIS_FEATHER)
						end
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
		if not player:hasKeyItem(xi.ki.FLEETSTALKERS_CLAW) then
			player:addKeyItem(xi.ki.FLEETSTALKERS_CLAW)
			player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.FLEETSTALKERS_CLAW)
			player:tradeComplete()
		else
			player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.FLEETSTALKERS_CLAW)
		end
	elseif (trade:hasItemQty(4060, 5)) then -- Beitetsu x5 -- SHOCKMAWS_BLUBBER 2918
		if not player:hasKeyItem(xi.ki.SHOCKMAWS_BLUBBER) then
			player:addKeyItem(xi.ki.SHOCKMAWS_BLUBBER)
			player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.SHOCKMAWS_BLUBBER)
			player:tradeComplete()
		else
			player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.SHOCKMAWS_BLUBBER)
		end
	elseif (trade:hasItemQty(4059, 5)) then -- Pluton x5 -- URMAHLULLUS_ARMOR KI 2919
		if not player:hasKeyItem(xi.ki.URMAHLULLUS_ARMOR) then
			player:addKeyItem(xi.ki.URMAHLULLUS_ARMOR)
			player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.URMAHLULLUS_ARMOR)
			player:tradeComplete()
		else
			player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.URMAHLULLUS_ARMOR)
		end
	elseif (trade:hasItemQty(9078, 1)) and (trade:hasItemQty(9076, 1)) then -- Ashweed and Gravewood Log -- COVENS_DUST KI 2908
		if not player:hasKeyItem(xi.ki.COVENS_DUST) then
			player:addKeyItem(xi.ki.COVENS_DUST)
			player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.COVENS_DUST)
			player:tradeComplete()
		else
			player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.COVENS_DUST)
		end
	elseif (trade:hasItemQty(9076, 1)) and (trade:hasItemQty(9077, 1)) then -- Gravewood log and Duskcrawler -- BLAZEWINGS_PINCER KI 2907
		if not player:hasKeyItem(xi.ki.BLAZEWINGS_PINCER) then
			player:addKeyItem(xi.ki.BLAZEWINGS_PINCER)
			player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.BLAZEWINGS_PINCER)
			player:tradeComplete()
		else
			player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.BLAZEWINGS_PINCER)
		end
	elseif (trade:hasItemQty(9078, 1)) and (trade:hasItemQty(9077, 1)) then -- Ashweed and Duskcrawler -- PAZUZUS_BLADE_HILT KI 2909
		if not player:hasKeyItem(xi.ki.PAZUZUS_BLADE_HILT) then
			player:addKeyItem(xi.ki.PAZUZUS_BLADE_HILT)
			player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.PAZUZUS_BLADE_HILT)
			player:tradeComplete()
		else
			player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.PAZUZUS_BLADE_HILT)
		end
	elseif (trade:hasItemQty(9078, 1)) and (trade:hasItemQty(9076, 1)) and (trade:hasItemQty(9077, 1)) then -- Ashweed, Gravewood log and Duskcrawler -- WRATHARES_CARROT 2910
		if not player:hasKeyItem(xi.ki.WRATHARES_CARROT) then
			player:addKeyItem(xi.ki.WRATHARES_CARROT)
			player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.WRATHARES_CARROT)
			player:tradeComplete()
		else
			player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.ki.WRATHARES_CARROT)
		end
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
