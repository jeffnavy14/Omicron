-----------------------------------
-- Marine Mayhem
--
-- Description: Instant KO (5'-20') or water damage (<5')
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getHP() > mob:getMaxHP() / 4 then
        return 1
    else
        return 0
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 4
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, xi.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    local koChance = math.random(1, 100)
    local finalDmg = 0

    if koChance <= 20 then
        finalDmg = target:getHP()
    else
        finalDmg = dmg
    end

    target:takeDamage(finalDmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    return finalDmg
end

return mobskillObject
