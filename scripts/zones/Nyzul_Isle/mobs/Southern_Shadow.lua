-----------------------------------
--  MOB: Southern Shadow
-- Area: Nyzul Isle
-- Info: NM
-----------------------------------
<<<<<<< HEAD
require("scripts/globals/nyzul")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
=======
require('scripts/globals/nyzul')
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.eliminateAllKill(mob)
    end
end

return entity
