-----------------------------------
-- ID: 26224
-- confectioners_ring 26224
--   gives "+1", or +1%, to the effects of each type of Rusk
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target, itemCheck, param, caster)
  return 0
end

itemObject.onItemEquip  = function(user, item)
    local foodTable = { 5782, 5783, 5784 } -- Sugar Rusk, Chocolate Rusk, Coconut Rusk

    if user then
        local foodEffect = user:getStatusEffect(xi.effect.FOOD)
        if foodEffect then
            local foodId = foodEffect:getSourceTypeParam()
            for _, food in pairs(foodTable) do
                if foodId == food then
                    user:addMod(xi.mod.SYNTH_HQ_RATE, 1)
                    return
                end
            end
        end
    end
end

itemObject.onItemUnequip = function(user, item)
    user:delMod(xi.mod.SYNTH_HQ_RATE, 1)
end

return itemObject
