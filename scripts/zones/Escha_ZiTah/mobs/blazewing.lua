-----------------------------------
-- Area: Escha Zi'Tah
-- Blazewing KI 2907
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:setMod(xi.mod.DMGPHYS, 500)
	mob:setMod(xi.mod.DMGMAGIC, 700)
	mob:setMod(xi.mod.ACC, 1500)
	mob:setMod(xi.mod.ATT, 1500)
	mob:setMod(xi.mod.MATT, 800)
	mob:setMod(xi.mod.MACC, 1500)
	mob:setMod(xi.mod.FIRE_SDT, 500)
	mob:setMod(xi.mod.ICE_SDT, 1000)
	mob:setMod(xi.mod.WIND_SDT, 500)
	mob:setMod(xi.mod.EARTH_SDT, 500)
	mob:setMod(xi.mod.THUNDER_SDT, 750)
	mob:setMod(xi.mod.WATER_SDT, 750)
	mob:setMod(xi.mod.LIGHT_SDT, 500)
	mob:setMod(xi.mod.DARK_SDT, 500)
	mob:setMod(xi.mod.SLASH_SDT, 500)
	mob:setMod(xi.mod.PIERCE_SDT, 500)
	mob:setMod(xi.mod.IMPACT_SDT, 500)
	mob:setMod(xi.mod.HTH_SDT, 500)
end

entity.onMobFight = function(mob)
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("BlazewingKill", 1)
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