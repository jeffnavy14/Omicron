-----------------------------------
-- Domain Invasion (Reward NPC)
-- Coded with love by Carver, Xaver, Graves, Demetrie
-- 2022, CatsEyeXI (http://catseyexi.com) / --server server.catseyexi.com
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Port_Bastok/Zone")
-----------------------------------
local m = Module:new("domain_reward_npc")

m:addOverride("xi.zones.Port_Bastok.Zone.onInitialize", function(zone)
    super(zone)
    local domain = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Skirmish Moogle",
        look = 2366,
        x = 87.928,
        y = 7.500,
        z = -192.295,
        rotation = 128,
        widescan = 1,

        onTrigger = function(player, npc)
		local escha = player:getCurrency("escha_beads")
		local menu =
            {
                title = "10000 Escha Beads",
                onStart = function(playerArg)
                    -- NOTE: This could be used to lock the player in place
                    playerArg:PrintToPlayer("Alluvian Skirmish Armor Set", xi.msg.channel.NS_SAY)
		    		player:PrintToPlayer(string.format("You have %s escha beads.", escha), xi.msg.channel.NS_SAY)
                end,
                options =
                {
                    {
                        "Otronif Set",
                        function(playerArg)
                            player:addItem(27729)  --otronif_mask_+1 
                            player:addItem(27875)  --otro-harness-1
                            player:addItem(28019)  --otronif_gloves_+1 
                            player:addItem(28161)  --otronif_brais_+1  
                            player:addItem(28298)  --otronif_boots_+1
		    				player:PrintToPlayer( "Enjoy your Otronif Set!", 0xd )
		    				player:delCurrency("escha_beads", 20000)
                        end,
                    },
                    {
                        "Iuitl Set",
                        function(playerArg)
                            player:addItem(27730)  --iuitl_headgear_+1 
                            player:addItem(27876)  --iuitl_vest_+1     
                            player:addItem(28020)  --iuitl_wristbands_+1
                            player:addItem(28162)  --iuitl_tights_+1   
                            player:addItem(28299)  --iuitl_gaiters_+1
		    				player:PrintToPlayer( "Enjoy your Iuitl Set!", 0xd )
		    				player:delCurrency("escha_beads", 20000)						
                        end,
                    },
                    {
                        "Hagondes Set",
                        function(playerArg)
                            player:addItem(27732)  --hagondes_hat_+1   
                            player:addItem(27878)  --hagondes_coat_+1  
                            player:addItem(28022)  --hagondes_cuffs_+1 
                            player:addItem(28164)  --hagondes_pants_+1
                            player:addItem(28301)  --hag-sabots-1
		    				player:PrintToPlayer("Enjoy your Hagondes Set!", 0xd )
		    				player:delCurrency("escha_beads", 20000)
                        end,
                    },
		    		{
                        "Gendewitha Set",
                        function(playerArg)
                            player:addItem(27731)  --gende._caubeen_+1 
                            player:addItem(27877)  --gende._bilaut_+1  
                            player:addItem(28021)  --gende._gages_+1   
                            player:addItem(28163)  --gende._spats_+1   
                            player:addItem(28300)  --gende._galosh._+1 
		    				player:PrintToPlayer("Enjoy your Gendewitha Set!", 0xd )
		    				player:delCurrency("escha_beads", 20000)
                        end,
                    },
                    {
                        "Cizin Set",
                        function(playerArg)
                            player:addItem(27728)  --cizin_helm_+1     
                            player:addItem(27874)  --cizin_mail_+1     
                            player:addItem(28018)  --cizin_mufflers_+1 
                            player:addItem(28160)  --cizin_breeches_+1 
                            player:addItem(28297)  --cizin_greaves_+1 
		    				player:PrintToPlayer("Enjoy your Cizin Set!", 0xd )
		    				player:delCurrency("escha_beads", 20000)
                        end,
                    },
                },
                onCancelled = function(playerArg)
                end,
                onEnd = function(playerArg)
		    	end,
              }
              player:customMenu(menu)
		  	
	        end,
    })
    utils.unused(domain)
end)

return m
