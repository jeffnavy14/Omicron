-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Dread Galka
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
	mob:renameEntity("Dread Galka")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("Brrr...", 0, mob:getPacketName())
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	player:PrintToPlayer("huoi...", 0, mob:getPacketName())
end

entity.onMobDespawn = function(mob)
	
end

return entity