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

    local dmgmod = 2
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 1, 2, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASH, xi.mobskills.shadowBehavior.NUMSHADOWS_1)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL)
	
	xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.TERROR, 25, 0, 60)
	
    return dmg
end

return mobskillObject
