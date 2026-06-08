-----------------------------------
-- ID: 25728
-- Zendik Robe 25728
--  Sphere(aura) magic attack bonus +10
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target, itemCheck, param, caster)
    return 0
end

itemObject.onItemEquip  = function(user, item)
    user:addStatusEffect(xi.effect.ENSPHERE, {
        power    = 10,
        subPower = xi.mod.MATT,
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