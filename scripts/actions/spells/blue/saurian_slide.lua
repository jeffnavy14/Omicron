-----------------------------------
-- Spell: Saurian Slide
-- Additional effect: Weakens attacks. Damage varies with TP.
-- Spell cost: 109 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: INT+1
-- Level: 30
-- Casting Time: .5 seconds
-- Recast Time: 35 seconds
-- Skillchain Element(s): Fragmentation / Distortion
-- Combos: Inquartata
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.tpmod = TPMOD_ATTACK
	params.bonusacc = 0
	if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
       params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.FRAGMENTATION
    params.scattr2 = xi.skillchainType.DISTORTION
    params.numhits = 1
    params.multiplier = 6
    params.tp150 = 5.0
    params.tp300 = 6.0
	params.tp350 = 6.25
    params.azuretp = 6.5
    params.duppercap = 94
    params.str_wsc = 0.75
    params.dex_wsc = 0.75
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

     -- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.ATTACK_DOWN,25, 0, 90 },
    }
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.BLUE_MAGIC
		
	local damage   = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
		xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)

    return damage
end

return spellObject
