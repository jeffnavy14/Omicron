-----------------------------------
-- Blistering Roar
--
-- Description: Damage and Terror Gains Defense Bonus, Magic Defense Bonus, flame aura
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, xi.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.TERROR, 1, 0, 9)
    xi.mobskills.mobBuffMove(mob, xi.effect.MAGIC_DEF_BOOST, 50, 0, 90)
    xi.mobskills.mobBuffMove(mob, xi.effect.DEFENSE_BOOST, 50, 0, 90)

    target:setTP(0)

    return dmg
end

return mobskillObject
