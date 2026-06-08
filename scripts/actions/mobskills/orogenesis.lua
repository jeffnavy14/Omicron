-----------------------------------
-- Orogenesis
-- AoE damage, Weight, Choke, & Evasion Down
-- Type: Physical (AoE)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 2
    local dmgmod = 0.3
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, mob:getWeaponDmg() * dmgmod, xi.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.PIERCING, info.hitslanded)

    target:dispelStatusEffect()
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.PIERCING)

    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.WEIGHT, 50, 0, 60)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.CHOKE, 50, 0, 60)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.EVASION_DOWN, 50, 0, 60)

    return dmg
end

return mobskillObject
