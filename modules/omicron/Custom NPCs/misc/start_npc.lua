-----------------------------------
-- Add some npcs for testers in starter cities.
-----------------------------------
require("modules/module_utils")
require("scripts/globals/events/domain_invasion")
-----------------------------------
local m = Module:new("start_npc")
m:setEnabled(true)

m:addOverride("xi.zones.Bastok_Mines.Zone.onInitialize", function(zone)

    -- Call the zone's original function for onInitialize
    super(zone)

    -- Insert NPC into zone
    local Lili = zone:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,
        name = "Lilisette",
        look = 3049,
        x = 93.446,
        y = 0.623,
        z = -68.917,
        rotation = 128,
        widescan = 1,

        onTrade = function(player, npc, trade)

            player:PrintToPlayer("No, thanks!", 0, npc:getPacketName())
        end,

        onTrigger = function(player, playerArg, npc)
		
		local plevel = player:getMainLvl();
            if (plevel > 98) then
local menu =
    {
        title = "Apex Camp",
        onStart = function(playerArg)

            playerArg:PrintToPlayer("Which camp would you like to go to?", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
                "Dho Gates",
                function(playerArg)
                player:setPos(-60.028, -9.969, 77.441, 204, 272)
                end,
            },
            {
                "Mho Gates",
                function(playerArg)
 					player:setPos(241.013, 19.986, -60.199, 144, 269)
                end,
            },
			{
                "Sih Gates",
                function(playerArg)
 					player:setPos(-77.528, -9.711, -259.626, 121, 268)
                end,
            },
			{
                "Woh Gates",
                function(playerArg)
 					player:setPos(300.857, 30.552, 72.162, 128, 273)
                end,
            },
			{
                "Reisenjima",
                function(playerArg)
 					player:setPos(-500.023, -19.074, -487.686, 190, 291)
                end,
            },
        },
		    onCancelled = function(playerArg)
			end,
			onEnd = function(playerArg)
			end,
    }
			player:customMenu(menu)
		else
            player:PrintToPlayer("Sorry not avail till LVL 99", 0x1F);
		end
        end,
    })

    local Cait = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Cait Sith",
        look = 2197,
        x = 93.228,
        y = 0.623,
        z = -72.038,
        rotation = 128,
        widescan = 1,

        onTrade = function(player, npc, trade)
            player:PrintToPlayer("No, thanks!", 0, npc:getPacketName())
        end,

onTrigger = function(player, playerArg, npc)

                    player:PrintToPlayer("Welcome to OmicronXI, here is a Head Start for you!")
                    player:setLevelCap(99)
					player:unlockJob(0)
					for i = xi.job.PLD, xi.job.RUN do
                        player:unlockJob(i)
                    end
                    for i = xi.ki.MAP_OF_THE_SAN_DORIA_AREA, xi.ki.MAP_OF_DIO_ABDHALJS_GHELSBA do
                        player:addKeyItem(i)
                    end
                    for i = xi.ki.MAP_OF_AL_ZAHBI, xi.ki.MAP_OF_RAKAZNAR do
                        player:addKeyItem(i)
                    end
                    for i = xi.ki.MAP_OF_RALA_WATERWAYS_U, xi.ki.MAP_OF_RAKAZNAR_U do
                        player:addKeyItem(i)
                    end
                    for i = xi.ki.MAP_OF_ESCHA_ZITAH, xi.ki.MAP_OF_REISENJIMA do
                    player:addKeyItem(i)
                    end
					npcUtil.giveKeyItem(player, xi.ki.LIMIT_BREAKER)
					npcUtil.giveKeyItem(player, xi.ki.JOB_BREAKER)
               
        end,
    })

    local Lilit = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Lilith",
        look = 2289,
        x = 93.253,
        y = 0.623,
        z = -75.164,
        rotation = 128,
        widescan = 1,
        onTrade = function(player, npc, trade)
            player:PrintToPlayer("No, thanks!", 0, npc:getPacketName())
        end,

        onTrigger = function(player, npc)
		local plevel = player:getMainLvl();
            if (plevel > 98) then
        local menu =
        {
            title = "Domain Invasion",
            onStart = function(playerArg)
	    
                playerArg:PrintToPlayer("Would you like to be ported to the next Domain Invasion?", xi.msg.channel.NS_SAY)
            end,
            options =
            {
                {
                    "Yes",
                    function(playerArg)
                        if GetServerVariable("[Domain]NM") == 0 then
                            player:setPos(-0.927, -43.600, -234.829, 195, 289)
                            player:addStatusEffect(xi.effect.ELVORSEAL, 1, 0, 0)
                        end
	                    
                        if GetServerVariable("[Domain]NM") == 1 then
                            player:setPos(-3.202, 5.250, -19.560, 195, 292)
                            player:addStatusEffect(xi.effect.ELVORSEAL, 1, 0, 0)
                        end
                        
	                    if GetServerVariable("[Domain]NM") == 2 or
                            GetServerVariable("[Domain]NM") == 3 then
                            player:setPos(-582.14, -228.00, 506.58, 180, 222)
                            player:addStatusEffect(xi.effect.ELVORSEAL, 1, 0, 0)
                        end
                    end,
                },
                {
                    "No",
                    function(playerArg)
 	    				player:PrintToPlayer("Let me know when you are ready for the next battle!!", 0x1F)
                    end,
                },
            },
	    	    onCancelled = function(playerArg)
	    		end,
	    		onEnd = function(playerArg)
	    		end,
        }
	    		player:customMenu(menu)
	    	else
                player:PrintToPlayer("Sorry not avail till LVL 99", 0x1F);
	    	end
            end,
    })

    utils.unused(Lili)
    utils.unused(Cait)
    utils.unused(Lilit)

