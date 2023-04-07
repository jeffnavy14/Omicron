-----------------------------------
-- Area: the_colloseum (zone 71)
-- Blooming_Bark (MAY T5 Fight)
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 1800)
end

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Blooming Bark")
	mob:setLocalVar("T5phase", 0)
	mob:setMobMod(xi.mobMod.NO_MOVE, 1)
	
	mob:setMod(xi.mod.ACC, 1300)
	mob:setMod(xi.mod.ATT, 1000)
	mob:setMod(xi.mod.MATT, 900)
	mob:setMod(xi.mod.MACC, 1600)
	mob:setMod(xi.mod.DOUBLE_ATTACK, 60)

	mob:setMod(xi.mod.FIRE_SDT, 1000)
	mob:setMod(xi.mod.ICE_SDT, 1000)
	mob:setMod(xi.mod.WIND_SDT, 1300)
	mob:setMod(xi.mod.EARTH_SDT, 500)
	mob:setMod(xi.mod.THUNDER_SDT, 700)
	mob:setMod(xi.mod.WATER_SDT, 1000)
	mob:setMod(xi.mod.LIGHT_SDT, 1200)
	mob:setMod(xi.mod.DARK_SDT, 800)

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

	mob:setMod(xi.mod.FASTCAST, 30)
	
	mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
	mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
	
end

entity.onMobEngaged = function(mob, player)
	mob:setMobMod(xi.mobMod.NO_MOVE, 0)
end

entity.onMobFight = function(mob, player, target)
	local HPP = mob:getHPP()
	local T5phase = mob:getLocalVar("T5phase")
	if HPP < 90 and T5phase == 0 then
		SpawnMob(17068062):updateEnmity(target)
		SpawnMob(17068063):updateEnmity(target)
		SpawnMob(17068064):updateEnmity(target)
		mob:setLocalVar("T5phase", 1)
	elseif HPP < 60 and T5phase == 1 then
		SpawnMob(17068065):updateEnmity(target)
		SpawnMob(17068066):updateEnmity(target)
		SpawnMob(17068067):updateEnmity(target)
		mob:setLocalVar("T5phase", 2)
	elseif HPP < 30 and T5phase == 2 then
		SpawnMob(17068068):updateEnmity(target)
		SpawnMob(17068069):updateEnmity(target)
		SpawnMob(17068070):updateEnmity(target)
		mob:setLocalVar("T5phase", 3)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("[Arena]tier", 0)
	player:addCurrency("jetton", 50)
	player:addItem(2488, 8)
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
end

return entity