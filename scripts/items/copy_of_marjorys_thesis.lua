-----------------------------------
-- ID: 6718
-- Item: Copy of Marjory's Thesis
-- Use: Grants 200 alter ego points.
-- Source: Marjory in Ru'Lude Gardens after RoE3 "Way Over Capacity". Added March 2026.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target, user, item, action)
    user:addCurrency('alter_ego_points', 200, 65535)
    -- See trust_magic_primer.lua note. Real MsgBasic ID still pending.
    user:printToPlayer(string.format('You obtain 200 alter ego points. Total: %d.',
        user:getCurrency('alter_ego_points')))
end

return itemObject
