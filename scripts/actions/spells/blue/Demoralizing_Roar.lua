-----------------------------------
-- Spell: Demoralizing Roar
-- Weakens the attack of enemies within range
-- Spell cost: 46 MP
-- Monster Type: Lizard
-- Spell Type: Magical (Water)
-- Blue Magic Points: 4
-- Stat Bonus: STR-2 VIT+3
-- Level: 80
-- Casting Time: 2 seconds
-- Recast Time: 20 seconds
-- Magic Bursts on: Scission, Gravitation, and Darkness
-- Combos: Double Attack, Triple Attack
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.LIZARDS
    params.effect = xi.effect.ATTACK_DOWN
    local power = 2500
    local tick = 0
    local duration = 30
    local resistThreshold = 0.5
    local isGaze = false
    local isConal = true

    return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params, power, tick, duration, resistThreshold, isGaze, isConal)
end

return spellObject
