-----------------------------------
--  Yggr
--
--  Description: Gains an intimidation and attack boost effect.
--  Type: Status Boost
--  Utsusemi/Blink absorb: n/a
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
	local duration = 90
	
	skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.ATTACK_BOOST, power, 0, duration))
    local dmg = (xi.mobskills.mobBuffMove(mob, xi.effect.INTIMIDATE, 100, 0, math.random(25, 32)))

	return xi.effect.INTIMIDATE

end

return mobskillObject
