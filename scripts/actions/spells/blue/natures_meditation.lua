-----------------------------------
-- Spell: Nat. Meditation
-- Enhances Attacks.
-- Spell cost: 38 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 6
-- Stat Bonus: DEX +6
-- Level: 99
-- Casting Time: 1 seconds
-- Recast Time: 60 seconds
-----------------------------------
-- Combos: Accuracy Bonus
-----------------------------------

local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0

end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = 60
    local attack = caster:getStat(xi.mod.ATT)
    local attBoost = attack * 0.2
	
	if caster:hasStatusEffect(xi.effect.DIFFUSION) then
        local diffMerit = caster:getMerit(xi.merit.DIFFUSION)

        if diffMerit > 0 then
            duration = duration + (duration / 100) * diffMerit
        end

        caster:delStatusEffect(xi.effect.DIFFUSION)
    end

	if not target:addStatusEffect(xi.effect.ATTACK_BOOST, { power = attBoost, duration = duration, origin = caster }) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

return xi.effect.ATTACK_BOOST
end
return spellObject
