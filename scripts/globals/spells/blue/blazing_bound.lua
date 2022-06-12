-----------------------------------
-- Spell: Blazing_Bound
-----------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    local multi = 6.38
    local params = {}
    params.diff = caster:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.BLUE_MAGIC
    params.bonus = 1.0
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.FIRE
    params.multiplier = multi
    params.tMultiplier = 1.5
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.3
    params.chr_wsc = 0.0
    local damage = BlueMagicalSpell(caster, target, spell, params, MND_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if (caster:hasStatusEffect(xi.effect.AZURE_LORE)) then
        multi = multi + 0.50
    end

    return damage
end

return spell_object
