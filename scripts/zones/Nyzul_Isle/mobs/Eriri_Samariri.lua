-----------------------------------
--  MOB: Eiri Samasriri
-- Area: Nyzul Isle
-- Info: Enemy Leader, Spams Frog Song
<<<<<<< HEAD
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/nyzul")
=======
-----------------------------------
require('scripts/globals/status')
require('scripts/globals/nyzul')
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
-----------------------------------
local entity = {}

entity.onMonsterAbilityPrepare = function(mob, skill)
    if math.random(1, 4) > 1 then
        return 1957
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
        local instance = mob:getInstance()
        local chars    = instance:getChars()

        for _, entities in ipairs(chars) do
            if player:hasStatusEffect(xi.effect.COSTUME) then
                player:delStatusEffect(xi.effect.COSTUME)
            end
        end
    end
end

return entity
