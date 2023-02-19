-----------------------------------
-- Area: Escha Zi'Tah
-- Urmahlulu KI 2919
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
	mob:setMod(xi.mod.FIRE_SDT, 200)
	mob:setMod(xi.mod.ICE_SDT, 250)
	mob:setMod(xi.mod.WIND_SDT, 250)
	mob:setMod(xi.mod.EARTH_SDT, 600)
	mob:setMod(xi.mod.THUNDER_SDT, 50)
	mob:setMod(xi.mod.WATER_SDT, 150)
	mob:setMod(xi.mod.LIGHT_SDT, 250)
	mob:setMod(xi.mod.DARK_SDT, 200)
	mob:setMod(xi.mod.SLASH_SDT, 1000)
	mob:setMod(xi.mod.PIERCE_SDT, 1000)
	mob:setMod(xi.mod.IMPACT_SDT, 1000)
	mob:setMod(xi.mod.HTH_SDT, 1000)
	mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mobArg, skillID)
		local HPP = mob:getHPP()
		if skillID == 632 then -- flame armor use lowers resistances briefly
			mob:setMod(xi.mod.FIRE_SDT, 900)
			mob:setMod(xi.mod.ICE_SDT, 950)
			mob:setMod(xi.mod.WIND_SDT, 950)
			mob:setMod(xi.mod.EARTH_SDT, 1300)
			mob:setMod(xi.mod.THUNDER_SDT, 750)
			mob:setMod(xi.mod.WATER_SDT, 850)
			mob:setMod(xi.mod.LIGHT_SDT, 950)
			mob:setMod(xi.mod.DARK_SDT, 900)
			mob:timer(60000, function(mob)
				mob:setMod(xi.mod.FIRE_SDT, 200)
				mob:setMod(xi.mod.ICE_SDT, 250)
				mob:setMod(xi.mod.WIND_SDT, 250)
				mob:setMod(xi.mod.EARTH_SDT, 600)
				mob:setMod(xi.mod.THUNDER_SDT, 50)
				mob:setMod(xi.mod.WATER_SDT, 150)
				mob:setMod(xi.mod.LIGHT_SDT, 250)
				mob:setMod(xi.mod.DARK_SDT, 200)
			end)		
		elseif skillID == 633 then -- howl use lowers resistances briefly and does a follow-up
			mob:setMod(xi.mod.FIRE_SDT, 900)
			mob:setMod(xi.mod.ICE_SDT, 950)
			mob:setMod(xi.mod.WIND_SDT, 950)
			mob:setMod(xi.mod.EARTH_SDT, 1300)
			mob:setMod(xi.mod.THUNDER_SDT, 750)
			mob:setMod(xi.mod.WATER_SDT, 850)
			mob:setMod(xi.mod.LIGHT_SDT, 950)
			mob:setMod(xi.mod.DARK_SDT, 900)
			mob:timer(60000, function(mob)
				mob:setMod(xi.mod.FIRE_SDT, 200)
				mob:setMod(xi.mod.ICE_SDT, 250)
				mob:setMod(xi.mod.WIND_SDT, 250)
				mob:setMod(xi.mod.EARTH_SDT, 600)
				mob:setMod(xi.mod.THUNDER_SDT, 50)
				mob:setMod(xi.mod.WATER_SDT, 150)
				mob:setMod(xi.mod.LIGHT_SDT, 250)
				mob:setMod(xi.mod.DARK_SDT, 200)
			end)
			if HPP > 51 then
				local nextMove = math.random(1, 2)
				if nextMove == 1 then -- use Wild Horn
					mob:useMobAbility(628)
				else -- use Ecliptic Meteor
					mob:useMobAbility(2586)
				end
			else
				local nextMove = math.random(1, 3)
				if nextMove == 1 then -- use Wild Horn
					mob:useMobAbility(628)
				elseif nextMove == 2 then -- use Ecliptic Meteor
					mob:useMobAbility(2586)
				else -- use amnesic_blast
					mob:useMobAbility(2391)
				end
			end
		end
	end)
end

entity.onMobFight = function(mob)
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("UrmahlulluKill", 1)
end

entity.onMobDespawn = function(mob)
	local gfZitahNPC = GetServerVariable("GFZitahNPC")
	GetNPCByID(gfZitahNPC):setStatus(xi.status.NORMAL)
end

return entity