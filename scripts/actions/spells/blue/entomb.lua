-----------------------------------
-- Spell: Entomb
-- Deals earth damage to enemies within range. Additional effect: Petrification.
-- Spell cost: 116 MP
-- Monster Type: Elementals
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 8
-- Stat Bonus: MP +30, VIT +8
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-- Combos: Defense Bonus
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
    params.damageType = xi.damageType.EARTH
    params.attribute = xi.mod.VIT
    params.multiplier = 4.36
    params.diff = 1
    params.tMultiplier = 4.0
    params.tphitslanded = 1
    params.duppercap = 99
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.8
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

        -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.PETRIFICATION, 2, 0, 60 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)
        
    return damage
end

return spellObject
    