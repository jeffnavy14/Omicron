-----------------------------------
-- Area: Escha Zi'Tah
-- Fleetstalker 2917
-----------------------------------
require("scripts/globals/mobskills")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:setLocalVar("FScsUsed", 0)
	mob:setLocalVar("FSpdUsed", 0)
	mob:setMod(xi.mod.ACC, 1600)
	mob:setMod(xi.mod.ATT, 1600)
	mob:setMod(xi.mod.MATT, 900)
	mob:setMod(xi.mod.MACC, 1600)
	mob:setMod(xi.mod.FIRE_SDT, 250)
	mob:setMod(xi.mod.ICE_SDT, 1150)
	mob:setMod(xi.mod.WIND_SDT, 700)
	mob:setMod(xi.mod.EARTH_SDT, 500)
	mob:setMod(xi.mod.THUNDER_SDT, 700)
	mob:setMod(xi.mod.WATER_SDT, 1300)
	mob:setMod(xi.mod.LIGHT_SDT, 850)
	mob:setMod(xi.mod.DARK_SDT, 850)
	mob:setMod(xi.mod.SLASH_SDT, 1000)
	mob:setMod(xi.mod.PIERCE_SDT, 1000)
	mob:setMod(xi.mod.IMPACT_SDT, 1000)
	mob:setMod(xi.mod.HTH_SDT, 1000)
end

entity.onMobFight = function(mob)
	local HPP = mob:getHPP()
	local CSused = mob:getLocalVar("FScsUsed")
	local PDUsed = mob:getLocalVar("FSpdUsed")
	if HPP < 75 and CSUsed == 0 then
		mob:useMobAbility(692)
		mob:setLocalVar("FScsUsed", 1)
	elseif HPP < 50 and PDused == 0 then
		mob:useMobAbility(693)
		mob:setLocalVar("FSpdUsed", 1)
	elseif HPP < 25 and CSUsed == 1 and PDUsed == 1 then
		mob:useMobAbility(692)
		mob:setLocalVar("FScsUsed", 2)
		mob:useMobAbility(693)
		mob:setLocalVar("FSpdused", 2)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("FleetstalkerKill", 1)
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
