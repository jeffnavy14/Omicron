-----------------------------------
-- Spell: Adoquium
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local power    = 3
    local duration = 180
    local handSlot = caster:getEquipID(xi.slot.HANDS)

    if caster:hasStatusEffect(xi.effect.PERPETUANCE) then
       duration = 360
    elseif caster:hasStatusEffect(xi.effect.PERPETUANCE) and
           handSlot == 27091 then -- Arbatel Bracers +1
           duration = 453
    elseif caster:hasStatusEffect(xi.effect.PERPETUANCE) and
           handSlot == 23238 then -- Arbatel Bracers +2
           duration = 453
    end

    local returnEffect = target:addStatusEffect(xi.effect.REGAIN, { power = power, origin = target, duration = duration })


    return returnEffect
end

return spellObject


-- +2 23238