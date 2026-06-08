-----------------------------------
-- Spell: Glutinous Dart
-- Damage Varies With TP.
-- Spell cost: 16 MP
-- Monster Type: BEASTMEN
-- Spell Type: Physical
-- Blue Magic Points: 2
-- Stat Bonus: HP +15 STR +3 DEX +3 INT -3
-- Level: 99
-- Casting Time: 1 seconds
-- Recast Time: 6 seconds
-- Magic Bursts on: Fragmentation
-- Combos: Max HP Boost
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.BEASTMEN
    params.tpmod = TPMOD_DAMAGE
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.PIERCING
    params.scattr = xi.skillchainType.FRAGMENTATION
    params.attribute = xi.mod.DEX
    params.numhits = 1
    params.multiplier = 3.0
    params.tMultiplier = 2.0
    params.tp150 = 1.0
    params.tp300 = 2.5
    params.duppercap = 89
    params.str_wsc = 0.7
    params.dex_wsc = 0.0
    params.vit_wsc = 0.7
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0


    damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)

    return damage
end

return spellObject
