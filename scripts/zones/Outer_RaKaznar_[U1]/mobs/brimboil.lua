-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
	mob:renameEntity("Brimboil")
	mob:setMod(xi.mod.DMG, -5000)
	mob:setMod(xi.mod.ACC, 1300)
	mob:setMod(xi.mod.ATT, 1300)
	mob:setMod(xi.mod.MATT, 700)
	mob:setMod(xi.mod.MACC, 1400)
	mob:setMod(xi.mod.FIRE_SDT, 1150)
    mob:setMod(xi.mod.ICE_SDT, 1150)
    mob:setMod(xi.mod.WIND_SDT, 1300)
	mob:setMod(xi.mod.EARTH_SDT, 1150)
    mob:setMod(xi.mod.THUNDER_SDT, 1150)
    mob:setMod(xi.mod.WATER_SDT, 1150)
    mob:setMod(xi.mod.LIGHT_SDT, 850)
    mob:setMod(xi.mod.DARK_SDT, 850)
	mob:setMod(xi.mod.SLASH_SDT, 500)
    mob:setMod(xi.mod.PIERCE_SDT, 500)
    mob:setMod(xi.mod.IMPACT_SDT, 250)
    mob:setMod(xi.mod.HTH_SDT, 250)
	mob:addListener("TAKE_DAMAGE", "BRIMBOIL_TAKE_DAMAGE", function(mobArg, amount, attacker)
    if amount >= 3500 then
		if not GetMobByID(17903756):isSpawned() then
			SpawnMob(17903756):updateEnmity(attacker)
		elseif not GetMobByID(17903757):isSpawned() then
			SpawnMob(17903757):updateEnmity(attacker)
		elseif not GetMobByID(17903758):isSpawned() then
			SpawnMob(17903758):updateEnmity(attacker)
		elseif not GetMobByID(17903759):isSpawned() then
			SpawnMob(17903759):updateEnmity(attacker)
		elseif not GetMobByID(17903760):isSpawned() then
			SpawnMob(17903760):updateEnmity(attacker)
		elseif not GetMobByID(17903761):isSpawned() then
			SpawnMob(17903761):updateEnmity(attacker)
		elseif not GetMobByID(17903762):isSpawned() then
			SpawnMob(17903762):updateEnmity(attacker)
		elseif not GetMobByID(17903763):isSpawned() then
			SpawnMob(17903763):updateEnmity(attacker)
		elseif not GetMobByID(17903764):isSpawned() then
			SpawnMob(17903764):updateEnmity(attacker)
		elseif not GetMobByID(17903765):isSpawned() then
			SpawnMob(17903765):updateEnmity(attacker)
		end
	end
    end)
    
end

entity.onMobEngaged = function(mob, player)
	mob:removeListener("TAKE_DAMAGE")
end

entity.onMobFight = function(mob, target)
	local mobID = mob:getID()
	if GetServerVariable("Vag2Active") == 0 then
		DespawnMob(mobID)
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("P2Boss2", 2)
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Vag2Active") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
		player:setPos(0,0,0)
		player:changeMusic(0, 73)
		player:changeMusic(1, 73)
		player:changeMusic(2, 73)
		player:changeMusic(3, 73)
		player:changeMusic(4, 73)
		player:setCharVar("VagPathActive", 0)
	end
end

entity.onMobDespawn = function(mob)
	SetServerVariable("P2Boss2", 2)
	if (GetServerVariable("P2Kills") == 15) and 
		not GetMobByID(17903756):isSpawned() and
		not GetMobByID(17903757):isSpawned() and
		not GetMobByID(17903758):isSpawned() and
		not GetMobByID(17903759):isSpawned() and
		not GetMobByID(17903760):isSpawned() and
		not GetMobByID(17903761):isSpawned() and
		not GetMobByID(17903762):isSpawned() and
		not GetMobByID(17903763):isSpawned() and
		not GetMobByID(17903764):isSpawned() and
		not GetMobByID(17903765):isSpawned()
	then
		GetNPCByID(17904617):setStatus(xi.status.NORMAL)
		GetNPCByID(17904618):setStatus(xi.status.NORMAL)
		GetNPCByID(17904619):setStatus(xi.status.NORMAL)
		GetNPCByID(17904620):setStatus(xi.status.NORMAL)
		GetNPCByID(17904621):setStatus(xi.status.NORMAL)
		GetNPCByID(17904622):setStatus(xi.status.NORMAL)
		SetServerVariable("P2Kills", 0)
	end
end

return entity