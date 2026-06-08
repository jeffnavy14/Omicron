-----------------------------------
-- Zesho Meppo
-- Katana weapon skill
-- Skill Level: 350
-- Delivers a fourfold attack. Damage varies with TP.
-- Modifier: DEX:25% AGI:25%
-- Skillchain Properties: Induration, Reverberation, Fusion
-- 100%TP    200%TP    300%TP
-- 4.0       8.0       18.715
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 4
    local accmod  = 1
    local ftp     = 4.0
    local info    = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, xi.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg     = xi.mobskills.mobFinalAdjustments(info, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end

return mobskillObject
