-----------------------------------
-- ID: 6367
-- codex of etchings
-- 1-8 memories obtained per Codex
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    local random = math.random(1,8)

    npcUtil.giveItem(target, { { xi.item.ETCHED_MEMORY, random } })
end

return itemObject
