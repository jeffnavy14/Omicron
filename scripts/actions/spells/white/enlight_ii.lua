-----------------------------------
-- Spell: Enlight
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local effect = xi.effect.ENLIGHT
    local magicskill = caster:getSkillLevel(xi.skill.DIVINE_MAGIC)
    local potency = 0

    local jpBonus = 0
    if caster.getJobPointLevel and xi.jp and xi.jp.ENLIGHT_EFFECT then
        jpBonus = caster:getJobPointLevel(xi.jp.ENLIGHT_EFFECT)
    end

    if magicskill <= 500 then
        potency = (2 * math.floor((magicskill + 85) / 13)) + math.floor((magicskill + 85) / 26) + jpBonus
    else
        potency = (2 * math.floor((magicskill + 400) / 20)) + math.floor((magicskill + 400) / 40) + jpBonus
    end

    if target:addStatusEffect(effect, { power = potency, origin = caster, duration = 180 }) then
        spell:setMsg(xi.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return effect
end

return spellObject
