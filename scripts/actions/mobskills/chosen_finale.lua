-----------------------------------
-- Chosen Finale
-- K.O.s all Alter Egos within its area of effect. Can K.O. Players
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
    local success = false

    if target:isAlive() then
        if target:isTrust() then
            target:die()
            success = true
        elseif target:isPC() and math.random(1, 100) <= 10 then
            target:die()
            success = true
        end
    end

    if not success then
        skill:setMsg(xi.msg.basic.SKILL_NO_EFFECT)
    end

    return 0
end

return mobskillObject
