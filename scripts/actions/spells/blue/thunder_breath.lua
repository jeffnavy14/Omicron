-----------------------------------
-- Spell: Thunder Breath
-- Deal thunder breath damage to enemies with a fan-shaped area originating from the caster.
-- Spell cost: 193 MP
-- Monster Type: Dragons
-- Spell Type: Breath (THUNDER)
-- Blue Magic Points: 4
-- Stat Bonus: STR+2, DEX+2
-- Level: 97
-- Casting Time: 7 seconds
-- Recast Time: 63 seconds
-- Combos:
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.DRAGON
    params.attackType = xi.attackType.BREATH
    params.damageType = xi.damageType.THUNDER
    params.diff = 0 -- no stat increases magic accuracy
    params.skillType = xi.skill.BLUE_MAGIC
    params.hpMod = 2
    params.lvlMod = 1
    params.tphitslanded = 1

    local damage = xi.spells.blue.useBreathSpell(caster, target, spell, params, true)
    
    return damage
end

return spellObject
