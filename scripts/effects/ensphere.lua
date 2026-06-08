-----------------------------------
-- xi.effect.ENSPHERE
-----------------------------------
local effectObject = {}

-- Restructured table to use Item ID as the key for instant lookups
local auraBonuses = 
{
    [xi.item.MEXTLI_HARNESS]        = {xi.mod.CRITHITRATE, 3},
    [xi.item.ENFORCERS_HARNESS]     = {xi.mod.CRITHITRATE, 4},
    [xi.item.ANHUR_ROBE]            = {xi.mod.MATT, 5},
    [xi.item.GYVE_DOUBLET]          = {xi.mod.MATT, 10},
    [xi.item.ZENDIK_ROBE]           = {xi.mod.MATT, 10},
    [xi.item.FAZHELUO_RADIANT_MAIL] = {xi.mod.STORETP, 6},
    [xi.item.TOCIS_HARNESS]         = {xi.mod.HASTE_GEAR, 200},
    [xi.item.HEKAS_KALASIRIS]       = {xi.mod.FASTCAST, 5},
    [xi.item.MEKIRA_MEIKOGAI]       = {xi.mod.DOUBLE_ATTACK, 3},
    [xi.item.KUBIRA_MEIKOGAI]       = {xi.mod.DOUBLE_ATTACK, 4},
    [xi.item.ANNOINTED_KALASIRIS]   = {xi.mod.RERAISE_I, 1},
    [xi.item.MAKORA_MEIKOGAI]       = {xi.mod.REGAIN, 5},
    [xi.item.MEKOSUCHINAE_HARNESS]  = {xi.mod.REFRESH, 1},
}


effectObject.onEffectGain = function(target, effect)
    -- Catching the modifier ID securely from 'subPower' to avoid icon collisions
    local modId = effect:getSubPower()
    local power = effect:getPower()

    if modId and modId > 0 then
        effect:addMod(modId, power)
    end
end

effectObject.onEffectTick = function(target, effect)
    -- Intentionally blank
end

effectObject.onEffectLose = function(target, effect)
    -- Intentionally blank
end

return effectObject