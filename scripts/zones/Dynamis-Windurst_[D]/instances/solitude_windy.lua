-------------------------------------------------------------------------
-- DYNA-D WINDURST !instance 40002
-----------------------------------
local ID = zones[xi.zone.DYNAMIS_WINDURST_D]
-----------------------------------
local instanceObject = {}

instanceObject.onInstanceCreated = function(instance)
-- Iterate through your block of SQL Mob IDs and force them to spawn
    for mobId = 17989633, 17989665 do
        SpawnMob(mobId, instance)
		GetMobByID(mobId, instance):setRespawnTime(1)
    end
end


-- Once the instance is ready, inform the requester that it's ready
instanceObject.onInstanceCreatedCallback = function(player, instance)
    if instance then
        player:setInstance(instance)
        player:setPos(0, 0, 0, 0, instance:getZone():getID())
    end
end

-- When the player zones into the instance
instanceObject.afterInstanceRegister = function(player)
    local instance = player:getInstance()
    player:countdown(instance:getTimeLimit() * 60)
end

-- Instance 'tick'
instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    --xi.instance.updateInstanceTime(instance, elapsed, ID.text)

    -- Check for mob death (could do also do this in the mob script)
    local mobsStillAlive = false
    local mobs = instance:getMobs()
    for _, mob in pairs(mobs) do
        if mob:isAlive() then
            mobsStillAlive = true
        end
    end

    if not mobsStillAlive then
        instance:complete()
    end
end

-- On fail
instanceObject.onInstanceFailure = function(instance)
    xi.ambuscade.onInstanceFailure(instance)
end

-- When something in the instance calls: instance:setProgress(...)
instanceObject.onInstanceProgressUpdate = function(instance, progress)
end

-- On win
instanceObject.onInstanceComplete = function(instance)
    xi.ambuscade.onInstanceComplete(instance)
end

instanceObject.onEventUpdate = function(player, csid, option, npc)
end

instanceObject.onEventFinish = function(player, csid, option, npc)
    if csid == 10001 then
        player:setPos(-34.2, -16, 58, 32, 249)
    end
end

return instanceObject