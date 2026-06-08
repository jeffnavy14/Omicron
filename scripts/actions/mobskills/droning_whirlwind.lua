-----------------------------------
-- Droning Whirlwind
--
-- Description: Damage, Knockback, multiple Dispel. Foe gains 50 Magic Defense, and activates aura.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 4
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, xi.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = xi.mobskills.mobFinalAdjustments(info, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.NUMSHADOWS_3)
    local dispelled = math.random(2, 4)

    if info.hitslanded ~= 0 then
        for i = 1, dispelled do
            target:dispelStatusEffect()
        end
    end

    xi.mobskills.mobBuffMove(mob, xi.effect.MAGIC_DEF_BOOST, 50, 0, 30)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)

    return dmg
end

return mobskillObject
