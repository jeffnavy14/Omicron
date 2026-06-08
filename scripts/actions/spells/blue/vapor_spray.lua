-----------------------------------
-- Spell: Vapor Spray
-- Deals Water breath damage to enemies within a fan-shaped area originating from the caster.
-- Spell cost: 172 MP
-- Monster Type: Luminians
-- Spell Type: Breath (Water)
-- Blue Magic Points: 3
-- Stat Bonus: HP+15, VIT+4
-- Level: 96
-- Casting Time: 3 seconds
-- Recast Time: 56 seconds
-- Combos: Max MP Boost
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.LUMINION
    params.attackType = xi.attackType.BREATH
    params.damageType = xi.damageType.WATER
    params.diff = 0
    params.skillType = xi.skill.BLUE_MAGIC
    params.hpMod = 2
    params.lvlMod = 1

    local damage = xi.spells.blue.useBreathSpell(caster, target, spell, params, true)

    return damage
end

return spellObject