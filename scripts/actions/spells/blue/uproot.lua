-----------------------------------
-- Spell: Uproot
-- Deals light damage to enemies within range. Also removes status aliments from caster.
-- Spell cost: 88 MP
-- Monster Type: Planoid
-- Spell Type: Magical (Light)
-- Stat Bonus:
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 30 seconds
-- Combos:
-----------------------------------
---@type TSpell
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
local removables =
            {
                xi.effect.FLASH,
                xi.effect.BLINDNESS,
                xi.effect.PARALYSIS,
                xi.effect.POISON,
                xi.effect.CURSE_I,
                xi.effect.CURSE_II,
                xi.effect.DISEASE,
                xi.effect.PLAGUE,
                xi.effect.WEIGHT,
                xi.effect.BIND,
                xi.effect.BIO,
                xi.effect.DIA,
                xi.effect.BURN,
                xi.effect.FROST,
                xi.effect.CHOKE,
                xi.effect.RASP,
                xi.effect.SHOCK,
                xi.effect.DROWN,
                xi.effect.STR_DOWN,
                xi.effect.DEX_DOWN,
                xi.effect.VIT_DOWN,
                xi.effect.AGI_DOWN,
                xi.effect.INT_DOWN,
                xi.effect.MND_DOWN,
                xi.effect.CHR_DOWN,
                xi.effect.ADDLE,
                xi.effect.SLOW,
                xi.effect.HELIX,
                xi.effect.ACCURACY_DOWN,
                xi.effect.ATTACK_DOWN,
                xi.effect.EVASION_DOWN,
                xi.effect.DEFENSE_DOWN,
                xi.effect.MAGIC_ACC_DOWN,
                xi.effect.MAGIC_ATK_DOWN,
                xi.effect.MAGIC_EVASION_DOWN,
                xi.effect.MAGIC_DEF_DOWN,
                xi.effect.MAX_TP_DOWN,
                xi.effect.MAX_MP_DOWN,
                xi.effect.MAX_HP_DOWN,
            }
    local params = {}
    params.ecosystem = xi.ecosystem.PLANOID
	if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.BURST_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end
	
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.LIGHT
    params.attribute = xi.mod.VIT
    params.multiplier = 4.36
    params.tMultiplier = 4.7
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.4
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

            for i, effect in ipairs(removables) do
                if caster:hasStatusEffect(effect) then
                   caster:delStatusEffect(effect)
                end
            end

    return xi.spells.blue.useMagicalSpell(caster, target, spell, params)
end

return spellObject
    