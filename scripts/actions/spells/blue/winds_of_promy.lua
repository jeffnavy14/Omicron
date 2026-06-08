-----------------------------------
-- Spell: Winds of Promy.
-- Removes one detrimental magic effect for party members within area of effect.
-- Spell cost: 36 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Light)
-- Blue Magic Points: 5
-- Stat Bonus: MND +3 CHR -2
-- Level: 89
-- Casting Time: 3 seconds
-- Recast Time: 20 seconds
-- Combos: Auto Refresh
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.EMPTY
    params.attribute = xi.mod.MND
    params.attribute = xi.mod.CHR
    params.skillType = xi.skill.BLUE_MAGIC
    params.effect = xi.effect.NONE

    local party = caster:getParty()

   for _, partyMember in pairs(party) do
    local effect = caster:eraseStatusEffect()
        if effect == xi.effect.NONE then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        else
        spell:setMsg(xi.msg.basic.MAGIC_ERASE)
        end
    return effect
   end
end

return spellObject
