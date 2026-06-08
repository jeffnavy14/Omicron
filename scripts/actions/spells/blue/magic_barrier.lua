-----------------------------------
-- Spell: Magic Barrier
-- Grants a Magic Shield effect.
-- Spell cost: 29 MP
-- Monster Type: Demons
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 3
-- Stat Bonus: MP +7 INT +2
-- Level: 82
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-----------------------------------
-- Combos: Max MP Boost
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local power = 1
	local duration = 300
    if target:hasStatusEffect(xi.effect.STONESKIN) then
       return spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end
	
	if caster:hasStatusEffect(xi.effect.DIFFUSION) then
        local diffMerit = caster:getMerit(xi.merit.DIFFUSION)

        if diffMerit > 0 then
            duration = duration + (duration / 100) * diffMerit
        end

        caster:delStatusEffect(xi.effect.DIFFUSION)
    end
	
    if not caster:addStatusEffect(xi.effect.MAGIC_SHIELD, { power = power, duration = duration, origin = caster, tier = 2 }) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return xi.effect.MAGIC_SHIELD
end

return spellObject

-- addStatusEffect(effectID, power, tick, duration, subType, subPower, tier, SourceType, SourceTypeParam)
-- hasStatusEffect(uint16 StatusID, sol::object const& SubType);