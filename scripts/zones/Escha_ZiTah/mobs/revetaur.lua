-----------------------------------
-- Area: Escha Zi'Tah
-- Revetaur ki 2903
-----------------------------------
local entity = {}
local usedApoc = 0

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
    mob:setMod(xi.mod.ICE_SDT, 1000)
    mob:setMod(xi.mod.WIND_SDT, 1000)
	mob:setMod(xi.mod.EARTH_SDT, 700)
    mob:setMod(xi.mod.THUNDER_SDT, 1000)
    mob:setMod(xi.mod.WATER_SDT, 1000)
    mob:setMod(xi.mod.LIGHT_SDT, 1300)
    mob:setMod(xi.mod.DARK_SDT, 200)
	mob:setMod(xi.mod.SLASH_SDT, 1000)
    mob:setMod(xi.mod.PIERCE_SDT, 1000)
    mob:setMod(xi.mod.IMPACT_SDT, 1000)
    mob:setMod(xi.mod.HTH_SDT, 1000)
	mob:setLocalVar("RevApocUsed", 0)
	-- WS listener
	mob:addListener("WEAPONSKILL_USE", "TARGET_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
		mob:useMobAbility(1359) -- Chthonian Ray
	end)
	-- Magic Damage listener
	mob:addListener("TAKE_DAMAGE", "REVETAUR_TAKE_DAMAGE", function(revetaur, amount, attacker, attackType, damageType)
        if amount > 1000 then
			local elements =
			{
				{ xi.damageType.FIRE,      xi.day.FIRESDAY },
				{ xi.damageType.EARTH,     xi.day.EARTHSDAY },
				{ xi.damageType.WATER,     xi.day.WATERSDAY },
				{ xi.damageType.WIND,      xi.day.WINDSDAY },
				{ xi.damageType.ICE,       xi.day.ICEDAY },
				{ xi.damageType.LIGHTNING, xi.day.LIGHTNINGSDAY },
				{ xi.damageType.LIGHT,     xi.day.LIGHTSDAY },
				{ xi.damageType.DARK,      xi.day.DARKSDAY }
			}

			-- If the element corresponding to the elemental day of the in-game Vana'diel week is used on Revetaur, it will use Apocalyptic Ray
			for k, v in pairs(elements) do
				if damageType == v[1] and VanadielDayOfTheWeek() == v[2] then
					local usedApoc = mob:getLocalVar("RevApocUsed")
					if usedApoc == 0 then
						mob:useMobAbility(1360) -- Apocalyptic Ray
						mob:setLocalVar("RevApocUsed", 1)
						mob:timer(10000, function(mob)
							mob:setLocalVar("RevApocUsed", 0)
						end)
					end
				end
			end
		end
    end)
end

entity.onMobFight = function(mob)
end

entity.onMobDeath = function(mob, player)
	mob:removeListener("WEAPONSKILL_USE")
	mob:removeListener("MAGIC_USE")
	player:setCharVar("RevetaurKill", 1)
end

entity.onMobDespawn = function(mob)
	local gfZitahNPC = GetServerVariable("GFZitahNPC")
	GetNPCByID(gfZitahNPC):setStatus(xi.status.NORMAL)
end

return entity