-----------------------------------
-- xi.effect.VORSEAL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    xi.geasFete.onEffectGain(target, effect)
end

effectObject.onEffectTick = function(target, effect)

end

effectObject.onEffectLose = function(target, effect)
    xi.geasFete.onEffectLose(target, effect)
end

return effectObject
