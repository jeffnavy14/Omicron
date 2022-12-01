-----------------------------------
--  MOB: Adamantoise
-- Area: Nyzul Isle
-- Info: Floor 20 and 40 Boss, Tortoise song dispels 3 buffs
-----------------------------------
<<<<<<< HEAD
mixins = { require("scripts/mixins/nyzul_boss_drops") }
require("scripts/globals/nyzul")
require("scripts/globals/status")
=======
mixins = { require('scripts/mixins/nyzul_boss_drops') }
require('scripts/globals/nyzul')
require('scripts/globals/status')
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    -- mob:addImmunity(xi.immunity.STUN)
    -- mob:addImmunity(xi.immunity.SLOW)
    -- mob:addImmunity(xi.immunity.ELEGY)
    -- mob:addImmunity(xi.immunity.TERROR)
    -- mob:addImmunity(xi.immunity.SLEEP)
    -- mob:addImmunity(xi.immunity.POISON)
    mob:setMod(xi.mod.MAIN_DMG_RATING, 36)
    mob:addMod(xi.mod.DEF, 200)
    mob:addMod(xi.mod.ATT, 150)
    mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 15)
end

<<<<<<< HEAD
entity.onMobEngaged= function(mob, target)
=======
entity.onMobEngaged = function(mob, target)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
end

entity.onMobFight = function(mob, target)
end

<<<<<<< HEAD
entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
=======
entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
        xi.nyzul.enemyLeaderKill(mob)
        xi.nyzul.vigilWeaponDrop(player, mob)
    end
end

return entity
