-----------------------------------
-- Spell: Benthic Typhoon
-- Delivers an area attack that lowers target's defense and magic defense. Damage varies with TP.
-- Spell cost: 56 MP
-- Monster Type: Vorageans
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 4
-- Stat Bonus: STR +2 VIT +2 DEX -1 AGI -1
-- Level: 83
-- Casting Time: .5 second
-- Recast Time: 55 seconds
-- Skillchain Element(s): Gravitiation / Transfixion
-- Combos: Skillchain Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.VORAGEAN
    params.tpmod = TPMOD_DAMAGE
	params.bonusacc = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.PIERCING
    params.scattr = xi.skillchainType.GRAVITATION
    params.scattr2 = xi.skillchainType.TRANSFIXION
    params.attribute = xi.mod.AGI
    params.skillType = xi.skill.BLUE_MAGIC
    params.numhits = 1
    params.multiplier = 4
    params.tp150 = 5.0
    params.tp300 = 6.0
	params.tp350 = 6.5
    params.azuretp = 7.25
    params.duppercap = 75
    params.str_wsc = 0.7
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.7
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
	
	-- Handle status effects. effect, power, tik, duration
	 local effectTable =
    {
        [1] = { xi.effect.DEFENSE_DOWN, 30, 0, 90},
		[2] = { xi.effect.MAGIC_DEF_DOWN, 30, 0, 90},
    }

    --local resist = applyResistanceEffect(caster, target, spell, params)
    --if resist >= 0.5 then
      --  target:addStatusEffect(typeEffectOne, power, tick, duration * resist)
      --  target:addStatusEffect(typeEffectTwo, power, tick, duration * resist)
   -- else
  --  spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
   -- end
 
    local damage =  xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
			xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)
    return damage
end

return spellObject
