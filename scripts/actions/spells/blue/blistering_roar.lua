-----------------------------------
-- Spell: Blistering Roar
-- Enemies within Area of Effect are frozen with Fear
-- Spell cost: 43 MP
-- Monster Type: Lizard (Gabbraths)
-- Spell Type: Magical (Dark)
-- Stat Bonus:
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 120 seconds
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

	local params = {}
    params.ecosystem      	= xi.ecosystem.LIZARD
	params.skillType 		= xi.skill.BLUE_MAGIC
	params.effect 			= xi.effect.TERROR
    params.power 			= 10
    params.tick 			= 3
    params.duration 		= 15
    params.resistThreshold 	= 0.00
    params.isGaze 			= false
    params.isConal 			= false

    return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params)
end

return spellObject
    