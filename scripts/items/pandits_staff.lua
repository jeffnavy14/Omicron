-----------------------------------
-- ID: 22101
-- Item: Pandit's Staff
-- Item Effect: Enchantment: Reraise V
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target, user, item, action)
    target:delStatusEffect(xi.effect.RERAISE)
    target:addStatusEffect(xi.effect.RERAISE, { power = 5, duration = 3600, origin = user })
    target:messageBasic(xi.msg.basic.GAINS_EFFECT_OF_STATUS, xi.effect.RERAISE)
end

return itemObject
