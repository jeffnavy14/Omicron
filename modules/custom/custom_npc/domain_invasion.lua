-----------------------------------
-- Add some test NPCs to GM_HOME (zone 210)
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Escha_RuAun/Zone")
-----------------------------------
local m = Module:new("domain_invasion")

-- Server Crash Failsafe
m:addOverride("xi.zones.Escha_RuAun.Zone.onInitialize", function(zone)
    super(zone)

    -- cleanup variables
    if GetServerVariable("[Domain]NMToD") < 1 then
	    SetServerVariable("[Domain]NMToD", 1)
	end
	if GetServerVariable("[Domain]Addon_Test") < 1 then
	    SetServerVariable("[Domain]Addon_Test", 1)
	end
	
	if GetServerVariable("[Domain]NMSpawned") == 1 then
	    SetServerVariable("[Domain]NMSpawned", 0)
	end
	if GetServerVariable("Addon_Test") < 1 then
	    SetServerVariable("Addon_Test", 4)
	end
    if GetServerVariable("[Domain]Addon_Spawned") == 1 then
	    SetServerVariable("[Domain]Addon_Spawned", 0)
	end
    if GetServerVariable("[Domain]Addon_Spawned_2") == 1 then
	    SetServerVariable("[Domain]Addon_Spawned_2", 0)
	end
    if GetServerVariable("[Domain]Addon_Spawned_3") == 1 then
	    SetServerVariable("[Domain]Addon_Spawned_3", 0)
	end
end)

-- NM 1
m:addOverride("xi.zones.Escha_RuAun.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already
    if
        GetServerVariable("[Domain]NM") == 0 and              -- Correct NM
        GetServerVariable("[Domain]NMSpawned") == 0 and       -- NM isn't spawned
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Jeronimo",
            x = 0.421,
            y = -43.600,
            z = -196.322,
            rotation = 65,
            widescan = 1,
    
            groupId = 96,
            groupZoneId = 289,

            onMobSpawn = function(mob)
			    SetServerVariable("[Domain]NMSpawned", 1)

                -- Debug
			    printf("SPAWNING MOB!!!!!!!!!!")
				printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
			end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)
                -- Variable control
			    SetServerVariable("[Domain]NMToD", os.time())
    		    SetServerVariable("[Domain]NM", 1)
				SetServerVariable("[Domain]NMSpawned", 0)

                -- Server-wide message
                player:PrintToArea("Fuck you.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)

                -- Debug
				printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
            end,
        })

        mob:setSpawn(0.421, -43.600, -196.322, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
    end

end)

-- NM 2
m:addOverride("xi.zones.Reisenjima_Henge.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already.
    if
        GetServerVariable("[Domain]NM") == 1 and              -- Correct NM
        GetServerVariable("[Domain]NMSpawned") == 0 and       -- NM isn't spawned
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
		local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Tortuga",
            x = 0.195,
            y = 5.50,
            z = -1.378,
            rotation = 65,
            widescan = 1,
    
            groupId = 89,
            groupZoneId = 291,

            onMobSpawn = function(mob)
			    SetServerVariable("[Domain]NMSpawned", 1)
			    SetServerVariable("[Domain]PushMessage", 1)

                -- Debug
                printf("SPAWNING MOB!!!!!!!!!!")
				printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))

			end,	

            onMobDeath = function(mob, player, isKiller, noKiller)
                -- Variable control
			    SetServerVariable("[Domain]NMToD", os.time())
    		    SetServerVariable("[Domain]NM", 2)
				SetServerVariable("[Domain]NMSpawned", 0)

                -- Server-wide message
                player:PrintToArea("Fuck you too.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)

                -- Debug
				printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
            end,
        })
    
        mob:setSpawn(0.195, 5.500, -1.378, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
    end
	    
end)

