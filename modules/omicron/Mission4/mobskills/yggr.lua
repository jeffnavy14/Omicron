-----------------------------------
--  Yggr
--
--  Description: Gains an intimidation and attack boost effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown *assuming 10y
-----------------------------------
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.INTIMIDATE, power, 1, 60)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, xi.effect.ATTACK_BOOST, power, 1, 60)

end

return mobskillObject
