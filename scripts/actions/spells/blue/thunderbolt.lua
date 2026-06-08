-----------------------------------
-- Spell: Thunderbolt
-- Deals Lightning damage to enemies within the area of effect. Additional effect: "Stun".
-- Spell cost: 138 MP
-- Monster Type: Beast
-- Spell Type: Magical (THunder)
-- Stat Bonus:
-- Level: 95
-- Casting Time: 8.5 seconds
-- Recast Time: 30 seconds
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
    params.ecosystem = xi.ecosystem.BEAST
	if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.THUNDER
    params.diff = 0 -- no stat increases magic accuracy
    params.skillType = xi.skill.BLUE_MAGIC
    params.attribute = xi.mod.INT
    params.attribute = xi.mod.MND
    params.multiplier = 4.0
    params.tMultiplier = 4.5
    params.duppercap = 75
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.2
    params.chr_wsc = 0.0
    
	     -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.STUN, 5, 3, 10 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)

    return damage
end

return spellObject
