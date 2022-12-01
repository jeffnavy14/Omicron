-----------------------------------
--  MOB: Shielde Chariot
-- Area: Nyzul Isle
-- Info: Enemy Leader, Uses Mortal Revolution
-----------------------------------
<<<<<<< HEAD
mixins = {require("scripts/mixins/families/chariot")}
require("scripts/globals/nyzul")
=======
mixins = { require('scripts/mixins/families/chariot') }
require('scripts/globals/nyzul')
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
-----------------------------------
local entity = {}

entity.onMonsterAbilityPrepare = function(mob)
    if mob:getHPP() > 25 then
        return 0
    elseif math.random(1, 2) == 2 then
        return 2057 -- Mortal Revolution
    end

<<<<<<< HEAD
    return ({2055, 2056})[math.random(1, 2)]
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
=======
    return ({ 2055, 2056 })[math.random(1, 2)]
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.enemyLeaderKill(mob)
    end
end

return entity
