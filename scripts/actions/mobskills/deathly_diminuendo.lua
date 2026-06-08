-----------------------------------
--  Deathly diminuendo
--  Description: Curses & BIO
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: aoe
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    local skillParams = {
        baseDamage = damage,
        element = xi.element.DARK,
        fTP = { 1.25, 1.25, 1.25 },
        shadowBehavior = xi.mobskills.shadowBehavior.NUMSHADOWS_2,
    }
    damage = xi.mobskills.mobMagicalMove(mob, target, skill, nil, skillParams).damage

    target:takeDamage(damage, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.CURSE_II, 35, 0, 45)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.BIO, 35, 0, 60)

    return damage
end

return mobskillObject