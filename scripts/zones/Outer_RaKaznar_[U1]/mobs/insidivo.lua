-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Insidivo")
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("P1W3Kills", 0)
	SetServerVariable("P1Boss2", 1)
	SpawnMob(17903639)
	SpawnMob(17903640)
	SpawnMob(17903641)
	SpawnMob(17903642)
	SpawnMob(17903643)
	SpawnMob(17903644)
	SpawnMob(17903645)
	SpawnMob(17903646)
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Vag1Active") == 0 then
		local mobID = mob:getID()
		Mob:DespawnMob(mobID)
	end
end

entity.onMobDespawn = function(mob)

end

return entity