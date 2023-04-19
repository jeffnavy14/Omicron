-----------------------------------
-- Area: the_colloseum (zone 71)
-- Bloomer (MAY T1 Fight add)
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Bloomer")
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
		
end

entity.onMobEngaged = function(mob, player)
	mob:setMobMod(xi.mobMod.NO_MOVE, 0)
end

entity.onMobFight = function(mob, player, target)
end

entity.onMobDeath = function(mob, player)
	
end

entity.onMobDespawn = function(mob)
	if not GetMobByID(17068059):isSpawned() then
		GetMobByID(17068053):setUnkillable(false)
	end
end

return entity