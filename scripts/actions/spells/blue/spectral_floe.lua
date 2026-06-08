-----------------------------------
-- Spell: Spectral Floe
-- Deals ice damage to enemies within range. Additional effect: Terror
-- Spell cost: 116 MP
-- Monster Type: Elementals
-- Spell Type: Magical (Water)
-- Blue Magic Points: 8
-- Stat Bonus: MP +30, INT +8
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-- Combos: Magic Attack Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0  
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ELEMENTALS
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.ICE
    params.attribute = xi.mod.INT
    params.diff = 1
    params.multiplier = 4.0
    params.tMultiplier = 4.0
    params.tphitslanded = 1
    params.duppercap = 99
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.8
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

        -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.TERROR,5, 0, 5 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)
        
    return damage
end

return spellObject
    