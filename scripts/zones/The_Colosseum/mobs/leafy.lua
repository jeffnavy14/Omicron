-----------------------------------
-- Area: the_colloseum (zone 71)
-- Leafy (MAY T1 Fight)
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Leafy")
	mob:setLocalVar("T1Phase", 0)
	mob:setMobMod(xi.mobMod.NO_MOVE, 1)
	mob:setMod(xi.mod.ACC, 1100)
	mob:setMod(xi.mod.ATT, 900)
	mob:setMod(xi.mod.MATT, 700)
	mob:setMod(xi.mod.MACC, 1400)
	mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
			
	mob:setMod(xi.mod.FIRE_SDT, 1500)
	mob:setMod(xi.mod.ICE_SDT, 1500)
	mob:setMod(xi.mod.WIND_SDT, 1500)
	mob:setMod(xi.mod.EARTH_SDT, 500)
	mob:setMod(xi.mod.THUNDER_SDT, 1500)
	mob:setMod(xi.mod.WATER_SDT, 500)
	mob:setMod(xi.mod.LIGHT_SDT, 500)
	mob:setMod(xi.mod.DARK_SDT, 1500)
			
	mob:setMod(xi.mod.FIRE_ABSORB, 0)
	mob:setMod(xi.mod.ICE_ABSORB, 0)
	mob:setMod(xi.mod.WIND_ABSORB, 0)
	mob:setMod(xi.mod.EARTH_ABSORB, 0)
	mob:setMod(xi.mod.LTNG_ABSORB, 0)
	mob:setMod(xi.mod.WATER_ABSORB, 0)
	mob:setMod(xi.mod.LIGHT_ABSORB, 100)
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

	mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
	mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
	
	mob:addListener("WEAPONSKILL_USE", "LEAFY_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
		if GetMobByID(17068058):isSpawned() then -- Bloomer
			GetMobByID(17068058):setTP(3000)
		end
		if GetMobByID(17068059):isSpawned() then -- Sprout
			GetMobByID(17068059):setTP(3000)
		end
	end)
end

entity.onMobEngaged = function(mob, player, target)
	mob:setMobMod(xi.mobMod.NO_MOVE, 0)
	GetMobByID(17068058):updateEnmity(target)
	GetMobByID(17068059):updateEnmity(target)
end

entity.onMobFight = function(mob, player, target)
	local HPP = mob:getHPP()
	local T1Phase = mob:getLocalVar("T1Phase")
	mob:setUnkillable(true)
	if HPP < 50 and T1Phase == 0 then
		mob:setModelId(3632) -- watermelon Mandragora
		if not GetMobByID(17068058):isSpawned() then
			SpawnMob(17068058):updateEnmity(target)
		end
		if not GetMobByID(17068059):isSpawned() then
			SpawnMob(17068059):updateEnmity(target)
		end
		mob:setLocalVar("T1Phase", 1)
	elseif HPP < 10 and T1Phase == 1 then
		if not GetMobByID(17068058):isSpawned() then
			SpawnMob(17068058):updateEnmity(target)
		end
		if not GetMobByID(17068059):isSpawned() then
			SpawnMob(17068059):updateEnmity(target)
		end
		mob:setLocalVar("T1Phase", 2)
	end
	if not GetMobByID(17068058):isSpawned() and
	   not GetMobByID(17068059):isSpawned()
    then
		mob:setUnkillable(false)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("[Arena]tier", 0)
	player:addCurrency("jetton", 30)
	player:addItem(2488, 5)
	player:PrintToPlayer("You have cleared the Tier 1 Arena fight! For your efforts you have been rewarded 30 Jettons and 5 Alexandrite.", 29)
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
	if
		not GetMobByID(17068058):isSpawned() and
		not GetMobByID(17068059):isSpawned()
	then
		SetServerVariable("[Arena]T1active", 0)
	end
end

return entity