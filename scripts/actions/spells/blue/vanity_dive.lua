-----------------------------------
-- Spell: Vanity Dive
-- Damage varies with TP.
-- Spell cost: 58 MP
-- Monster Type: Empty
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: AGI +3 CHR -2
-- Level: 70
-- Casting Time: .5 seconds
-- Recast Time: 40 seconds
-- Skillchain Element(s): Scission
-- Combos: Accurcy Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.EMPTY
    params.tpmod = TPMOD_DMG
    params.bonusacc = 60
    params.bonusacc = 66
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end

    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.SCISSION
    params.numhits = 1
    params.multiplier = 3
    params.tp150 = 3.0
    params.tp300 = 4.5
    params.azuretp = 0.625
    params.duppercap = 78
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
