-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Murkcrawler")
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	
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
	SetServerVariable("P2Boss1", 2)
	if (GetServerVariable("P2Kills") == 5) then
		GetNPCByID(17904617):setStatus(xi.status.NORMAL)
		GetNPCByID(17904618):setStatus(xi.status.NORMAL)
		GetNPCByID(17904619):setStatus(xi.status.NORMAL)
		GetNPCByID(17904620):setStatus(xi.status.NORMAL)
		GetNPCByID(17904621):setStatus(xi.status.NORMAL)
		GetNPCByID(17904622):setStatus(xi.status.NORMAL)
		SetServerVariable("P2Kills", 0)
	end
end

return entity