end)


m:addOverride("xi.zones.Port_Windurst.Zone.onInitialize", function(zone)
    super(zone)
    local Lili = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Lilisette",
        look = 3049,
        x = 182.409,
        y = -12.000,
        z = 229.149,
        rotation = 50,
        widescan = 1,
        onTrade = function(player, npc, trade)

            player:PrintToPlayer("No, thanks!", 0, npc:getPacketName())
        end,

        onTrigger = function(player, playerArg, npc)
		
		local plevel = player:getMainLvl();
            if (plevel > 98) then
local menu =
    {
        title = "Apex Camp",
        onStart = function(playerArg)

            playerArg:PrintToPlayer("Which camp would you like to go to?", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
                "Dho Gates",
                function(playerArg)
                player:setPos(-60.028, -9.969, 77.441, 204, 272)
                end,
            },
            {
                "Mho Gates",
                function(playerArg)
 					player:setPos(241.013, 19.986, -60.199, 144, 269)
                end,
            },
			{
                "Sih Gates",
                function(playerArg)
 					player:setPos(-77.528, -9.711, -259.626, 121, 268)
                end,
            },
			{
                "Woh Gates",
                function(playerArg)
 					player:setPos(300.857, 30.552, 72.162, 128, 273)
                end,
            },
			{
                "Reisenjima",
                function(playerArg)
 					player:setPos(-500.023, -19.074, -487.686, 190, 291)
                end,
            },
        },
		    onCancelled = function(playerArg)
			end,
			onEnd = function(playerArg)
			end,
    }
			player:customMenu(menu)
		else
            player:PrintToPlayer("Sorry not avail till LVL 99", 0x1F);
		end
        end,
    })

    local Cait = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,

        name = "Cait Sith",
        look = 2197,
        x = 186.788,
        y = -12.000,
        z = 229.149,
        rotation = 50,
        widescan = 1,

        onTrade = function(player, npc, trade)
		
            player:PrintToPlayer("No, thanks!", 0, npc:getPacketName())
        end,

        onTrigger = function(player, playerArg, npc)

            player:PrintToPlayer("Welcome to OmicronXI, here is a Head Start for you!")
            player:setLevelCap(99)
            player:unlockJob(0)
            for i = xi.job.PLD, xi.job.RUN do
                player:unlockJob(i)
            end
            for i = xi.ki.MAP_OF_THE_SAN_DORIA_AREA, xi.ki.MAP_OF_DIO_ABDHALJS_GHELSBA do
                player:addKeyItem(i)
            end
            for i = xi.ki.MAP_OF_AL_ZAHBI, xi.ki.MAP_OF_RAKAZNAR do
                player:addKeyItem(i)
            end
            for i = xi.ki.MAP_OF_RALA_WATERWAYS_U, xi.ki.MAP_OF_RAKAZNAR_U do
                player:addKeyItem(i)
            end
            for i = xi.ki.MAP_OF_ESCHA_ZITAH, xi.ki.MAP_OF_REISENJIMA do
            player:addKeyItem(i)
            end
            npcUtil.giveKeyItem(player, xi.ki.LIMIT_BREAKER)
            npcUtil.giveKeyItem(player, xi.ki.JOB_BREAKER)
       
