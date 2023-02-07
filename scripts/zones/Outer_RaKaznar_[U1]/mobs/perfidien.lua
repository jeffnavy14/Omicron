-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Perfidien
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Perfidien")
	mob:setMobMod(xi.mobMod.DRAW_IN, 10)
	mob:setMod(xi.mod.DMG, -6000)
	mob:setMod(xi.mod.ACC, 2000)
	mob:setMod(xi.mod.ATT, 2000)
	mob:setMod(xi.mod.MATT, 1000)
	mob:setMod(xi.mod.MACC, 2000)
	mob:setMod(xi.mod.FIRE_SDT, 500)
    mob:setMod(xi.mod.ICE_SDT, 500)
    mob:setMod(xi.mod.WIND_SDT, 500)
	mob:setMod(xi.mod.EARTH_SDT, 500)
    mob:setMod(xi.mod.THUNDER_SDT, 500)
    mob:setMod(xi.mod.WATER_SDT, 500)
    mob:setMod(xi.mod.LIGHT_SDT, 500)
    mob:setMod(xi.mod.DARK_SDT, 500)
	mob:setMod(xi.mod.REGAIN, 10)
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("Perfidien: This is my realm... come to leave the mortal coil so soon?", 13)
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	-- prev music will be 65
	local party = player:getParty()
	for i, partyMember in pairs(party) do
		if partyMember:isPC() then
			partyMember:changeMusic(0, 75)
			partyMember:changeMusic(1, 75)
			partyMember:changeMusic(2, 75)
			partyMember:changeMusic(3, 75)
			partyMember:changeMusic(4, 75)
			partyMember:setCharVar("VagPath4Win", 1)
		end
	end
	if (GetServerVariable("Vag1Active") == 1) then
		SpawnMob(17903709):updateEnmity(killer)
	elseif (GetServerVariable("Vag2Active") == 1) then
		SpawnMob(17903768):updateEnmity(killer)
	elseif (GetServerVariable("Vag3Active") == 1) then
		SpawnMob(17903825):updateEnmity(killer)
	end
	player:PrintToPlayer("Perfidien: I see... then taste true might!", 13)
end

entity.onMobRoam = function(mob, player)
	if (GetServerVariable("Vag1Active") == 0) then
		DespawnMob(17903708)
	end
	if (GetServerVariable("Vag2Active") == 0) then
		DespawnMob(17903767)
	end
	if (GetServerVariable("Vag3Active") == 0) then
		DespawnMob(17903824)
	end
end

entity.onMobDespawn = function(mob)
	
end

return entity