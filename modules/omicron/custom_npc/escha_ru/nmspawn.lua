-----------------------------------

-----------------------------------
require("modules/module_utils")
require("scripts/zones/Escha_RuAun/Zone")
-----------------------------------
local m = Module:new("Escha_NM")

m:addOverride("xi.zones.Escha_RuAun.Zone.onZoneTick", function(zone)
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

            end,
			releaseIdOnDeath = true,
        })
        mob:setDropID(4053)
        mob:setSpawn(581.474, -70.298, -86.974, 50)
        mob:spawn()
    end
end)

return m