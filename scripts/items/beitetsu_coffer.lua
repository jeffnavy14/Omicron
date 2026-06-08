-----------------------------------
-- ID: 6533
-- Beitetsu coffer
-- Breaks up a Beitetsu coffer
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.BEITETSU, 99 } })
end

return itemObject
