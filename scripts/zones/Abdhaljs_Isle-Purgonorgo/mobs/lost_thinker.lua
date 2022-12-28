-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Lost_Thinker
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
	mob:renameEntity("Lost Thinker")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
end

entity.onMobEngaged = function(mob, player)
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	
end

entity.onMobDespawn = function(mob)
	
end

return entity