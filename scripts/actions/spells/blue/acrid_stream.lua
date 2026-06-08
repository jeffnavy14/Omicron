-----------------------------------
-- Spell: Acrid Stream
-- Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Lowers target's Magic Defense.
-- Spell cost: 89 MP
-- Monster Type: Vorageans
-- Spell Type: Magical (Water)
-- Blue Magic Points: 3
-- Stat Bonus: DEX+2, MND+2
-- Level: 77
-- Casting Time: 4 seconds
-- Recast Time: 23 seconds
-- Magic Bursts on: Scission, Gravitation, Darkness
-- Combos: Double Attack, Triple Attack
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.VORAGEANS
	 if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.WATER
    params.attribute = xi.mod.INT
    params.multiplier = 3
    params.tMultiplier = 2.296875
    params.duppercap = 50
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.6
    params.chr_wsc = 0.0

-- Handle status effects. effect, power, tik, duration
    local effectTable =
    {
        [1] = { xi.effect.MAGIC_DEF_DOWN, 10, 0, 120 },
    }

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
        xi.spells.blue.applyBlueAdditionalEffect(caster, target, params, effectTable)

    return damage
end

return spellObject
