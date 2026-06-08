-----------------------------------
-- Spell: Droning Whirlwind
-- Deals wind damage to enemies within area of effect. Additional effect: Dispel
-- Spell cost: 224 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Wind)
-- Stat Bonus:
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 5 seconds
-- Combos:
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
     if caster:hasStatusEffect(xi.effect.UNBRIDLED_LEARNING) or 
     caster:hasStatusEffect(xi.effect.UNBRIDLED_WISDOM) then
return 0
    else
        return spell:setMsg(xi.basic.STATUS_PREVENTS)
    end
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
    params.damageType = xi.damageType.WIND
	params.diff = 0 -- no stat increases magic accuracy
    params.skillType = xi.skill.BLUE_MAGIC
    params.attribute = xi.mod.INT
    params.multiplier = 4.0
    params.tMultiplier = 4.5
    params.duppercap = 75
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 2.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
    local dispel = target:dispelStatusEffect()

    return damage, dispel
end

return spellObject
    