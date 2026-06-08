-----------------------------------
-- Spell: Leafstorm
-- Deals wind damage within area of effect.
-- Spell cost: 132
-- Monster Type: Plantoids
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: MP+3 MND+1 CHR+1
-- Level: 77
-- Casting Time: 7 seconds
-- Recast Time: 62 seconds
-- Magic Bursts on: Induration, Distortion, and Darkness
-- Combos: Magic Burst Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.treant
    params.attackType = xi.attackType.AoE
    params.damageType = xi.damageType.wind
    params.diff = 0 -- no stat increases magic accuracy
    params.skillType = xi.skill.BLUE_MAGIC
    params.hpMod = 2
    params.lvlMod = 1

    local results = xi.spells.blue.useBreathSpell(caster, target, spell, params, true)
    local damage = results[1]
    local resist = results[2]

    if resist >= 0.5 then
        target:addStatusEffect(xi.effect.PARALYSIS, { power = 15, origin = target, duration = 60 * resist})
    end

    return damage
end

return spellObject
