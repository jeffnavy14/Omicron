-----------------------------------
-- Add some Spawn NPCs to Abdhaljs_Isle-Purgonorgo (zone 44)
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
-----------------------------------
local m = Module:new("NaturePathNMs")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)
	
	SetServerVariable("nmColkhab", 0) --north beach
	SetServerVariable("nmTchakka", 0) -- NE Tunnel
	SetServerVariable("nmYumcax", 0) -- NW Tunnel
	SetServerVariable("nmKumhau", 0) -- East Beach
	SetServerVariable("nmHurkan", 0) -- SE Tunnel
	SetServerVariable("nmAchuka", 0) -- SE Tunnel
	SetServerVariable("nmTeodor", 0)
	-- For part III
	--SetServerVariable("nmFu", 0)
	--SetServerVariable("nmKyou", 0)
	--SetServerVariable("nmKin", 0)
	--SetServerVariable("nmKei", 0)
	--SetServerVariable("nmGin", 0)
	--SetServerVariable("nmOu", 0)
	
    -- Spawn A (Colkhab)
local SpawnerA = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = " ",
        look = 721,
        x = 605.000,
        y = -3.000,
        z = 510.000,

        rotation = 128,

		groupID = 30,
		zoneID = 292,
		
		onTrigger = function(player, npc)
			gotEnough = player:getCurrency("infamy")
			nmAup = GetServerVariable("nmColkhab")
			if nmAup == 0 and gotEnough >= 200 then 
					SpawnMob(16957516):updateEnmity(player)
					player:addCurrency("infamy", -200)
					SetServerVariable("nmColkhab", 1)
					for _,v in ipairs (player:getParty()) do
						v:ChangeMusic(0, 62)
						v:ChangeMusic(1, 62)
						v:ChangeMusic(2, 62)
						v:ChangeMusic(3, 62)
						v:ChangeMusic(4, 62)
					end
			else
				player:PrintToPlayer("You hear a faint buzzing far in the distance...", 13)
			end
			
		end
	})

	utils.unused(SpawnerA)
	
   -- Spawn B (Tchakka)
local SpawnerB = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = ".",
        look = 721,
        x = 711.000,
        y = -3.100,
        z = 404.000,

        rotation = 128,

		groupID = 30,
		zoneID = 292,
		
		onTrigger = function(player, npc)
			gotEnough = player:getCurrency("infamy");
			nmBup = GetServerVariable("nmTchakka");
			if nmBup == 0 and gotEnough >= 200 then
					SpawnMob(16957607):updateEnmity(player);
					player:addCurrency("infamy", -200);
					SetServerVariable("nmTchakka", 1);
					for _,v in ipairs (player:getParty()) do
						v:ChangeMusic(0, 62)
						v:ChangeMusic(1, 62)
						v:ChangeMusic(2, 62)
						v:ChangeMusic(3, 62)
						v:ChangeMusic(4, 62)
					end
			else
				player:PrintToPlayer("You barely hear the flow of gurgling water...", 13)
			end
		end
	})

	utils.unused(SpawnerB)		

    -- Spawn C (Yumcax)
local SpawnerC = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = ",",
        look = 721,
        x = 397.000,
        y = -3.000,
        z = 322.000,

        rotation = 128,

		groupID = 30,
		zoneID = 292,
		
		onTrigger = function(player, npc)
			gotEnough = player:getCurrency("infamy");
			nmCup = GetServerVariable("nmYumcax");
			if nmCup == 0 and gotEnough >= 200 then
					SpawnMob(16957713):updateEnmity(player);
					player:addCurrency("infamy", -200);
					SetServerVariable("nmYumcax", 1);
					for _,v in ipairs (player:getParty()) do
						v:ChangeMusic(0, 62)
						v:ChangeMusic(1, 62)
						v:ChangeMusic(2, 62)
						v:ChangeMusic(3, 62)
						v:ChangeMusic(4, 62)
					end
			else
				player:PrintToPlayer("You hear leaves rustling seemingly far...", 13)
			end
		end
		
	})
	
	utils.unused(SpawnerC)		
    
	-- Spawn D (Kumhau)
local SpawnerD = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "  ",
        look = 2492,
        x = 770.000,
        y = -3.000,
        z = 265.000,

        rotation = 128,

		groupID = 30,
		zoneID = 292,
		
		onTrigger = function(player, npc)
			gotEnough = player:getCurrency("infamy");
			nmDup = GetServerVariable("nmKumhau");
			if nmDup == 0 and gotEnough >= 200 then
					SpawnMob(16957804):updateEnmity(player);
					player:addCurrency("infamy", -200);
					SetServerVariable("nmKumhau", 1);
					for _,v in ipairs (player:getParty()) do
						v:ChangeMusic(0, 62)
						v:ChangeMusic(1, 62)
						v:ChangeMusic(2, 62)
						v:ChangeMusic(3, 62)
						v:ChangeMusic(4, 62)
					end
			else
				player:PrintToPlayer("You hear distant soft growling...", 13)
			end
		end
		
	})
	
	utils.unused(SpawnerD)		
	
	-- Spawn E (Achuka)
local SpawnerE = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = ". ",
        look = 2492,
        x = 717.000,
        y = -3.400,
        z = 163.000,

        rotation = 128,

		groupID = 30,
		zoneID = 292,
		
		onTrigger = function(player, npc)
			gotEnough = player:getCurrency("infamy");
			nmEup = GetServerVariable("nmAchuka");
			if nmEup == 0 and gotEnough >= 200 then
					SpawnMob(16957895):updateEnmity(player);
					player:addCurrency("infamy", -200);
					SetServerVariable("nmAchuka", 1);
					for _,v in ipairs (player:getParty()) do
						v:ChangeMusic(0, 62)
						v:ChangeMusic(1, 62)
						v:ChangeMusic(2, 62)
						v:ChangeMusic(3, 62)
						v:ChangeMusic(4, 62)
					end
			else
				player:PrintToPlayer("You hear distant soft growling...", 13)
			end
		end
		
	})
	
	utils.unused(SpawnerE)		

	-- Spawn F (Hurkan)
local SpawnerF = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = ", ",
        look = 2492,
        x = 393.000,
        y = -3.200,
        z = 196.000,

        rotation = 128,

		groupID = 30,
		zoneID = 292,
		
		onTrigger = function(player, npc)
			gotEnough = player:getCurrency("infamy");
			nmFup = GetServerVariable("nmHurkan");
			if nmFup == 0 and gotEnough >= 200 then
					SpawnMob(16957986):updateEnmity(player);
					player:addCurrency("infamy", -200);
					SetServerVariable("nmHurkan", 1);
					for _,v in ipairs (player:getParty()) do
						v:ChangeMusic(0, 62)
						v:ChangeMusic(1, 62)
						v:ChangeMusic(2, 62)
						v:ChangeMusic(3, 62)
						v:ChangeMusic(4, 62)
					end
			else
				player:PrintToPlayer("You hear distant soft growling...", 13)
			end
		end
		
	})
	
	utils.unused(SpawnerF)		

	
end)

return m