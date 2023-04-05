-----------------------------------
-- Area: Escha Zi'Tah
-- Gestalt 2900
-----------------------------------
require("scripts/globals/mobskills")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:setLocalVar("GestaltCSused", 0)
	mob:setMod(xi.mod.ACC, 1300)
	mob:setMod(xi.mod.ATT, 1300)
	mob:setMod(xi.mod.MATT, 700)
	mob:setMod(xi.mod.MACC, 1400)
	mob:setMod(xi.mod.FIRE_SDT, 1300)
	mob:setMod(xi.mod.ICE_SDT, 1300)
	mob:setMod(xi.mod.WIND_SDT, 1300)
	mob:setMod(xi.mod.EARTH_SDT, 1300)
	mob:setMod(xi.mod.THUNDER_SDT, 1300)
	mob:setMod(xi.mod.WATER_SDT, 1300)
	mob:setMod(xi.mod.LIGHT_SDT, 1300)
	mob:setMod(xi.mod.DARK_SDT, 700)
	mob:setMod(xi.mod.SLASH_SDT, 1000)
	mob:setMod(xi.mod.PIERCE_SDT, 1000)
	mob:setMod(xi.mod.IMPACT_SDT, 750)
	mob:setMod(xi.mod.HTH_SDT, 750)
end

entity.onMobFight = function(mob)
	local HPP = mob:getHPP()
	local ChainUse = mob:getLocalVar("GestaltCSused")
	if HPP < 80 and ChainUse == 0 then
		mob:useMobAbility(692)
		mob:setLocalVar("GestaltCSused", 1)
	elseif HPP < 60 and ChainUse == 1 then
		mob:useMobAbility(692)
		SetServerVariable("GestaltCSused", 2)
	elseif HPP < 40 and ChainUse == 2 then
		mob:useMobAbility(692)
		SetServerVariable("GestaltCSused", 3)
	elseif HPP < 20 and ChainUse == 3 then
		mob:useMobAbility(692)
		SetServerVariable("GestaltCSused", 4)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("GestaltKill", 1)
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
