-----------------------------------
-- Zone: Diorama_Abdhaljs-Ghelsba
-- Pawn
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)	
	mob:renameEntity("Pawn")
	mob:setMobMod(xi.mobMod.NO_MOVE, 1)
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:addStatusEffect(xi.effect.REGAIN, 50, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 50, 3, 0)
	mob:addMod(xi.mod.DMG,-3000)
	mob:setMod(xi.mod.ACC, 1500)
	mob:setMod(xi.mod.MATT, 400)
	mob:setMod(xi.mod.MACC, 1000)
	mob:setMod(xi.mod.DOUBLE_ATTACK, 10)
	
	mob:setMod(xi.mod.FIRE_SDT, 1000)
	mob:setMod(xi.mod.ICE_SDT, 1000)
	mob:setMod(xi.mod.WIND_SDT, 1000)
	mob:setMod(xi.mod.EARTH_SDT, 1000)
	mob:setMod(xi.mod.THUNDER_SDT, 1000)
	mob:setMod(xi.mod.WATER_SDT, 1000)
	mob:setMod(xi.mod.LIGHT_SDT, 1000)
	mob:setMod(xi.mod.DARK_SDT, 1000)
	
	mob:setMod(xi.mod.FIRE_ABSORB, 0) -- MAY NEED ADJUSTMENT
	mob:setMod(xi.mod.ICE_ABSORB, 0)
	mob:setMod(xi.mod.WIND_ABSORB, 0)
	mob:setMod(xi.mod.EARTH_ABSORB, 0)
	mob:setMod(xi.mod.LTNG_ABSORB, 0)
	mob:setMod(xi.mod.WATER_ABSORB, 0)
	mob:setMod(xi.mod.LIGHT_ABSORB, 0)
	mob:setMod(xi.mod.DARK_ABSORB, 0)
	
	mob:setMod(xi.mod.STATUSRES, 50) -- NEED TO BE SET STILL
	mob:setMod(xi.mod.SLEEPRES, 0)
	mob:setMod(xi.mod.POISONRES, 0)
	mob:setMod(xi.mod.PARALYZERES, 0)
	mob:setMod(xi.mod.BLINDRES, 20)
	mob:setMod(xi.mod.SILENCERES, 0)
	mob:setMod(xi.mod.VIRUSRES, 20)
	mob:setMod(xi.mod.PETRIFYRES, 50)
	mob:setMod(xi.mod.BINDRES, 0)
	mob:setMod(xi.mod.CURSERES, 20)
	mob:setMod(xi.mod.GRAVITYRES, 0)
	mob:setMod(xi.mod.SLOWRES, 50)
	mob:setMod(xi.mod.STUNRES, 0)
	mob:setMod(xi.mod.AMNESIARES, 100)
	mob:setMod(xi.mod.LULLABYRES, 0)

	mob:setMod(xi.mod.FASTCAST, 30)
	local mobID = mob:getID()
	if mobID < 16953460 then
		mob:setMobMod(xi.mobMod.DROP_LIST, 0)
	end
	--16953460 to 16953467
	local mobID = mob:getID()
	if mobID == 16953460 then
		mob:setMod(xi.mod.FIRE_SDT, 1500)
		mob:setMod(xi.mod.FIRE_ABSORB, 100)
	elseif mobID == 16953461 then
		mob:setMod(xi.mod.ICE_SDT, 1500)
		mob:setMod(xi.mod.ICE_ABSORB, 100)
	elseif mobID == 16953462 then
		mob:setMod(xi.mod.WIND_SDT, 1500)
		mob:setMod(xi.mod.WIND_ABSORB, 100)
	elseif mobID == 16953463 then
		mob:setMod(xi.mod.EARTH_SDT, 1500)
		mob:setMod(xi.mod.EARTH_ABSORB, 100)
	elseif mobID == 16953464 then
		mob:setMod(xi.mod.THUNDER_SDT, 1500)
		mob:setMod(xi.mod.LTING_ABSORB, 100)
	elseif mobID == 16953465 then
		mob:setMod(xi.mod.WATER_SDT, 1500)
		mob:setMod(xi.mod.WATER_ABSORB, 100)
	elseif mobID == 16953466 then
		mob:setMod(xi.mod.LIGHT_SDT, 1500)
		mob:setMod(xi.mod.LIGHT_ABSORB, 100)
	elseif mobID == 16953467 then
		mob:setMod(xi.mod.DARK_SDT, 1500)
		mob:setMod(xi.mod.DARK_ABSORB, 100)
	end
end

entity.onMobEngaged = function(mob, player)
	mob:setMobMod(xi.mobMod.NO_MOVE, 0)
	mob:setTP(3000)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobFight = function(mob, player)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end	
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	if mob:getID() > 16953459 then
		player:PrintToPlayer("King has weakened a bit", 13)
		GetMobByID(16953475):addHP(-15000)
	end
end

entity.onMobDespawn = function(mob)

end

return entity