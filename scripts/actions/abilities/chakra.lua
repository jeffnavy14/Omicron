-----------------------------------
-- Ability: Chakra
-- Cures certain status effects and restores a small amount of HP to user.
-- Obtained: Monk Level 35
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    -- Premium Heart: each counter reduces next Chakra recast by 1s
    local bonus = player:getLocalVar('PREMIUM_HEART_CHAKRA_BONUS')
    if bonus > 0 then
        ability:setRecast(math.max(0, ability:getRecast() - bonus))
        player:setLocalVar('PREMIUM_HEART_CHAKRA_BONUS', 0)
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    return xi.job_utils.monk.useChakra(player, target, ability)
end

return abilityObject
