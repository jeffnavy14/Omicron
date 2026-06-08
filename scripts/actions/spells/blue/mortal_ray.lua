-----------------------------------
-- Spell: Mortal Ray
-- Inflicts Doom upon an enemy.
-- Spell cost: 267 MP
-- Monster Type: Demons
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 4
-- Stat Bonus: STR+2, MND+2
-- Level: 91
-- Casting Time: 8 seconds
-- Recast Time: 150 seconds
-- Combos: Dual Wield
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast 	= function(caster, target, spell)
    local params = {}
    params.ecosystem 		= xi.ecosystem.DEMON
    params.effect 			= xi.effect.DOOM
    params.power 			= 10
    params.tick 			= 3
    params.duration 		= 188
    params.resistThreshold 	= 0.00
    params.isGaze 			= true
    params.isConal 			= false

	if target:isNM() then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    else
		return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params)
    end
end

return spellObject
