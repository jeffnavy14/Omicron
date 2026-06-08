-----------------------------------
-- Spell: Bilgestorm
-- Deals damage in an area of effect. Additional effect: Lowers attack, accuracy, and defense
-- Spell cost: 122 MP
-- Monster Type: 
-- Spell Type: Physical
-- Blue Magic Points: 5
-- Stat Bonus: HP-5, MP+5
-- Level: 99
-- Casting Time: 1 seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Gravitation, and Darkness
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
    params.ecosystem = xi.ecosystem.DEMON
	params.tpmod = TPMOD_DAMAGE
	 params.bonusatt = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusatt = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusatt = math.floor(caster:getTP() / 50)
    end
	
    params.skillType = xi.skill.BLUE_MAGIC
	 params.tpmod = TPMOD_DAMAGE
	 params.bonusatt = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusatt = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusatt = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.BLUNT
    params.scattr = xi.skillchainType.GRAVITATION
    params.scattr = xi.skillchainType.DARKNESS
    params.numhits = 1
    params.multiplier = 6.78
	params.tmultiplier = 5.0
    params.tp150 = 4.78
    params.tp300 = 4.78
	params.tp350 = 5.25
    params.azuretp = 6.78
    params.duppercap = 75
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
	
	 local effectTable =
    {
        [1] = { xi.effect.DEFENSE_DOWN,  25, 0, duration },
		[2] = { xi.effect.ATTACK_DOWN, 	 25, 0, duration },
		[3] = { xi.effect.ACCURACY_DOWN, 10, 0, duration },
	}
    local fTP = caster:getTP()
    local resistThreshold = 0
    if fTP >= 2000 then 
        duration = 60
    elseif fTP == 3000 then
        duration = 120
        resistThreshold = 0.5
        end
    local duration = 30
    local resistThreshold = 0.5

        local damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
    xi.spells.blue.applyBlueAdditionalEffect(caster, target, spell, params, damage, effectTable)

    return damage, returnEffect
end

return spellObject
