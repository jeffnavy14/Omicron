-----------------------------------
--  MOB: Psycheflayer
-- Area: Nyzul Isle
-- Info: Specified Mob Group and Eliminate all Group
-----------------------------------
<<<<<<< HEAD
require("scripts/globals/nyzul")
=======
require('scripts/globals/nyzul')
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    xi.nyzul.specifiedEnemySet(mob)

    if mob:getPool() == 8072 then
        mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
    end
end

<<<<<<< HEAD
entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
=======
entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.specifiedEnemyKill(mob)

        if mob:getID() >= 17092974 then
            xi.nyzul.specifiedGroupKill(mob)
        end
    end
end

return entity
