-----------------------------------
--  Ofnir
--
--  Description: Inflicts damage, Defense Down, and Magical Defense Down on players.
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
    local power = math.random(20, 25)

	skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.DEFENSE_DOWN, 50, 0, 120))
    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.MAGIC_DEF_DOWN, 50, 0, 120))
    
    local dmgmod = 2
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, xi.magic.ele.WIND, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.SLASH, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
    return dmg
end

return mobskillObject
