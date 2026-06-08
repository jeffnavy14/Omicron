-----------------------------------
-- ID: 6532
-- Pluton coffer
-- Breaks up a Pluton coffer
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, {{xi.item.PLUTON, 99}})
end

return itemObject
