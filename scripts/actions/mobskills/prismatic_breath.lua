-----------------------------------
--  Prismatic Breath
--
--  Description: AoE (conal) damage & Inhibit TP (Store TP reduction)
--  
--
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill, action)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.INHIBIT_TP, 50, 0, 60)

    local params = {}
    params.percentMultipier = 0.15
    params.fTP = { 3, 3, 3 } -- Assuming 3 is meant to be a fixed fTP for all TP levels
    params.element = xi.element.EARTH
    params.damageCap = 500
    params.attackType = xi.attackType.BREATH
    params.damageType = xi.damageType.EARTH
    params.shadowBehavior = xi.mobskills.shadowBehavior.IGNORE_SHADOWS

    local info = xi.mobskills.mobBreathMove(mob, target, skill, action, params)
    local dmg = xi.mobskills.mobFinalAdjustments(info, mob, skill, target, xi.attackType.BREATH, xi.damageType.EARTH, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.EARTH, { breakBind = false })

    return dmg
end

return mobskillObject
