-----------------------------------
-- Divine Favor
-- Description: Self-buff.
-- Mechanics: 
-- 1. Boosts the damage of the next "Level ? Holy" (handled in Holy scripts).
-- 2. Erases debuffs from the user (Cait Sith).
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- 1. Apply Divine Favor Logic
    -- Note: xi.effect.DIVINE_FAVOR is not a standard effect ID.
    -- We use a LocalVar to track this state instead.
    mob:setLocalVar("DivineFavor", 1)

    -- 2. Erase Debuffs
    -- The prompt notes she uses this to erase her debuffs. 
    -- We iterate through common enfeebles and remove them.
    local effectsToErase = {
        xi.effect.DIA, xi.effect.BIO, xi.effect.BLINDNESS, xi.effect.PARALYSIS,
        xi.effect.SILENCE, xi.effect.SLOW, xi.effect.WEIGHT, xi.effect.POISON,
        xi.effect.STUN, xi.effect.SLEEP_I, xi.effect.SLEEP_II, xi.effect.BIND,
        xi.effect.GRAVITY, xi.effect.DISPEL, xi.effect.ELEGY, xi.effect.REQUIEM,
        xi.effect.THRENODY, xi.effect.ADDLE, xi.effect.BURN, xi.effect.FROST,
        xi.effect.CHOKE, xi.effect.RASP, xi.effect.SHOCK, xi.effect.DROWN, xi.effect.PLAGUE,
        xi.effect.CURSE, xi.effect.DOOM, xi.effect.DISEASE,
    }

    for _, effectId in ipairs(effectsToErase) do
        if mob:hasStatusEffect(effectId) then
            mob:delStatusEffect(effectId)
        end
    end

    -- Visual/Message: "Cait Sith gains the effect of Divine Favor."
    skill:setMsg(xi.msg.basic.SKILL_GAIN_EFFECT)

    return 0
end

return mobskillObject