---------------------------------------
-- Area: Escha Zi'Tah
-- Angrboda 2901
---------------------------------------
require("scripts/mixins/job_special")
---------------------------------------
local entity = {}
entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	--mob:setMod(xi.mod.DMG, -5000)
	mob:setMod(xi.mod.ACC, 1300)
	mob:setMod(xi.mod.ATT, 1300)
	mob:setMod(xi.mod.MATT, 1500)
	mob:setMod(xi.mod.MACC, 1400)
	mob:setMod(xi.mod.FIRE_ABSORB, 100)
    mob:setMod(xi.mod.ICE_SDT, 700)
    mob:setMod(xi.mod.WIND_SDT, 700)
	mob:setMod(xi.mod.EARTH_SDT, 700)
    mob:setMod(xi.mod.THUNDER_SDT, 700)
    mob:setMod(xi.mod.WATER_SDT, 700)
    mob:setMod(xi.mod.LIGHT_SDT, 700)
    mob:setMod(xi.mod.DARK_SDT, 700)
	mob:setMod(xi.mod.SLASH_SDT, 700)
    mob:setMod(xi.mod.PIERCE_SDT, 700)
    mob:setMod(xi.mod.IMPACT_SDT, 1000)
    mob:setMod(xi.mod.HTH_SDT, 1000)
	mob:setLocalVar("AngrbodaStage", 0)
end

entity.onMobFight = function(mob)
	local HPP = mob:getHP()
	local Stage = mob:getLocalVar("AngrbodaStage")
	if HPP < 95 and Stage == 0 then
		mob:setMod(xi.mod.ACC, 1300)
		mob:setMod(xi.mod.ATT, 1400)
		mob:setLocalVar("AngrbodaStage", 1)
	elseif HPP < 90 and Stage == 1 then
		mob:setMod(xi.mod.ACC, 1300)
		mob:setMod(xi.mod.ATT, 1500)
		mob:setLocalVar("AngrbodaStage", 2)
	elseif HPP < 85 and Stage == 2 then
		mob:setMod(xi.mod.ACC, 1350)
		mob:setMod(xi.mod.ATT, 1600)
		mob:setLocalVar("AngrbodaStage", 3)
	elseif HPP < 80 and Stage == 3 then
		mob:setMod(xi.mod.ACC, 1350)
		mob:setMod(xi.mod.ATT, 1700)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 5)
		mob:setLocalVar("AngrbodaStage", 4)
	elseif HPP < 75 and Stage == 4 then
		mob:setMod(xi.mod.ACC, 1350)
		mob:setMod(xi.mod.ATT, 1800)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 10)
		mob:setLocalVar("AngrbodaStage", 5)
	elseif HPP < 70 and Stage == 5 then
		mob:setMod(xi.mod.ACC, 1400)
		mob:setMod(xi.mod.ATT, 1900)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 15)
		mob:setLocalVar("AngrbodaStage", 6)
	elseif HPP < 65 and Stage == 6 then
		mob:setMod(xi.mod.ACC, 1400)
		mob:setMod(xi.mod.ATT, 2000)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 20)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 5)
		mob:setLocalVar("AngrbodaStage", 7)
	elseif HPP < 60 and Stage == 7 then
		mob:setMod(xi.mod.ACC, 1400)
		mob:setMod(xi.mod.ATT, 2100)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 25)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 5)
		mob:setLocalVar("AngrbodaStage", 8)
	elseif HPP < 55 and Stage == 8 then
		mob:setMod(xi.mod.ACC, 1450)
		mob:setMod(xi.mod.ATT, 2200)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 30)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
		mob:setLocalVar("AngrbodaStage", 9)
	elseif HPP < 50 and Stage == 9 then
		mob:setMod(xi.mod.ACC, 1450)
		mob:setMod(xi.mod.ATT, 2300)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 35)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
		mob:setLocalVar("AngrbodaStage", 10)
	elseif HPP < 45 and Stage == 10 then
		mob:setMod(xi.mod.ACC, 1450)
		mob:setMod(xi.mod.ATT, 2400)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 40)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 20)
		mob:setLocalVar("AngrbodaStage", 11)
	elseif HPP < 40 and Stage == 11 then
		mob:setMod(xi.mod.ACC, 1500)
		mob:setMod(xi.mod.ATT, 2500)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 45)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 20)
		mob:setLocalVar("AngrbodaStage", 12)
	elseif HPP < 35 and Stage == 12 then
		mob:setMod(xi.mod.ACC, 1500)
		mob:setMod(xi.mod.ATT, 2600)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 50)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 25)
		mob:setLocalVar("AngrbodaStage", 3)
	elseif HPP < 30 and Stage == 13 then
		mob:setMod(xi.mod.ACC, 1500)
		mob:setMod(xi.mod.ATT, 2700)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 55)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 25)
		mob:setLocalVar("AngrbodaStage", 14)
	elseif HPP < 25 and Stage == 14 then
		mob:setMod(xi.mod.ACC, 1550)
		mob:setMod(xi.mod.ATT, 2800)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 60)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 30)
		mob:setLocalVar("AngrbodaStage", 15)
	elseif HPP < 20 and Stage == 15 then
		mob:setMod(xi.mod.ACC, 1550)
		mob:setMod(xi.mod.ATT, 2900)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 65)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 30)
		mob:setLocalVar("AngrbodaStage", 16)
	elseif HPP < 15 and Stage == 16 then
		mob:setMod(xi.mod.ACC, 1550)
		mob:setMod(xi.mod.ATT, 3000)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 70)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 35)
		mob:setLocalVar("AngrbodaStage", 17)
	elseif HPP < 10 and Stage == 17 then
		mob:setMod(xi.mod.ACC, 1600)
		mob:setMod(xi.mod.ATT, 3000)
		mob:setMod(xi.mod.DOUBLE_ATTACK, 75)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 35)
		mob:setLocalVar("AngrbodaStage", 18)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("AngrbodaKill", 1)
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