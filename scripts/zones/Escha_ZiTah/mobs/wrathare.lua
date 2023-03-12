-----------------------------------
-- Area: Escha Zi'Tah
-- Wrathare KI 2910
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:setMod(xi.mod.ACC, 1700)
	mob:setMod(xi.mod.ATT, 1500)
	mob:setMod(xi.mod.MATT, 800)
	mob:setMod(xi.mod.MACC, 1500)
	mob:setMod(xi.mod.FIRE_SDT, 900)
	mob:setMod(xi.mod.ICE_SDT, 750)
	mob:setMod(xi.mod.WIND_SDT, 900)
	mob:setMod(xi.mod.EARTH_SDT, 750)
	mob:setMod(xi.mod.THUNDER_SDT, 1100)
	mob:setMod(xi.mod.WATER_SDT, 1100)
	mob:setMod(xi.mod.LIGHT_SDT, 750)
	mob:setMod(xi.mod.DARK_SDT, 1100)
	mob:setMod(xi.mod.SLASH_SDT, 500)
	mob:setMod(xi.mod.PIERCE_SDT, 500)
	mob:setMod(xi.mod.IMPACT_SDT, 500)
	mob:setMod(xi.mod.HTH_SDT, 500)
	mob:setMod(xi.mod.REGAIN, 10)
	mob:setMod(xi.mod.SLOWRES, 90)
	mob:setMod(xi.mod.BLINDRES, 90)
	mob:setMod(xi.mod.PARALYZERES, 90)
	mob:addListener("WEAPONSKILL_USE", "WRATHARE_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action) -- 10 shadows after Whirling Claws w/ hate reset
		if skillID == 259 then
			mob:addStatusEffect(xi.effect.BLINK, 10, 0, 900)
			mob:resetEnmity(target)
		end
	end)
end

entity.onMobFight = function(mob, target)
	local GonnaDie = math.random(1, 1000) -- endeath... yay
	local HPP = mob:getHPP()
	if HPP > 80 and GonnaDie > 990 then
		--target:setMsg(xi.msg.basic.FALL_TO_GROUND) -- message not in ID's yet
		target:setHP(0)
	elseif HPP > 60 and GonnaDie > 980 then
		--target:setMsg(xi.msg.basic.FALL_TO_GROUND)
		target:setHP(0)
	elseif HPP > 50 and GonnaDie > 970 then
		--target:setMsg(xi.msg.basic.FALL_TO_GROUND)
		target:setHP(0)
	elseif HPP > 40 and GonnaDie > 960 then
		--target:setMsg(xi.msg.basic.FALL_TO_GROUND)
		target:setHP(0)
	elseif HPP > 30 and GonnaDie > 950 then
		--target:setMsg(xi.msg.basic.FALL_TO_GROUND)
		target:setHP(0)
	elseif HPP > 20 and GonnaDie > 925 then
		--target:setMsg(xi.msg.basic.FALL_TO_GROUND)
		target:setHP(0)
	elseif HPP > 10 and GonnaDie > 900 then
		--target:setMsg(xi.msg.basic.FALL_TO_GROUND)
		target:setHP(0)
	end	
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("WrathareKill", 1)
	local siltGain = math.random(1, 4)
	local beadGain = 5 + math.random(1, 4)
	player:addCurrency("escha_silt", 9 + siltGain)
	player:addCurrency("escha_silt", beadGain)
end

entity.onMobDespawn = function(mob)
	local gfZitahNPC = GetServerVariable("GFZitahNPC")
	GetNPCByID(gfZitahNPC):setStatus(xi.status.NORMAL)
end

return entity