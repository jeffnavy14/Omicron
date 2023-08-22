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
    target:PrintToPlayer("The true power of Gungnir cometh not from the blade herself, but from the countless souls it hath sent to the corpse-halls of the Underworld!", 13)
	local needles = 10000 / skill:getTotalTargets()
    local dmg     = xi.mobskills.mobFinalAdjustments(needles, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.DARK)

    return dmg
end

return mobskillObject
