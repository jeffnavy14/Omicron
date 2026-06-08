-----------------------------------
-- ID: 11868
-- Mekira Meikogai -- 11868
--  Sphere(aura) double attack +3
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target, itemCheck, param, caster)
    return 0
end

itemObject.onItemEquip  = function(user, item)
    user:addStatusEffect(xi.effect.ENSPHERE, {
        power    = 3,
        subPower = xi.mod.DOUBLE_ATTACK,
        tick     = 3,
        duration = 0,
        tier     = xi.auraTarget.PARTY,
        flag     = xi.effectFlag.AURA,
        origin   = user
    })
end

itemObject.onItemUnequip = function(user, item)
    user:delStatusEffect(xi.effect.ENSPHERE)
end

return itemObject