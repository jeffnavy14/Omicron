-----------------------------------
-- Spell: Blazing Bound
-- Deals fire damage to an enemy.
-- Spell cost: 113
-- Monster Type: Vorageans
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: VIT+2 AGI+1 
-- Level: 80
-- Casting Time:  seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Induration, Distortion, and Darkness
-- Combos: Dual wield
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.LIMULE
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.FIRE
    params.diff = 0 -- no stat increases magic accuracy
    params.skillType = xi.skill.BLUE_MAGIC
    params.hpMod = 3
    params.lvlMod = 0.625
    params.attribute = xi.mod.INT
    params.multiplier = 3.0
    params.tMultiplier = 1.5
    params.duppercap = 69
    params.str_wsc = 0.3
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.2
    params.chr_wsc = 0.0


    return xi.spells.blue.useMagicalSpell(caster, target, spell, params)
end

return spellObject
