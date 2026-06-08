-----------------------------------
-- Spell: Cruel Joke
-- Inflicts Doom on enemies within range.
-- Spell cost: 187 MP
-- Monster Type: Undead
-- Spell Type: Magical (Dark)
-- Stat Bonus:
-- Level: 99
-- Casting Time: 3 seconds
-- Recast Time: 30 seconds
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    if caster:hasStatusEffect(xi.effect.UNBRIDLED_LEARNING) or
    caster:hasStatusEffect(xi.effect.UNBRIDLED_WISDOM) then
        return 0
    else
        return spell:setMsg(xi.msg.basic.STATUS_PREVENTS)
    end
end
spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.UNDEAD
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.DARK
    params.effect = xi.effect.DOOM
    local power = 50
    local tick = 3
    local duration = 60
    local resistThreshold = 0.0
    local isGaze = false
    local isConal = true

    if target:isNM() then
         skill:setMsg(xi.msg.basic.SKILL_MISS)
    else
         return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params, power, tick, duration, resistThreshold, isGaze, isConal)
    end
end

return spellObject
    