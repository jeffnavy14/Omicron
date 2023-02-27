-----------------------------------
-- Area: Escha Zi'Tah
-- Umdhlebi KI 2916
-----------------------------------
require("scripts/globals/mobskills")
---------------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:setLocalVar("FBUse", 0)
	mob:setLocalVar("UmdhlebiCSUsed", 0)
	mob:setMod(xi.mod.ACC, 1300)
	mob:setMod(xi.mod.ATT, 1300)
	mob:setMod(xi.mod.MATT, 700)
	mob:setMod(xi.mod.MACC, 1400)
	mob:setMod(xi.mod.FIRE_SDT, 1150)
    mob:setMod(xi.mod.ICE_SDT, 500)
    mob:setMod(xi.mod.WIND_SDT, 700)
	mob:setMod(xi.mod.EARTH_SDT, 150)
    mob:setMod(xi.mod.THUNDER_SDT, 1000)
    mob:setMod(xi.mod.WATER_SDT, 300)
    mob:setMod(xi.mod.LIGHT_SDT, 500)
    mob:setMod(xi.mod.DARK_SDT, 300)
	mob:setMod(xi.mod.SLASH_SDT, 1000)
    mob:setMod(xi.mod.PIERCE_SDT, 1000)
    mob:setMod(xi.mod.IMPACT_SDT, 1000)
    mob:setMod(xi.mod.HTH_SDT, 1000)
end

entity.onMobFight = function(mob)
	local HPP = mob:getHPP()
	local CSpellUsed = mob:getLocalVar("UmdhlebiCSUsed")
	local FullBloomUse = mob:getLocalVar("FBUse")
	if HPP < 80 and CSpellUsed == 0 then
		mob:useMobAbility(692)
		mob:setLocalVar("UmdhlebiCSUsed", 1)
	elseif HPP < 76 and FullBloomUse == 0 then
		mob:useMobAbility(2883)
		mob:setLocalVar("FBUse", 1)
	elseif HPP < 60 and CSpellUsed == 1 then
		mob:useMobAbility(692)
		mob:setLocalVar("UmdhlebiCSUsed", 2)
	elseif HPP < 51 and FullBloomUse == 1 then
		mob:useMobAbility(2883)
		mob:setLocalVar("FBUse", 2)
	elseif HPP < 40 and CSpellUsed == 2 then
		mob:useMobAbility(692)
		mob:setLocalVar("UmdhlebiCSUsed", 3)
	elseif HPP < 26 and FullBloomUse == 2 then
		mob:useMobAbility(2883)
		mob:setLocalVar("FBUse", 3)
	elseif HPP < 20 and CSpellUsed == 3 then
		mob:useMobAbility(692)
		mob:setLocalVar("UmdhlebiCSUsed", 4)
	elseif HPP < 1 and FullBloomUse == 3 then
		mob:useMobAbility(2883)
		mob:setLocalVar("FBUse", 4)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("UmdhlebiKill", 1)
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