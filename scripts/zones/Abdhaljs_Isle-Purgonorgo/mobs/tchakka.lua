-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Tchakka
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Tchakka")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 50, 3, 0)
	mob:addMod(xi.mod.DMG,-5000)
	mob:setMod(xi.mod.ACC, 1000)
	mob:setMod(xi.mod.MATT, 400)
	mob:setMod(xi.mod.MACC, 1000)
end

entity.onMobEngaged = function(mob, player)
	player:ChangeMusic(0, 62)
	player:ChangeMusic(1, 62)
	player:ChangeMusic(2, 62)
	player:ChangeMusic(3, 62)
	player:ChangeMusic(4, 62)
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	player:ChangeMusic(0, 33)
	player:ChangeMusic(1, 33)
	player:ChangeMusic(2, 33)
	player:ChangeMusic(3, 33)
	player:ChangeMusic(4, 33)
end

entity.onMobDespawn = function(mob)
	
	SetServerVariable("nmTchakka", 0)
	
end

return entity