-- NM 3
m:addOverride("xi.zones.Provenance.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already.
    if
	    GetServerVariable("Addon_Test") == 0 and
        GetServerVariable("[Domain]NM") == 2 and              -- Correct NM
        GetServerVariable("[Domain]NMSpawned") == 0 and       -- NM isn't spawned
        (os.time() - GetServerVariable("[Domain]Addon_Test")) > 30 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Battosai",
            look = 3601,
            x = -580,
            y = -228,
            z = 540,
            rotation = 65,
            widescan = 1,
    
            groupId = 64,
            groupZoneId = 288,
			
            onMobSpawn = function(mob)
			    SetServerVariable("[Domain]NMSpawned", 1)
			    SetServerVariable("[Domain]PushMessage", 1)

                -- Debug
                printf("SPAWNING MOB!!!!!!!!!!")
                printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
			end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                -- Variable control
			    SetServerVariable("[Domain]NMToD", os.time()) -- Set NM ToD
    		    SetServerVariable("[Domain]NM", 0)            -- Set NM to be spawned next
				SetServerVariable("[Domain]NMSpawned", 0)     -- Set NM spawned flag (To not spawn infinite NMs)
				SetServerVariable("[Domain]Addon_Spawned", 0)
				SetServerVariable("[Domain]Addon_Spawned_2", 0)
				SetServerVariable("[Domain]Addon_Spawned_3", 0)
				SetServerVariable("Addon_Test", 4)

                -- Server-wide message
                player:PrintToArea("Fuck you three.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)

                -- Debug
				printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
            end,
        })
    
        mob:setSpawn(-580, -228, 540, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
		SetServerVariable("[Domain]NMSpawned", 1)
    end
	    
end)
-- Addon 1
m:addOverride("xi.zones.Provenance.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already.
    if
        GetServerVariable("Addon_Test") == 4 and
        GetServerVariable("[Domain]NM") == 2 and              -- Correct NM
		GetServerVariable("[Domain]Addon_Spawned") == 0 and
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Test 1",
            x = -570,
            y = -228,
            z = 538,
            rotation = 65,
            widescan = 1,
    
            groupId = 5,
            groupZoneId = 222,
			
            onMobSpawn = function(mob)
		        SetServerVariable("[Domain]Addon_Spawned", 1)
			    SetServerVariable("[Domain]PushMessage", 1)

                -- Debug
                printf("SPAWNING MOB!!!!!!!!!!")
                printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
			end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                -- Variable control
	            local Addon = GetServerVariable("Addon_Test")
                local AddonLeft = math.floor(Addon / 4)
		            SetServerVariable("Addon_Test", Addon - AddonLeft - 1)
					print(string.format("On death is working"))
				if GetServerVariable("Addon_Test", 0 ) then
				   SetServerVariable("[Domain]Addon_Test", os.time()) -- Set NM ToD
				   print(string.format("ToD is working"))
				end

                -- Server-wide message
                player:PrintToArea("Test 1 Has been Defeated.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)

                -- Debug
				printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
            end,
        })
    
        mob:setSpawn(-570, -228, 538, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
		SetServerVariable("[Domain]Addon_Spawned", 1)

    end
	    
end)
-- Addon 2
m:addOverride("xi.zones.Provenance.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already.
    if
        GetServerVariable("Addon_Test") == 4 and
        GetServerVariable("[Domain]NM") == 2 and              -- Correct NM
		GetServerVariable("[Domain]Addon_Spawned_2") == 0 and
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Test 2",
            x = -580,
            y = -228,
            z = 540,
            rotation = 65,
            widescan = 1,
    
            groupId = 4,
            groupZoneId = 222,
			
            onMobSpawn = function(mob)
		        SetServerVariable("[Domain]Addon_Spawned_2", 1)
			    SetServerVariable("[Domain]PushMessage", 1)

                -- Debug
                printf("SPAWNING MOB!!!!!!!!!!")
                printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
			end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                -- Variable control
	            local Addon = GetServerVariable("Addon_Test")
                local AddonLeft = math.floor(Addon / 4)
		            SetServerVariable("Addon_Test", Addon - AddonLeft - 1)
                    print(string.format("On death is working"))
				if GetServerVariable("Addon_Test", 0 ) then
				   SetServerVariable("[Domain]Addon_Test", os.time()) -- Set NM ToD
				   print(string.format("ToD is working"))
				end

                -- Server-wide message
                player:PrintToArea("Test 2 has been defeated.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)

                -- Debug
				printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
            end,
        })
    
        mob:setSpawn(-580, -228, 540, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
		SetServerVariable("[Domain]Addon_Spawned_2", 1)

    end
	    
end)
-- Addon 3
m:addOverride("xi.zones.Provenance.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already.
    if
        GetServerVariable("Addon_Test") == 4 and
        GetServerVariable("[Domain]NM") == 2 and              -- Correct NM
		GetServerVariable("[Domain]Addon_Spawned_3") == 0 and
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Test 3",
            x = -590,
            y = -228,
            z = 540,
            rotation = 65,
            widescan = 1,
    
            groupId = 6,
            groupZoneId = 222,
			
            onMobSpawn = function(mob)
		        SetServerVariable("[Domain]Addon_Spawned_3", 1)
			    SetServerVariable("[Domain]PushMessage", 1)

                -- Debug
                printf("SPAWNING MOB!!!!!!!!!!")
                printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
			end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                -- Variable control
	            local Addon = GetServerVariable("Addon_Test")
                local AddonLeft = math.floor(Addon / 4)
		            SetServerVariable("Addon_Test", Addon - AddonLeft - 1)
                    print(string.format("On death is working"))
				if GetServerVariable("Addon_Test", 0 ) then
				   SetServerVariable("[Domain]Addon_Test", os.time()) -- Set NM ToD
				   print(string.format("ToD is working"))
				   end
						

                -- Server-wide message
                player:PrintToArea("Test 3 has been defeated.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)

                -- Debug
				printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
            end,
        })
    
        mob:setSpawn(-590, -228, 540, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
		SetServerVariable("[Domain]Addon_Spawned_3", 1)

    end
	    
end)

return m
