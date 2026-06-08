-----------------------------------
-- Spell: Leafstorm
-- Deals wind damage within area of effect.
-- Spell cost: 132
-- Monster Type: Plantoids
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: MP+3 MND+1 CHR+1
-- Level: 77
-- Casting Time: 7 seconds
-- Recast Time: 62 seconds
-- Magic Bursts on: Induration, Distortion, and Darkness
-- Combos: Magic Burst Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.treant
	if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
	params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.WIND
	params.attribute = xi.mod.STR
    params.diff = 0
    params.multiplier = 2.75
    params.tMultiplier = 2
    params.tphitslanded = 1
    params.duppercap = 99
    params.str_wsc = 0.3
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
	params.resistThreshold 	= 0.50
	
	     -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.PARALYSIS, 15, 0, 60 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)

    return damage
end

return spellObject
