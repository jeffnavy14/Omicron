-----------------------------------
-- Spell: Cesspool
-- Deals Water damage to enemies within range. Additional Effect: Plague
-- Spell cost: 166 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Water)
-- Stat Bonus:
-- Level: 99
-- Casting Time: 3 seconds
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
    params.ecosystem = xi.ecosystem.AMORPHS
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.WATER
    params.attribute = xi.mod.INT
    params.multiplier = 6.5
    params.tMultiplier = 1.5
    params.duppercap = 99
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.3
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.addedEffect = xi.effect.PLAGUE
    local resistThreshold = 0
    local power = 10
    local tick = 0
    local duration = 60
    local fTP = caster:getTP()
    if fTP >= 3000 then
        duration = 60
        resistThreshold = 0.5
    end
    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return damage
end
return spellObject
