local controller = require("scripts/globals/di_controller")
local jobSpecial = require("scripts/mixins/job_special")

local entity = {}

-----------------------------------
-- Spawn
-----------------------------------
entity.onMobSpawn = function(mob)
    controller.onSpawn(mob)
    controller.applySpawnScaling(mob)
    mob:setLocalVar("hpScaled", 0)
    mob:setLocalVar("battleStarted", 0)
    mob:addStatusEffect(xi.effect.ENASPIR, { power = 70, origin = mob })
    mob:getStatusEffect(xi.effect.ENASPIR):delEffectFlag(xi.effectFlag.DISPELABLE)


    jobSpecial(mob)

    xi.mix.jobSpecial.config(mob, {
        between = 60,
        chance = 100,
        delay = 2,
        specials = {
            { id = xi.jsa.HUNDRED_FISTS, hpp = math.random(75, 85), cooldown = 60 },
            { id = xi.jsa.HUNDRED_FISTS, hpp = math.random(55, 65), cooldown = 60 },
            { id = xi.jsa.HUNDRED_FISTS, hpp = math.random(25, 35), cooldown = 60 },
            { id = xi.jsa.HUNDRED_FISTS, hpp = math.random(5, 10), cooldown = 60 },

        },
    })

end

-----------------------------------
-- First engage
-----------------------------------
entity.onMobEngage = function(mob, target)

    if mob:getLocalVar("hpScaled") == 0 then
        controller.applyScaling(mob)
        mob:setLocalVar("hpScaled", 1)
    end

    mob:setLocalVar("battleStarted", 1)

end

-----------------------------------
-- Combat loop
-----------------------------------
entity.onMobFight = function(mob, target)

    -- Example AI triggers
    local hp = mob:getHPP()

    if hp < 75 and mob:getLocalVar("phase75") == 0 then
        --mob:useMobAbility(2001)
        mob:setLocalVar("phase75", 1)
    end

    if hp < 50 and mob:getLocalVar("phase50") == 0 then
        --mob:useMobAbility(2002)
        mob:setLocalVar("phase50", 1)
    end

    if hp < 25 and mob:getLocalVar("phase25") == 0 then
        --mob:useMobAbility(2003)
        mob:setLocalVar("phase25", 1)
    end

end

-----------------------------------
-- Death
-----------------------------------
entity.onMobDeath = function(mob, player, optParams)

    controller.onDeath(mob)

end

-----------------------------------
-- Despawn (wipe or timeout)
-----------------------------------
entity.onMobDespawn = function(mob)

end

return entity