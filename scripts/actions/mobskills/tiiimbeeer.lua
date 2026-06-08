-----------------------------------
-- Tiiimbeeer
--
-- Description: Damage, Doom (10-count), Plague, Bind, all stats down
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, xi.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
    local effects = { xi.effect.STR_DOWN, xi.effect.DEX_DOWN, xi.effect.VIT_DOWN, xi.effect.AGI_DOWN, xi.effect.INT_DOWN, xi.effect.MND_DOWN,
                      xi.effect.CHR_DOWN, xi.effect.ACCURACY_DOWN, xi.effect.ATTACK_DOWN, xi.effect.EVASION_DOWN,
                      xi.effect.DEFENSE_DOWN, xi.effect.MAGIC_DEF_DOWN, xi.effect.MAGIC_ACC_DOWN, xi.effect.MAGIC_ATK_DOWN }

    for i, effect in ipairs(effects) do
        xi.mobskills.mobStatusEffectMove(mob, target, effect, 50, 0, 30)
    end

    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.DOOM, 10, 3, 30)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.PLAGUE, 5, 3, 30)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.BIND, 50, 3, 10)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)

    return dmg
end

return mobskillObject
