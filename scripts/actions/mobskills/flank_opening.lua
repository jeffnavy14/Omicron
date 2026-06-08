-----------------------------------
--  Flank Opening
--  Description: Aoe High Damage/knockback & gains Defense Down Aura
--  Type: Physical
--  Range: aoe
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 3
    local accmod = 2
    local dmgmod = 1.1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
        target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
        mob:addStatusEffect(xi.effect.DEFENSE_DOWN, { power = 10, subType = xi.effect.DEFENSE_DOWN, subPower = 0, tick = 3, duration = 30, tier = xi.auraTarget.ENEMIES, flag = xi.effectFlag.AURA, origin = mob })
    return dmg
end

return mobskillObject