-----------------------------------
-- Spell: Evryone. Grudge
-- Deals dark damage to an enemy.
-- Spell cost: 185 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 4
-- Stat Bonus: INT +2 MND +2 STR -1 VIT -1
-- Level: 90
-- Casting Time: 5.5 seconds
-- Recast Time: 70 seconds
-- Combos: 	Gilfinder / Treasure Hunter
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.BEASTMEN
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.DARK
    params.attribute = xi.mod.INT
    params.multiplier = 1
    params.azureBonus = 2
    params.tMultiplier = 2.0
    params.duppercap = 0
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.7
    params.chr_wsc = 0.0

    return xi.spells.blue.useMagicalSpell(caster, target, spell, params)
end

return spellObject
