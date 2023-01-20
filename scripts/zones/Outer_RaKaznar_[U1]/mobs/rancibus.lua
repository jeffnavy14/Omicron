-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Rancibus")
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("Rancibus: Yu-h fu-ids 'ill b'ine", 13)
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	if (GetServerVariable("P2Kills") == 5) then
		player:PrintToPlayer("You have cleared the second path of Vagary.", 29)
		player:PrintToPlayer("Please make your way to the connection.", 29)
		player:setCharVar("VagPathActive", 0)
	end
	SetServerVariable("P2Boss3", 2)
	player:setCharVar("VagPath2Win", 1)
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
	
end

return entity