-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Lost Gnat
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Lost Frog")
	mob:setMobMod(xi.mobMod.NO_MOVE, 1)
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
	mob:hideHP(true)
	mob:addMod(xi.mod.ACC, 150)
	mob:setMod(xi.mod.DOUBLE_ATTACK, 25)
end
		
entity.onMobEngaged = function(mob, target)
	mob:setMobMod(xi.mobMod.NO_MOVE, 0)
	SpawnMob(mob:getID() + 15):updateEnmity(target) --Dread Cracklaw A
	SpawnMob(mob:getID() + 30):updateEnmity(target) --Dread Cracklaw B
	SpawnMob(mob:getID() + 45):updateEnmity(target) --Dread Pugil A
	SpawnMob(mob:getID() + 60):updateEnmity(target) --Dread Pugil B
	SpawnMob(mob:getID() + 75):updateEnmity(target) --Kraken
end
		
entity.onMobFight = function(mob, target)
		
end
		
entity.onMobDeath = function(mob, player, isKiller, noKiller)
		player:addCurrency('infamy', 1)
end
		
entity.onMobDespawn = function(mob)
	
end

return entity