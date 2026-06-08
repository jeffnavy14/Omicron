-----------------------------------
-- Spell: Atra. Libations
-- Steals HP from enemies within range. Ineffective against updead.
-- Spell cost: 164 MP
-- Monster Type: Undead
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 6
-- Stat Bonus: VIT +8
-- Level: 99
-- Casting Time: 4 seconds
-- Recast Time: 180 seconds
-- Combos: Defense Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0  
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.UNDEAD
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.DARK
    params.diff = 0
    params.skillType = xi.skill.BLUE_MAGIC
    params.dmgMultiplier = .15
 
    return xi.spells.blue.useDrainSpell(caster, target, spell, params, 0, false)
end

return spellObject
    