-----------------------------------
-- ID: 13121
-- Beast Collar
-- !exec player:addItem({id=13121, signature="CraftMaster"})
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target, itemCheck, param, caster)
    return 0
end

itemObject.onItemEquip  = function(user, item)
    if item:getSignature() == 'CraftMaster' then
        user:addMod(xi.mod.FISH, 2)
        user:addMod(xi.mod.WOOD, 2)
        user:addMod(xi.mod.SMITH, 2)
        user:addMod(xi.mod.GOLDSMITH, 2)
        user:addMod(xi.mod.CLOTH, 2)
        user:addMod(xi.mod.LEATHER, 2)
        user:addMod(xi.mod.BONE, 2)
        user:addMod(xi.mod.ALCHEMY, 2)
        user:addMod(xi.mod.COOK, 2)
    end
end

itemObject.onItemUnequip = function(user, item)
    if item:getSignature() == 'CraftMaster' then
        user:delMod(xi.mod.FISH, 2)
        user:delMod(xi.mod.WOOD, 2)
        user:delMod(xi.mod.SMITH, 2)
        user:delMod(xi.mod.GOLDSMITH, 2)
        user:delMod(xi.mod.CLOTH, 2)
        user:delMod(xi.mod.LEATHER, 2)
        user:delMod(xi.mod.BONE, 2)
        user:delMod(xi.mod.ALCHEMY, 2)
        user:delMod(xi.mod.COOK, 2)
    end
end

return itemObject