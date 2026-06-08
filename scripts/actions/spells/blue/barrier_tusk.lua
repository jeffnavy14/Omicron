-----------------------------------
-- Spell: Barrier Tank
-- Reduces the amount of damage you take
-- Spell cost: 41 MP
-- Monster Type: Beast
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: HP+15, MP-15, VIT+3
-- Level: 91
-- Casting Time: 6 seconds
-- Recast Time: 60 seconds
-- Combos: Max HP Boost
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local power = 15 -- 15%
    local duration = 90
	
	if caster:hasStatusEffect(xi.effect.DIFFUSION) then
        local diffMerit = caster:getMerit(xi.merit.DIFFUSION)

        if diffMerit > 0 then
            duration = duration + (duration / 100) * diffMerit
        end

        caster:delStatusEffect(xi.effect.DIFFUSION)
    end

    if not target:addStatusEffect(xi.effect.PHALANX, { power = power, subPower = 1, duration = duration, origin = caster }) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return xi.effect.PHALANX
end

return spellObject
