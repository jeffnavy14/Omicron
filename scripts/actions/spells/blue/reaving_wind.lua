-----------------------------------
-- Spell: Reaving Wind
-- Reduces TP for enermies within range.
-- Spell cost: 84 MP
-- Monster Type: Amphiptere
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: STR+2, AGI+2
-- Level: 90
-- Casting Time: 4 seconds
-- Recast Time: 90 seconds
-- Combos: Magic Burst Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.BIRD
    params.effect = typeEffectOne
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.BLUE_MAGIC
    

    
        if target:getEcosystem() == xi.ecosystem.AMORPHS then
        spell:setMsg(xi.msg.basic.MAGIC_TP_REDUCE)
        targets:delTP(750)
        elseif target:getEcosystem() == xi.ecosystem.AQUANS then
        spell:setMsg(xi.msg.basic.MAGIC_TP_REDUCE)
        targets:delTP(1250)
        else
        spell:setMsg(xi.msg.basic.MAGIC_TP_REDUCE)
        target:delTP(1000)
    end
end
return spellObject