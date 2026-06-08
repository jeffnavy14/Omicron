-----------------------------------
-- Seeping Dread
-- Causes Terror, which causes the victim to be stunned for the duration of the effect, this can not be removed.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power    = 30
    local duration = 30

    if skill:isAoE() then
        duration = 10
    end

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.TERROR, power, 0, duration))

    return xi.effect.TERROR
end

return mobskillObject
