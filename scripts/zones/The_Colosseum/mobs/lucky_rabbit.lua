-----------------------------------
-- Area: the_colloseum (zone 71)
-- Lucky_Rabbit (Mar T1 Fight)
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 1800)
end

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Lucky Rabbit")
	mob:setLocalVar("2HRused", 0)
	mob:setMobMod(xi.mobMod.NO_MOVE, 1)
	mob:setMod(xi.mod.ACC, 1100)
	mob:setMod(xi.mod.ATT, 900)
	mob:setMod(xi.mod.MATT, 700)
	mob:setMod(xi.mod.MACC, 1400)
	mob:addMod(xi.mod.RATTP, 475)
	mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
			
	mob:setMod(xi.mod.FIRE_SDT, 1100)
	mob:setMod(xi.mod.ICE_SDT, 900)
	mob:setMod(xi.mod.WIND_SDT, 900)
	mob:setMod(xi.mod.EARTH_SDT, 1000)
	mob:setMod(xi.mod.THUNDER_SDT, 1000)
	mob:setMod(xi.mod.WATER_SDT, 900)
	mob:setMod(xi.mod.LIGHT_SDT, 1500)
	mob:setMod(xi.mod.DARK_SDT, 50)
			
	mob:setMod(xi.mod.FIRE_ABSORB, 0)
	mob:setMod(xi.mod.ICE_ABSORB, 0)
	mob:setMod(xi.mod.WIND_ABSORB, 0)
	mob:setMod(xi.mod.EARTH_ABSORB, 0)
	mob:setMod(xi.mod.LTNG_ABSORB, 0)
	mob:setMod(xi.mod.WATER_ABSORB, 0)
	mob:setMod(xi.mod.LIGHT_ABSORB, 0)
	mob:setMod(xi.mod.DARK_ABSORB, 0)
			
	mob:setMod(xi.mod.STATUSRES, 50) -- NEED TO BE SET STILL
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

entity.onMobEngaged = function(mob, player)
	mob:setMobMod(xi.mobMod.NO_MOVE, 0)
end

entity.onMobFight = function(mob)
	local HPP = mob:getHPP()
	local LR2hr = mob:getLocalVar("2HRused")
	if HPP < 80 and LR2hr == 0 then
		mob:useMobAbility(323)
		mob:useMobAbility(323)
		mob:useMobAbility(323)
		mob:setLocalVar("2HRused", 1)
	elseif HPP < 50 and LR2hr == 1 then
		mob:useMobAbility(323)
		mob:useMobAbility(323)
		mob:useMobAbility(323)
		mob:setLocalVar("2HRused", 2)
	elseif HPP < 10 and LR2hr == 2 then
		mob:useMobAbility(323)
		mob:useMobAbility(323)
		mob:useMobAbility(323)
        mob:setLocalVar("2HRused", 3)
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
	SetServerVariable("[Arena]T1active", 0)
end

return entity
