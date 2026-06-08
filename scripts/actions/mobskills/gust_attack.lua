-----------------------------------
-- gust
-- Gust: Magical Damage Element: Wind damage, choke (-18 HP/tic), and knockback. Goes through shadows.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * math.random(4, 6)

    damage = xi.mobskills.mobMagicalMove(mob, target, skill, damage, xi.element.WIND, 1, xi.mobskills.magicalTpBonus.NO_EFFECT)
    damage = xi.mobskills.mobFinalAdjustments(damage, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.WIND, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(damage, mob, xi.attackType.MAGICAL, xi.damageType.WIND)
    if not target:hasStatusEffect(xi.effect.CHOKE) then
           target:addStatusEffect(xi.effect.CHOKE, { power = 18, tick = 3, duration = 180, origin = mob })
    end
    return damage
end

return mobskillObject
