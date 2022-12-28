-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Blightslither")
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("P1W2Kills", 0)
	SetServerVariable("P1Boss1", 1)
	SpawnMob(17903628)
	SpawnMob(17903629)
	SpawnMob(17903630)
	SpawnMob(17903631)
	SpawnMob(17903632)
	SpawnMob(17903633)
	SpawnMob(17903634)
	SpawnMob(17903635)
	SpawnMob(17903636)
	SpawnMob(17903637)
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