-----------------------------------
-- Spell: Pyric Bulwark
-- Grants immunity to the next incoming attack (physical, magical, or ranged).
-- Spell cost: 102 MP (Retail)
-- Monster Type: Arcana
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 6
-- Stat Bonus: VIT+6
-- Level: 99
-- Casting Time: 2 seconds
-- Recast Time: 35 seconds
-- Duration: 5 minutes
-----------------------------------------


---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    -- Base duration is 5 minutes (300 seconds)
    local duration = xi.spells.blue.calculateDurationWithDiffusion(caster, 300)
 
    -- Helper function to remove all Pyric Bulwark shields
    local function removePyricBulwarkShields(p)
        if p then
            p:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
            p:delStatusEffect(xi.effect.MAGIC_SHIELD)
            p:delStatusEffect(xi.effect.ARROW_SHIELD)
        end
    end
 
    local addedPhysical = target:addStatusEffect(xi.effect.PHYSICAL_SHIELD, { power = 1, duration = duration, origin = caster })
    local addedMagical  = target:addStatusEffect(xi.effect.MAGIC_SHIELD, { power = 1, duration = duration, origin = caster, icon = 0 })
    local addedRanged   = target:addStatusEffect(xi.effect.ARROW_SHIELD, { power = 1, duration = duration, origin = caster, icon = 0 })
 
    if addedPhysical or addedMagical or addedRanged then
        target:addListener('TAKE_DAMAGE', 'PYRIC_BULWARK_CONSUME', function(targetArg, damage, attacker, attackType, damageType)
            if attackType == xi.attackType.PHYSICAL or attackType == xi.attackType.MAGICAL or attackType == xi.attackType.RANGED then
                targetArg:timer(100, function(p)
                    removePyricBulwarkShields(p)
                    p:removeListener('PYRIC_BULWARK_CONSUME')
                end)
            end
        end)
    else
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end
 
    -- Return a representative effect. PHYSICAL_SHIELD is a good choice as it's the first applied.
    return xi.effect.PHYSICAL_SHIELD
end

return spellObject