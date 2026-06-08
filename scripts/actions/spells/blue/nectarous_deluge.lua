-----------------------------------
-- Spell: Nectarous Deluge
-- Deals water damage to enemies within range. Additional effect: Poison
-- Spell cost: 97 MP
-- Monster Type: Plantoids
-- Spell Type: Magical (Water)
-- Blue Magic Points: 6
-- Stat Bonus: MND +8
-- Level: 99
-- Casting Time: 3 seconds
-- Recast Time: 45 seconds
-- Combos: Beast Killer
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0  
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.PLANTOIDS
	if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.WATER
    params.attribute = xi.mod.MND
    params.multiplier = 4.5
    params.diff = 2
    params.tMultiplier = 4.0
    params.tphitslanded = 1
    params.duppercap = 99
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.3
    params.chr_wsc = 0.0

	     -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.POISON, 5, 3, 30 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)
    
    return damage
end

return spellObject
    