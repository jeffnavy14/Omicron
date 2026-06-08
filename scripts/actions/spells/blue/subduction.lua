-----------------------------------
-- Spell: Subduction
-- Deals wind damage to enemies within range. Additional effect: Weight
-- Spell cost: 24 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 6
-- Stat Bonus: MP +25, VIT +6, INT +6
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 5 seconds
-- Combos: Magic Attack Bonus
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
        return 0
    
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ARCANA
	if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.WIND
    params.attribute = xi.mod.VIT
    params.attribute = xi.mod.STR
    params.multiplier = 1.63
    params.tMultiplier = 1.5
    params.duppercap = 69
    params.str_wsc = 0.1
    params.dex_wsc = 0.0
    params.vit_wsc = 0.1
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

	     -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.WEIGHT, 5, 3, 90 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)

    return damage
end

return spellObject
    