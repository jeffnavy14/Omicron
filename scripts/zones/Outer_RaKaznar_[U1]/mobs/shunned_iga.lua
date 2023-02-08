-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Shunned_Iga
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
require("scripts/mixins/job_special")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Shunned Iga")
	mob:setMod(xi.mod.DMG, -5000)
	mob:setMod(xi.mod.ACC, 1300)
	mob:setMod(xi.mod.ATT, 1300)
	mob:setMod(xi.mod.MATT, 700)
	mob:setMod(xi.mod.MACC, 1400)
	mob:setMod(xi.mod.FIRE_SDT, 1500)
    mob:setMod(xi.mod.ICE_SDT, 700)
    mob:setMod(xi.mod.WIND_SDT, 1000)
	mob:setMod(xi.mod.EARTH_SDT, 1000)
    mob:setMod(xi.mod.THUNDER_SDT, 1000)
    mob:setMod(xi.mod.WATER_SDT, 1000)
    mob:setMod(xi.mod.LIGHT_SDT, 1500)
    mob:setMod(xi.mod.DARK_SDT, 700)
	mob:setMod(xi.mod.SLASH_SDT, 1000)
    mob:setMod(xi.mod.PIERCE_SDT, 1000)
    mob:setMod(xi.mod.IMPACT_SDT, 1000)
    mob:setMod(xi.mod.HTH_SDT, 1000)
	if (GetServerVariable("P3Wave1") == 0) then
		mob:setDropID(4038)
	else
		mob:setDropID(4030)
	end
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)

end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Vag3Active") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobDespawn = function(mob)
	if (GetServerVariable("P3Wave1") == 1) then
		local P3W1Kills = GetServerVariable("P3W1Kills")
		SetServerVariable("P3W1Kills", P3W1Kills + 1)
		if GetServerVariable("P3W1Kills") == 22 then
			SetServerVariable("P3Wave1", 0)
			SetServerVariable("P3Wave2", 1)
			local p1ID = 17903795
			repeat
				SpawnMob(p1ID)
				p1ID = p1ID + 1
			until p1ID == 17903802
		end
	elseif (GetServerVariable("P3Wave3") == 1) then
		local P3W3Kills = GetServerVariable("P3W3Kills")
		SetServerVariable("P3W3Kills", (P3W3Kills + 1))
		if GetServerVariable("P3W3Kills") == 12 then
			SetServerVariable("P3Wave3", 0)
			SetServerVariable("P3Wave4", 1)
			local p1ID = 17903814
			repeat
				SpawnMob(p1ID)
				p1ID = p1ID + 1
			until p1ID == 17903824
			player:changeMusic(0, 74)
			player:changeMusic(1, 74)
			player:changeMusic(2, 74)
			player:changeMusic(3, 74)
			player:changeMusic(4, 74)
		end
	end
end

return entity
