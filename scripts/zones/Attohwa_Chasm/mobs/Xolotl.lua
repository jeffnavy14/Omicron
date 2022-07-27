-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Xolotl
-----------------------------------
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setRespawnTime(0, true)
end

entity.onMobDeath = function(mob, player, isKiller)
    player:addTitle(xi.title.XOLOTL_XTRAPOLATOR)
end

entity.onMobDespawn = function(mob)
    -- Do not respawn Xolotl for 1-4 hours
    mob:setRespawnTime(math.random(3600, 14400), true)
end

return entity
