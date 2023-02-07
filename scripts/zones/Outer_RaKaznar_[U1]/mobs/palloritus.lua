-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Palloritus
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Palloritus")
	mob:setMod(xi.mod.DMG, -6000)
	mob:setMod(xi.mod.ACC, 1250)
	mob:setMod(xi.mod.ATT, 1250)
	mob:setMod(xi.mod.MATT, 500)
	mob:setMod(xi.mod.MACC, 1250)
	mob:setMod(xi.mod.FIRE_SDT, 700)
    mob:setMod(xi.mod.ICE_SDT, 300)
    mob:setMod(xi.mod.WIND_SDT, 300)
	mob:setMod(xi.mod.EARTH_SDT, 200)
    mob:setMod(xi.mod.THUNDER_SDT, 500)
    mob:setMod(xi.mod.WATER_SDT, 200)
    mob:setMod(xi.mod.LIGHT_SDT, 500)
    mob:setMod(xi.mod.DARK_SDT, 50)
	mob:setMod(xi.mod.SLASH_SDT, 1000)
    mob:setMod(xi.mod.PIERCE_SDT, 1000)
    mob:setMod(xi.mod.IMPACT_SDT, 1000)
    mob:setMod(xi.mod.HTH_SDT, 1000)
	player:changeMusic(0, 74)
	player:changeMusic(1, 74)
	player:changeMusic(2, 74)
	player:changeMusic(3, 74)
	player:changeMusic(4, 74)
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