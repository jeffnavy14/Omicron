-----------------------------------
-- Bastion Quest Givers and Spawners
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abyssea-Attohwa/Zone")
require("scripts/zones/Abyssea-Misareaux/Zone")
require("scripts/zones/Abyssea-Vunkerl/Zone")
-----------------------------------
local m = Module:new("BastionChaos")
m:setEnabled(true)

m:addOverride("xi.zones.Abyssea-Attohwa.Zone.onInitialize", function(zone)

    super(zone)

---------------------------------------
--Quest Giver
---------------------------------------
	
	SetServerVariable("MegaMaidAA1", 0)
	SetServerVariable("MegaMaidAA2", 0)
	SetServerVariable("MegaMaidAA3", 0)
	SetServerVariable("[AABastion]Active", 0)
	
	local Biggs = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Biggs",
        look = 93,
        x = -302.132,
        y = -6.97,
        z = 13.067,
        rotation = 0,
		
		onTrigger = function(player, npc)
			AttohwaBastion = player:getCharVar("[Bastion]Attohwa")
			
			if AttohwaBastion == 1 then
				player:PrintToPlayer("The machines were sighted north of here, near a miasma spring. Plese be careful" ,0, npc:getPacketName())
	
			elseif AttohwaBastion == 2 then
				player:PrintToPlayer("Oh! Excellent work my friend, allow me to reward you with some Republic... I mean Resistance Credits" ,0, npc:getPacketName())
				player:addCurrency("resistance_credit", 50)
				player:PrintToPlayer("You recieve 50 Resistance Credits.", 29)
				player:setCharVar("[Bastion]Attohwa", 3)
			
			elseif AttohwaBastion == 3 then
				player:PrintToPlayer("Looks like there have been reports of more activity in the north, please handle it as we are still very few..." ,0, npc:getPacketName())
				player:setCharVar("[Bastion]Attohwa", 1)
			
			else
				player:PrintToPlayer("Ah friend, would you be kind enough to aid us, to the north have been sightings of ancient machines." ,0, npc:getPacketName())
				player:PrintToPlayer("These machines have done great amounts of damage to our forces and defenses, and we have to few people to handle it.", xi.msg.channel.NS_SAY)
			
			local menu =
		{
			title = "Will you help?",
			onStart = function(playerArg)
				playerArg:PrintToPlayer("Hmmm...?", xi.msg.channel.NS_SAY)
			end,
			options =
			{
				{
					"No",
					function(playerArg)
						player:PrintToPlayer("Biggs: Maybe another time time then...", xi.msg.channel.NS_SAY)
					end,
				},
				{
					"Yes",
					function(playerArg)
						player:PrintToPlayer("Bob: Be careful out there.", xi.msg.channel.NS_SAY)
						player:setCharVar("[Bastion]Attohwa", 1)
					end,
				},
			},
		}
			player:timer(2000, function(player)
			player:customMenu(menu)	
			end)
		end
	end,
	
	})
	

	utils.unused(Biggs)	

---------------------------------------
--Spawner
---------------------------------------
	local AttohwaSpawn = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Flag",
        look = 817,
        x = -375.474,
        y = -4.1421,
        z = 152.142,
        rotation = 0,
		
		onTrigger = function(player, npc)
		AttohwaBastion = player:getCharVar("[Bastion]Attohwa")
		AciveBastion = GetServerVariable("[AABastion]Active")
		if AttohwaBastion == 1 and
			ActiveBastion ~= 0
		then
			player:PrintToPlayer("You hear machines approach...", xi.msg.channel.NS_SAY)
			SpawnMob(17658300):updateEnmity(player)
			SpawnMob(17658301):updateEnmity(player)
			SpawnMob(17658304):updateEnmity(player)
			SpawnMob(17658305):updateEnmity(player)
			SpawnMob(17658306):updateEnmity(player)
			SpawnMob(17658308):updateEnmity(player)
			SpawnMob(17658309):updateEnmity(player)
			npc:timer(600000, function(player)
				DespawnMob(17658300)
				DespawnMob(17658301)
				DespawnMob(17658304)
				DespawnMob(17658305)
				DespawnMob(17658306)
				DespawnMob(17658308)
				DespawnMob(17658309)
				DespawnMob(17658310)
				player:PrintToPlayer("The machines leave, as if called elsewhere...", xi.msg.channel.NS_SAY)
				SetServerVariable("[AABastion]Active", 0)
			end)
		else
			player:PrintToPlayer("Its a flag...", xi.msg.channel.NS_SAY)		
		end
	end,	
	})

	utils.unused(AttohwaSpawn)

