-----------------------------------
--  Geirrothr
--
--  Description: Inflicts Damage based on difficulty divided by any players in range. Additional effect: Bind.
--  Type: Physical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 20y
-----------------------------------
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = math.random(20, 25)

    msg(xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.BIND, power, 0, 60))

    local dmgmod = 2
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, xi.magic.ele.WIND, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = (xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASH, xi.mobskills.shadowBehavior.WIPE_SHADOWS)) / skill:getTotalTargets()
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.DARK)
    return dmg
end

return mobskillObject
