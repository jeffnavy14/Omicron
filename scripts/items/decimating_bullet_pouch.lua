-----------------------------------
-- ID: 6311
-- Item: decimating_bullet_pouch
-- When used, you will obtain one stack of decimating_bullet
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.DECIMATING_BULLET, 99 } })
end

return itemObject
