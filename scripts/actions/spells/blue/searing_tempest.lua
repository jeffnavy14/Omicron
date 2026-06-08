-----------------------------------
-- Spell: Searing Tempest
-- Deals fire damage to enemies within range. Additional effect: Burn
-- Spell cost: 116 MP
-- Monster Type: Elementals
-- Spell Type: Magical (FIRE)
-- Blue Magic Points: 8
-- Stat Bonus: MP +30, STR +8
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-- Combos: Attack Bonus
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
    params.damageType = xi.damageType.FIRE
    params.attribute = xi.mod.STR
    params.multiplier = 4.36
    params.tMultiplier = 4.5
    params.duppercap = 69
    params.str_wsc = 0.8
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

        -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.BURN,5, 0, 60 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)
        
    return damage
end

return spellObject
    