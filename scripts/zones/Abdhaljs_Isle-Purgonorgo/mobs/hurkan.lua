-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Hurkan
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Hurkan")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
	mob:hideHP(true)
	mob:addMod(xi.mod.ACC, 150)
	
end

entity.onMobEngaged = function(mob, player)
	player:ChangeMusic(0, 62)
	player:ChangeMusic(1, 62)
	player:ChangeMusic(2, 62)
	player:ChangeMusic(3, 62)
	player:ChangeMusic(4, 62)
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	player:ChangeMusic(0, 200)
	player:ChangeMusic(1, 200)
	player:ChangeMusic(2, 200)
	player:ChangeMusic(3, 200)
	player:ChangeMusic(4, 200)
end

entity.onMobDespawn = function(mob)

	SetServerVariable("nmHurkan", 0)
	
end

return entity