-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Palloritus")
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("Palloritus: Ohh~hoho! People never come down here to play! Let's have some goodie ol' fun.", 13)
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	player:setCharVar("VagPath3Win", 1)
	if (GetServerVariable("P3Wave4") == 1) then
		local P3W4Kills = GetServerVariable("P3W4Kills")
		SetServerVariable("P3W4Kills", (P3W4Kills + 1))
		if GetServerVariable("P3W4Kills") == 7 then
			local mobID = mob:getID()
			player:PrintToPlayer("You have cleared the third path of Vagary.", 29)
			player:PrintToPlayer("Please make your way to the connection.", 29)
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
	player:PrintToPlayer("Palloritus: Owwwww... okay, this isn't fun anymore... I'm telling your mom on you...", 13)
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
		SetServerVariable("Vag3Active", 0)
		SetServerVariable("P3Boss2", 0)
	end
end

entity.onMobDespawn = function(mob)

end

return entity