end,
})

    local Lilit = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,

        name = "Lilith",
        look = 2289,
        x = 191.660,
        y = -12.000,
        z = 229.149,
        rotation = 50,
        widescan = 1,
		
        onTrade = function(player, npc, trade)
  
        player:PrintToPlayer("No, thanks!", 0, npc:getPacketName())
        end,
        onTrigger = function(player, npc)
		local plevel = player:getMainLvl();
        if (plevel > 98) then
        local menu =
        {
            title = "Domain Invasion",
            onStart = function(playerArg)
	    
                playerArg:PrintToPlayer("Would you like to be ported to the next Domain Invasion?", xi.msg.channel.NS_SAY)
            end,
            options =
            {
                {
                    "Yes",
                    function(playerArg)
                        if GetServerVariable("[Domain]NM") == 0 then
                            player:setPos(-0.927, -43.600, -234.829, 195, 289)
                            player:addStatusEffect(xi.effect.ELVORSEAL, 1, 0, 0)
                        end
	                    
                        if GetServerVariable("[Domain]NM") == 1 then
                            player:setPos(-3.202, 5.250, -19.560, 195, 292)
                            player:addStatusEffect(xi.effect.ELVORSEAL, 1, 0, 0)
                        end
                        
	                    if GetServerVariable("[Domain]NM") == 2 or
                            GetServerVariable("[Domain]NM") == 3 then
                            player:setPos(-582.14, -228.00, 506.58, 180, 222)
                            player:addStatusEffect(xi.effect.ELVORSEAL, 1, 0, 0)
                        end
                    end,
                },
                {
                    "No",
                    function(playerArg)
 	    				player:PrintToPlayer("Let me know when you are ready for the next battle!!", 0x1F)
                    end,
                },
            },
	    	    onCancelled = function(playerArg)
	    		end,
	    		onEnd = function(playerArg)
	    		end,
        }
	    		player:customMenu(menu)
	    	else
                player:PrintToPlayer("Sorry not avail till LVL 99", 0x1F);
	    	end
            end,
        })
	    
        utils.unused(Lili)
        utils.unused(Cait)
        utils.unused(Lilit)
end)

