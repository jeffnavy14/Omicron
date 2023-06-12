-----------------------------------
-- Area: the_colloseum (zone 71)
-- Not_Demetrie (June T5 Fight)
-----------------------------------
local ID = require("scripts/zones/The_Colosseum/IDs")
mixins = { require("scripts/mixins/job_special") }
---------------------------------------
local entity = {}

entity.onMobSpawn = function(mob, player)
	mob:setModelId(789)
	mob:renameEntity("Not Demetrie")
	mob:setLocalVar("T5Phase", 0)
	mob:setMobMod(xi.mobMod.NO_MOVE, 1)
	
	mob:setMod(xi.mod.FIRE_SDT, 850)
	mob:setMod(xi.mod.ICE_SDT, 850)
	mob:setMod(xi.mod.WIND_SDT, 850)
	mob:setMod(xi.mod.EARTH_SDT, 850)
	mob:setMod(xi.mod.THUNDER_SDT, 850)
	mob:setMod(xi.mod.WATER_SDT, 850)
	mob:setMod(xi.mod.LIGHT_SDT, 1150)
	mob:setMod(xi.mod.DARK_SDT, 850)
			
	mob:setMod(xi.mod.FIRE_ABSORB, 0)
	mob:setMod(xi.mod.ICE_ABSORB, 0)
	mob:setMod(xi.mod.WIND_ABSORB, 0)
	mob:setMod(xi.mod.EARTH_ABSORB, 0)
	mob:setMod(xi.mod.LTNG_ABSORB, 0)
	mob:setMod(xi.mod.WATER_ABSORB, 0)
	mob:setMod(xi.mod.LIGHT_ABSORB, 0)
	mob:setMod(xi.mod.DARK_ABSORB, 0)
			
	mob:setMod(xi.mod.STATUSRES, 50)
	mob:setMod(xi.mod.SLEEPRES, 20)
	mob:setMod(xi.mod.POISONRES, 0)
	mob:setMod(xi.mod.PARALYZERES, 100)
	mob:setMod(xi.mod.BLINDRES, 20)
	mob:setMod(xi.mod.SILENCERES, 0)
	mob:setMod(xi.mod.VIRUSRES, 20)
	mob:setMod(xi.mod.PETRIFYRES, 50)
	mob:setMod(xi.mod.BINDRES, 0)
	mob:setMod(xi.mod.CURSERES, 20)
	mob:setMod(xi.mod.GRAVITYRES, 0)
	mob:setMod(xi.mod.SLOWRES, 50)
	mob:setMod(xi.mod.STUNRES, 0)
	mob:setMod(xi.mod.AMNESIARES, 0)
	mob:setMod(xi.mod.LULLABYRES, 0)
	
	mob:setMobMod(xi.mobMod.SEVERE_SPELL_CHANCE, 0)

	mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
	mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
end

entity.onMobEngaged = function(mob, target)
	mob:setMobMod(xi.mobMod.NO_MOVE, 0)
end

