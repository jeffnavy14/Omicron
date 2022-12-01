-----------------------------------
--  MOB: Battledressed Chariot
-- Area: Nyzul Isle
-- Info: Enemy Leader, Uses Discoid
-----------------------------------
<<<<<<< HEAD
mixins = {require("scripts/mixins/families/chariot")}
require("scripts/globals/nyzul")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
=======
mixins = { require('scripts/mixins/families/chariot') }
require('scripts/globals/nyzul')
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.enemyLeaderKill(mob)
    end
end

return entity
