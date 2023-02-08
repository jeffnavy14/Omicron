-----------------------------------
-- Zone: Outer_RaKaznar_[U1]
-- Putraxia
-----------------------------------
local ID = require("scripts/zones/Outer_RaKaznar_[U1]/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Putraxia")
	mob:setMobMod(xi.mobMod.DRAW_IN, 25)
	mob:setMod(xi.mod.DMG, -6000)
	mob:setMod(xi.mod.ACC, 1250)
	mob:setMod(xi.mod.ATT, 1250)
	mob:setMod(xi.mod.MATT, 500)
	mob:setMod(xi.mod.MACC, 1250)
	mob:setMod(xi.mod.FIRE_SDT, 500)
    mob:setMod(xi.mod.ICE_SDT, 850)
    mob:setMod(xi.mod.WIND_SDT, 200)
	mob:setMod(xi.mod.EARTH_SDT, 700)
    mob:setMod(xi.mod.THUNDER_SDT, 200)
    mob:setMod(xi.mod.WATER_SDT, 700)
    mob:setMod(xi.mod.LIGHT_SDT, 700)
    mob:setMod(xi.mod.DARK_SDT, 50)
	mob:setMod(xi.mod.SLASH_SDT, 1000)
    mob:setMod(xi.mod.PIERCE_SDT, 1000)
    mob:setMod(xi.mod.IMPACT_SDT, 1000)
    mob:setMod(xi.mod.HTH_SDT, 1000)
	mob:setMod(xi.mod.REGAIN, 10)
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("Putraxia: Hmmph, intruders in the master's realm... corrupting your souls may be worth... a dime...", 13)
end

entity.onMobFight = function(mob, target)
	local mobID = mob:getID()
	if GetServerVariable("Vag1Active") == 0 then
		DespawnMob(mobID)
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	player:PrintToPlayer("You have cleared the first path of Vagary.", 29)
	player:PrintToPlayer("Please make your way to the connection.", 29)
	local party = player:getParty()
	for i, partyMember in pairs(party) do
		if partyMember:isPC() then
			partyMember:changeMusic(0, 73)
			partyMember:changeMusic(1, 73)
			partyMember:changeMusic(2, 73)
			partyMember:changeMusic(3, 73)
			partyMember:changeMusic(4, 73)
			partyMember:setCharVar("VagPathActive", 0)
		end
	end
	SetServerVariable("Vag1Active", 0)
	SetServerVariable("P1W1Kills", 0)
	SetServerVariable("P1W2Kills", 0)
	SetServerVariable("P1W3Kills", 0)
	SetServerVariable("P1Boss1", 0)
	SetServerVariable("P1Boss2", 0)
	SetServerVariable("P1Boss3", 0)
	partyMember:setCharVar("VagPath1Win", 1)
	if (player:getCharVar("Mission3State") == 5) then
		player:setCharVar("Mission3State", 6)
	end
	player:PrintToPlayer("Putraxia: Maas...ter... I have... fa~iled... ... ...", 13)
	GetNPCByID(17904626):setStatus(xi.status.NORMAL)
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Vag1Active") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
		local party = player:getParty()
		for i, partyMember in pairs(party) do
			if partyMember:isPC() then
				partyMember:setPos(0,0,0)
				partyMember:changeMusic(0, 73)
				partyMember:changeMusic(1, 73)
				partyMember:changeMusic(2, 73)
				partyMember:changeMusic(3, 73)
				partyMember:changeMusic(4, 73)
				partyMember:setCharVar("VagPathActive", 0)
			end
		end
	end
end

entity.onMobDespawn = function(mob)

end

return entity