entity.onMobFight = function(mob, player, target) -- 789 >> 790 >> 2171
	mob:setUnkillable(true)
	local HPP = mob:getHPP()
	local T5Phase = mob:getLocalVar("T5Phase")
	if HPP < 90 and T5Phase == 0 then
		mob:setAnimationSub(1)
		mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
		player:changeMusic(0, 121)
		player:changeMusic(1, 121)
		player:changeMusic(2, 121)
		player:changeMusic(3, 121)
		player:changeMusic(4, 121)
		mob:setLocalVar("T5Phase", 1)
	elseif HPP < 80 and T5Phase == 1 then
		mob:setAnimationSub(2)
		mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
		mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
		mob:setLocalVar("T5Phase", 2)
	elseif HPP < 75 and T5Phase == 2 then -- Part 2
		mob:setAnimationSub(0)
		mob:setMobMod(xi.mobMod.SKILL_LIST, 361)
		mob:setModelId(790)
		mob:setHP(200000)
		mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
		for i = 0, 1 do
			local petId = ID.mob.LITTLE_LIZZIE_YI + i
			local pet = GetMobByID(petId)

			if T5Phase == 2 and not pet:isSpawned() then
				pet:spawn()
				pet:updateEnmity(target)
			end

			if pet:getCurrentAction() == xi.act.ROAMING then
				pet:updateEnmity(target)
			end
		end
		player:changeMusic(0, 119)
		player:changeMusic(1, 119)
		player:changeMusic(2, 119)
		player:changeMusic(3, 119)
		player:changeMusic(4, 119)
		mob:setLocalVar("T5Phase", 3)
	elseif HPP < 90 and T5Phase == 3 then
		mob:setAnimationSub(1)
		mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
		mob:setLocalVar("T5Phase", 4)
	elseif HPP < 80 and T5Phase == 4 then
		mob:setAnimationSub(2)
		mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
		mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
		mob:setLocalVar("T5Phase", 5)
		mob:setMobMod(xi.mobMod.SEVERE_SPELL_CHANCE, 10)
	elseif HPP < 50 and T5Phase == 5 then -- Part 3
		mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
		mob:setAnimationSub(0)
		mob:setModelId(2171)
		mob:setHP(200000)
		player:changeMusic(0, 86)
		player:changeMusic(1, 86)
		player:changeMusic(2, 86)
		player:changeMusic(3, 86)
		player:changeMusic(4, 86)
		mob:setLocalVar("T5Phase", 6)
	elseif HPP < 90 and T5Phase == 6 then
		mob:setAnimationSub(1)
		mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
		mob:setLocalVar("T5Phase", 7)
	elseif HPP < 80 and T5Phase == 7 then
		mob:setAnimationSub(2)
		mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
		mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
		mob:setLocalVar("T5Phase", 8)
	elseif HPP < 70 and T5Phase == 8 then
		mob:setAnimationSub(0)
		mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
		for i = 0, 1 do
			local petId = ID.mob.LITTLE_LIZZIE_YI + i
			local pet = GetMobByID(petId)

			if T5Phase == 8 and not pet:isSpawned() then
				pet:spawn()
				pet:updateEnmity(target)
			end

			if pet:getCurrentAction() == xi.act.ROAMING then
				pet:updateEnmity(target)
			end
		end
		mob:setLocalVar("T5Phase", 9)
	elseif HPP < 60 and T5Phase == 9 then
		mob:setAnimationSub(1)
		mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
		for i = 0, 1 do
			local petId = ID.mob.DEME_SHADOW + i
			local pet = GetMobByID(petId)

			if T5Phase == 9 and not pet:isSpawned() then
				pet:spawn()
				pet:updateEnmity(target)
			end

			if pet:getCurrentAction() == xi.act.ROAMING then
				pet:updateEnmity(target)
			end
		end
		mob:setLocalVar("T5Phase", 10)
	elseif HPP < 50 and T5Phase == 10 then
		mob:setAnimationSub(2)
		mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
		mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
		mob:setLocalVar("T5Phase", 11)
		mob:setMobMod(xi.mobMod.SEVERE_SPELL_CHANCE, 20)
	elseif HPP < 40 and T5Phase == 11 then
		mob:setAnimationSub(1)
		mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
		mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
		for i = 0, 1 do
			local petId = ID.mob.DEME_SHADOW + i
			local pet = GetMobByID(petId)

			if T5Phase == 11 and not pet:isSpawned() then
				pet:spawn()
				pet:updateEnmity(target)
			end

			if pet:getCurrentAction() == xi.act.ROAMING then
				pet:updateEnmity(target)
			end
		end
		mob:setLocalVar("T5Phase", 12)
	elseif HPP < 30 and T5Phase == 12 then
		mob:setAnimationSub(2)
		mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
		mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
		mob:setLocalVar("T5Phase", 13)
		mob:setMobMod(xi.mobMod.SEVERE_SPELL_CHANCE, 30)
	elseif HPP < 20 and T5Phase == 13 then
		mob:setAnimationSub(1)
		mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
		mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
		for i = 0, 1 do
			local petId = ID.mob.DEME_SHADOW + i
			local pet = GetMobByID(petId)

			if T5Phase == 13 and not pet:isSpawned() then
				pet:spawn()
				pet:updateEnmity(target)
			end

			if pet:getCurrentAction() == xi.act.ROAMING then
				pet:updateEnmity(target)
			end
		end
		mob:setLocalVar("T5Phase", 14)
	elseif HPP < 10 and T5Phase == 14 then
		mob:setAnimationSub(0)
		mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
		
		for i = 0, 1 do
			local petId = ID.mob.LITTLE_LIZZIE_YI + i
			local pet = GetMobByID(petId)

			if T5Phase == 14 and not pet:isSpawned() then
				pet:spawn()
				pet:updateEnmity(target)
				mob:setLocalVar("T5Phase", 15)
			end

			if pet:getCurrentAction() == xi.act.ROAMING then
				pet:updateEnmity(target)
			end
		end
		mob:setMobMod(xi.mobMod.SEVERE_SPELL_CHANCE, 40)
	end
		
	if not GetMobByID(17068084):isSpawned() and
	   not GetMobByID(17068085):isSpawned()
	then
		mob:setUnkillable(false)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("[Arena]tier", 0)
	player:addCurrency("jetton", 50)
	player:addCurrency("nyzul_isle_assault_point", 50) -- REMOVE AFTER NYZUL FIXED
	player:addItem(2488, 8)
	player:addItem(3502, 1)
	if not player:hasItem(26517) then
		player:addItem(26517)
	end
	player:PrintToPlayer("You have cleared the Tier 5 Arena fight! For your efforts you have been rewarded 50 Jettons and 8 Alexandrite.", 29)
	player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
	player:timer(2000, function(player)
		player:setPos(-600,0,40, 0)
	end)
	player:changeMusic(0, 70)
	player:changeMusic(1, 70)
	player:changeMusic(2, 70)
	player:changeMusic(3, 70)
	player:changeMusic(4, 70)
end

entity.onMobDespawn = function(mob)
	SetServerVariable("[Arena]T5active", 0)
	DespawnMob(17068084)
	DespawnMob(17068085)
	DespawnMob(17068086)
	DespawnMob(17068087)
end

return entity
