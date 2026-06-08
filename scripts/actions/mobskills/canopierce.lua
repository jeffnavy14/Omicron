-----------------------------------
-- Canopierce
--
-- Description: Damage is divided between targets in an area of effect. Additional effect: Rasp
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local targets = xi.mobskills.getTargets(mob, skill)
    local targetCount = #targets

    if targetCount == 0 then
        return 0
    end

    -- Calculate total damage based on the main target
    local numhits   = 1
    local accmod    = 1
    local ftp       = 2
    local info      = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, xi.mobskills.physicalTpBonus.NO_EFFECT)
    local totalDmg  = xi.mobskills.mobFinalAdjustments(info, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    local splitDmg  = math.floor(totalDmg / targetCount)

    for _, aoeTarget in ipairs(targets) do
        aoeTarget:takeDamage(splitDmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
        xi.mobskills.mobStatusEffectMove(mob, aoeTarget, xi.effect.RASP, 50, 3, 60)
    end

    return splitDmg
end

return mobskillObject
