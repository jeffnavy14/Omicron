-----------------------------------
--  MOB: Ginger Custard
-- Area: Nyzul Isle
-- Info: Enemy Leader, Absorbs fire elemental damage, Highly resistant to silence, Gains regain at 50% HP
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
    mob:setMod(xi.mod.FIRE_ABSORB, 100)
    mob:setMod(xi.mod.SILENCE_MEVA, 80)
end

entity.onMobFight = function(mob, target)
    if mob:getLocalVar("Regain") == 0 then
        if mob:getHPP() <= 50 then
            mob:setMod(xi.mod.REGAIN, 100)
            mob:setLocalVar("Regain", 1)
        end
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
        xi.nyzul.enemyLeaderKill(mob)
    end
end

return entity
