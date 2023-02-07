-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Achuka
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Jaundiced Slime")
	mob:setMod(xi.mod.DMG, -5000)
	mob:setMod(xi.mod.ACC, 1300)
	mob:setMod(xi.mod.ATT, 1300)
	mob:setMod(xi.mod.MATT, 600)
	mob:setMod(xi.mod.MACC, 1300)
	mob:setMod(xi.mod.FIRE_SDT, 1150)
    mob:setMod(xi.mod.ICE_SDT, 1150)
    mob:setMod(xi.mod.WIND_SDT, 2000)
	mob:setMod(xi.mod.EARTH_SDT, 1150)
    mob:setMod(xi.mod.THUNDER_SDT, 1150)
    mob:setMod(xi.mod.WATER_SDT, 1150)
    mob:setMod(xi.mod.LIGHT_SDT, 850)
    mob:setMod(xi.mod.DARK_SDT, 850)
	mob:setMod(xi.mod.SLASH_SDT, 500)
    mob:setMod(xi.mod.PIERCE_SDT, 500)
    mob:setMod(xi.mod.IMPACT_SDT, 250)
    mob:setMod(xi.mod.HTH_SDT, 250)
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	if (GetServerVariable("P2Boss3") > 1 ) then	
		local P2Kills = GetServerVariable("P2Kills")
		SetServerVariable("P2Kills", P2Kills + 1)
		if (GetServerVariable("P2Kills") == 5) then
			player:PrintToPlayer("You have cleared the second path of Vagary.", 29)
			player:PrintToPlayer("Please make your way to the connection.", 29)
			player:changeMusic(0, 73)
			player:changeMusic(1, 73)
			player:changeMusic(2, 73)
			player:changeMusic(3, 73)
			player:changeMusic(4, 73)
			player:setCharVar("VagPathActive", 0)
			SetServerVariable("Vag2Active", 0)
		end
	end
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Vag2Active") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobDespawn = function(mob, player)
	if (GetServerVariable("P2Kills") ~= 15) then
		local P2Kills = GetServerVariable("P2Kills")
		SetServerVariable("P2Kills", P2Kills + 1)
		if (GetServerVariable("P2Boss3") == 0) then
			if (GetServerVariable("P2Boss2") == 0) then
				if (GetServerVariable("P2Boss1") == 0) then
					if (GetServerVariable("P2Kills") == 15) then
						GetNPCByID(17904617):setStatus(xi.status.NORMAL)
						GetNPCByID(17904618):setStatus(xi.status.NORMAL)
						GetNPCByID(17904619):setStatus(xi.status.NORMAL)
						GetNPCByID(17904620):setStatus(xi.status.NORMAL)
						GetNPCByID(17904621):setStatus(xi.status.NORMAL)
						GetNPCByID(17904622):setStatus(xi.status.NORMAL)
						SetServerVariable("P2Kills", 0)
					end
				elseif (GetServerVariable("P2Boss1") == 2) then
					if (GetServerVariable("P2Kills") == 15) then
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
				if (GetServerVariable("P2Kills") == 15) and
					not GetMobByID(17903664):isSpawned() and
					not GetMobByID(17903665):isSpawned() and
					not GetMobByID(17903666):isSpawned() and
					not GetMobByID(17903667):isSpawned() and
					not GetMobByID(17903668):isSpawned() and
					not GetMobByID(17903669):isSpawned() and
					not GetMobByID(17903670):isSpawned() and
					not GetMobByID(17903671):isSpawned() and
					not GetMobByID(17903672):isSpawned() and
					not GetMobByID(17903673):isSpawned() 
				then
						GetNPCByID(17904617):setStatus(xi.status.NORMAL)
						GetNPCByID(17904618):setStatus(xi.status.NORMAL)
						GetNPCByID(17904619):setStatus(xi.status.NORMAL)
						GetNPCByID(17904620):setStatus(xi.status.NORMAL)
						GetNPCByID(17904621):setStatus(xi.status.NORMAL)
						GetNPCByID(17904622):setStatus(xi.status.NORMAL)
					SetServerVariable("P2Kills", 0)
				end
			elseif (GetServerVariable("P2Boss3") == 2) then
				if (GetServerVariable("P2Kills") == 15) then
					GetNPCByID(17904617):setStatus(xi.status.NORMAL)
					GetNPCByID(17904618):setStatus(xi.status.NORMAL)
					GetNPCByID(17904619):setStatus(xi.status.NORMAL)
					GetNPCByID(17904620):setStatus(xi.status.NORMAL)
					GetNPCByID(17904621):setStatus(xi.status.NORMAL)
					GetNPCByID(17904622):setStatus(xi.status.NORMAL)
					SetServerVariable("P2Kills", 0)
				end
			end
		end
	end
end

return entity