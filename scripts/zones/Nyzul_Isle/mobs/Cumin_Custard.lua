-----------------------------------
--  MOB: Cumin Custard
-- Area: Nyzul Isle
-- Info: Enemy Leader, Absorbs wind elemental damage
-----------------------------------
<<<<<<< HEAD
mixins = {require("scripts/mixins/families/flan")}
require("scripts/globals/status")
require("scripts/globals/nyzul")
=======
mixins = { require('scripts/mixins/families/flan') }
require('scripts/globals/status')
require('scripts/globals/nyzul')
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.WIND_ABSORB, 100)
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
