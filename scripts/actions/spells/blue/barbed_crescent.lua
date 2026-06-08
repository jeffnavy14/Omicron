-----------------------------------
-- Spell: Barbed Crescent
-- Damage varies with TP. Additional effect: Accuracy Down.
-- Spell cost: 52 MP
-- Monster Type: Undead
-- Spell Type: Physical
-- Blue Magic Points: 2
-- Stat Bonus: STR -3 DEX +4
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 22 seconds
-- Magic Bursts on: Scission, Gravitation, Darkness
-- Combos: Dual Wield
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.UNDEAD
    params.tpmod = TPMOD_DAMAGE
	params.bonusacc = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.DISTORTION
    params.scattr2 = xi.skillchainType.LIQUEFACATION
    params.attribute = xi.mod.DEX
    params.numhits = 1
    params.multiplier = 4
	 params.tp150 = 4.5
    params.tp300 = 5.0
	params.tp350 = 5.25
    params.azuretp = 5.75
    params.duppercap = 89
    params.str_wsc = 0.0
    params.dex_wsc = 0.7
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
   
    -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.ACCURACY_DOWN,30, 0, 120 },
    }
		
	local damage   = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
		xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)
    return damage
end

return spellObject
