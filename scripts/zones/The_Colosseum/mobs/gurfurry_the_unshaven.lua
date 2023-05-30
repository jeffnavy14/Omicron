-----------------------------------
-- Area: the_colloseum (zone 71)
-- Gurfurry_the_Unshaven (June T2 Fight)
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
---------------------------------------
local entity = {}

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Gurfurry the Unshaven")
	mob:setLocalVar("T2Phase", 0)
	mob:setMobMod(xi.mobMod.NO_MOVE, 1)
	
	mob:setMod(xi.mod.ACC, 1150)
	mob:setMod(xi.mod.ATT, 900)
	mob:setMod(xi.mod.MATT, 750)
	mob:setMod(xi.mod.MACC, 1450)
	mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
			
	mob:setMod(xi.mod.FIRE_SDT, 600)
	mob:setMod(xi.mod.ICE_SDT, 1000)
	mob:setMod(xi.mod.WIND_SDT, 1150)
	mob:setMod(xi.mod.EARTH_SDT, 1000)
	mob:setMod(xi.mod.THUNDER_SDT, 1000)
	mob:setMod(xi.mod.WATER_SDT, 1300)
	mob:setMod(xi.mod.LIGHT_SDT, 1150)
	mob:setMod(xi.mod.DARK_SDT, 1150)
			
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

	mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
	mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
end

entity.onMobEngaged = function(mob, player, target)
	mob:setMobMod(xi.mobMod.NO_MOVE, 0)
	GetMobByID(17068076):updateEnmity(target)
	GetMobByID(17068077):updateEnmity(target)
end

entity.onMobFight = function(mob, player, target)
	mob:setUnkillable(true)
	if not GetMobByID(17068078):isSpawned() and
	   not GetMobByID(17068079):isSpawned()
    then
		mob:setUnkillable(false)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("[Arena]tier", 0)
	player:addCurrency("jetton", 35)
	player:addCurrency("nyzul_isle_assault_point", 35 -- REMOVE AFTER NYZUL FIXED)
	player:addItem(2488, 6)
	player:PrintToPlayer("You have cleared the Tier 2 Arena fight! For your efforts you have been rewarded 35 Jettons and 6 Alexandrite.", 29)
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
	SetServerVariable("[Arena]T2active", 0)
	DespawnMob(17068078)
	DespawnMob(17068079)
end

return entity