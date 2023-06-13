-----------------------------------
-- Area: the_colloseum (zone 71)
-- Gadalar (JUL T4 Adds)
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 1800)
end

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Gadalar")
	mob:setLocalVar("T4Phase", 0)
	
	mob:setMod(xi.mod.ACC, 1250)
	mob:setMod(xi.mod.ATT, 1050)
	mob:setMod(xi.mod.MATT, 850)
	mob:setMod(xi.mod.MACC, 1550)
	mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
	
	mob:setMod(xi.mod.FIRE_SDT, 1000)
	mob:setMod(xi.mod.ICE_SDT, 700)
	mob:setMod(xi.mod.WIND_SDT, 900)
	mob:setMod(xi.mod.EARTH_SDT, 1000)
	mob:setMod(xi.mod.THUNDER_SDT, 1000)
	mob:setMod(xi.mod.WATER_SDT, 900)
	mob:setMod(xi.mod.LIGHT_SDT, 50)
	mob:setMod(xi.mod.DARK_SDT, 1250)
	
	mob:setMod(xi.mod.FIRE_ABSORB, 0) -- MAY NEED ADJUSTMENT
	mob:setMod(xi.mod.ICE_ABSORB, 0)
	mob:setMod(xi.mod.WIND_ABSORB, 0)
	mob:setMod(xi.mod.EARTH_ABSORB, 0)
	mob:setMod(xi.mod.LTNG_ABSORB, 0)
	mob:setMod(xi.mod.WATER_ABSORB, 0)
	mob:setMod(xi.mod.LIGHT_ABSORB, 100)
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

	mob:setMod(xi.mod.FASTCAST, 30)
	
	mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
	mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
end

entity.onMobRoam = function(mob)
	if GetServerVariable("[Arena]T4active") == 0 then
		DespawnMob(17068106)
	end
end

entity.onMobEngaged = function(mob, player)
end

entity.onMobFight = function(mob)
	if GetServerVariable("[Arena]T4active") == 0 then
		DespawnMob(17068106)
	end
end

entity.onMobDeath = function(mob, player)
	player:PrintToPlayer("The shadow of Rughadjeen flinched...", 13)
end

entity.onMobDespawn = function(mob)
end

return entity