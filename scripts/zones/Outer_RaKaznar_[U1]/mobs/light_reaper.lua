-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Light Reaper")
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	if (GetServerVariable("P3Wave2") == 1) then
		local P3W2Kills = GetServerVariable("P3W2Kills")
		SetServerVariable("P3W2Kills", P3W2Kills + 1)
		if GetServerVariable("P3W2Kills") == 7 then
			SetServerVariable("P3Wave2", 0)
			SetServerVariable("P3Wave3", 1)
			SpawnMob(17903708)
			SpawnMob(17903709)
			SpawnMob(17903710)
			SpawnMob(17903711)
			SpawnMob(17903712)
			SpawnMob(17903713)
			SpawnMob(17903714)
			SpawnMob(17903715)
			SpawnMob(17903716)
			SpawnMob(17903717)
			SpawnMob(17903718)
			SpawnMob(17903719)
		end
	end
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Vag3Active") == 0 then
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

end

return entity