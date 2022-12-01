-----------------------------------
--  MOB: Long Gunned Chariot
-- Area: Nyzul Isle
-- Info: Enemy Leader, Uses Homing Missile
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

entity.onMobSpawn = function(mob)
    -- local data = mob:getData('homing')
    -- sets homing missile variant
    -- data.HM = 1
    mob:addListener("WEAPONSKILL_STATE_EXIT", "HOMING_MISSILE_WEAPONSKILL_STATE_EXIT", function(chariotMob, skillid)
        if skillid == 2058 then
            chariotMob:setLocalVar("firstHit", 0)
        end
    end)
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
