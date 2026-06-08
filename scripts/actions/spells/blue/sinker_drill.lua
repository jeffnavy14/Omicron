-----------------------------------
-- Spell: Sinker Drill
-- Delivers a fivefold attack. Damage varies with TP.
-- Spell cost: 91 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 6
-- Stat Bonus: STR +4 DEX +4 VIT +4
-- Level: 99
-- Casting Time: 3 seconds
-- Recast Time: 20 seconds
-- Skillchain Element(s): Gravitation / Reverberation 
-- Combos: Critical attack bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.BEAST
    params.tpmod = TPMOD_DMG
    params.bonusacc = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end

    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.PIERCING
    params.scattr = xi.skillchainType.GRAVITATION
    params.scattr2 = xi.skillchainType.REVERBERATION
    params.numhits = 5
    params.multiplier = 3
    params.tp150 = 1.0
    params.tp300 = 2.5
    params.azuretp = 2.625
    params.duppercap = 21
    params.str_wsc = 0.7
    params.dex_wsc = 0.0
    params.vit_wsc = 0.7
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    return xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
