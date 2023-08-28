-----------------------------------
--  Valfodr
--
--  Description: Inflicts damage, Curse, and silence.
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
	local typeEffect = 0
    local currentMsg = xi.msg.basic.NONE
    local msg = xi.msg.basic.NONE

    msg = xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.CURSE_I, 25, 0, 300)

    if msg == xi.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = xi.effect.CURSE_I
        currentMsg = msg
    end

    msg = xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SILENCE, 20, 0, 180)

    if msg == xi.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = xi.effect.SILENCE
        currentMsg = msg
    end

    skill:setMsg(currentMsg)
	local dmgmod = 2
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, xi.magic.ele.WIND, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.SLASH, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
    return dmg
end

return mobskillObject
