-----------------------------------
-- Zone: Diorama_Abdhaljs-Ghelsba
-- Valkyrie
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)	
	mob:renameEntity("Valkyrie")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:addStatusEffect(xi.effect.REGAIN, 100, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 50, 3, 0)
	mob:addMod(xi.mod.DMG,-4000)
	mob:setMod(xi.mod.ACC, 1500)
	mob:setMod(xi.mod.MATT, 800)
	mob:setMod(xi.mod.MACC, 1300)	
end

entity.onMobEngaged = function(mob, player, target)
	mob:setTP(3000)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
	local MobID = mob:getID()
	SpawnMob(16953485):updateEnmity(target)
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobFight = function(mob, player,target)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	
end

entity.onMobDespawn = function(mob)
	
end

return entity