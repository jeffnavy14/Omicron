-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Insidivo
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Insidivo")
	mob:setMod(xi.mod.DMG, -5000)
	mob:setMod(xi.mod.ACC, 1250)
	mob:setMod(xi.mod.MATT, 400)
	mob:setMod(xi.mod.MACC, 1250)
	mob:setMod(xi.mod.FIRE_SDT, 850)
    mob:setMod(xi.mod.ICE_SDT, 850)
    mob:setMod(xi.mod.WIND_SDT, 50)
	mob:setMod(xi.mod.EARTH_SDT, 850)
    mob:setMod(xi.mod.THUNDER_SDT, 500)
    mob:setMod(xi.mod.WATER_SDT, 500)
    mob:setMod(xi.mod.LIGHT_SDT, 200)
    mob:setMod(xi.mod.DARK_SDT, 850)
	mob:setMod(xi.mod.FASTCAST, 60)
end

entity.onMobFight = function(mob, target)
	local mobID = mob:getID()
	if GetServerVariable("Vag1Active") == 0 then
		DespawnMob(mobID)
	end
end

entity.onMobEngaged = function(mob, player)
	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("P1W3Kills", 0)
	SetServerVariable("P1Boss2", 1)
	local p1ID = 17903679
	repeat
		SpawnMob(p1ID)
		p1ID = p1ID + 1
	until p1ID == 17903707
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Vag1Active") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobDespawn = function(mob)

end

return entity