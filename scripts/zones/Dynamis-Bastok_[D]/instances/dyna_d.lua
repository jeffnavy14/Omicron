-----------------------------------
-- doomvoid
-----------------------------------
require('modules/omicronxi/custom_instance/custom_instance')
require('modules/omicronxi/custom_instance/bastok_d/IDs')
-----------------------------------
local instanceObject = {}

instanceObject.onInstanceCreated = function(instance)
        SpawnMob(17985540, instance)
end

instanceObject.onInstanceCreatedCallback = function(player, instance)
    if instance then
        player:setInstance(instance)
        player:setPos(0, 0, 0, 0, instance:getZone():getID())
    end
end

instanceObject.afterInstanceRegister = function(player)
    local instance = player:getInstance()
    player:countdown(instance:getTimeLimit() * 60)
end

instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
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
