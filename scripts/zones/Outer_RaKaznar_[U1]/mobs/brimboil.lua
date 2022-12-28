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
	mob:addListener("TAKE_DAMAGE", "BRIMBOIL_TAKE_DAMAGE", function(mobArg, amount, attacker)
    if amount >= 3500 then
		if not GetMobByID(17903664):isSpawned() then
			SpawnMob(17903664):updateEnmity(attacker)
		elseif not GetMobByID(17903665):isSpawned() then
			SpawnMob(17903665):updateEnmity(attacker)
		elseif not GetMobByID(17903666):isSpawned() then
			SpawnMob(17903666):updateEnmity(attacker)
		elseif not GetMobByID(17903667):isSpawned() then
			SpawnMob(17903667):updateEnmity(attacker)
		elseif not GetMobByID(17903668):isSpawned() then
			SpawnMob(17903668):updateEnmity(attacker)
		elseif not GetMobByID(17903669):isSpawned() then
			SpawnMob(17903669):updateEnmity(attacker)
		elseif not GetMobByID(17903670):isSpawned() then
			SpawnMob(17903670):updateEnmity(attacker)
		elseif not GetMobByID(17903671):isSpawned() then
			SpawnMob(17903671):updateEnmity(attacker)
		elseif not GetMobByID(17903672):isSpawned() then
			SpawnMob(17903672):updateEnmity(attacker)
		elseif not GetMobByID(17903673):isSpawned() then
			SpawnMob(17903673):updateEnmity(attacker)
		end
	end
    end)
    
end

entity.onMobEngaged = function(mob, player)
	mob:removeListener("TAKE_DAMAGE")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Vag2Active") == 0 then
		local mobID = mob:getID()
		Mob:DespawnMob(mobID)
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
	if (GetServerVariable("P2Kills") == 5) and 
		not GetMobByID(17903664):isSpawned() and
		not GetMobByID(17903665):isSpawned() and
		not GetMobByID(17903666):isSpawned() and
		not GetMobByID(17903667):isSpawned() and
		not GetMobByID(17903668):isSpawned() and
		not GetMobByID(17903669):isSpawned() and
		not GetMobByID(17903670):isSpawned() and
		not GetMobByID(17903671):isSpawned() and
		not GetMobByID(17903672):isSpawned() and
		not GetMobByID(17903673):isSpawned()
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