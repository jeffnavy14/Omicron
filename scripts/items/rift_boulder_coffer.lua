-----------------------------------
-- ID: 6534
-- Boulder Coffer
-- Breaks up a Boulder Coffer
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.RIFTBORN_BOULDER, 99 } })
end

return itemObject