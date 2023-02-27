-----------------------------------
-- Area: Escha Zi'Tah
-- Lustful Lydia ki 2896
-----------------------------------
require("scripts/globals/mobskills")
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
	mob:setMod(xi.mod.FIRE_SDT, 1300)
    mob:setMod(xi.mod.ICE_SDT, 1100)
    mob:setMod(xi.mod.WIND_SDT, 1000)
	mob:setMod(xi.mod.EARTH_SDT, 800)
    mob:setMod(xi.mod.THUNDER_SDT, 1000)
    mob:setMod(xi.mod.WATER_SDT, 500)
    mob:setMod(xi.mod.LIGHT_SDT, 1100)
    mob:setMod(xi.mod.DARK_SDT, 500)
	mob:setMod(xi.mod.SLASH_SDT, 1000)
    mob:setMod(xi.mod.PIERCE_SDT, 900)
    mob:setMod(xi.mod.IMPACT_SDT, 800)
    mob:setMod(xi.mod.HTH_SDT, 800)
	mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mobArg, skillID)
		if skillID == 319 or -- bad breath
			skillID == 320 -- Sweet Breath
		then
			mob:resetEnmity(target)
		end
	end)
end

entity.onMobFight = function(mob)
		
end

entity.onMobDeath = function(mob, player)
	mob:removeListener("WEAPONSKILL_STATE_ENTER")
	player:setCharVar("LydiaKill", 1)
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