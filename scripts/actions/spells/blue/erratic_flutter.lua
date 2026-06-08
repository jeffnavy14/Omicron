-----------------------------------
-- Spell: Erratic Flutter
-- Increases attack speed
-- Spell cost: 92 MP
-- Monster Type: VERMIN
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 6
-- Stat Bonus: HP +5 MP +15 AGI +5 CHR +5
-- Level: 99
-- Casting Time: 1 seconds
-- Recast Time: 45 seconds
-- Duration: 5 minutes
-----------------------------------
-- Combos: Fast Cast
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local power = 3000 -- 30%
    local duration = 300
	
	if caster:hasStatusEffect(xi.effect.DIFFUSION) then
        local diffMerit = caster:getMerit(xi.merit.DIFFUSION)

        if diffMerit > 0 then
            duration = duration + (duration / 100) * diffMerit
        end

        caster:delStatusEffect(xi.effect.DIFFUSION)
    end
	
    if not target:addStatusEffect(xi.effect.HASTE, { power = power, duration = duration, origin = caster }) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return xi.effect.HASTE
end

return spellObject
