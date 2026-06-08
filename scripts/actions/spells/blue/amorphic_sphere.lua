-----------------------------------
-- Spell: Amorphic Spikes
-- Delivers a fivefold attack. Damage varies with TP.
-- Spell cost: 79 MP
-- Monster Type: Lizards
-- Spell Type: Physical (Ice)
-- Blue Magic Points: 4
-- Stat Bonus: INT+5, MND+2
-- Level: 98
-- Casting Time: .5 seconds
-- Recast Time: 58.25 seconds
-- Skillchain Element: GRAVITATION, TRANSFIXION 
-- Combos: Gilfinder, Treasure Hunter
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
    params.scattr = xi.skillchainType.GRAVITATION
    params.scattr = xi.skillchainType.TRANSFIXION
    params.numhits = 5
    params.multiplier = 3.0
    params.tp150 = 1.375
    params.tp300 = 1.75
    params.azuretp = 1.875
    params.duppercap = 80
    params.str_wsc = 0.0
    params.dex_wsc = 0.7
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.7
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    return xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
