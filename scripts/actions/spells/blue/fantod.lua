-----------------------------------
-- Spell: Fantod
-- Enhances attack and magic attack.
-- Spell cost: 12 MP
-- Monster Type: Birds
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 1
-- Stat Bonus: HP -10 DEX +2 AGI +2
-- Level: 99
-- Casting Time: .5 seconds
-- Recast Time: 10 seconds
-----------------------------------
-- Combos: Store TP
-----------------------------------
local effectz =
{
    {xi.effect.MAGIC_ATK_BOOST, { power = 30, duration = 180, origin = caster }},
    {xi.effect.ATTACK_BOOST, { power = 30, duration = 180, origin = caster }},
}

local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0

end

spellObject.onSpellCast = function(caster, target, spell)

    local duration = 180
    local power = 30
    local apower = caster:getStat(xi.mod.ATT) *.3
	
	if caster:hasStatusEffect(xi.effect.DIFFUSION) then
        local diffMerit = caster:getMerit(xi.merit.DIFFUSION)

        if diffMerit > 0 then
            duration = duration + (duration / 100) * diffMerit
        end

        caster:delStatusEffect(xi.effect.DIFFUSION)
    end
	
    if not caster:addStatusEffect(xi.effect.MAGIC_ATK_BOOST, { power = power, duration = duration, origin = caster }) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end
    if not caster:addStatusEffect(xi.effect.ATTACK_BOOST, { power = apower, duration = duration, origin = caster }) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end
    
    return xi.effect.MAGIC_ATK_BOOST, xi.effect.ATTACK_BOOST

end
return spellObject
