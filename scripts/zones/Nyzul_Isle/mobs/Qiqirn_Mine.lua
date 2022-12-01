-----------------------------------
-- Area: Nyzul Isle
--  MOB: Qiqirn Mine
-- Note: Explosive mine from Qiqrin
-----------------------------------
<<<<<<< HEAD
require("scripts/globals/status")
=======
require('scripts/globals/status')
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setUnkillable(true)
    mob:hideHP(true)
<<<<<<< HEAD
    mob:SetAutoAttackEnabled(false)
=======
    mob:setAutoAttackEnabled(false)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    mob:setStatus(xi.status.DISAPPEAR)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
    mob:setMobMod(xi.mobMod.SIGHT_RANGE, 15)
    mob:setMobMod(xi.mobMod.SOUND_RANGE, 15)
end

<<<<<<< HEAD
entity.onMobDeath = function(mob, player, isKiller)
=======
entity.onMobDeath = function(mob, player, optParams)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
end

return entity
