-----------------------------------
--  Zantetsuken Kai
--
--  Description: Inflicts critical damage of -95% HP.
--  Type: Magical
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
    local targHP = target:getMaxHP()
	local dmg = (targHP * .95)
	
	target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
	
	return dmg
	
end

return mobskillObject
