-----------------------------------
--  Beleaguerment
--  Description: Aoe med damage - slow, dia, weight
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: aoe
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4

    damage = xi.mobskills.mobMagicalMove(mob, target, skill, damage, xi.element.DARK, 1.25, xi.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = xi.mobskills.mobFinalAdjustments(damage, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.NUMSHADOWS_2)

    target:takeDamage(damage, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SLOW, 35, 3, 30)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.WEIGHT, 35, 3, 30)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.DIA, 35, 3, 30)

    return damage
end

return mobskillObject