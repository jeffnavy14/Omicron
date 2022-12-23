-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Ashen Soul")
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
		DespawnMob(mobID)
	end
end

entity.onMobDespawn = function(mob)

end

return entity
