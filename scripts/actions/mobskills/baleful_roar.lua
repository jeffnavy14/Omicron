-----------------------------------
-- Baleful Roar (Mireu)
-- Front AOE version of Horrid Roar. Takes all buffs + Enmity reset. Only Food effects and your Elvorseal aren't taken.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if not target:isInfront(mob, 128) then
        return 1
    elseif mob:getAnimationSub() == 1 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numDispelled = target:dispelAllStatusEffect(xi.effectFlag.DISPELABLE)

    if numDispelled == 0 then
        skill:setMsg(xi.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(xi.msg.basic.SKILL_ERASE)
    end

    mob:resetEnmity(target)

    return numDispelled
end

return mobskillObject
