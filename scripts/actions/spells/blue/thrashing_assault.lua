-----------------------------------
-- Spell: Thrashing Assault
-- Delivers a fivefold attack. Damage varies with TP.
-- Spell cost: 119 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 7
-- Stat Bonus: HP +20 DEX +8
-- Level: 119
-- Casting Time: .5 seconds
-- Recast Time: 60 seconds
-- Skillchain Element(s): Fusion / Impaction
-- Combos: Double Attack / Triple Attack
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.BEASTMEN
    params.tpmod = TPMOD_DMG
    params.bonusacc = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end

    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.FUSION
    params.scattr2 = xi.skillchainType.IMPACTION
    params.numhits = 5
    params.multiplier = 3
    params.tp150 = 1.25
    params.tp300 = 2
    params.azuretp = 0.625
    params.duppercap = 21
    params.str_wsc = 0.7
    params.dex_wsc = 0.7
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    return xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
