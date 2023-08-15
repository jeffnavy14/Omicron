-----------------------------------
-- Zone: Diorama_Abdhaljs-Ghelsba
-- King
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)	
	mob:renameEntity("King")
	mob:setMobMod(xi.mobMod.NO_MOVE, 1)
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:addStatusEffect(xi.effect.REGAIN, 50, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 0, 3, 0)
	mob:addMod(xi.mod.DMG,-10000)
	mob:setMod(xi.mod.ACC, 1500)
	mob:setMod(xi.mod.MATT, 400)
	mob:setMod(xi.mod.MACC, 1000)
	mob:setMod(xi.mod.QUAD_ATTACK, 30)
	
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
	mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
	mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
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
	if not GetMobByID(16953460):isSpawned() and
		not GetMobByID(16953461):isSpawned() and
		not GetMobByID(16953462):isSpawned() and
		not GetMobByID(16953463):isSpawned() and
		not GetMobByID(16953464):isSpawned() and
		not GetMobByID(16953465):isSpawned() and
		not GetMobByID(16953466):isSpawned() and
		not GetMobByID(16953467):isSpawned() and
		not GetMobByID(16953468):isSpawned() and
		not GetMobByID(16953469):isSpawned() and
		not GetMobByID(16953470):isSpawned() and
		not GetMobByID(16953472):isSpawned() and
		not GetMobByID(16953473):isSpawned() and
		not GetMobByID(16953474):isSpawned() and
		not GetMobByID(16953475):isSpawned()
	then
		mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
		mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("Decent", 0)
	local party = player:getParty()
	for i, partyMember in pairs(party) do
		partyMember:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
		partyMember:timer(2000, function(player)
			partyMember:setPos(180,-20,183,120)
			partyMember:setCharVar("DecentGroup", 0)
		end)
		partyMember:changeMusic(0, 33)
		partyMember:changeMusic(1, 33)
		partyMember:changeMusic(2, 33)
		partyMember:changeMusic(3, 33)
		partyMember:changeMusic(4, 33)
		partyMember:PrintToPlayer("Oh Divine Lord I hath failed thee!", 13)
		partyMember:PrintToPlayer("Balamor's enchantment has expired.", 13)
	end
	player:addTreasure(9303, mob:getID())
	local Scale = math.random(1, 100)
	if Scale > 84 then
		player:addTreasure(9307, mob:getID())
	elseif Scale > 69 then
		player:addTreasure(9306, mob:getID())
	elseif Scale > 54 then
		player:addTreasure(9305, mob:getID())
	elseif Scale > 39 then
		player:addTreasure(9304, mob:getID())
	elseif Scale > 24 then
		player:addTreasure(9303, mob:getID())
	end
end

entity.onMobDespawn = function(mob)
	
end

return entity