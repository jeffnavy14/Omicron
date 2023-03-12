-----------------------------------
-- Area: Escha Zi'Tah
-- Aglaophotis ki 2897
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
	mob:setMod(xi.mod.EARTH_SDT, 700)
    mob:setMod(xi.mod.THUNDER_SDT, 1150)
    mob:setMod(xi.mod.WATER_SDT, 700)
    mob:setMod(xi.mod.LIGHT_SDT, 700)
    mob:setMod(xi.mod.DARK_SDT, 1000)
	mob:setMod(xi.mod.SLASH_SDT, 1000)
    mob:setMod(xi.mod.PIERCE_SDT, 750)
    mob:setMod(xi.mod.IMPACT_SDT, 500)
    mob:setMod(xi.mod.HTH_SDT, 500)
	mob:setMod(xi.mod.TRIPLE_ATTACK, 65)
	--mob:setMobMod(xi.mobMod.ADD_EFFECT, 1) -- for Enwater effect but its healing player
	mob:addStatusEffect(xi.effect.ENWATER_II, 100, 0, 0)
end

entity.onAdditionalEffect = function(mob, target, damage)
    --return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENWATER) -- if add effect stops healing re-enable
end

entity.onMobEngaged = function(mob, player)

end

entity.onMobFight = function(mob)
	local AgloTP = mob:getTP()
	if AgloTP == 3000 then
		local UseSet = math.random(1, 4)
		if UseSet == 1 then
			mob:useMobAbility(2163) -- seedspray
			mob:timer(3000, function(mob)
				mob:setTP(2000)
				mob:useMobAbility(2164) -- viscid_emission
			end)
			mob:timer(6000, function(mob)
				mob:setTP(1000)
				mob:useMobAbility(2167) -- bloody carress
			end)
		elseif UseSet == 2 then
			mob:useMobAbility(2164) -- viscid_emission
			mob:timer(3000, function(mob)
				mob:setTP(2000)
				mob:useMobAbility(2167) -- bloody carress
			end)
			mob:timer(6000, function(mob)
				mob:setTP(1000)
				mob:useMobAbility(2163) -- seedspray
			end)
		elseif UseSet == 3 then
			mob:useMobAbility(2167) -- bloody carress
			mob:timer(3000, function(mob)
				mob:setTP(2000)
				mob:useMobAbility(2163) -- seedspray
			end)
			mob:timer(6000, function(mob)
				mob:setTP(1000)
				mob:useMobAbility(2164) -- viscid_emission
			end)
		else
			mob:useMobAbility(2167) -- bloody carress
			mob:timer(3000, function(mob)
				mob:setTP(2000)
				mob:useMobAbility(2164) -- viscid_emission
			end)
			mob:timer(6000, function(mob)
				mob:setTP(1000)
				mob:useMobAbility(2167) -- bloody carress
			end)
		end
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("AglaophotisKill", 1)
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