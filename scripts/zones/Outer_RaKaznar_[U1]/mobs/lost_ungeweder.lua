-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Lost Ungeweder
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Lost Ungeweder")
	mob:setMod(xi.mod.WATER_NULL, 1)
	mob:setMod(xi.mod.EARTH_NULL, 1)
	mob:setMod(xi.mod.CAPACITY_BONUS, -100)
	mob:setMod(xi.mod.DMG,-5000)
	mob:setMod(xi.mod.DMGPHYS_II,-3000)
	mob:setMod(xi.mod.LTNG_ABSORB, 100)
	mob:setMod(xi.mod.WIND_ABSORB, 100)
	mob:setMod(xi.mod.ACC, 1250)
	mob:setMod(xi.mod.MATT, 400)
	mob:setMod(xi.mod.MACC, 1250)
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	local party = player:getParty()
	local partySize = player:getPartySize()
	local P1W2Kills = GetServerVariable("P1W2Kills")
	local P1W3Kills = GetServerVariable("P1W3Kills")
	
	if 
		(GetServerVariable("P1Boss1") == 1) and
		(GetServerVariable("P1Boss2") == 0) and
		(GetServerVariable("P1W2Kills") == 25)
	then
		SpawnMob(17903678):updateEnmity(player)
	elseif
		(GetServerVariable("P1Boss2") == 1) and
		(GetServerVariable("P1Boss3") == 0) and 
		(GetServerVariable("P1W3Kills") == 20)
	then
		SpawnMob(17903707):updateEnmity(player)
		SetServerVariable("P1Boss3", 1)
		for i, partyMember in pairs(party) do
			if partyMember:isPC() then
				partyMember:changeMusic(0, 74)
				partyMember:changeMusic(1, 74)
				partyMember:changeMusic(2, 74)
				partyMember:changeMusic(3, 74)
				partyMember:changeMusic(4, 74)
			end
		end
	end
end

entity.onMobFight = function(mob, target)
	local mobID = mob:getID()
	if GetServerVariable("P1Boss2") == 1 and
		GetServerVariable("P1Boss3", 0) and
		mobID < 17903678
	then
		DespawnMob(mobID)
	end
	if GetServerVariable("Vag1Active") == 0 then
		DespawnMob(mobID)
	end
end

entity.onMobRoam = function(mob, player)
	local mobID = mob:getID()
	if GetServerVariable("P1Boss2") == 1 and
		GetServerVariable("P1Boss3", 0) and
		mobID < 17903678
	then
		DespawnMob(mobID)
	end
	if GetServerVariable("Vag1Active") == 0 then
		DespawnMob(mobID)
	end
end

entity.onMobDespawn = function(mob)
	local P1W2Kills = GetServerVariable("P1W2Kills")
	local P1W3Kills = GetServerVariable("P1W3Kills")
	if (GetServerVariable("P1Boss1") == 1) and
		(GetServerVariable("P1Boss2") == 0)
	then
		SetServerVariable("P1W2Kills", P1W2Kills + 1)
	elseif 
		(GetServerVariable("P1Boss2") == 1) and
		(GetServerVariable("P1Boss3") == 0)
	then
		SetServerVariable("P1W3Kills", P1W3Kills + 1)
	end
end

return entity