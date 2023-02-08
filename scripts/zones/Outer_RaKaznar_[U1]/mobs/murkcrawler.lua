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
	mob:setMod(xi.mod.DMG, -5000)
	mob:setMod(xi.mod.ACC, 1300)
	mob:setMod(xi.mod.ATT, 1300)
	mob:setMod(xi.mod.MATT, 600)
	mob:setMod(xi.mod.MACC, 1300)
	mob:setMod(xi.mod.FIRE_SDT, 1500)
    mob:setMod(xi.mod.ICE_SDT, 1000)
    mob:setMod(xi.mod.WIND_SDT, 500)
	mob:setMod(xi.mod.EARTH_SDT, 300)
    mob:setMod(xi.mod.THUNDER_SDT, 500)
    mob:setMod(xi.mod.WATER_SDT, 200)
    mob:setMod(xi.mod.LIGHT_SDT, 1300)
    mob:setMod(xi.mod.DARK_SDT, 1000)
	mob:setMod(xi.mod.SLASH_SDT, 875)
    mob:setMod(xi.mod.PIERCE_SDT, 875)
    mob:setMod(xi.mod.IMPACT_SDT, 250)
    mob:setMod(xi.mod.HTH_SDT, 250)
	mob:setMod(xi.mod.REGAIN, 10)
end

entity.onMobEngaged = function(mob, player)
	-- listener for Venomous Vapor to apply 30s stat down aura use Foul Waters instead
	mob:addListener("ABILITY_USE", "BUBBLE_ARMOR", function(mobArg, amount, attacker)
		mob:addStatusEffect(xi.effect.GEO_MAGIC_DEF_DOWN, 40, 0, 60)
	end)
end

entity.onMobFight = function(mob, target)
	local mobID = mob:getID()
	if GetServerVariable("Vag2Active") == 0 then
		DespawnMob(mobID)
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	mob:removeListener("ABILITY_USE")
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

return entity