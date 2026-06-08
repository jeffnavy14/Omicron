-----------------------------------
-- Spell: Paralyzing Triad
-- Delivers a threefold attack. Additional effect: Paralysis. Damage varies with TP.
-- Spell cost: 33 MP
-- Monster Type: Elemental
-- Spell Type: Physical
-- Blue Magic Points: 6
-- Stat Bonus: HP -10 STR +4 DEX +4
-- Level: 99
-- Casting Time: 1 seconds
-- Recast Time: 15 seconds
-- Magic Bursts on:  Gravitation
-- Combos: Skillchain Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ELEMENTAL
    params.tpmod = TPMOD_ACC
    params.tpmod = TPMOD_ATT
	params.bonusacc = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
	elseif caster:hasStatusEffect(xi.effect.EFFLUX) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.GRAVITATION
    params.attribute = xi.mod.INT
    params.numhits = 3
    params.multiplier = 3.0
    params.tp150 = 3.25
    params.tp300 = 3.5
    params.tp350 = 3.6
    params.azuretp = 4.53125
    params.duppercap = 19
    params.str_wsc = 0.7
    params.dex_wsc = 0.7
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
	params.ignorefstrcap = true
	
	  -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.PARALYSIS,2500, 0, 60 },
    }
   
	local damage   = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
		xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)
    return damage
end

return spellObject
