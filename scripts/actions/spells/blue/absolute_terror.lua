-----------------------------------
-- Spell: Absolute terror
-- Freezes target in fear.
-- Spell cost: 29 MP
-- Monster Type: Dragon
-- Spell Type: Magical (Dark)
-- Stat Bonus:
-- Level: 96
-- Casting Time: .5 seconds
-- Recast Time: 30 seconds
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

	local params = {}
    params.ecosystem      	= xi.ecosystem.DRAGON
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
    