-----------------------------------
-- Carcharian Verve
--
-- Description: Gains Attack Boost and Magic Attack Boost, removes negative status effects, activates water aura.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:eraseAllStatusEffect()

    local count = target:dispelAllStatusEffect()
    count = count + target:eraseAllStatusEffect()

    if count == 0 then
        skill:setMsg(xi.msg.basic.SKILL_NO_EFFECT)
    else
        skill:setMsg(xi.msg.basic.DISAPPEAR_NUM)
    end

    xi.mobskills.mobBuffMove(mob, xi.effect.BOOST, 100, 0, 30)
    xi.mobskills.mobBuffMove(mob, xi.effect.MAGIC_ATK_BOOST, 100, 0, 30)

    return count
end

return mobskillObject
