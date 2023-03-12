-----------------------------------
-- Area: Escha Zi'Tah
-- Gulltop 2905
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
    mob:setMod(xi.mod.WIND_SDT, 1300)
	mob:setMod(xi.mod.EARTH_SDT, 300)
    mob:setMod(xi.mod.THUNDER_SDT, 700)
    mob:setMod(xi.mod.WATER_SDT, 700)
    mob:setMod(xi.mod.LIGHT_SDT, 1150)
    mob:setMod(xi.mod.DARK_SDT, 300)
	mob:setMod(xi.mod.SLASH_SDT, 750)
    mob:setMod(xi.mod.PIERCE_SDT, 500)
    mob:setMod(xi.mod.IMPACT_SDT, 1000)
    mob:setMod(xi.mod.HTH_SDT, 1000)
	-- listener for rhino attack
	mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mobArg, skillID)
		if skillID == 341 then
			--add geo gravity
			target:addStatusEffect(xi.effect.GEO_WEIGHT, 50) -- effect number 567, may need to change to mob
		end
	end)
end

entity.onMobFight = function(mob)
end

entity.onMobDeath = function(mob, player)
	mob:removeListener("WEAPONSKILL_STATE_ENTER")
	player:setCharVar("GulltopKill", 1)
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