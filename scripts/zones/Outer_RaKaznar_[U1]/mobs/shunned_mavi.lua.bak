-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Shunned Mavi")
	if (GetServerVariable("P3Wave1") == 0) then
		mob:setDropID(4038)
	else
		mob:setDropID(4030)
	end
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	if (GetServerVariable("P3Wave1") == 1) then
		local P3W1Kills = GetServerVariable("P3W1Kills")
		SetServerVariable("P3W1Kills", P3W1Kills + 1)
		if GetServerVariable("P3W1Kills") == 22 then
			SetServerVariable("P3Wave1", 0)
			SetServerVariable("P3Wave2", 1)
			SpawnMob(17903701)
			SpawnMob(17903702)
			SpawnMob(17903703)
			SpawnMob(17903704)
			SpawnMob(17903705)
			SpawnMob(17903706)
			SpawnMob(17903707)
		end
	elseif (GetServerVariable("P3Wave4") == 1) then
		local P3W4Kills = GetServerVariable("P3W4Kills")
		SetServerVariable("P3W4Kills", (P3W4Kills + 1))
		if GetServerVariable("P3W4Kills") == 7 then
			local mobID = mob:getID()
			player:setPos(0,0,0)
			player:changeMusic(0, 73)
			player:changeMusic(1, 73)
			player:changeMusic(2, 73)
			player:changeMusic(3, 73)
			player:changeMusic(4, 73)			
			player:setCharVar("VagPathActive", 0)
			SetServerVariable("Vag3Active", 0)
			SetServerVariable("P3Boss2", 0)
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
