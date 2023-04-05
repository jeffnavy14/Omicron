-----------------------------------
-- Area: the_colloseum (zone 71)
-- Unhappy_Bloom (MAY T2 Fight)
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 1800)
end

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Unhappy Bloom")
	mob:setLocalVar("T2Phase", 0)
	mob:setMobMod(xi.mobMod.NO_MOVE, 1)
	
	mob:setMod(xi.mod.ACC, 1150)
	mob:setMod(xi.mod.ATT, 900)
	mob:setMod(xi.mod.MATT, 750)
	mob:setMod(xi.mod.MACC, 1450)
	mob:setMod(xi.mod.TRIPLE_ATTACK, 10)
	
	mob:setMod(xi.mod.FIRE_SDT, 1300)
	mob:setMod(xi.mod.ICE_SDT, 700)
	mob:setMod(xi.mod.WIND_SDT, 900)
	mob:setMod(xi.mod.EARTH_SDT, 1000)
	mob:setMod(xi.mod.THUNDER_SDT, 1300)
	mob:setMod(xi.mod.WATER_SDT, 900)
	mob:setMod(xi.mod.LIGHT_SDT, 1000)
	mob:setMod(xi.mod.DARK_SDT, 800)
	
	mob:setMod(xi.mod.FIRE_ABSORB, 0)
	mob:setMod(xi.mod.ICE_ABSORB, 0)
	mob:setMod(xi.mod.WIND_ABSORB, 0)
	mob:setMod(xi.mod.EARTH_ABSORB, 0)
	mob:setMod(xi.mod.LTNG_ABSORB, 0)
	mob:setMod(xi.mod.WATER_ABSORB, 0)
	mob:setMod(xi.mod.LIGHT_ABSORB, 10)
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

entity.onMobEngaged = function(mob, player)
	mob:setMobMod(xi.mobMod.NO_MOVE, 0)
end

entity.onMobFight = function(mob, player)
	local HPP = mob:getHPP()
	local T2Phase = mob:getLocalVar("T2Phase")
	if HPP < 80 and T2Phase == 0 then
		player:PrintToPlayer("Unhappy Bloom: Brrrgh, My leaves, get own!", 13)
		mob:useMobAbility(587)
		mob:useMobAbility(586)
		mob:setLocalVar("T2Phase", 1)
	elseif HPP < 60 and T2Phase == 1 then
		player:PrintToPlayer("Unhappy Bloom: Brrrgh, My leaves, get own!", 13)
		mob:useMobAbility(587)
		mob:useMobAbility(586)
		mob:useMobAbility(583)
		mob:setLocalVar("T2Phase", 2)
	elseif HPP < 40 and T2Phase == 2 then
		player:PrintToPlayer("Unhappy Bloom: Brrrgh, My leaves, get own!", 13)
		mob:useMobAbility(587)
		mob:useMobAbility(586)
		mob:useMobAbility(583)
		mob:useMobAbility(581)
		mob:setLocalVar("T2Phase", 3)
	elseif HPP < 20 and T2Phase == 3 then
		player:PrintToPlayer("Unhappy Bloom: NO! MINE!", 13)
		mob:useMobAbility(587)
		mob:useMobAbility(586)
		mob:useMobAbility(583)
		mob:useMobAbility(581)
		mob:useMobAbility(584)
		mob:setLocalVar("T2Phase", 4)
	elseif HPP < 5 and T2Phase == 4 then
		player:PrintToPlayer("Unhappy Bloom: I tried warning you! You unkind curr, now you shall taste true pain!", 13)
		mob:setUnkillable(true)
		mob:useMobAbility(587)
		mob:useMobAbility(586)
		mob:useMobAbility(583)
		mob:useMobAbility(581)
		mob:useMobAbility(584)
		mob:useMobAbility(710)
		mob:timer(20000, function(mob)
			mob:setUnkillable(false)
		end)
		mob:setLocalVar("T2Phase", 5)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("[Arena]tier", 0)
	player:addCurrency("jetton", 35)
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
end

return entity