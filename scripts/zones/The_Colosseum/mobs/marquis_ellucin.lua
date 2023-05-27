-----------------------------------
-- Area: the_colloseum (zone 71)
-- Marquis_Ellucin (June T3 Add)
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
---------------------------------------
local entity = {}

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Marquis Ellucin")
	mob:setLocalVar("T4Phase", 0)
	mob:setMobMod(xi.mobMod.NO_MOVE, 1)
	
	mob:setMod(xi.mod.ACC, 1250)
	mob:setMod(xi.mod.ATT, 1050)
	mob:setMod(xi.mod.MATT, 850)
	mob:setMod(xi.mod.MACC, 1550)
	mob:setMod(xi.mod.DOUBLE_ATTACK, 10)

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

	mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
	mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
end

entity.onMobEngaged = function(mob, player, target)
	mob:setMobMod(xi.mobMod.NO_MOVE, 0)
	GetMobByID(17068074):updateEnmity(target)
	GetMobByID(17068083):updateEnmity(target)
end

entity.onMobFight = function(mob, player, target)
	
end

entity.onMobDeath = function(mob, player)
	player:PrintToPlayer("Botym has slighly weakened...", xi.msg.channel.NS_SAY)
end

entity.onMobDespawn = function(mob)
end

return entity