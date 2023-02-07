-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Lightreaper
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Lightreaper")
	mob:setMod(xi.mod.DMG, -6000)
	mob:setMod(xi.mod.ACC, 1250)
	mob:setMod(xi.mod.ATT, 1250)
	mob:setMod(xi.mod.MATT, 500)
	mob:setMod(xi.mod.MACC, 1250)
	mob:setMod(xi.mod.FIRE_SDT, 1300)
    mob:setMod(xi.mod.ICE_SDT, 300)
    mob:setMod(xi.mod.WIND_SDT, 700)
	mob:setMod(xi.mod.EARTH_SDT, 600)
    mob:setMod(xi.mod.THUNDER_SDT, 700)
    mob:setMod(xi.mod.WATER_SDT, 600)
    mob:setMod(xi.mod.LIGHT_SDT, 1300)
    mob:setMod(xi.mod.DARK_SDT, 150)
	mob:setMod(xi.mod.SLASH_SDT, 875)
    mob:setMod(xi.mod.PIERCE_SDT, 8750)
    mob:setMod(xi.mod.IMPACT_SDT, 1000)
    mob:setMod(xi.mod.HTH_SDT, 1000)
	mob:setMod(xi.mod.REGAIN, 10)
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	
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
	end
end

entity.onMobDespawn = function(mob)
	if (GetServerVariable("P3Wave2") == 1) then
		local P3W2Kills = GetServerVariable("P3W2Kills")
		SetServerVariable("P3W2Kills", P3W2Kills + 1)
		if GetServerVariable("P3W2Kills") == 7 then
			SetServerVariable("P3Wave2", 0)
			SetServerVariable("P3Wave3", 1)
			local p1ID = 17903802
			repeat
				SpawnMob(p1ID)
				p1ID = p1ID + 1
			until p1ID == 17903814
		end
	end
end

return entity