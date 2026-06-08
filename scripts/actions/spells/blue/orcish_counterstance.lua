-----------------------------------
-- Spell: O. Counterstance
-- Increases the caster's chance of countering.
-- Spell cost: 18 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 5
-- Stat Bonus: HP +10 STR +3 VIT +3 DEX -2 AGI -2
-- Level: 98
-- Casting Time: 4.5 seconds
-- Recast Time: 120 seconds
-----------------------------------
-- Combos: Counter
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0

end

spellObject.onSpellCast = function(caster, target, spell)

    local duration = 180
    local power = 1000
	
	if caster:hasStatusEffect(xi.effect.DIFFUSION) then
        local diffMerit = caster:getMerit(xi.merit.DIFFUSION)

        if diffMerit > 0 then
            duration = duration + (duration / 100) * diffMerit
        end

        caster:delStatusEffect(xi.effect.DIFFUSION)
    end
	
    if not caster:addStatusEffect(xi.effect.COUNTERSTANCE, { power = power, duration = duration, origin = caster }) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end
    
    return xi.effect.COUNTERSTANCE

end
return spellObject