end)

m:addOverride("xi.zones.Abyssea-Misareaux.Zone.onInitialize", function(zone)

    super(zone)

---------------------------------------
--Quest Giver
---------------------------------------
	
	SetServerVariable("MegaMaidAM1", 0)
	SetServerVariable("MegaMaidAM2", 0)
	SetServerVariable("MegaMaidAM3", 0)
	SetServerVariable("[AMBastion]Active", 0)
	
	local Biggs = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Wedge",
        look = 97,
        x = 284.465,
        y = -15.547,
        z = 226.452,
        rotation = 120,
		
		onTrigger = function(player, npc)
			MisareauxBastion = player:getCharVar("[Bastion]Misareaux")
			
			if MisareauxBastion == 1 then
				player:PrintToPlayer("Dose widgets be t'da south, scrap em good." ,0, npc:getPacketName())
	
			elseif MisareauxBastion == 2 then
				player:PrintToPlayer("Hooo-ieee! Dat a lotta scrap... wha? Republic credit? Dat's trash... here be some Resistance Credits, tank'y m'friend." ,0, npc:getPacketName())
				player:addCurrency("resistance_credit", 50)
				player:PrintToPlayer("You recieve 50 Resistance Credits.", 29)
				player:setCharVar("[Bastion]Misareaux", 3)
			
			elseif MisareauxBastion == 3 then
				player:PrintToPlayer("Looking like dey be up to it again n d'south, ifn' y'please scrap the lot would'ya..." ,0, npc:getPacketName())
				player:setCharVar("[Bastion]Misareaux", 1)
			
			else
				player:PrintToPlayer("Dem der' do-hckies do be doing a number t'us." ,0, npc:getPacketName())
				player:PrintToPlayer("Dey be doing a big'ol hunk o' dent to dem der defenses, an' we ain't gots no people left t'spare.", xi.msg.channel.NS_SAY)
			
			local menu =
		{
			title = "Will you help?",
			onStart = function(playerArg)
				playerArg:PrintToPlayer("Hmmm...?", xi.msg.channel.NS_SAY)
			end,
			options =
			{
				{
					"No",
					function(playerArg)
						player:PrintToPlayer("Wedge: Well alrah-ty, y'all take care now...", xi.msg.channel.NS_SAY)
					end,
				},
				{
					"Yes",
					function(playerArg)
						player:PrintToPlayer("Wedge: Okie-dokie, don't be pokie!", xi.msg.channel.NS_SAY)
						player:setCharVar("[Bastion]Misareaux", 1)
					end,
				},
			},
		}
			player:timer(2000, function(player)
			player:customMenu(menu)	
			end)
		end
	end,
	
	})
	

	utils.unused(Wedge)	

---------------------------------------
--Spawner
---------------------------------------
	local MisareauxSpawn = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Flag",
        look = 817,
        x = 280.265,
        y = -16.018,
        z = 123.213,
        rotation = 190,  -- S 63.5 W 127 N 190.5 254
		
		onTrigger = function(player, npc)
		MisareauxBastion = player:getCharVar("[Bastion]Misareaux")
		AMAciveBastion = GetServerVariable("[AMBastion]Active")
		if MisareauxBastion == 1 and
			ActiveBastion ~= 0
		then
			player:PrintToPlayer("You hear machines approach...", xi.msg.channel.NS_SAY)
			SpawnMob(17662505):updateEnmity(player)
			SpawnMob(17662506):updateEnmity(player)
			SpawnMob(17662509):updateEnmity(player)
			SpawnMob(17662510):updateEnmity(player)
			SpawnMob(17662511):updateEnmity(player)
			SpawnMob(17662513):updateEnmity(player)
			SpawnMob(17662514):updateEnmity(player)
			npc:timer(600000, function(player)
				DespawnMob(17662505)
				DespawnMob(17662506)
				DespawnMob(17662509)
				DespawnMob(17662510)
				DespawnMob(17662511)
				DespawnMob(17662513)
				DespawnMob(17662514)
				DespawnMob(17662515)
				player:PrintToPlayer("The machines leave, as if called elsewhere...", xi.msg.channel.NS_SAY)
				SetServerVariable("[AMBastion]Active", 0)
			end)
		else
			player:PrintToPlayer("Its a flag...", xi.msg.channel.NS_SAY)		
		end
	end,	
	})

	utils.unused(MisareauxSpawn)

