-----------------------------------
-- Healing Breeze
-- Description: Restores HP for party members within area of effect.
-- Type: Magical (Wind)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.msg.basic.SELF_HEAL)

    return xi.mobskills.mobHealMove(target, mob:getMaxHP() * 172 / 1024)
end

return mobskillObject
