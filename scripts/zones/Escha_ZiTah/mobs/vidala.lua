-----------------------------------
-- Area: Escha Zi'Tah
-- Vidala ki 2899
-----------------------------------
require("scripts/globals/mobskills")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob, player)
	mob:setLocalVar("VidPDused", 0)
	--mob:setMod(xi.mod.DMG, -5000)
	mob:setMod(xi.mod.ACC, 1300)
	mob:setMod(xi.mod.ATT, 1300)
	mob:setMod(xi.mod.MATT, 700)
	mob:setMod(xi.mod.MACC, 1400)
	mob:setMod(xi.mod.FIRE_SDT, 1150)
    mob:setMod(xi.mod.ICE_SDT, 700)
    mob:setMod(xi.mod.WIND_SDT, 1000)
	mob:setMod(xi.mod.EARTH_SDT, 1000)
    mob:setMod(xi.mod.THUNDER_SDT, 1000)
    mob:setMod(xi.mod.WATER_SDT, 1000)
    mob:setMod(xi.mod.LIGHT_SDT, 1000)
    mob:setMod(xi.mod.DARK_SDT, 1000)
	mob:setMod(xi.mod.SLASH_SDT, 900)
    mob:setMod(xi.mod.PIERCE_SDT, 900)
    mob:setMod(xi.mod.IMPACT_SDT, 800)
    mob:setMod(xi.mod.HTH_SDT, 800)
	mob:addListener("TAKE_DAMAGE", "VIDALA_TAKE_DAMAGE", function(mob, amount, attacker, attackType, damageType, target)
		if damageType == xi.damageType.WIND and amount > 4000 then
			local VidHP = mob:getHP()
			mob:setMobLevel(119)
			mob:setHP(VidHP)
			attacker:PrintToPlayer("Vidala has weakened slightly.", 13)
		end
	end)
	mob:addListener("WEAPONSKILL_USE", "WS_START_MSG", function(mobArg, skillId, target, attacker)
		if skilID == 270 then -- roar
			local VidalaLEVEL = mob:getLevel()
			local VidHP = mob:getHP()
			mob:setMobLevel(VidalaLEVEL + 1)
			mob:setHP(VidHP)
			attacker:PrintToPlayer("Vidala has gotten stronger!", 13)
		end
	end)
end

entity.onMobEngaged = function(mob, player)
	mob:castSpell(255)-- Use break right away
end

entity.onMobFight = function(mob)
	local HPP = mob:getHPP()
	local PDused = mob:getLocalVar("VidPDused")
	if HPP <= 80 and PDused == 0 then
		mob:useMobAbility(693) -- Perfect Dodge
		mob:setLocalVar("VidPDused", 1)
	elseif HPP <= 60 and PDused == 1 then
		mob:useMobAbility(693) -- Perfect Dodge
		mob:setLocalVar("VidPDused", 2)
	elseif HPP <= 40 and PDused == 2 then
		mob:useMobAbility(693) -- Perfect Dodge
		mob:setLocalVar("VidPDused", 3)
	elseif HPP <= 20 and PDused == 3 then
		mob:useMobAbility(693) -- Perfect Dodge
		mob:setLocalVar("VidPDused", 4)
	elseif HPP <= 10 and PDused == 4 then
		mob:useMobAbility(693) -- Perfect Dodge
		mob:setLocalVar("VidPDused", 4)
	end
end

entity.onMobDeath = function(mob, player)
	player:setCharVar("VidalaKill", 1)
	mob:removeListener("TAKE_DAMAGE")
	mob:removeListener("WEAPONSKILL_USE")
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