-----------------------------------
-- Area: Escha Zi'Tah
-- Ferrodon ki 2904
-----------------------------------
require("scripts/globals/mobskills")
---------------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	--mob:setMod(xi.mod.DMG, -5000)
	mob:setMod(xi.mod.ACC, 1300)
	mob:setMod(xi.mod.ATT, 1300)
	mob:setMod(xi.mod.MATT, 700)
	mob:setMod(xi.mod.MACC, 1400)
	mob:setMod(xi.mod.FIRE_SDT, 750)
    mob:setMod(xi.mod.ICE_SDT, 750)
    mob:setMod(xi.mod.WIND_SDT, 750)
	mob:setMod(xi.mod.EARTH_SDT, 750)
    mob:setMod(xi.mod.THUNDER_SDT, 750)
    mob:setMod(xi.mod.WATER_SDT, 1300)
    mob:setMod(xi.mod.LIGHT_SDT, 750)
    mob:setMod(xi.mod.DARK_SDT, 500)
	mob:setMod(xi.mod.SLASH_SDT, 500)
    mob:setMod(xi.mod.PIERCE_SDT, 500)
    mob:setMod(xi.mod.IMPACT_SDT, 250)
    mob:setMod(xi.mod.HTH_SDT, 250)
	mob:setLocalVar("FerrBoostUse", 0)
	mob:setLocalVar("FerrBerserkUse", 0)
	mob:setLocalVar("FerrSlamUse", 0)
end

entity.onMobFight = function(mob)	
	local Slam = mob:getLocalVar("FerrSlamUse")
	local BoostUse = mob:getLocalVar("FerrBoostUse")
	local BerserkUse = mob:getLocalVar("FerrBerserkUse")
	local HPP = mob:getHPP()
	if HPP < 90 and BoostUse == 0 then
		mob:useMobAbility(700) -- boost
		mob:setLocalVar("FerrBoostUse", 1)
	elseif HPP < 80 and BerserkUse == 0 then
		mob:useMobAbility(2217) -- berserk
		mob:setLocalVar("FerrBerserkUse", 1)
	elseif HPP < 70 and BoostUse == 1 then
		mob:useMobAbility(700) -- boost
		mob:setLocalVar("FerrBoostUse", 2)
	elseif HPP < 60 and BerserkUse == 1 then
		mob:useMobAbility(2217) -- berserk
		mob:setLocalVar("FerrBerserkUse", 2)
	elseif HPP < 50 and BoostUse == 2 then
		mob:useMobAbility(700) -- boost
		mob:setLocalVar("FerrBoostUse", 3)
	elseif HPP < 40 and BerserkUse == 2 then
		mob:useMobAbility(2217) -- berserk
		mob:setLocalVar("FerrBerserkUse", 3)
	elseif HPP < 30 and BoostUse == 3 then
		mob:useMobAbility(700) -- boost
		mob:setLocalVar("FerrBoostUse", 4)
	elseif HPP < 26 and Slam ~= 1 then
		mob:useMobAbility(2101) -- demoralizing_roar
		mob:timer(3000, function(mob)
			mob:useMobAbility(2101) -- demoralizing_roar
		end)
		mob:timer(6000, function(mob)
			mob:useMobAbility(2101) -- demoralizing_roar
		end)
		mob:setLocalVar("FerrSlamUse", 1)
	elseif HPP < 20 and BerserkUse == 3 then
		mob:useMobAbility(2217) -- berserk
		mob:setLocalVar("FerrBerserkUse", 4)
	elseif HPP < 10 and BoostUse == 4 then
		mob:useMobAbility(700) -- boost
		mob:setLocalVar("FerrBoostUse", 5)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("FerrodonKill", 1)
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