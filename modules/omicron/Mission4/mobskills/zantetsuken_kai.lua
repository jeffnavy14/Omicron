-----------------------------------
--  Ofnir
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
    
	local HPcur = target:getHP()
    
	local dmg = target:setHP(HPcur * 0.05)
	target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
    return dmg
end

return mobskillObject
