-----------------------------------
-- Spell: Palling Salvo
-- Deals dark damage to enemies within range. Additional effect: Bio
-- Spell cost: 175 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 7
-- Stat Bonus: DEX +6, AGI +6
-- Level: 99
-- Casting Time: 2 seconds
-- Recast Time: 45 seconds
-- Combos: Tenacity
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0  
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.VERMIN
	if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.DARK
    params.attribute = xi.mod.AGI
    params.multiplier = 5.0
    params.tMultiplier = 5.37
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.6
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

	     -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.BIO, 5, 10, 90 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)

    return damage
end

return spellObject
    