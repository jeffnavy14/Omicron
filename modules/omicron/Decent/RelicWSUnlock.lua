-----------------------------------
-- A unique Relic Weapon Obtainment Quest (zone 44)
-----------------------------------
require('scripts/globals/weaponskillids')
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
-----------------------------------
local m = Module:new("Virgil")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)
	
	local Zalsuhm = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Virgil",
        look = "0x01000204A510A520AB30A540AB50776100700000",
        x = 624.596,
        y = 0.161,
        z = 23.322,
        rotation = 32,
		
		onTrigger = function(player, npc)
			Virgil = player:getCharVar("[Virgil]Unlock")
			-- 1 waiting for mats
			-- 2 has mats, on wait to start getting the ws's
			-- 3 ready for ws trades with weapon equiped
			
			if Virgil == 1 then
				player:PrintToPlayer("Samples from each of the mighty beast trapped on this island, and bring the samples all at once please.", 0, npc:getPacketName())
			elseif Virgil == 2 and os.time() < player:getCharVar("[Virgil]time") then
				player:PrintToPlayer("Still working on it...", 0, npc:getPacketName())
			elseif Virgil == 2 and os.time() > player:getCharVar("[Virgil]time") then
				player:PrintToPlayer("Sorry for the wait, now I need you to bring me 5 Colorless souls, which are crystalized. While holding a relic weapon", 0, npc:getPacketName())
				player:PrintToPlayer("With those I can bestow to you the weapon's imbued skill.", 0, npc:getPacketName())
				player:setCharVar("[Virgil]Unlock", 3)
			elseif Virgil == 3 then
				player:PrintToPlayer("So I'm looking for 5 Colorless souls, which are crystalized. While holding a relic weapon", 0, npc:getPacketName())
				player:PrintToPlayer("With those I can bestow to you the weapon's imbued skill.", 0, npc:getPacketName())
			else
				player:PrintToPlayer("They thought I was a thief, tried to run me out of town, now there is... Oh! Wow! I thought adventurers were all slain by the Vorageans... hmmm" ,0, npc:getPacketName())
				player:timer(2000, function(player)
					player:PrintToPlayer("You know, I've done some work with the alchemist and smith out in the East,", 0, npc:getPacketName())
                end)
                player:timer(4000, function(player)
                    player:PrintToPlayer("I sense you my be able to unlock some of the power latent in my works... yes...", 13)
                end)
                
				local menu =
					{
					title = "Will you assist?",
					onStart = function(playerArg)
					end,
					options =
						{
							{
							"I've dealt with crazier",
							function(playerArg)
							player:PrintToPlayer("Zalsuhm: Perfect, I will need samples from each of the mighty beast trapped on this island", xi.msg.channel.NS_SAY)
							player:PrintToPlayer("The kind powerful enough for reforging, and all at once please, easier tracking that way.", xi.msg.channel.NS_SAY)
							player:setCharVar("[Virgil]Unlock", 1)
							end,
							},
							{
							"Back away slowly",
							function(playerArg)
							player:PrintToPlayer("Zalsuhm: Another time then perhaps... farewell...", xi.msg.channel.NS_SAY)
							end,
							},
						},
					}
					player:timer(8000, function(player)
						player:customMenu(menu)	
					end)
			
			end
		end,
		
		onTrade = function(player, npc, trade)
			Virgil = player:getCharVar("[Virgil]Unlock")
			if Virgil == 1 and (trade:hasItemQty(3977, 1)) and (trade:hasItemQty(4014, 1)) and (trade:hasItemQty(3980, 1)) and (trade:hasItemQty(4012, 1)) and (trade:hasItemQty(3979, 1)) and (trade:hasItemQty(8752, 1)) then
				player:PrintToPlayer("Virgil: Alright, I'll get to work on this right away...", 13);
				player:PrintToPlayer("Tomorrow I should be ready for the rituals", 13);
				player:setCharVar("[Virgil]time", getVanaMidnight());
				player:setCharVar("[Virgil]Unlock", 2);
				player:tradeComplete();
			elseif (trade:hasItemQty(3294, 5)) and 
				Virgil == 3
			then
				if
					player:getEquipID(xi.slot.MAIN) == 20509 and
					player:getCharVar("SpharaiLock") ~= 1
				then
					player:tradeComplete();
					player:addLearnedWeaponskill(50)
					player:PrintToPlayer("You learned the weapon skill 'Final Heaven'", 29);
					player:setCharVar("SpharaiLock", 1);
					
				elseif
					player:getEquipID(xi.slot.MAIN) == 20583 and
					player:getCharVar("MandauLock") ~= 1 
				then
					player:tradeComplete();
					player:addLearnedWeaponskill(51)
					player:PrintToPlayer("You learned the weapon skill 'Mercy Stroke'", 29);
					player:setCharVar("MandauLock", 1);
				
				elseif
					player:getEquipID(xi.slot.MAIN) == 20685 and
					player:getCharVar("ExcaliburLock") ~= 1 
				then
					player:tradeComplete();
					player:addLearnedWeaponskill(52)
					player:PrintToPlayer("You learned the weapon skill 'Knights of Round'", 29);
					player:setCharVar("ExcaliburLock", 1);
					
				elseif
					player:getEquipID(xi.slot.MAIN) == 21683 and
					player:getCharVar("RagnorokLock") ~= 1
				then
					player:tradeComplete();
					player:addLearnedWeaponskill(53)
					player:PrintToPlayer("You learned the weapon skill 'Scourge'", 29);
					player:setCharVar("RagnorokLock", 1);

				elseif 
					player:getEquipID(xi.slot.MAIN) == 21750 and
					player:getCharVar("GuttlerLock") ~= 1 
				then
					player:tradeComplete();
					player:addLearnedWeaponskill(54)
					player:PrintToPlayer("You learned the weapon skill 'Onslaught'", 29);
					player:setCharVar("GuttlerLock", 1);
				
				elseif
					player:getEquipID(xi.slot.MAIN) == 21756 and 
					player:getCharVar("BravuraLock") ~= 1
				then
					player:tradeComplete();
					player:addLearnedWeaponskill(55)
					player:PrintToPlayer("You learned the weapon skill 'Metatron Torment'", 29);
					player:setCharVar("BravuraLock", 1);
				
				elseif
					player:getEquipID(xi.slot.MAIN) == 21808 and 
					player:getCharVar("ApocalypseLock") ~= 1 
				then
					player:tradeComplete();
					player:addLearnedWeaponskill(56)
					player:PrintToPlayer("You learned the weapon skill 'Catastrophe'", 29);
					player:setCharVar("ApocalypseLock", 1);
				
				
				elseif
					player:getEquipID(xi.slot.MAIN) == 21857 and
					player:getCharVar("GungnirLock") ~= 1 
				then
					player:tradeComplete();
					player:addLearnedWeaponskill(57)
					player:PrintToPlayer("You learned the weapon skill 'Geirskogul'", 29);
					player:setCharVar("GungnirLock", 1);
				
				elseif
					player:getEquipID(xi.slot.MAIN) == 21906 and 
					player:getCharVar("KikokuLock") ~= 1 
				then
					player:tradeComplete();
					player:addLearnedWeaponskill(58)
					player:PrintToPlayer("You learned the weapon skill 'Blade: Metsu'", 29);
					player:setCharVar("KikokuLock", 1);
				
				elseif 
					player:getEquipID(xi.slot.MAIN) == 21954 and 
					player:getCharVar("AmanomurakumoLock") ~= 1 
				then
					player:tradeComplete();
					player:addLearnedWeaponskill(59)
					player:PrintToPlayer("You learned the weapon skill 'Tachi: Kaiten'", 29);
					player:setCharVar("AmanomurakumoLock", 1);
				
				elseif 
					player:getEquipID(xi.slot.MAIN) == 21077 and 
					player:getCharVar("MjollnirLock") ~= 1
				then
					player:tradeComplete()
					player:addLearnedWeaponskill(60)
					player:PrintToPlayer("You learned the weapon skill 'Randgrith'", 29)
					player:setCharVar("MjollnirLock", 1)
				
				elseif 
					player:getEquipID(xi.slot.MAIN) == 22060 and 
					player:getCharVar("ClaustrumLock") ~= 1 
				then
					player:tradeComplete();
					player:addLearnedWeaponskill(61)
					player:PrintToPlayer("You learned the weapon skill 'Gate of Tartarus'", 29);
					player:setCharVar("ClaustrumLock", 1);
				
				elseif player:getCharVar("YoichinoyumiLock") ~=1 then
					if player:getEquipID(xi.slot.RANGE) == 22115 then
						player:tradeComplete();
						player:addLearnedWeaponskill(62)
						player:PrintToPlayer("You learned the weapon skill 'Namas Arrow'", 29);
						player:setCharVar("YoichinoyumiLock", 1);
					elseif player:getEquipID(xi.slot.RANGE) == 22129 then
						player:tradeComplete();
						player:addLearnedWeaponskill(62)
						player:PrintToPlayer("You learned the weapon skill 'Namas Arrow'", 29);
						player:setCharVar("YoichinoyumiLock", 1);
					end
				
				elseif player:getCharVar("AnnihilatorLock") ~=1 then
					if player:getEquipID(xi.slot.RANGE) == 21267 then
						player:tradeComplete();
						player:addLearnedWeaponskill(63)
						player:PrintToPlayer("You learned the weapon skill 'Coronach'", 29);
						player:setCharVar("AnnihilatorLock", 1);
					elseif player:getEquipID(xi.slot.RANGE) == 22140 then
						player:tradeComplete();
						player:addLearnedWeaponskill(63)
						player:PrintToPlayer("You learned the weapon skill 'Coronach'", 29);
						player:setCharVar("AnnihilatorLock", 1);
					end
				
				else
					player:PrintToPlayer("I need you to have a fully realized Relic Weapon equipe to work my magic...", 0 , npc:getPacketName())
				end
			else
				player:PrintToPlayer("That's not what I'm looking for sorry.", 0, npc:getPacketName())
			end
		
		end
		
			
})

utils.unused(Virgil)

end)

return m
