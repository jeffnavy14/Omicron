-----------------------------------
-- Spell: Gates of Hades
-- Deals fire damage to enemies within area of effect. Additional effect: Burn.
-- Spell cost: 156 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 
-- Stat Bonus: 
-- Level: 97
-- Casting Time: 3.5 seconds
-- Recast Time: 30 seconds
-- Combos:
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    if caster:hasStatusEffect(xi.effect.UNBRIDLED_LEARNING) or
    caster:hasStatusEffect(xi.effect.UNBRIDLED_WISDOM) then
        return 0
    else
        return spell:setMsg(xi.msg.basic.STATUS_PREVENTS)
    end
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.BEASTS
	if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.FIRE
    params.attribute = xi.mod.STR
    params.attribute = xi.mod.DEX
    params.multiplier = 5.36
    params.tMultiplier = 5.0
    params.tphitslanded = 1
    params.tp150 = 1.375
    params.tp300 = 2.0
    params.duppercap = 99
    params.str_wsc = 0.2
    params.dex_wsc = 0.2
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.ftpMod = { 1.0, 2.5, 5.0 }
	
	     -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.BURN, 10, 3, 90 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)

    return damage
end

return spellObject
    