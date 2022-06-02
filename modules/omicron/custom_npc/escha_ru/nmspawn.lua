-----------------------------------

-----------------------------------
require("modules/module_utils")
require("scripts/zones/Escha_RuAun/Zone")
-----------------------------------
local m = Module:new("Escha_NM")

m:addOverride("xi.zones.GM_Home.Zone.onInitialize", function(zone)
    super(zone)

    -- cleanup variables
    if GetServerVariable("Avatar1") > 1 then
       SetServerVariable("Avatar1", 0)
    end
    if GetServerVariable("Avatar2") > 1 then
       SetServerVariable("Avatar2", 0)
    end
    if GetServerVariable("Avatar3") > 1 then
       SetServerVariable("Avatar3", 0)
    end
    if GetServerVariable("Avatar4") > 1 then
       SetServerVariable("Avatar4", 0)
    end
	
end)

m:addOverride("xi.zones.Escha_RuAun.Zone.onZoneTick", function(zone, mob)
    super(zone)
                            ------------------
                            -- Byakko Spawn --
	                        ------------------
    if
        GetServerVariable("[Eschan]Byakko") == 1 and                -- Correct NM
        (os.time() - GetServerVariable("[Eschan]Byakko_Time")) > 5 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan Byakko",
                x = -417.141,
                y = -70.298,
                z = 409.665,
                rotation = 50,
                groupId = 78,
                groupZoneId = 289,

            onMobSpawn = function(mob)
            SetServerVariable("[Eschan]Byakko", 0)
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)
			    player:setCharVar("[Eschan]Byakko",1)
            end,
			releaseIdOnDeath = true,
        })
        mob:setDropID(4050)
        mob:setSpawn(-417.141, -70.298, 409.665, 50)
        mob:spawn()
    end
	
	                        ------------------
                            -- Suzaku Spawn --
	                        ------------------
    if
        GetServerVariable("[Eschan]Suzaku") == 1 and                -- Correct NM
        (os.time() - GetServerVariable("[Eschan]Suzaku_Time")) > 5 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan Suzaku",
                x = -513.394,
                y = -70.020,
                z = -269.371,
                rotation = 50,
                groupId = 81,
                groupZoneId = 289,

            onMobSpawn = function(mob)
	        SetServerVariable("[Eschan]Suzaku", 0)
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)
                player:setCharVar("[Eschan]Suzaku",1)
            end,
			releaseIdOnDeath = true,
        })
        mob:setDropID(4054)
        mob:setSpawn(-513.394, -70.020, -269.371, 50)
        mob:spawn()
    end
	
	                     ------------------
                         -- Genbu Spawn --
	                     ------------------
    if
        GetServerVariable("[Eschan]Genbu") == 1 and               -- Correct NM
        (os.time() - GetServerVariable("[Eschan]Genbu_Time")) > 5 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan Genbu",
                x = 260.208,
                y = -70.298,
                z = 523.173,
                rotation = 50,
                groupId = 79,
                groupZoneId = 289,

            onMobSpawn = function(mob)
	        SetServerVariable("[Eschan]Genbu", 0)
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)
                player:setCharVar("[Eschan]Genbu",1)
            end,
			releaseIdOnDeath = true,
        })
        mob:setDropID(4051)
	    mob:setSpawn(260.208, -70.298, 523.173, 50)
        mob:spawn()
    end
	
	                        ------------------
                            -- Seiryu Spawn --
	                        ------------------
    if
        GetServerVariable("[Eschan]Seiryu") == 1 and                -- Correct NM
        (os.time() - GetServerVariable("[Eschan]Seiryu_Time")) > 5 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan Seiryu",
                x = -417.141,
                y = -70.298,
                z = 409.665,
                rotation = 50,
                groupId = 78,
                groupZoneId = 289,

            onMobSpawn = function(mob)
       	    SetServerVariable("[Eschan]Seiryu", 0)
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)
                player:setCharVar("[Eschan]Seiryu",1)
            end,
			releaseIdOnDeath = true,
        })
        mob:setDropID(4053)
        mob:setSpawn(581.474, -70.298, -86.974, 50)
        mob:spawn()
    end
	                        -----------
	                        -- Kirin --
	                        -----------
	 if
        GetServerVariable("[Eschan]Kirin") == 1 and                -- Correct NM
        (os.time() - GetServerVariable("[Eschan]Kirin_Time")) > 5  -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan Kirin",
                x = -1.582,
                y = -54.039,
                z = -597.508,
                rotation = 50,
                groupId = 82,
                groupZoneId = 289,

            onMobSpawn = function(mob)
       	        SetServerVariable("[Eschan]Kirin", 0)
            end,	
			
    		onMobFight = function(mob, target)
	    	    local lifePercent = mob:getHPP()
                if lifePercent < 70 and GetServerVariable("Avatar1") == 0 then
			        SetServerVariable("Avatar1", 1)
	            end
	    	    if lifePercent < 45 and GetServerVariable("Avatar2") == 0 then
			    SetServerVariable("Avatar2", 1)
	            end
	    	    if lifePercent < 25 and GetServerVariable("Avatar3") == 0 then
			        SetServerVariable("Avatar3", 1)
			    end
	            if lifePercent < 5 and GetServerVariable("Avatar4") == 0 then
			        SetServerVariable("Avatar4", 1)
			    end
	        end,
			
			
            onMobDeath = function(mob, player, isKiller, noKiller)
                player:setCharVar("[Eschan]Kirin",1)
				SetServerVariable("Avatar1", 0)
				SetServerVariable("Avatar2", 0)
				SetServerVariable("Avatar3", 0)
				SetServerVariable("Avatar4", 0)
            end,
			
			releaseIdOnDeath = true,
        })
        mob:setDropID(0)
        mob:setSpawn(-1.52, -54.039, -597.508, 50)
        mob:spawn()
    end
	
	              --------------------
	              -- KIRINS AVATARS --
	              --------------------
				  
				  -- Kirin's Genbu --
	if GetServerVariable("Avatar1") == 1 then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Kirin's Genbu",
                x = -11.552,
                y = -54.040,
                z = -606.276,
                rotation = 50,
                groupId = 15,
                groupZoneId = 130,

            onMobSpawn = function(mob)
       	        SetServerVariable("Avatar1", 2)
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)

            end,
			releaseIdOnDeath = true,
        })
        mob:setDropID(0)
        mob:setSpawn(-11.552, -54.040, -606.276, 50)
        mob:spawn()
    end
	
	               -- Kirin's Suzaku --
	if GetServerVariable("Avatar2") == 1 then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Kirin's Suzaku",
                x = 16.562,
                y = -55.240,
                z = -605.491,
                rotation = 50,
                groupId = 18,
                groupZoneId = 130,

            onMobSpawn = function(mob)
                SetServerVariable("Avatar2", 2)
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)

            end,
			releaseIdOnDeath = true,
        })
        mob:setDropID(0)
        mob:setSpawn(16.562, -55.240, -605.491, 50)
        mob:spawn()
    end
	             -- Kirin's Seiryu --
	if GetServerVariable("Avatar3") == 1 then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Kirin's Seiryu",
                x = -11.552,
                y = -54.040,
                z = -606.276,
                rotation = 50,
                groupId = 16,
                groupZoneId = 130,

            onMobSpawn = function(mob)
                SetServerVariable("Avatar3", 2)
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)

            end,
			releaseIdOnDeath = true,
        })
        mob:setDropID(0)
        mob:setSpawn(-11.552, -54.040, -606.276, 50)
        mob:spawn()
    end
	    
		        -- Kirin's Byakko --
	if GetServerVariable("Avatar4") == 1 then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Kirin's Byakko",
                x = 16.562,
                y = -55.240,
                z = -605.491,
                rotation = 50,
                groupId = 17,
                groupZoneId = 130,

            onMobSpawn = function(mob)
                SetServerVariable("Avatar4", 2)
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)

            end,
			releaseIdOnDeath = true,
        })
        mob:setDropID(0)
        mob:setSpawn(16.562, -55.240, -605.491, 50)
        mob:spawn()
    end
end)

return m