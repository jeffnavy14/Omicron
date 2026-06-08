-----------------------------------
-- Spell: Diffusion Ray
-- Deals light damage to enemies within a fan-shaped area originating from caster.
-- Spell cost: 238 MP
-- Monster Type: Archaic Machines
-- Spell Type: Magical (Light)
-- Blue Magic Points: 6
-- Stat Bonus: STR +5 VIT +7
-- Level: 99
-- Casting Time: 12 seconds
-- Recast Time: 45 seconds
-- Combos: Store TP
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ARCHAICMACHINE
    params.tpmod = TPMOD_DAMAGE
	 if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.LIGHT
    params.attribute = xi.mod.MND
    params.diff = 0
    params.bonus = 50
    params.numhits = 1
	params.multiplier = 5.5
    params.tMultiplier = 3
    params.duppercap = 49
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.7
    params.chr_wsc = 0.0


    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)


    return damage
end

return spellObject
