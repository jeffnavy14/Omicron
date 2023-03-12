-----------------------------------
-- Area: Escha Zi'Tah
-- Bucca(17957382) 1/3 KI 2908 Alpluachra(17957388) & Puca(17957385)
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:addListener("WEAPONSKILL_USE", "BUCCA_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
		if not GetMobByID(17957388):isSpawned() then
			GetMobByID(17957385):setTP(3000)
		end
	end)
	mob:setMod(xi.mod.DMGMAGIC, 750)
	mob:setMod(xi.mod.ACC, 1500)
	mob:setMod(xi.mod.ATT, 1500)
	mob:setMod(xi.mod.MATT, 800)
	mob:setMod(xi.mod.MACC, 1500)
	mob:setMod(xi.mod.FIRE_SDT, 850)
	mob:setMod(xi.mod.ICE_SDT, 850)
	mob:setMod(xi.mod.WIND_SDT, 50)
	mob:setMod(xi.mod.EARTH_SDT, 850)
	mob:setMod(xi.mod.THUNDER_SDT, 850)
	mob:setMod(xi.mod.WATER_SDT, 850)
	mob:setMod(xi.mod.LIGHT_SDT, 850)
	mob:setMod(xi.mod.SLASH_SDT, 500)
	mob:setMod(xi.mod.PIERCE_SDT, 500)
	mob:setMod(xi.mod.IMPACT_SDT, 500)
	mob:setMod(xi.mod.HTH_SDT, 500)	
	mob:setMod(xi.mod.DARK_ABSORB, 100)
end

entity.onMobFight = function(mob)
end

entity.onMobDeath = function(mob, player)
	if
		not GetMobByID(17957388):isSpawned() and
		not GetMobByID(17957385):isSpawned()
	then
		player:setCharVar("FaeKill", 1)
	end
	local siltGain = math.random(1, 4)
	local beadGain = 5 + math.random(1, 4)
	player:addCurrency("escha_silt", 9 + siltGain)
	player:addCurrency("escha_silt", beadGain)
end

entity.onMobDespawn = function(mob)
	if
		not GetMobByID(17957388):isSpawned() and
		not GetMobByID(17957385):isSpawned()
	then
		local gfZitahNPC = GetServerVariable("GFZitahNPC")
		GetNPCByID(gfZitahNPC):setStatus(xi.status.NORMAL)
	end
end

return entity