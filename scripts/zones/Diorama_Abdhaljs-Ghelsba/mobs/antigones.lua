-----------------------------------
-- Zone: Diorama_Abdhaljs-Ghelsba
-- Antigones
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)	
	mob:renameEntity("Antigones")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:addStatusEffect(xi.effect.REGAIN, 100, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 50, 3, 0)
	mob:addMod(xi.mod.DMG,-4000)
	mob:setMod(xi.mod.ACC, 1500)
	mob:setMod(xi.mod.MATT, 800)
	mob:setMod(xi.mod.MACC, 1300)	
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

entity.onMobFight = function(mob, player,target)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
	local HPP = mob:getHPP()
	local DeadGeneral = GetServerVariable("DeadGeneral")
	local AlexUp = GetServerVariable("AlexUp")
	if DeadGeneral == 3 and HPP < 5 and AlexUp == 0 then
		SpawnMob(16953385):updateEnmity(target)
		SetServerVariable("AlexUp", 1)
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller, target)
	local DeadGeneral = GetServerVariable("DeadGeneral")
	SetServerVariable("DeadGeneral", DeadGeneral + 1)
end

entity.onMobDespawn = function(mob)
	if not GetMobByID(16953495):isSpawned() and
		not GetMobByID(16953496):isSpawned() and
		not GetMobByID(16953497):isSpawned() and
		not GetMobByID(16953385):isSpawned() and
		GetServerVariable("AlexDead") == 0
	then
		SpawnMob(16953385)
	end
end

return entity