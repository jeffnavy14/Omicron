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
    local numhits = 1
    local accmod = 4
    local dmgmod = 2.1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.WEIGHT, mob:getMainLvl() / 2.5, 3, 30)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.MAX_HP_DOWN, 50, 0, 30)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.MAX_TP_DOWN, 50, 0, 30)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.MAX_MP_DOWN, 50, 0, 30)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.STR_DOWN, 50, 0, 30)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.DEX_DOWN, 50, 0, 30)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.VIT_DOWN, 50, 0, 30)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.AGI_DOWN, 50, 0, 30)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.INT_DOWN, 50, 0, 30)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.MND_DOWN, 50, 0, 30)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.CHR_DOWN, 50, 0, 30)


    return dmg


end

return mobskillObject