-----------------------------------
--  hellish crescendo
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
    local damage = mob:getWeaponDmg() * 5

    local skillParams = {
        baseDamage = damage,
        element = xi.element.DARK,
        fTP = { 1.5, 1.5, 1.5 },
        shadowBehavior = xi.mobskills.shadowBehavior.IGNORE_SHADOWS,
    }
    damage = xi.mobskills.mobMagicalMove(mob, target, skill, nil, skillParams).damage

    target:takeDamage(damage, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.PARALYSIS, 1, 0, 60)

    return damage
end

return mobskillObject