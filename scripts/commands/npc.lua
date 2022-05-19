-----------------------------------
-- func: !npc
-- desc: Test dynamic entity before its placed into a module for testing.
-- note: Will spawn after you move from your current position
-----------------------------------
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    local zone = player:getZone()
    local npc = zone:insertDynamicEntity({
        -- NPC or MOB
    objtype = xi.objType.NPC,
    name = "Atori-Tutori",
	look = 3106,
    x = player:getXPos(),
    y = player:getYPos(),
    z = player:getZPos(),
    rotation = player:getRotPos(),

        onTrigger = function(player, npc, option)
		local escha = player:getCurrency("escha_beads")
		if (escha >= 10000) then
			 local menu =
        {
            title = "10000 Escha Beads",
            onStart = function(playerArg)
                -- NOTE: This could be used to lock the player in place
                playerArg:PrintToPlayer("Skirmish Armor Set", xi.msg.channel.NS_SAY)
				player:PrintToPlayer(string.format("You have %s escha beads.", escha), xi.msg.channel.NS_SAY)
            end,
            options =
            {
                {
                    "Otronif Set",
                    function(playerArg)
					local stock_1 =
                        {
			            27729, 1,  --otronif_mask_+1 
			            27875, 1,  --otro-harness-1
                        28019, 1,  --otronif_gloves_+1 
                        28161, 1,  --otronif_brais_+1  
                        28298, 1,  --otronif_boots_+1
                        27730, 1,  --iuitl_headgear_+1 
                        27876, 1,  --iuitl_vest_+1     
                        28020, 1,  --iuitl_wristbands_+1
                        28162, 1,  --iuitl_tights_+1   
                        28299, 1,  --iuitl_gaiters_+1
						27732, 1,  --hagondes_hat_+1   
                        27878, 1,  --hagondes_coat_+1  
                        28022, 1,  --hagondes_cuffs_+1 
                        28164, 1,  --hagondes_pants_+1
                        28301, 1,  --hag-sabots-1
						27731, 1,  --gende._caubeen_+1 
                        27877, 1,  --gende._bilaut_+1  
                        28021, 1,  --gende._gages_+1   
                        28163, 1,  --gende._spats_+1   
                        28300, 1,  --gende._galosh._+1 
						27728, 1,  --cizin_helm_+1     
                        27874, 1,  --cizin_mail_+1     
                        28018, 1,  --cizin_mufflers_+1 
                        28160, 1,  --cizin_breeches_+1 
                        28297, 1   --cizin_greaves_+1 
                        };
                        xi.shop.general(player, stock_1);
                        player:PrintToPlayer( "Merchant Moogle : Welcome to Crystal Depot Kupo!", 0x1F);
                    end,
                },
                {
                    "Iuitl Set",
                    function(playerArg)
						
                    end,
                },
                {
                    "Hagondes Set",
                    function(playerArg)

                    end,
                },
				{
                    "Gendewitha Set",
                    function(playerArg)

                    end,
                },
                {
                    "Cizin Set",
                    function(playerArg)

                    end,
                },
                {
                    "Option 6",
                    function(playerArg)
                        playerArg:PrintToPlayer("Option 3 Selected", xi.msg.channel.NS_SAY)
                        playerArg:independentAnimation(playerArg, 250, 4) -- Lightbulb
                    end,
                },
				                {
                    "Option 7",
                    function(playerArg)
                        playerArg:PrintToPlayer("Option 1 Selected", xi.msg.channel.NS_SAY)
                        playerArg:independentAnimation(playerArg, 251, 4) -- Hearts
                    end,
                },
                {
                    "Option 8",
                    function(playerArg)
                        playerArg:PrintToPlayer("Option 2 Selected", xi.msg.channel.NS_SAY)
                        playerArg:independentAnimation(playerArg, 252, 4) -- Music Notes
                    end,
                },
                {
                    "Option 9",
                    function(playerArg)
                        playerArg:PrintToPlayer("Option 3 Selected", xi.msg.channel.NS_SAY)
                        playerArg:independentAnimation(playerArg, 250, 4) -- Lightbulb
                    end,
                },
            },
            onCancelled = function(playerArg)
            end,
            onEnd = function(playerArg)
			
              end,
          }
          player:customMenu(menu)
		  	elseif (escha <= 10000) then
	              player:PrintToPlayer( "You do not have enough Escha Beads", 0xd )
		  	end
		end,
    })
    player:PrintToPlayer(string.format("Please move to spawn (%s)", npc:getPacketName()))
end