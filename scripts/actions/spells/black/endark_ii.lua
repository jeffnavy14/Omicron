-----------------------------------
-- Spell: Endark
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local effect = xi.effect.ENDARK
    local magicskill = caster:getSkillLevel(xi.skill.DARK_MAGIC)
    local potency = 0

    if magicskill >= 500 then
        potency = math.floor((math.floor((magicskill + 2) * 5 / 66) + 7) * 2.5)
    else
        potency = math.floor(math.floor((magicskill + 400) / 20) * 2.5)
    end

    if target:addStatusEffect(effect, { power = potency, origin = caster, duration = 180 }) then
        spell:setMsg(xi.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return effect
end

return spellObject
