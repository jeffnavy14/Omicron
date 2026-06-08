-----------------------------------
-- Spell: Blinding Fulgor
-- Deals light damage to enemies within range. Additional effect: Flash
-- Spell cost: 116 MP
-- Monster Type: Elementals
-- Spell Type: Magical (Light)
-- Blue Magic Points: 8
-- Stat Bonus: HP +40, STR +4, DEX +4, AGI +4
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-- Combos: Magic Evasion Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0  
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ELEMENTALS
	if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.LIGHT
    params.attribute = xi.mod.STR
    params.attribute = xi.mod.DEX
    params.attribute= xi.mod.AGI
    params.multiplier = 4.75
    params.tMultiplier = 5.0
	 params.tp150 = 1.375
    params.tp300 = 2.0
    params.duppercap = 75
    params.str_wsc = 0.3
    params.dex_wsc = 0.3
    params.vit_wsc = 0.0
    params.agi_wsc = 0.3
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

	     -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.FLASH, 1, 0, 30 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)

    return damage
end

return spellObject
    