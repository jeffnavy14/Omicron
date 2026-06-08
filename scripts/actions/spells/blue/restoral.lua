-----------------------------------
-- Spell: Restoral
-- Restores the caster’s HP.
-- Spell cost: 127 MP
-- Monster Type: Archaic Machines
-- Spell Type: Magical (Light)
-- Blue Magic Points: 7
-- Stat Bonus: HP +15 MP +15
-- Level: 99
-- Casting Time: 3.5 seconds
-- Recast Time: 10 seconds
-----------------------------------
-- Combos: Max HP Boost
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.attribute = xi.mod.MND
    params.minCure = 700
    params.divisor0 = 1.5
    params.constant0 = 700
    params.powerThreshold1 = 300
    params.divisor1 = 2.5
    params.constant1 = 950
    params.powerThreshold2 = 400
    params.divisor2 = 5
    params.constant2 = 1090


    return xi.spells.blue.useCuringSpell(caster, target, spell, params)

end

return spellObject
