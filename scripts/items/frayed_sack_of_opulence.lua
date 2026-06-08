-----------------------------------
-- ID: 6488
-- Frayed sack of opulence
-- Taupe Stone x6~12
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.TAUPE_STONE, math.random(6, 12) } })
end

return itemObject
