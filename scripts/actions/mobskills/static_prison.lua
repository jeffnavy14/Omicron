-----------------------------------
-- Static Prison
--
-- Description: Damage, Paralyze, Shock (-20/tic), and multiple buff dispel.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getHP() > mob:getMaxHP() / 2 then
        return 1
    else
        return 0
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill, action)
    local params = {}

    params.baseDamage     = mob:getMainLvl() + 2
    params.fTP            = { 18.00, 18.00, 18.00 } -- TODO: Capture fTPs
    params.element        = xi.element.THUNDER
    params.attackType     = xi.attackType.MAGICAL
    params.damageType     = xi.damageType.THUNDER
    params.shadowBehavior = xi.mobskills.shadowBehavior.WIPE_SHADOWS

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, action, params)
    local dispelled = math.random(2, 4)

        for i = 1, dispelled do
            target:dispelStatusEffect()
        end

    if xi.mobskills.processDamage(mob, target, skill, action, info) then
        target:takeDamage(info.damage, mob, info.attackType, info.damageType)

        xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.SHOCK, 20, 3, 60)
        xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.PARALYSIS, 30, 0, 15)
    end

    return info.damage
end

return mobskillObject
