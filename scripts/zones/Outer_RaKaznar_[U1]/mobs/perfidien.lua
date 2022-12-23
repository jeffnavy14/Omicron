-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Perfidien")
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("Perfidien: This is my realm... come to leave the mortal coil so soon?", 13)
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	-- prev music will be 65
	player:changeMusic(0, 75)
	player:changeMusic(1, 75)
	player:changeMusic(2, 75)
	player:changeMusic(3, 75)
	player:changeMusic(4, 75)
	player:setCharVar("VagPath4Win", 1)
	if (GetServerVariable("Vag1Active") == 1) then
		SpawnMob(17903728):updateEnmity(killer)
	elseif (GetServerVariable("Vag2Active") == 1) then
		SpawnMob(17903730):updateEnmity(killer)
	elseif (GetServerVariable("Vag3Active") == 1) then
		SpawnMob(17903732):updateEnmity(killer)
	end
	player:PrintToPlayer("Perfidien: I see... then taste true might!", 13)
end

entity.onMobRoam = function(mob, player)
	if (GetServerVariable("Vag1Active") == 0) then
		Mob:DespawnMob(17903727)
	end
	if (GetServerVariable("Vag2Active") == 0) then
		Mob:DespawnMob(17903729)
	end
	if (GetServerVariable("Vag3Active") == 0) then
		Mob:DespawnMob(17903731)
	end
end

entity.onMobDespawn = function(mob)

end

return entity