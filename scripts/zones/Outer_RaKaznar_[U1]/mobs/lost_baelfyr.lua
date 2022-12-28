-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Lost Baelfyr")
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	if (GetServerVariable("P1Boss1") == 1) and (GetServerVariable("P1Boss2") == 0) then
		local P1W2Kills = GetServerVariable("P1W2Kills")
		SetServerVariable("P1W2Kills", P1W2Kills + 1)
		if GetServerVariable("P1W2Kills") == 10 then
			SpawnMob(17903638):updateEnmity(player)
		end
	elseif (GetServerVariable("P1Boss2") == 1) and (GetServerVariable("P1Boss3") == 0) then
		local P1W3Kills = GetServerVariable("P1W3Kills")
		SetServerVariable("P1W3Kills", (P1W3Kills + 1))
		if GetServerVariable("P1W3Kills") == 8 then
			SpawnMob(17903647):updateEnmity(player)
			GetServerVariable("P1Boss3", 1)
			player:changeMusic(0, 74)
			player:changeMusic(1, 74)
			player:changeMusic(2, 74)
			player:changeMusic(3, 74)
			player:changeMusic(4, 74)
		end
	end
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Vag1Active") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobDespawn = function(mob)

end

return entity
