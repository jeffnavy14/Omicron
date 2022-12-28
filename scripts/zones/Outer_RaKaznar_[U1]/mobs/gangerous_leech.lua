-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Gangerous Leech")
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Vag2Active") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobDespawn = function(mob)
	if (GetServerVariable("P2Kills") ~= 5) then
		local P2Kills = GetServerVariable("P2Kills")
		SetServerVariable("P2Kills", P2Kills + 1)
		if (GetServerVariable("P2Boss3") == 0) then
			if (GetServerVariable("P2Boss2") == 0) then
				if (GetServerVariable("P2Boss1") == 0) then
					if (GetServerVariable("P2Kills") == 5) then
						GetNPCByID(17904617):setStatus(xi.status.NORMAL)
						GetNPCByID(17904618):setStatus(xi.status.NORMAL)
						GetNPCByID(17904619):setStatus(xi.status.NORMAL)
						GetNPCByID(17904620):setStatus(xi.status.NORMAL)
						GetNPCByID(17904621):setStatus(xi.status.NORMAL)
						GetNPCByID(17904622):setStatus(xi.status.NORMAL)
						SetServerVariable("P2Kills", 0)
					end
				elseif (GetServerVariable("P2Boss1") == 2) then
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
			elseif (GetServerVariable("P2Boss2") == 2) then
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
		elseif (GetServerVariable("P2Boss3") == 2) then
			if (GetServerVariable("P2Kills") == 5) then
				player:PrintToPlayer("You have cleared the second path of Vagary.", 29)
				player:PrintToPlayer("Please make your way to the connection.", 29)
				player:changeMusic(0, 73)
				player:changeMusic(1, 73)
				player:changeMusic(2, 73)
				player:changeMusic(3, 73)
				player:changeMusic(4, 73)
				player:setCharVar("VagPathActive", 0)
				SetServerVariable("Vag2Active")
			end
		end
	end
end

return entity