-----------------------------------
-- Bored to Tears
-- Description: Slow
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local slowed  = xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SLOW, 1250, 0, 120)

    skill:setMsg(xi.msg.basic.SKILL_ENFEEB_IS)
    if slowed then
        return xi.effect.SLOW
    else
        skill:setMsg(xi.msg.basic.SKILL_MISS) -- no effect
    end

    return nil
end

return mobskillObject
