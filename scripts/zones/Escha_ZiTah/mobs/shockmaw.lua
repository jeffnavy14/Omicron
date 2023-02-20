-----------------------------------
-- Area: Escha Zi'Tah
-- Shockmaw KI 2918
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:setMod(xi.mod.ACC, 1600)
	mob:setMod(xi.mod.ATT, 1600)
	mob:setMod(xi.mod.MATT, 900)
	mob:setMod(xi.mod.MACC, 1600)
	mob:setMod(xi.mod.FIRE_SDT, 850)
	mob:setMod(xi.mod.ICE_SDT, 600)
	mob:setMod(xi.mod.WIND_SDT, 600)
	mob:setMod(xi.mod.EARTH_SDT, 850)
	mob:setMod(xi.mod.THUNDER_SDT, 500)
	mob:setMod(xi.mod.WATER_SDT, 700)
	mob:setMod(xi.mod.LIGHT_SDT, 500)
	mob:setMod(xi.mod.DARK_SDT, 700)
	mob:setMod(xi.mod.SLASH_SDT, 1000)
	mob:setMod(xi.mod.PIERCE_SDT, 1000)
	mob:setMod(xi.mod.IMPACT_SDT, 1000)
	mob:setMod(xi.mod.HTH_SDT, 1000)
	mob:setMod(xi.mod.FASTCAST, 50)
	mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mobArg, skillID)
		if skillID == 2871 then
			mob:setMod(xi.mod.WATER_ABSORB, 100) -- Baleen Gurge switch water to absorb
			mob:setMod(xi.mod.WATER_SDT, 1000)
			mob:setMod(xi.mod.LTNG_ABSORB, 0)
			mob:setMod(xi.mod.THUNDER_SDT, 500)
			mob:setMobMod(xi.mobMod.SPELL_LIST, 614)
		elseif skillID == 2870 then
			mob:setMod(xi.mod.WATER_ABSORB, 0) -- Caudal Capacitor switch thunder to absorb
			mob:setMod(xi.mod.WATER_SDT, 700)
			mob:setMod(xi.mod.LTNG_ABSORB, 1000)
			mob:setMod(xi.mod.THUNDER_SDT, 1000)
			mob:setMobMod(xi.mobMod.SPELL_LIST, 615)
		end
	end)
end

entity.onMobFight = function(mob)
end

entity.onMobDeath = function(mob, player)
	mob:removeListener("WEAPONSKILL_STATE_ENTER")
	player:setCharVar("ShockmawKill", 1)
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