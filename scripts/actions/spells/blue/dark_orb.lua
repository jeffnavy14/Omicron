-----------------------------------
-- Spell: Dark Orb
-- Deals dark damage to an enemy
-- Spell cost: 124 MP
-- Monster Type: Demons
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+2, MND+2
-- Level: 93
-- Casting Time: 9 seconds
-- Recast Time: 72 seconds
-- Magic Bursts on: Induration, Distortion, and Darkness
-- Combos: Counter
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.GARGOUILLE
	 if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.DARK
    params.skillType = xi.skill.BLUE_MAGIC
    params.attribute = xi.mod.AGI
    params.attribute = xi.mod.MND
    params.diff = 0
    params.multiplier = 4.5
    params.tMultiplier = 4.5
    params.tp150 = 1.5
    params.tp300 = 2
    params.azuretp = 1
    params.duppercap = 78
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.4
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.lvlMod = 0.5

    return xi.spells.blue.useMagicalSpell(caster, target, spell, params, true)
end

return spellObject
