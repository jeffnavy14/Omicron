-----------------------------------
-- Batholithic Shell
--
-- Description: Gains Blaze Spikes, Stoneskin, Haste, Attack Bonus, and Magic Attack Bonus. Player may dispel buffs.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.BLAZE_SPIKES, 50, 0, 160))

    xi.mobskills.mobBuffMove(mob, xi.effect.STONESKIN, 1000, 0, 300)
    xi.mobskills.mobBuffMove(mob, xi.effect.HASTE, 50, 0, 160)
    xi.mobskills.mobBuffMove(mob, xi.effect.ATTACK_BOOST, 50, 0, 160)
    xi.mobskills.mobBuffMove(mob, xi.effect.MAGIC_ATK_BOOST, 50, 0, 160)

    return xi.effect.BLAZE_SPIKES
end

return mobskillObject
