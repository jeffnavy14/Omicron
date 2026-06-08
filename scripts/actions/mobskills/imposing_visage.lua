-----------------------------------
-- Imposing_Visage
-- Front AOE version of Absolute Terror.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- Target must be in a 180-degree cone in front of the mob.
    if not target:isInfront(mob, 128) then
        return 1
    elseif mob:getAnimationSub() == 1 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power    = 1
    local duration = math.random(10, 20)

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.TERROR, power, 0, duration))

    return xi.effect.TERROR
end

return mobskillObject
