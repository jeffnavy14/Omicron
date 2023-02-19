-----------------------------------
-- Area: Escha Zi'Tah
-- Cunnast
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	--mob:setMod(xi.mod.DMG, -5000)
	mob:setMod(xi.mod.ACC, 1300)
	mob:setMod(xi.mod.ATT, 1300)
	mob:setMod(xi.mod.MATT, 700)
	mob:setMod(xi.mod.MACC, 1400)
	mob:setMod(xi.mod.FIRE_SDT, 700)
    mob:setMod(xi.mod.ICE_SDT, 1300)
    mob:setMod(xi.mod.WIND_SDT, 500)
	mob:setMod(xi.mod.EARTH_SDT, 700)
    mob:setMod(xi.mod.THUNDER_SDT, 700)
    mob:setMod(xi.mod.WATER_SDT, 700)
    mob:setMod(xi.mod.LIGHT_SDT, 700)
    mob:setMod(xi.mod.DARK_SDT, 700)
	mob:setMod(xi.mod.SLASH_SDT, 500)
    mob:setMod(xi.mod.PIERCE_SDT, 1000)
    mob:setMod(xi.mod.IMPACT_SDT, 250)
    mob:setMod(xi.mod.HTH_SDT, 250)
end

entity.onMobFight = function(mob)
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("CunnastKill", 1)
end

entity.onMobDespawn = function(mob)
	local gfZitahNPC = GetServerVariable("GFZitahNPC")
	GetNPCByID(gfZitahNPC):setStatus(xi.status.NORMAL)
end

return entity