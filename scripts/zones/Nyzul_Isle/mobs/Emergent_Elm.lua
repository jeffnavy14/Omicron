-----------------------------------
--  MOB: Emergent Elm
-- Area: Nyzul Isle
-- Info: NM
-----------------------------------
<<<<<<< HEAD
require("scripts/globals/nyzul")
require("scripts/globals/additional_effects")
require("scripts/globals/status")
=======
require('scripts/globals/nyzul')
require('scripts/globals/additional_effects')
require('scripts/globals/status')
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
<<<<<<< HEAD
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.BIND, {chance = 25, duration = 30})
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
=======
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.BIND, { chance = 25, duration = 30 })
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.eliminateAllKill(mob)
    end
end

return entity
