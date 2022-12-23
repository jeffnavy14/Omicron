-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Plouton")
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("Plouton: Not even Twilight can devour me! What chance do you think you have!", 13)
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	if (GetServerVariable("P1Boss3") == 1) or
		(GetServerVariable("P2Boss3") == 1) or
		(GetServerVariable("P3Boss2") == 1)
	then
		player:changeMusic(0, 74)
		player:changeMusic(1, 74)
		player:changeMusic(2, 74)
		player:changeMusic(3, 74)
		player:changeMusic(4, 74)
	else
		player:changeMusic(0, 62)
		player:changeMusic(1, 62)
		player:changeMusic(2, 62)
		player:changeMusic(3, 62)
		player:changeMusic(4, 62)
	end
	player:PrintToPlayer("Plouton: I shall control the Styx! Not that worthless hooded one...", 13)
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Vag1Active") == 0 then
		Mob:DespawnMob(17903727)
	end
	if GetServerVariable("Vag2Active") == 0 then
		Mob:DespawnMob(17903729)
	end
	if GetServerVariable("Vag3Active") == 0 then
		Mob:DespawnMob(17903731)
	end
end

entity.onMobDespawn = function(mob)

end

return entity