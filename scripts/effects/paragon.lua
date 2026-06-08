-----------------------------------
-- xi.effect.custom effect paragon 
require('scripts/globals/paragon')
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
xi.paragon.onEffectGain(target, effect)
end

effectObject.onEffectTick = function(target, effect)
xi.paragon.onEffectTick(target, effect)
end

effectObject.onEffectLose = function(target, effect)
xi.paragon.onEffectLose(target, effect)
end

return effectObject
