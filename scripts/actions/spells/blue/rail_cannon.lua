-----------------------------------
-- Spell: Rail Cannon
-- Spell cost: 200 MP
-- Monster Type: Archaics
-- Spell Type: Magical (Light)
-- Blue Magic Points: 6
-- Stat Bonus: INT+1, MND+1
-- Level: 99
-- Casting Time: 2.5 seconds
-- Recast Time: 80 seconds
-- Combos: Magic Burst Bon us
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ARCHAICMACHINE
	 if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.LIGHT
	params.attribute = xi.mod.MND
    params.numhits = 1
    params.multiplier = 6
	params.tMultiplier = 6
    params.tp150 = 2.125
    params.tp300 = 2.75
    params.azuretp = 2.875
    params.duppercap = 75
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.4
    params.chr_wsc = 0.0

    return xi.spells.blue.useMagicalSpell(caster, target, spell, params)
end

return spellObject
