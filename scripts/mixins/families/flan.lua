require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.flan = function(flanMob)
    flanMob:addListener("TAKE_DAMAGE", "FLAN_TAKE_DAMAGE", function(mob, damage, attacker, attackType, damageType)
        local accumulatedPhisical = mob:getLocalVar("physical")
        local accumulatedMagical  = mob:getLocalVar("magical")

<<<<<<< HEAD

        if attackType == xi.attackType.PHYSICAL or attackType == xi.attackType.RANGED then
            accumulatedPhisical = accumulatedPhisical + damage

            if accumulatedPhisical > mob:getMaxHP() * 0.3 or damage > mob:getMaxHP() * 0.1 then
=======
        if
            attackType == xi.attackType.PHYSICAL or
            attackType == xi.attackType.RANGED
        then
            accumulatedPhisical = accumulatedPhisical + damage

            if
                accumulatedPhisical > mob:getMaxHP() * 0.3 or
                damage > mob:getMaxHP() * 0.1
            then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
                mob:setAnimationSub(2) -- Spike head
                mob:setMod(xi.mod.DMGPHYS, -50)
                mob:setMod(xi.mod.DMGRANGE, -50)
                mob:setMod(xi.mod.DMGMAGIC, 0)
                mob:setLocalVar("Damage", 0)
                accumulatedPhisical = 0
            end

            mob:setLocalVar("physical", accumulatedPhisical)
        else
            accumulatedMagical = accumulatedMagical + damage

<<<<<<< HEAD
            if accumulatedMagical > mob:getMaxHP() * 0.3 or damage > mob:getMaxHP() * 0.1 then
=======
            if
                accumulatedMagical > mob:getMaxHP() * 0.3 or
                damage > mob:getMaxHP() * 0.1
            then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
                mob:setAnimationSub(1) -- Smooth head
                mob:setMod(xi.mod.DMGPHYS, 0)
                mob:setMod(xi.mod.DMGRANGE, 0)
                mob:setMod(xi.mod.DMGMAGIC, -50)
                mob:setLocalVar("Damage", 1)
                accumulatedMagical = 0
            end

            mob:setLocalVar("magical", accumulatedMagical)
        end
    end)

end

return g_mixins.families.flan
