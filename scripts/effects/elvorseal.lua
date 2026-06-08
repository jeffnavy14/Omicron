-----------------------------------
-- xi.effect.ELVORSEAL
local controller = require("scripts/globals/di_controller")
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    if target:isPC() then
        target:despawnPet()
        controller.buildFencing(target)

        target:addListener('TICK', 'DI_DISTANCE_TICK', function(targetArg)
            controller.checkDistanceDI(targetArg)
        end)
    end

    target:clearTrusts()
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    if target:isPC() then
        target:objectiveUtility({})
    end

    target:removeListener('DI_DISTANCE_TICK')
    target:setLocalVar('FENCE_WARNED', 0)
    target:setLocalVar('FENCE_TIMER_ACTIVE', 0)
end

return effectObject