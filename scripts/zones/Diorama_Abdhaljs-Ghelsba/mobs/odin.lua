-----------------------------------
-- Zone: Diorama_Abdhaljs-Ghelsba
-- Odin
-- temp lua's for Ofnir, Valfodr, Gagnrath, Geirrothr, Sanngetall, Yggr, Zantetsuken, Zantetsuken Kai
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)	
	mob:renameEntity("Odin")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:addStatusEffect(xi.effect.REGAIN, 100, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 50, 3, 0)
	mob:addMod(xi.mod.DMG,-4000)
	mob:setMod(xi.mod.ACC, 1500)
	mob:setMod(xi.mod.MATT, 800)
	mob:setMod(xi.mod.MACC, 1300)	
	mob:setLocalVar("Stage", 0)
end

entity.onMobEngaged = function(mob, player)
	mob:setTP(3000)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
	local party = player:getParty()
	for i, partyMember in pairs(party) do
		partyMember:changeMusic(0, 186)
		partyMember:changeMusic(1, 186)
		partyMember:changeMusic(2, 186)
		partyMember:changeMusic(3, 186)
		partyMember:changeMusic(4, 186)
	end
end

entity.onMobRoam = function(mob, player)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
end

entity.onMobFight = function(mob, player)
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
	end
	local HPP = mob:getHPP()
	local Stage = mob:getLocalVar("Stage")
	if HPP < 90 and Stage == 0 then -- Zantetsuken Kai
		mob:setLocalVar("Stage", 1)
		mob:useMobAbility(2912)
	elseif HPP < 80 and Stage == 1 then -- Yggr
		mob:setLocalVar("Stage", 2)
		mob:useMobAbility(2122)
	elseif HPP < 70 and Stage == 2 then -- Zantetsuken Kai
		mob:setLocalVar("Stage", 3)
		mob:useMobAbility(2912)
	elseif HPP < 60 and Stage == 3 then -- Yggr
		mob:setLocalVar("Stage", 4)
		mob:useMobAbility(2122)
	elseif HPP < 50 and Stage == 4 then-- Zantetsuken Kai
		mob:setLocalVar("Stage", 5)
		mob:useMobAbility(2912)
	elseif HPP < 40 and Stage == 5 then -- Yggr 
		mob:setLocalVar("Stage", 6)
		mob:useMobAbility(2122)
	elseif HPP < 30 and Stage == 6 then -- Zantetsuken Kai
		mob:setLocalVar("Stage", 7)
		mob:useMobAbility(2912)
	elseif HPP < 20 and Stage == 7 then -- Yggr
		mob:setLocalVar("Stage", 8)
		mob:useMobAbility(2122)
	elseif HPP < 10 and Stage == 8 then -- Zantetsuken *nned lua
		mob:setLocalVar("Stage", 9)
		mob:useMobAbility(2126)	
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	if GetServerVariable("Decent") == 3 then
		for i, partyMember in pairs(party) do
			partyMember:changeMusic(0, 30)
			partyMember:changeMusic(1, 30)
			partyMember:changeMusic(2, 30)
			partyMember:changeMusic(3, 30)
			partyMember:changeMusic(4, 30)
		end
	elseif GetServerVariable("Decent") == 4 then
		for i, partyMember in pairs(party) do
			partyMember:changeMusic(0, 37)
			partyMember:changeMusic(1, 37)
			partyMember:changeMusic(2, 37)
			partyMember:changeMusic(3, 37)
			partyMember:changeMusic(4, 37)
		end
	end
	player:PrintToPlayer("Odin: So there are those that do have the strength to live...", 13)
	player:PrintToPlayer("The looming darkness lifts from the air...", xi.msg.channel.NS_SAY)
	if GetServerVariable("Decent") == 4 then
		player:PrintToPlayer("Yet the heavy light remains...", xi.msg.channel.NS_SAY)
	end
end

entity.onMobDespawn = function(mob)
	
end

return entity