end)

m:addOverride("xi.zones.Abyssea-Vunkerl.Zone.onInitialize", function(zone)

    super(zone)

---------------------------------------
--Quest Giver
---------------------------------------
	
	SetServerVariable("MegaMaidAV1", 0)
	SetServerVariable("MegaMaidAV2", 0)
	SetServerVariable("MegaMaidAV3", 0)
	SetServerVariable("[AVBastion]Active", 0)
	
	local Piette = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Piette",
        look = 97,
        x = 157.593,
        y = -38.213,
        z = -148.385,
        rotation = 63.5,
		
		onTrigger = function(player, npc)
			VunkerlBastion = player:getCharVar("[Bastion]Vunkerl")
			
			if VunkerlBastion == 1 then
				player:PrintToPlayer("Prithee, take care of the devices yonder. to the northwest." ,0, npc:getPacketName())
	
			elseif VunkerlBastion == 2 then
				player:PrintToPlayer("Most wondrous! thanketh thee! h're's some..." ,0, npc:getPacketName())
				player:PrintToPlayer("I understand you not Republic trash!! Nay nay nay, here's some Resistance Credits, takest care" ,0, npc:getPacketName())
				player:addCurrency("resistance_credit", 50)
				player:PrintToPlayer("You recieve 50 Resistance Credits.", 29)
				player:setCharVar("[Bastion]Vunkerl", 3)
			
			elseif VunkerlBastion == 3 then
				player:PrintToPlayer("The devices hath come to the northwest yet again, prithee dispose of the trash" ,0, npc:getPacketName())
				player:setCharVar("[Bastion]Vunkerl", 1)
			
			else
				player:PrintToPlayer("Devices to the northwest hath nearly ruined us." ,0, npc:getPacketName())
				player:PrintToPlayer("With nary a soul to spareth, might we not beseech thee to dispatch the lot for us", xi.msg.channel.NS_SAY)
			
			local menu =
		{
			title = "Will you help?",
			onStart = function(playerArg)
				playerArg:PrintToPlayer("Hmmm...?", xi.msg.channel.NS_SAY)
			end,
			options =
			{
				{
					"No",
					function(playerArg)
						player:PrintToPlayer("Piette: Pity, be safe good friend.", xi.msg.channel.NS_SAY)
					end,
				},
				{
					"Yes",
					function(playerArg)
						player:PrintToPlayer("Piette: Glourious Altana, praise be to thee!", xi.msg.channel.NS_SAY)
						player:setCharVar("[Bastion]Vunkerl", 1)
					end,
				},
			},
		}
			player:timer(2000, function(player)
			player:customMenu(menu)	
			end)
		end
	end,
	
	})
	

	utils.unused(Wedge)	

---------------------------------------
--Spawner
---------------------------------------
	local VunkerlSpawn = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Flag",
        look = 817,
        x = 52.9,
        y = -39.65,
        z = -72.319,
        rotation = 63.5,  -- S 63.5 W 127 N 190.5 254
		
		onTrigger = function(player, npc)
		VunkerlBastion = player:getCharVar("[Bastion]Vunkerl")
		AVAciveBastion = GetServerVariable("[AVBastion]Active")
		if VunkerlBastion == 1 and
			ActiveBastion ~= 0
		then
			player:PrintToPlayer("You hear machines approach...", xi.msg.channel.NS_SAY)
			SpawnMob(17666525):updateEnmity(player)
			SpawnMob(17666526):updateEnmity(player)
			SpawnMob(17666529):updateEnmity(player)
			SpawnMob(17666530):updateEnmity(player)
			SpawnMob(17666531):updateEnmity(player)
			SpawnMob(17666533):updateEnmity(player)
			SpawnMob(17666534):updateEnmity(player)
			npc:timer(600000, function(player)
				DespawnMob(17666525)
				DespawnMob(17666526)
				DespawnMob(17666529)
				DespawnMob(17666530)
				DespawnMob(17666531)
				DespawnMob(17666533)
				DespawnMob(17666534)
				DespawnMob(17666535)
				player:PrintToPlayer("The machines leave, as if called elsewhere...", xi.msg.channel.NS_SAY)
				SetServerVariable("[AVBastion]Active", 0)
			end)
		else
			player:PrintToPlayer("Its a flag...", xi.msg.channel.NS_SAY)		
		end
	end,	
	})

	utils.unused(VunkerlSpawn)

end)

return m