-----------------------------------
-- Area: Escha Zi'Tah
-- Alpluachra(17957388) KI 2908 1/3 mobs, Bucca(17957382), & Puca(17957385)
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:addListener("WEAPONSKILL_USE", "ALPLUACHRA_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
		if GetMobByID(17957382):isSpawned() then
			GetMobByID((17957382):setTP(3000)
		if GetMobByID(17957385):isSpawned() then
			GetMobByID((17957385):setTP(3000)
		end
	end)
	mob:setMod(xi.mod.DMGMAGIC, 750)
	mob:setMod(xi.mod.ACC, 1500)
	mob:setMod(xi.mod.ATT, 1500)
	mob:setMod(xi.mod.MATT, 800)
	mob:setMod(xi.mod.MACC, 1500)
	mob:setMod(xi.mod.FIRE_SDT, 600)
	mob:setMod(xi.mod.ICE_SDT, 600)
	mob:setMod(xi.mod.EARTH_SDT, 600)
	mob:setMod(xi.mod.THUNDER_SDT, 600)
	mob:setMod(xi.mod.WATER_SDT, 600)
	mob:setMod(xi.mod.LIGHT_SDT, 150)
	mob:setMod(xi.mod.DARK_SDT, 600)
	mob:setMod(xi.mod.SLASH_SDT, 500)
	mob:setMod(xi.mod.PIERCE_SDT, 500)
	mob:setMod(xi.mod.IMPACT_SDT, 500)
	mob:setMod(xi.mod.HTH_SDT, 500)
	mob:setMod(xi.mod.WIND_ABSORB, 100)
end

entity.onMobFight = function(mob)
end

entity.onMobDeath = function(mob, player)
	if
		not GetMobByID(17957382):isSpawned() and
		not GetMobByID(17957385):isSpawned()
	then
		player:setCharVar("FaeKill", 1)
	end
end

entity.onMobDespawn = function(mob)
	if
		not GetMobByID(17957382):isSpawned() and
		not GetMobByID(17957385):isSpawned()
	then
		local gfZitahNPC = GetServerVariable("GFZitahNPC")
		GetNPCByID(gfZitahNPC):setStatus(xi.status.NORMAL)
	end
end

return entity