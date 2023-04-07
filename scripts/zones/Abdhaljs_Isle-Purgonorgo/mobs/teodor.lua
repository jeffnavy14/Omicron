-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Teodor
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
	mob:renameEntity("Teodor")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:setLocalVar("TeoStage", 0)
	mob:setLocalVar("killer", 0)
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("Claim their blood! The master demands it!", 0, mob:getPacketName())
end

entity.onMobFight = function(mob, player)
	local InvTier = player:getLocalVar("InvTier")
	if InvTier == 1 then
		local HPP = mob:getHPP()
		local Stage = mob:getLocalVar("TeoStage")
		if HPP < 95 and Stage == 0 then
			mob:useMobAbility(3381)
			player:PrintToPlayer("Teodor: Time to get serious with you I see.", 13)
			mob:setLocalVar("TeoStage", 1)
		elseif HPP < 90 and Stage == 1 then
			mob:useMobAbility(3384)
			mob:setMod(xi.mod.TRIPLE_ATTACK, 5)
			mob:setLocalVar("TeoStage", 2)
			player:PrintToPlayer("Teodor: Don't mind me while I borrow some of your might.", 13)
		elseif HPP < 85 and Stage == 2 then
			mob:useMobAbility(3382)
			mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
			mob:setLocalVar("TeoStage", 3)
		elseif HPP < 80 and Stage == 3 then
			mob:useMobAbility(3384)
			mob:setMod(xi.mod.TRIPLE_ATTACK, 15)
			mob:setLocalVar("TeoStage", 4)
			player:PrintToPlayer("Teodor: This is getting a little annoying", 13)
		elseif HPP < 75 and Stage == 4 then
			mob:useMobAbility(3383)
			mob:setMod(xi.mod.TRIPLE_ATTACK, 20)
			mob:setLocalVar("TeoStage", 5)
		elseif HPP < 70 and Stage == 5 then
			mob:useMobAbility(3384)
			mob:setMod(xi.mod.TRIPLE_ATTACK, 25)
			mob:setLocalVar("TeoStage", 6)
			player:PrintToPlayer("Teodor: ugh... effort... why...", 13)
		elseif HPP < 65 and Stage == 6 then
			mob:useMobAbility(3381)
			mob:setMod(xi.mod.TRIPLE_ATTACK, 30)
			mob:setLocalVar("TeoStage", 7)
		elseif HPP < 60 and Stage == 7 then
			mob:useMobAbility(3380)
			mob:setMod(xi.mod.TRIPLE_ATTACK, 35)
			mob:timer(6000, function(mob)
				mob:useMobAbility(3385)
			end)
			mob:setLocalVar("TeoStage", 8)
		elseif HPP < 55 and Stage == 8 then
			mob:useMobAbility(3384)
			mob:setMod(xi.mod.TRIPLE_ATTACK, 40)
			mob:setLocalVar("TeoStage", 9)
		elseif HPP < 50 and Stage == 9 then
			mob:setModelId(2633)
			mob:setSpellList(477)
			mob:setMobMod(xi.mobMod.SKILL_LIST, 0)
			player:PrintToPlayer("Teodor: Hmmm... interesting, now for some real fun.", 13)
			mob:renameEntity("Balamor")
			mob:setLocalVar("TeoStage", 10)
			mob:setMod(xi.mod.FIRE_SDT, 700)
			mob:setMod(xi.mod.ICE_SDT, 300)
			mob:setMod(xi.mod.WIND_SDT, 300)
			mob:setMod(xi.mod.EARTH_SDT, 200)
			mob:setMod(xi.mod.THUNDER_SDT, 500)
			mob:setMod(xi.mod.WATER_SDT, 200)
			mob:setMod(xi.mod.LIGHT_SDT, 500)
			mob:setMod(xi.mod.DARK_SDT, 50)
			mob:setMod(xi.mod.TRIPLE_ATTACK, 45)
		elseif HPP < 50 and Stage == 10 then
			mob:useMobAbility(3303)
			mob:addMod(xi.mod.DMGPHYS, -500)
			mob:setLocalVar("TeoStage", 11)
		elseif HPP < 45 and Stage == 11 then
			mob:useMobAbility(3305)
			mob:addMod(xi.mod.DMGPHYS, -1000)
			mob:setLocalVar("TeoStage", 12)
		elseif HPP < 40 and Stage == 12 then
			mob:useMobAbility(3306)
			mob:addMod(xi.mod.DMGPHYS, -1500)
			mob:setLocalVar("TeoStage", 13)
		elseif HPP < 35 and Stage == 13 then
			mob:useMobAbility(3307)
			mob:addMod(xi.mod.DMGPHYS, -2000)
			mob:setLocalVar("TeoStage", 14)
		elseif HPP < 30 and Stage == 14 then
			mob:useMobAbility(3304)
			mob:addMod(xi.mod.DMGPHYS, -2500)
			mob:setLocalVar("TeoStage", 15)
		elseif HPP < 25 and Stage == 15 then
			mob:useMobAbility(3307)
			mob:addMod(xi.mod.DMGPHYS, -3000)
			mob:setLocalVar("TeoStage", 16)
		elseif HPP < 20 and Stage == 16 then
			mob:useMobAbility(3306)
			mob:addMod(xi.mod.DMGPHYS, -3500)
			mob:setLocalVar("TeoStage", 17)
		elseif HPP < 15 and Stage == 17 then
			mob:useMobAbility(3304)
			mob:addMod(xi.mod.DMGPHYS, -4000)
			mob:setLocalVar("TeoStage", 18)
		elseif HPP < 10 and Stage == 18 then
			mob:useMobAbility(3305)
			mob:addMod(xi.mod.DMGPHYS, -4500)
			mob:setLocalVar("TeoStage", 19)
		elseif HPP < 5 and Stage == 19 then
			mob:useMobAbility(3304)
			mob:addMod(xi.mod.DMGPHYS, -5000)
			mob:setLocalVar("TeoStage", 20)
		end
	end
	
end

entity.onMobDeath = function(mob, player)
	player:PrintToPlayer("Blast! I was not expecting such strength...", 0, mob:getPacketName())
end

entity.onMobDespawn = function(mob)
	
end

return entity