-----------------------------------
-- Tabbiyaa Gambit
--
-- Description: Self-heal, erase and occasionally gives damage sheild (Phalanx)
-- Type: Healing
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- Lets not heal if we haven't taken any damage..
    if mob:getHPP() == 100 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:eraseStatusEffect()
    mob:addStatusEffect(xi.effect.PHALANX, { power = 25, duration = 30, origin = mob })
    skill:setMsg(xi.msg.basic.SELF_HEAL)
    -- Assuming its a 4-6% heal based on its max HP and numbers quoted on wiki.
    return xi.mobskills.mobHealMove(mob, mob:getMaxHP() * (math.random(25, 45) * 0.01))
end

return mobskillObject
