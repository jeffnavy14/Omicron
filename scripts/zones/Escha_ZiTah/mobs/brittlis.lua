-----------------------------------
-- Area: Escha Zi'Tah
-- Brittlis KI 2914
-----------------------------------
require("scripts/globals/mobskills")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:setLocalVar("BrittlisCSUsed", 0)
	mob:setMod(xi.mod.ACC, 1500)
	mob:setMod(xi.mod.ATT, 1500)
	mob:setMod(xi.mod.MATT, 800)
	mob:setMod(xi.mod.MACC, 1500)
	mob:setMod(xi.mod.FIRE_SDT, 500)
	mob:setMod(xi.mod.ICE_SDT, 1300)
	mob:setMod(xi.mod.WIND_SDT, 500)
	mob:setMod(xi.mod.EARTH_SDT, 1000)
	mob:setMod(xi.mod.THUNDER_SDT, 1000)
	mob:setMod(xi.mod.WATER_SDT, 700)
	mob:setMod(xi.mod.LIGHT_SDT, 1300)
	mob:setMod(xi.mod.DARK_SDT, 700)
	mob:setMod(xi.mod.SLASH_SDT, 500)
	mob:setMod(xi.mod.PIERCE_SDT, 800)
	mob:setMod(xi.mod.IMPACT_SDT, 1150)
	mob:setMod(xi.mod.HTH_SDT, 1150)
end

entity.onMobFight = function(mob)
	local HPP = mob:getHPP()
	local CSpellUsed = mob:getLocalVar("BrittlisCSUsed")
	if HPP < 80 and CSpellUsed == 0 then
		mob:useMobAbility(692)
		mob:setLocalVar("BrittlisCSUsed", 1)
	elseif HPP < 55 and CSpellUsed == 1 then
		mob:useMobAbility(692)
		mob:setLocalVar("BrittlisCSUsed", 2)
	elseif HPP < 30 and CSpellUsed == 2 then
		mob:useMobAbility(692)
		mob:setLocalVar("BrittlisCSUsed", 3)
	elseif HPP < 5 and CSpellUsed == 3 then
		mob:useMobAbility(692)
		mob:setLocalVar("BrittlisCSUsed", 4)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("BrittlisKill", 1)
	local siltGain = math.random(1, 4)
	local beadGain = 5 + math.random(1, 4)
	player:addCurrency("escha_silt", 9 + siltGain)
	player:addCurrency("escha_silt", beadGain)
end

entity.onMobDespawn = function(mob)
	local gfZitahNPC = GetServerVariable("GFZitahNPC")
	GetNPCByID(gfZitahNPC):setStatus(xi.status.NORMAL)
end

return entity