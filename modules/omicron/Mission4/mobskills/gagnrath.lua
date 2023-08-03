-----------------------------------
--  Gagnrath
--
--  Description: Inflicts damage and Terror.
--  Type: Physical
--  Utsusemi/Blink absorb: 1
--  Range: Unknown *assuming 10y
-----------------------------------
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = math.random(20, 25)

    msg(xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.TERROR, power, 0, 60))

    local dmgmod = 2
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, mob:getWeaponDmg() * 4, xi.magic.ele.WIND, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASH, xi.mobskills.shadowBehavior.NUMSHADOWS_1)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL)
    return dmg
end

return mobskillObject
