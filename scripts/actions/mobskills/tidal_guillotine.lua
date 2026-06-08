-----------------------------------
-- Tidal Guillotine
--
-- Description: Damage or Instant KO if damage dealt would be greater than 50% of player's HP. Additional effect: Enmity reset
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

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 4
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, xi.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    local finalDmg = dmg
    if dmg > (target:getHP() / 2) then
        finalDmg = target:getHP()
    end

    target:takeDamage(finalDmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

    return finalDmg
end

return mobskillObject
