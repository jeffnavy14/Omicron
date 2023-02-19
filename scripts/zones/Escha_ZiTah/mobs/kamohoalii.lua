-----------------------------------
-- Area: Escha Zi'Tah
-- Kamohoalii KI 2915
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
	mob:setMod(xi.mod.ICE_SDT, 700)
	mob:setMod(xi.mod.WIND_SDT, 1150)
	mob:setMod(xi.mod.EARTH_SDT, 700)
	mob:setMod(xi.mod.THUNDER_SDT, 1150)
	mob:setMod(xi.mod.WATER_SDT, 700)
	mob:setMod(xi.mod.LIGHT_SDT, 1150)
	mob:setMod(xi.mod.DARK_SDT, 300)
	mob:setMod(xi.mod.SLASH_SDT, 800)
	mob:setMod(xi.mod.PIERCE_SDT, 1100)
	mob:setMod(xi.mod.IMPACT_SDT, 900)
	mob:setMod(xi.mod.HTH_SDT, 900)
	mob:addListener("TAKE_DAMAGE", "KAMOHOALII_TAKE_DAMAGE", function(mobArg, wsid, tp, action, amount, attacker)
		if amount >= 5000 then
			if mob:hasStatusEffect(xi.effect.SKILLCHAIN) then
				mob:setAnimationSub(1)
				mob:setMobMod(xi.mobMod.SKILL_LIST, 191);
				mob:timer(60000, function(mobArg)
					mob:setAnimationSub(0)
					mob:setMobMod(xi.mobMod.SKILL_LIST, 2000);
				end)
			end
		end
	end)		
end

entity.onMobFight = function(mob)

end

entity.onMobDeath = function(mob, player)
	player:setCharVar("KamohoaliiKill", 1)
end

entity.onMobDespawn = function(mob)
	local gfZitahNPC = GetServerVariable("GFZitahNPC")
	GetNPCByID(gfZitahNPC):setStatus(xi.status.NORMAL)
end

return entity