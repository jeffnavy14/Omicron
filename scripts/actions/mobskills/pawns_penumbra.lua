-----------------------------------
--  pawns penumbra
--  Description: damage, dispell, resets all job ability timers 
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

    damage = xi.mobskills.mobMagicalMove(mob, target, skill, damage, xi.element.DARK, 1.5, xi.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = xi.mobskills.mobFinalAdjustments(damage, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
    target:dispelAllStatusEffect()
        if math.random(1,15) == 1 then 
            xi.customutil.resetJobAbility(target)
        end
    return damage
end

return mobskillObject