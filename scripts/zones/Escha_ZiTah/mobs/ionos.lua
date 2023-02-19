-----------------------------------
-- Area: Escha Zi'Tah
-- Ionos KI 2911
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:setMod(xi.mod.ACC, 1500)
	mob:setMod(xi.mod.ATT, 1500)
	mob:setMod(xi.mod.MATT, 800)
	mob:setMod(xi.mod.MACC, 1500)
	mob:setMod(xi.mod.FIRE_SDT, 800)
	mob:setMod(xi.mod.ICE_SDT, 1000)
	mob:setMod(xi.mod.WIND_SDT, 800)
	mob:setMod(xi.mod.EARTH_SDT, 1000)
	mob:setMod(xi.mod.THUNDER_SDT, 700)
	mob:setMod(xi.mod.WATER_SDT, 1000)
	mob:setMod(xi.mod.LIGHT_SDT, 800)
	mob:setMod(xi.mod.DARK_SDT, 1000)
	mob:setMod(xi.mod.SLASH_SDT, 700)
	mob:setMod(xi.mod.PIERCE_SDT, 1000)
	mob:setMod(xi.mod.IMPACT_SDT, 500)
	mob:setMod(xi.mod.HTH_SDT, 500)
	mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mobArg, skillID)
		if skillID == 3505 then
			--add geo gravity
			target:addStatusEffect(xi.effect.PETRIFY, 50)
			target:addStatusEffect(xi.effect.RASP, 50)
		end
	end)
end

entity.onMobFight = function(mob, target)
	
end

entity.onMobDeath = function(mob, player)
	mob:removeListener("WEAPONSKILL_STATE_ENTER")
	player:setCharVar("IonosKill",1)
end

entity.onMobDespawn = function(mob)
	local gfZitahNPC = GetServerVariable("GFZitahNPC")
	GetNPCByID(gfZitahNPC):setStatus(xi.status.NORMAL)
end

return entity