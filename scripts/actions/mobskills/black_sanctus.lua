-----------------------------------
-- black sanctus
-- dark
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getLocalVar('Sheild') == 1 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3.5

    mob:setAnimationSub(2)
    mob:setLocalVar('Sheild', 1)
    mob:addStatusEffect(xi.effect.PHYSICAL_SHIELD, { power = 1, origin = mob, icon = 0 })
    mob:addStatusEffect(xi.effect.ARROW_SHIELD, { power = 1, origin = mob, icon = 0 })
    mob:addStatusEffect(xi.effect.MAGIC_SHIELD, { power = 1, origin = mob, icon = 0 })


    mob:timer(30000, function(mobArg)
        mobArg:setAnimationSub(0)
        mobArg:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
        mobArg:delStatusEffect(xi.effect.ARROW_SHIELD)   
        mobArg:delStatusEffect(xi.effect.MAGIC_SHIELD)
        mobArg:setLocalVar('Sheild', 0)
    end)

    damage = xi.mobskills.mobMagicalMove(mob, target, skill, damage, xi.element.DARK, 1, xi.mobskills.magicalTpBonus.MAB_BONUS)
    damage = xi.mobskills.mobFinalAdjustments(damage, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, xi.attackType.MAGICAL, xi.damageType.DARK)

    return damage
end

return mobskillObject
