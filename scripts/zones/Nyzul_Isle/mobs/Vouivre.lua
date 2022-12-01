-----------------------------------
--  MOB: Vouivre
-- Area: Nyzul Isle
-- Info: NM
-----------------------------------
<<<<<<< HEAD
require("scripts/globals/nyzul")
require("scripts/globals/status")
=======
require('scripts/globals/nyzul')
require('scripts/globals/status')
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.REGEN, 5)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 40)
    mob:setMod(xi.mod.TRIPLE_ATTACK, 35)
    -- mob:addImmunity(xi.immunity.TERROR)
end

<<<<<<< HEAD
entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
=======
entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.eliminateAllKill(mob)
    end
end

return entity
