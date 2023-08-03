-----------------------------------
-- Zone: Diorama_Abdhaljs-Ghelsba
-- Dread Thinker
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)	
	mob:renameEntity("Dread Thinker")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:addStatusEffect(xi.effect.REGAIN, 40, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 50, 3, 0)
	mob:addMod(xi.mod.DMG,-3400)
	mob:setMod(xi.mod.ACC, 1250)
	mob:setMod(xi.mod.MATT, 70)
	mob:setMod(xi.mod.MACC, 1250)	
end

entity.onMobEngaged = function(mob, player)
	mob:setTP(3000)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobFight = function(mob, player)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
		
end

entity.onMobDespawn = function(mob)
	local mobID = mob:getID()
	if mobID > 16953442 then
		SpawnMob(mobID + 5):updateEnmity(target)
	end
end

return entity