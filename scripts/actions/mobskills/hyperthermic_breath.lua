-----------------------------------
-- Hyperthermic Breath
-- Family: Wyrm
-- Description: Fire-elemental Breath damage in front of the Wyrm. Inflicts Defense Down and Magic Defense Down to players directly in line of the breath. Standing to the side reduces the damage.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if not target:isInfront(mob, 128) then
        return 1
    elseif mob:getAnimationSub() == 1 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill, action)
    local params = {}

    params.percentMultipier = 0.15
    params.damageCap        = 1596
    params.bonusDamage      = 0
    params.mAccuracyBonus   = { 0, 0, 0 }
    params.resistStat       = xi.mod.INT
    params.element          = xi.element.FIRE
    params.attackType       = xi.attackType.BREATH
    params.damageType       = xi.damageType.FIRE
    params.shadowBehavior   = xi.mobskills.shadowBehavior.IGNORE_SHADOWS

    local info = xi.mobskills.mobBreathMove(mob, target, skill, action, params)

    info.damage  = utils.conalDamageAdjustment(mob, target, skill, info.damage, 0.2)

    if xi.mobskills.processDamage(mob, target, skill, action, info) then
        target:takeDamage(info.damage, mob, info.attackType, info.damageType)

        -- Additional Effect: Defense Down and Magic Defense Down
        xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.DEFENSE_DOWN, 50, 0, 180)
        xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.MAGIC_DEF_DOWN, 50, 0, 180)
    end

    return info.damage
end

return mobskillObject
