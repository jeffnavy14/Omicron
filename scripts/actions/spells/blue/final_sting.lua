-----------------------------------
-- Spell: Final Sting
-- Deals damage proportional to HP. Reduces HP to 1 after use. Damage varies with TP.
-- Spell cost: 88 MP
-- Monster Type: Bee
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 1
-- Stat Bonus: HP-20, AGI+5
-- Level: 81
-- Casting Time: 5 seconds
-- Recast Time: 11 seconds
-- Magic Bursts on:
-- Combos: Zanshin
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
                return 0        
end

spellObject.onSpellCast = function(caster, target, spell)
   local params = {}
    params.ecosystem = xi.ecosystem.VERMIN
    params.tpmod = TPMOD_DAMAGE
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.skillType = xi.skill.BLUE_MAGIC
    params.scattr = xi.skillchainType.FUSION
    params.diff = 0
    params.numhits = 1
    params.multiplier = 1
    params.tp150 = 1.5
    params.tp300 = 2
    params.azuretp = 1
    params.duppercap = 0
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    local playerlvl = caster:getMainLvl()
    local playerHP = caster:getMaxHP()
    local moblvl = target:getMainLvl()
    local mobHP = target:getMaxHP()
    local mobHPH = target:getMaxHP() / 2
    local damage = playerHP - 1
    local playerTP = caster:getTP()
    local boost = 1

    if caster:getHP() > mobHPH then
        if moblvl >= playerlvl then
           mobHP = mobHP * .5
        else
           mobHP = mobHP * .65           
        end
    end
            if playerTP < 999 then
               boost = 1
            elseif playerTP > 1000 and playerTP < 1500 then 
               boost = 1.25
            elseif playerTP > 1501 and playerTP < 2500 then
               boost = 1.5
            elseif playerTP > 2501 then
               boost = 1.75
            end
                if damage > mobHP then
                   damage = mobHP
                else damage = caster:getHP() * boost 
                end
                        damage = xi.spells.blue.applySpellDamage(caster, target, spell, damage, params)
                        caster:setHP(1)
                        caster:setTP(0)
                        return damage
end
return spellObject
