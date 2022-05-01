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
	
	if GetServerVariable("[Domain]NMSpawned") == 1 then
	    SetServerVariable("[Domain]NMSpawned", 0)
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
            look = "0x0000680A00000000000000000000000000000000",
            x = 0.421,
            y = -43.600,
            z = -196.322,
            rotation = 65,
            widescan = 1,
    
            groupId = 5,
            groupZoneId = 154,

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
            look = "0x0000680A00000000000000000000000000000000",
            x = 0.195,
            y = 5.50,
            z = -1.378,
            rotation = 65,
            widescan = 1,
    
            groupId = 5,
            groupZoneId = 154,

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
        GetServerVariable("[Domain]NM") == 2 and              -- Correct NM
        GetServerVariable("[Domain]NMSpawned") == 0 and       -- NM isn't spawned
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
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
    
            groupId = 1,
            groupZoneId = 222,
			
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

return m
