-----------------------------------
-- Spell: Carcharian Verve
-- Enhances attack and magic attack. Reduces spell interruption rate.
-- Spell cost: 65 MP
-- Monster Type: Aquans
-- Spell Type: Magical (Water)
-- Blue Magic Points: 
-- Stat Bonus: 
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-- Combos: Magic Attack Bonus
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
	local duration = 900
    local returnEffect = xi.effect.MAGIC_ATK_BOOST
    local mabPower = caster:getMod(xi.mod.MATT) * .2
    local attPower = caster:getMod(xi.mod.ATT) * .2
	local power = 10
	
	if caster:hasStatusEffect(xi.effect.DIFFUSION) then
        local diffMerit = caster:getMerit(xi.merit.DIFFUSION)

        if diffMerit > 0 then
            duration = duration + (duration / 100) * diffMerit
        end

        caster:delStatusEffect(xi.effect.DIFFUSION)
    end

    local actionOne   = target:addStatusEffect(xi.effect.MAGIC_ATK_BOOST, { power = mabpower, duration = duration, origin = caster })
    local actionTwo   = target:addStatusEffect(xi.effect.ATTACK_BOOST, { power = attpower, duration = duration, origin = caster })
    local actionThree = target:addStatusEffect(xi.effect.AQUAVEIL, { power = power, duration = duration, origin = caster })


    if not actionOne and not actionTwo and not actionThree then -- all statuses fail to apply
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    elseif not actionOne and actionTwo and actionThree then -- the first status fails to apply
        returnEffect = xi.effect.MAGIC_ATK_BOOST
    elseif actionOne and actionThree and not actionTwo then -- the second status fails to apply
        returnEffect = xi.effect.ATTACK_BOOST
    elseif actionOne and actionTwo and not actionThree then -- the third status fails to apply
        returnEffect = xi.effect.AQUAVEIL
    end

    return returnEffect
end

return spellObject
    