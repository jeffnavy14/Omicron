-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Lost_Craver
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
	mob:renameEntity("Lost Craver")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
end

entity.onMobEngaged = function(mob, player)
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	player:PrintToPlayer("...", 0, mob:getPacketName())
end

entity.onMobDespawn = function(mob)
end

return entity