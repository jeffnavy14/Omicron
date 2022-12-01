-----------------------------------
--  MOB: Mokka
-- Area: Nyzul Isle
-- Info: Enemy Leader, Only uses Deafening Tantara
-----------------------------------
<<<<<<< HEAD
require("scripts/globals/status")
require("scripts/globals/nyzul")
=======
require('scripts/globals/status')
require('scripts/globals/nyzul')
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addListener("CRITICAL_TAKE", "IMP_CRITICAL_TAKE", function(impMob)
        if math.random(100) <= 20 and impMob:getAnimationSub() == 4 then
            impMob:setAnimationSub(5)
            -- Reacquire horn after 5 to 60 seconds
            impMob:timer(math.random(5000, 60000), function(hornLessmob)
                if hornLessmob:isAlive() then
                    hornLessmob:setAnimationSub(4)
                end
            end)
        end
    end)
<<<<<<< HEAD
=======

>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    mob:setMod(xi.mod.MOVE, 64)
    mob:setAnimationSub(4)
end

<<<<<<< HEAD
entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
=======
entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.enemyLeaderKill(mob)
    end
end

return entity
