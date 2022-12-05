-----------------------------------
-- Gatekeeper, teleporter and random filler NPCs
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
-----------------------------------
local m = Module:new("FlavourPeople")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)
	
	local YagMachine = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Broken Machine",
        look = 2165,
        x = 590.000,
        y = -3.000,
        z = 10.000,
        rotation = 128,
		
		onTrigger = function(player, npc)
			player:PrintToPlayer("The machine seems rusted beyond sensible use..." ,13)
		end
	})

	utils.unused(YagMachine)		

---------------------------------------
	local BShovel = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Broken Shovel",
        look = 7,
        x = 568.000,
        y = 0.000,
        z = 30.000,
        rotation = 61,
		
		onTrigger = function(player, npc)
			player:PrintToPlayer("Is nowhere safe... Abyssea is lost my friend, this land was thought to be a possible safe haven.  We were very wrong" ,0, npc:getPacketName())
		end
	})

	utils.unused(BShovel)

---------------------------------------	
	local Eliana = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Eliana",
        look = 143,
		x = 580.000,
        y = 0.000,
        z = 25.000,
		rotation = 140,

		onTrigger = function(player, npc)
			player:PrintToPlayer("Nah 'dat be a purdy one... Don'cha be thinkin' so der?" ,0, npc:getPacketName())
			player:PrintToPlayer("Wondah if it'a taste like chicken..." ,0, npc:getPacketName())
		end,
    
	})

	utils.unused(Eliana)
---------------------------------------
	
	local Mukiki = zone:insertDynamicEntity({

		objtype = xi.objType.NPC,
		name = "Mukiki",
        look = 173,
		x = 569.000,
        y = 0.000,
		z = 25.000,
		rotation = 10,


		onTrigger = function(player, npc)
			player:PrintToPlayer("Feararu the Elvaan lady, she tried to eataru me." ,0, npc:getPacketName())
			player:PrintToPlayer("Thankfully I've been practicing my black magic... now if only I could figure out this wierd spell... Ul..te...pah?" ,0, npc:getPacketName())
			player:PrintToPlayer("Translating this is not easy-weasy" ,0, npc:getPacketName())
		end,
    
	})

    utils.unused(Mukiki)
---------------------------------------
	
	local MuteGoblin = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Mute Goblin",
        look = 3631,
        x = 557.000,
        y = -3.000,
        z = 80.000,
		rotation = 198,
		widescan = 1,

    onTrigger = function(player, npc)
		player:PrintToPlayer("..." ,0, npc:getPacketName())
	end,
    
	})

    utils.unused(MuteGoblin)
---------------------------------------
	local Amchuchu = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Amchuchu",
        look = 3078,
        x = 517.000,
        y = -3.000,
        z = 542.000,
		rotation = 0,
		widescan = 1,

    onTrigger = function(player, npc)
		player:PrintToPlayer("I heard about you from Joachim's friends... been adventuring here in Abyssea by the sounds." ,0, npc:getPacketName())
		player:PrintToPlayer("This little isle was one of the few safe havens we had from those horrid hoards that dropped from the sky." ,0, npc:getPacketName())
		player:PrintToPlayer("Sadly our safety here didn't last as long as we had been hoping" ,0, npc:getPacketName())
		player:timer(2000, function(player)
			player:PrintToPlayer("In Adoulin, the Naakuals rose up and devastaed everything in their attempt to fight these vorageans, so some of us escaped our homes coming east." ,0, npc:getPacketName())
			player:PrintToPlayer("We've come to call this 'The Path of Lost Nature' and some of the creatures we saw in Adoulin have arrived here." ,0, npc:getPacketName())
			player:PrintToPlayer("We've also started seeing strange vortex's here, we know of 3 so far.  Maybe the settlers in the south know more" ,0, npc:getPacketName())
		end)
	end,
    
	})

    utils.unused(Amchuchu)
	
---------------------------------------	
-- Mid
---------------------------------------
	
	local Mid = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Mid",
        look = 3160,

        x = 565.500, 
        y = -3.400,
        z = -2.738,

        rotation = 127.5,
		widescan = 1,
		
		
		onTrigger = function(player, playerArg, npc)
		
		local menu =
    {
        title = "A request of Mid?",
        onStart = function(playerArg)
		
            playerArg:PrintToPlayer("Hmmm... ...?", xi.msg.channel.NS_SAY)
        end,
        options =
        {
			{
                "What are the anomolies?",
                function(playerArg)
				player:PrintToPlayer("Mid: When the Naakuals came to this island, their energies caused a reaction of some kind...", xi.msg.channel.NS_SAY)
				player:PrintToPlayer("I was able to tap that to trap them, but that left the other creatures, who now guard them... waiting.", xi.msg.channel.NS_SAY)
                end,
            },
            {
				"Send me to the Pier",
				function(playerArg)
				player:setPos(521, -3.038, 540)
				end,
			},

        },
        onCancelled = function(playerArg)
        end,
        onEnd = function(playerArg)
        end,
    }
		player:customMenu(menu)	
	end
	
	})

	utils.unused(Mid)

---------------------------------------
--Gate Keeper
---------------------------------------

	local Bob = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Bob",
        look = 37,

        x = 521.500, 
        y = -3.000,
        z = 549.000,

        rotation = 190,
		widescan = 1,
		
		
		onTrigger = function(player, playerArg, npc)
		
		local menu =
    {
        title = "Ready to join the fight?",
        onStart = function(playerArg)
		
            playerArg:PrintToPlayer("Join the Path of Lost Nature fight?", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
				"Yes please!",
				function(playerArg)
				player:PrintToPlayer("Bob: Be careful out there.", xi.msg.channel.NS_SAY)
				end,
			},              
            {
                "Return to Jeuno",
				function(playerArg)
				player:setPos(-4, -0.001, 18.4313, 0, 244)
				end,
            },
            {
                "What's going on?",
                function(playerArg)
				player:PrintToPlayer("Bob: This is a battlefield, Amchuchu can explain further, this was our last safe place but the wildlife decided to come and push back.", xi.msg.channel.NS_SAY)
				player:PrintToPlayer("Something about it draws out certain creature I won't go near, so if you say yes be careful.", xi.msg.channel.NS_SAY)
                end,
            },
            {
				"Send me to the South Camp",
				function(playerArg)
				player:setPos(560.359, -3.4, -2.738)
				end,
			},

        },
        onCancelled = function(playerArg)
        end,
        onEnd = function(playerArg)
        end,
    }
		player:customMenu(menu)	
	end
	
	})

	utils.unused(Bob)	
	
end)

return m