m:addOverride("xi.zones.Northern_San_dOria.Zone.onInitialize", function(zone)

 
    super(zone)

    local Lili = zone:insertDynamicEntity({

       
        objtype = xi.objType.NPC,

        name = "Lilisette",
        look = 3049,
        x = 82.179,
        y = 0.000,
        z = 4.156,
        rotation = 204,

        widescan = 1,
		
        onTrade = function(player, npc, trade)
            player:PrintToPlayer("No, thanks!", 0, npc:getPacketName())
        end,
        onTrigger = function(player, playerArg, npc)
		
		local plevel = player:getMainLvl();
            if (plevel > 98) then
local menu =
    {
        title = "Apex Camp",
        onStart = function(playerArg)

            playerArg:PrintToPlayer("Which camp would you like to go to?", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
                "Dho Gates",
                function(playerArg)
                player:setPos(-60.028, -9.969, 77.441, 204, 272)
                end,
            },
            {
                "Mho Gates",
                function(playerArg)
 					player:setPos(241.013, 19.986, -60.199, 144, 269)
                end,
            },
			{
                "Sih Gates",
                function(playerArg)
 					player:setPos(-77.528, -9.711, -259.626, 121, 268)
                end,
            },
			{
                "Woh Gates",
                function(playerArg)
 					player:setPos(300.857, 30.552, 72.162, 128, 273)
                end,
            },
			{
                "Reisenjima",
                function(playerArg)
 					player:setPos(-500.023, -19.074, -487.686, 190, 291)
                end,
            },
        },
		    onCancelled = function(playerArg)
			end,
			onEnd = function(playerArg)
			end,
    }
			player:customMenu(menu)
		else
            player:PrintToPlayer("Sorry not avail till LVL 99", 0x1F);
		end
        end,
    })

    local Cait = zone:insertDynamicEntity({

       
        objtype = xi.objType.NPC,
        name = "Cait Sith",
        look = 2197,
        x = 78.948,
        y = 0.000,
        z = 7.239,
        rotation = 204,
        widescan = 1,

        onTrade = function(player, npc, trade)

            player:PrintToPlayer("No, thanks!", 0, npc:getPacketName())
        end,

        onTrigger = function(player, playerArg, npc)

            player:PrintToPlayer("Welcome to OmicronXI, here is a Head Start for you!")
            player:setLevelCap(99)
            player:unlockJob(0)
            for i = xi.job.PLD, xi.job.RUN do
                player:unlockJob(i)
            end
            for i = xi.ki.MAP_OF_THE_SAN_DORIA_AREA, xi.ki.MAP_OF_DIO_ABDHALJS_GHELSBA do
                player:addKeyItem(i)
            end
            for i = xi.ki.MAP_OF_AL_ZAHBI, xi.ki.MAP_OF_RAKAZNAR do
                player:addKeyItem(i)
            end
            for i = xi.ki.MAP_OF_RALA_WATERWAYS_U, xi.ki.MAP_OF_RAKAZNAR_U do
                player:addKeyItem(i)
            end
            for i = xi.ki.MAP_OF_ESCHA_ZITAH, xi.ki.MAP_OF_REISENJIMA do
            player:addKeyItem(i)
            end
            npcUtil.giveKeyItem(player, xi.ki.LIMIT_BREAKER)
            npcUtil.giveKeyItem(player, xi.ki.JOB_BREAKER)
       
end,
})

    local Lilit = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Lilith",
        look = 2289,
        x = 74.813,
        y = 0.000,
        z = 11.578,

        rotation = 204,

        widescan = 1,

        onTrade = function(player, npc, trade)
            player:PrintToPlayer("No, thanks!", 0, npc:getPacketName())
        end,

        onTrigger = function(player, npc)
		local plevel = player:getMainLvl();
        if (plevel > 98) then
        local menu =
        {
            title = "Domain Invasion",
            onStart = function(playerArg)
	    
                playerArg:PrintToPlayer("Would you like to be ported to the next Domain Invasion?", xi.msg.channel.NS_SAY)
            end,
            options =
            {
                {
                    "Yes",
                    function(playerArg)
                        if GetServerVariable("[Domain]NM") == 0 then
                            player:setPos(-0.927, -43.600, -234.829, 195, 289)
                            player:addStatusEffect(xi.effect.ELVORSEAL, 1, 0, 0)
                        end
	                    
                        if GetServerVariable("[Domain]NM") == 1 then
                            player:setPos(-3.202, 5.250, -19.560, 195, 292)
                            player:addStatusEffect(xi.effect.ELVORSEAL, 1, 0, 0)
                        end
                        
	                    if GetServerVariable("[Domain]NM") == 2 or
                            GetServerVariable("[Domain]NM") == 3 then
                            player:setPos(-582.14, -228.00, 506.58, 180, 222)
                            player:addStatusEffect(xi.effect.ELVORSEAL, 1, 0, 0)
                        end
                    end,
                },
                {
                    "No",
                    function(playerArg)
 	    				player:PrintToPlayer("Let me know when you are ready for the next battle!!", 0x1F)
                    end,
                },
            },
	    	    onCancelled = function(playerArg)
	    		end,
	    		onEnd = function(playerArg)
	    		end,
        }
	    		player:customMenu(menu)
	    	else
                player:PrintToPlayer("Sorry not avail till LVL 99", 0x1F);
	    	end
            end,
    })

    utils.unused(Lili)
    utils.unused(Cait)
    utils.unused(Lilit)
end)
-- SKIRMISH REWARD NPC
m:addOverride("xi.zones.Port_Bastok.Zone.onInitialize", function(zone)
    super(zone)
    local domain = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Skirmish Moogle",
        look = 2419,
        x = 87.928,
        y = 7.500,
        z = -192.295,
        rotation = 128,
        widescan = 1,
		
		
        onEventUpdate = function(player, csid, option)
            xi.events.domainCampaign.onEventUpdate(player, csid, option)
        end,
        onTrigger = function(player, npc)
		require("scripts/zones/Port_Bastok/IDs")
            local csid = 425
            xi.events.domainCampaign.onTrigger(player, csid)
		end,
		
		})
	utils.unused(skirmoogle)
end)


return m