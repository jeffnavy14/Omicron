-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Dread Lizard
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Dread Reptile")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
	mob:hideHP(true)
	mob:addMod(xi.mod.ACC, 150)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
		player:addCurrency('infamy', 1)
end

return entity