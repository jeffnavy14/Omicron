-----------------------------------
-- Spell: Osmosis
-- Steals an enemy's HP and one beneficial status effect. Ineffective against undead.
-- Spell cost: 47 MP
-- Monster Type: VORAGEANS
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 5
-- Stat Bonus: MND +3 CHR +2
-- Level: 84
-- Casting Time: 4 seconds
-- Recast Time: 120 seconds
-- Combos: Magic defense Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0  
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.VORAGEAN
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.DARK
    params.diff = 0 -- no stat increases magic accuracy
    params.skillType = xi.skill.BLUE_MAGIC
    params.dmgMultiplier = 5

    caster:stealStatusEffect(target)
    return xi.spells.blue.useDrainSpell(caster, target, spell, params, 0, false)
end

return spellObject
    