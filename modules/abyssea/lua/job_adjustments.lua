-----------------------------------
-- Module: Job Adjustments (Abyssea Era)
-- Desc: Removes traits/abilities/effects that were added to jobs during the Abyssea era
-----------------------------------
-- Source: https://www.bg-wiki.com/ffxi/Version_Update_(03/26/2012)
-----------------------------------
require('modules/module_utils')
-----------------------------------

local m = Module:new('job_adjustments')

-----------------------------------
-- Warrior
-----------------------------------

-- Warrior's Charge: Remove Triple Attack bonus
m:addOverride('xi.effects.warriors_charge.onEffectGain', function(target, effect)
    effect:addMod(xi.mod.DOUBLE_ATTACK, 100)
end)

-- Warrior's Charge: Apply merit recast reduction
m:addOverride('xi.job_utils.warrior.useWarriorsCharge', function(player, target, ability, action)
    local recastReduction = player:getMerit(xi.merit.WARRIORS_CHARGE) - 150
    action:setRecast(action:getRecast() - recastReduction)

    player:addStatusEffect(xi.effect.WARRIORS_CHARGE, 1, 0, 60)

    return xi.effect.WARRIORS_CHARGE
end)

-----------------------------------
-- White Mage
-----------------------------------

-- Martyr: Apply merit recast reduction, remove merit healing bonus
m:addOverride('xi.job_utils.white_mage.useMartyr', function(player, target, ability, action)
    local recastReduction = player:getMerit(xi.merit.MARTYR) - 150
    action:setRecast(action:getRecast() - recastReduction)

    local damageHP = math.floor(player:getHP() * 0.25)
    local healHP = damageHP * 2
    healHP = utils.clamp(healHP, 0, target:getMaxHP() - target:getHP())

    -- If stoneskin is present, it should absorb damage
    damageHP = utils.handleStoneskin(player, damageHP)
    player:delHP(damageHP)
    target:addHP(healHP)

    return healHP
end)

-- Devotion: Apply merit recast reduction, remove merit MP bonus
m:addOverride('xi.job_utils.white_mage.useDevotion', function(player, target, ability, action)
    local recastReduction = player:getMerit(xi.merit.DEVOTION) - 150
    action:setRecast(action:getRecast() - recastReduction)

    local damageHP = math.floor(player:getHP() * 0.25)
    local healMP = damageHP
    healMP = utils.clamp(healMP, 0, target:getMaxMP() - target:getMP())

    -- If stoneskin is present, it should absorb damage
    damageHP = utils.handleStoneskin(player, damageHP)
    player:delHP(damageHP)
    target:addMP(healMP)

    return healMP
end)

return m
