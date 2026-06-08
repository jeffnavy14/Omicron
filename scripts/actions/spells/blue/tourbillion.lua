-----------------------------------
-- Spell: Tourbillion
-- Delivers an area attack. Additional effect duration varies with TP. Additional effect: Weakens defense.
-- Spell cost: 108 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Blunt)
-- Stat Bonus:
-- Level: 97
-- Casting Time: 1 seconds
-- Recast Time: 30 seconds
-- Skillchain Element(s): Light, Fragmentation
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
    params.ecosystem = xi.ecosystem.BEAST
    params.tpmod = TPMOD_DAMAGE
	 params.bonusatt = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusatt = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusatt = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.BLUNT
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.BLUE_MAGIC
    params.scattr = xi.skillchainType.LIGHT
    params.scattr2 = xi.skillchainType.FRAGMENTATION
    params.numhits = 1
    params.multiplier = 11.0
	params.tmultiplier = 4.5
    params.tp150 = 4.33
    params.tp300 = 5.0
	params.tp350 = 5.25
    params.duppercap = 69
    params.str_wsc = 0.75
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.75
    params.chr_wsc = 0.0
	-- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.DEFENSE_DOWN, 33, 0, 60 },
	}
    local fTP = caster:getTP()
    local resistThreshold = 0
    if fTP >= 2000 then 
        duration = 60
    elseif fTP == 3000 then
        duration = 120
        resistThreshold = 0.5
        end
	
		
    local damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
		xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)

    return damage
end

return spellObject
    