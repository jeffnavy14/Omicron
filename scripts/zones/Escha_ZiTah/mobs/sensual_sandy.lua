-----------------------------------
-- Area: Escha Zi'Tah
-- Sensual Sandy KI 2912
-----------------------------------
require("scripts/globals/mobskills")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:setLocalVar("EBadBreathUsed", 0)
	mob:setMod(xi.mod.ACC, 1500)
	mob:setMod(xi.mod.ATT, 1500)
	mob:setMod(xi.mod.MATT, 800)
	mob:setMod(xi.mod.MACC, 1500)
	mob:setMod(xi.mod.FIRE_SDT, 800)
	mob:setMod(xi.mod.ICE_SDT, 800)
	mob:setMod(xi.mod.WIND_SDT, 900)
	mob:setMod(xi.mod.EARTH_SDT, 800)
	mob:setMod(xi.mod.THUNDER_SDT, 800)
	mob:setMod(xi.mod.WATER_SDT, 800)
	mob:setMod(xi.mod.LIGHT_SDT, 500)
	mob:setMod(xi.mod.DARK_SDT, 600)
	mob:setMod(xi.mod.SLASH_SDT, 800)
	mob:setMod(xi.mod.PIERCE_SDT, 600)
	mob:setMod(xi.mod.IMPACT_SDT, 900)
	mob:setMod(xi.mod.HTH_SDT, 900)
	mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
	--[[mob:addListener("SKILLCHAIN", "CHAIN_COUNT", function(mobArg, wsCount, attacker)
		if wsCount > 1 then
			mob:useMobAbility(1332) -- Extremely bad breath
		end
	end)]]-- not set up backend
end

entity.onAdditionalEffect = function(mob, target, damage)
	local Inflict = math.random(1, 3) -- Inflicts Curse, Def Down, MDF down (probably randomly) each hit
	if Inflict == 1 then
		return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.CURSE)
	end
end

entity.onMobFight = function(mob)
	local HPP = mob:getHPP()
	local EBBused = mob:getLocalVar("EBadBreathUsed")
	if HPP <= 95 and EBBused == 0 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 1)
	elseif HPP <= 90 and EBBused == 1 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 2)
	elseif HPP <= 85 and EBBused == 2 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 3)
	elseif HPP <= 80 and EBBused == 3 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 4)
	elseif HPP <= 75 and EBBused == 4 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 5)
	elseif HPP <= 70 and EBBused == 5 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 6)
	elseif HPP <= 65 and EBBused == 6 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 7)
	elseif HPP <= 60 and EBBused == 7 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 8)
	elseif HPP <= 55 and EBBused == 8 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 9)
	elseif HPP <= 50 and EBBused == 9 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 10)
	elseif HPP <= 45 and EBBused == 10 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 11)
	elseif HPP <= 40 and EBBused == 11 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 12)
	elseif HPP <= 35 and EBBused == 12 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 13)
	elseif HPP <= 30 and EBBused == 13 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 14)
	elseif HPP <= 25 and EBBused == 14 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 15)
	elseif HPP <= 20 and EBBused == 15 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 16)
	elseif HPP <= 15 and EBBused == 16 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 17)
	elseif HPP <= 10 and EBBused == 17 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 18)
	elseif HPP <= 5 and EBBused == 18 then
		mob:useMobAbility(1332) -- Extremely bad breath
		mob:setLocalVar("EBadBreathUsed", 19)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("SandyKill", 1)
	mob:removeListener("Skillchain")
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