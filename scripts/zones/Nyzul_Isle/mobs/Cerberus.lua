-----------------------------------
--  MOB: Cerberus
-- Area: Nyzul Isle
-- Info: Floor 60 80 and 100 Boss
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
    mob:setMod(xi.mod.DOUBLE_ATTACK, 20)
    mob:setMod(xi.mod.REGEN, 10) -- validate
    -- mdt already set in mob family mods
    mob:setMod(xi.mod.POISON_MEVA, 100)
    mob:setMod(xi.mod.PARALYZE_MEVA, 100)
    mob:setMod(xi.mod.BLIND_MEVA, 100)
    mob:setMod(xi.mod.SILENCE_MEVA, 100)
    mob:setMod(xi.mod.SLOW_MEVA, 125)
    mob:addMod(xi.mod.ATT, 75)
    mob:setMod(xi.mod.DEFP, 48)
    mob:setMod(xi.mod.MAIN_DMG_RATING, 40)
    -- mob:addImmunity(xi.immunity.SLEEP)
    -- mob:addImmunity(xi.immunity.TERROR)
    mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 15)
end

entity.onMobFight = function(mob, target)
    if mob:getHPP() > 25 then
        mob:setMod(xi.mod.REGAIN, 10)
    else
        mob:setMod(xi.mod.REGAIN, 70)
    end
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
        xi.nyzul.handleRunicKey(mob)
    end
end

return entity
