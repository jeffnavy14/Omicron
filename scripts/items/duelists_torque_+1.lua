-----------------------------------
-- Duelist's Torque +1
-- Increases the number of effects removed by Dispel by 2.
-----------------------------------

local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local itemId = item:getID()

    if target:getEquipID(xi.slot.NECK) == itemId then
        itemObject.onItemEquip(target, item, xi.slot.NECK)
    end
    return 0
end

itemObject.onItemEquip = function(target, item, slot)
    if slot ~= nil and slot ~= xi.slot.NECK then
        return
    elseif target:getEquipID(xi.slot.NECK) ~= item:getID() then
        return
    end

    target:setLocalVar("EXTRA_DISPEL", 1)
end

itemObject.onItemUnequip = function(target, item, slot)
    if slot ~= nil and slot ~= xi.slot.NECK then
        return
    end

    target:setLocalVar("EXTRA_DISPEL", 0)
end

return itemObject