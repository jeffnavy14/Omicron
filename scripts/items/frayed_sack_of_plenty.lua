-----------------------------------
-- ID: 6487
-- Frayed sack of plenty
-- 	Fern Stone x6~12
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.FERN_STONE, math.random(6, 12) } })
end

return itemObject
