-----------------------------------
-- Spell: Foul Waters
-- Deals water damage to enemies in a fan-shaped area originating from caster. Additional effect: Drown.
-- Spell cost: 76 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Water)
-- Blue Magic Points: 4
-- Stat Bonus: VIT +4
-- Level: 99
-- Casting Time: 3.5 seconds
-- Recast Time: 60 seconds
-- Combos: Resist Silence
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0  
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.AMORPHS
	if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.WATER
    params.attribute = xi.mod.MND
    params.multiplier = 2.25
    params.diff = 2
    params.tMultiplier = 3.0
    params.tphitslanded = 1
    params.duppercap = 69
    params.str_wsc = 0.2
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.2
    params.chr_wsc = 0.0

	    -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.DROWN, 65, 0, 180 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)

    return damage
end

return spellObject
    