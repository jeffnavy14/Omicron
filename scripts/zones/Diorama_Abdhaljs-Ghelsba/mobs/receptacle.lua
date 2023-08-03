-----------------------------------
-- Zone: Diorama_Abdhaljs-Ghelsba
-- Receptacle (3 total, IDs 16953376, 16953415, 16953452)
-----------------------------------
local ID = require("scripts/zones/Diorama_Abdhaljs-Ghelsba/IDs")
-----------------------------------
local entity = {}
	
entity.onMobSpawn = function(mob)
	mob:setMobMod(xi.mobMod.NO_MOVE, 1)
	mob:renameEntity("Receptacle")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:addStatusEffect(xi.effect.REGAIN, 500, 3, 0)
	mob:addStatusEffect(xi.effect.REGEN, 50, 3, 0)
	mob:addMod(xi.mod.DMG,-5000)
	mob:setMod(xi.mod.ACC, 1000)
	mob:setMod(xi.mod.MATT, 400)
	mob:setMod(xi.mod.MACC, 1000)
end

entity.onMobEngaged = function(mob, player)
	mob:setMobMod(xi.mobMod.NO_MOVE, 0)
	if GetServerVariable("Decent") == 1 then
		SpawnMob(16953380):updateEnmity(target)
		SpawnMob(16953381):updateEnmity(target)
		SpawnMob(16953382):updateEnmity(target)
		SpawnMob(16953383):updateEnmity(target)
	elseif GetServerVariable("Decent") == 2 then
		SpawnMob(16953419):updateEnmity(target)
		SpawnMob(16953420):updateEnmity(target)
		SpawnMob(16953421):updateEnmity(target)
		SpawnMob(16953422):updateEnmity(target)
	elseif GetServerVariable("Decent") == 3 then
		SpawnMob(16953456):updateEnmity(target)
		SpawnMob(16953457):updateEnmity(target)
		SpawnMob(16953458):updateEnmity(target)
		SpawnMob(16953459):updateEnmity(target)
	end
	if GetServerVariable("Decent") == 0 then
		local mobID = mob:getID()
		DespawnMob(mobID)
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
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	local party = player:getParty()
	local MobNumber = mob:getID()
	if GetServerVariable("Decent") == 1 and MobNumber == 16953379 then -- Spawn Group 2
		SetServerVariable("Decent", 2)
		local decentP2id = 16953386
		repeat
			SpawnMob(decentP2id, 900)
			decentP2id = decentP2id + 1
		until decentP2id == 16953401
		SpawnMob(16953418) -- 2nd Receptacle
		for i, partyMember in pairs(party) do
			partyMember:changeMusic(0, 36)
			partyMember:changeMusic(1, 36)
			partyMember:changeMusic(2, 36)
			partyMember:changeMusic(3, 36)
			partyMember:changeMusic(4, 36)
		end
	elseif GetServerVariable("Decent") == 2 and MobNumber == 16953418 then -- Spawn Group 3
		SetServerVariable("Decent", 3)
		GetNPCByID(16953347):setStatus(xi.status.NORMAL)
		local decentP3id = 16953423
		repeat
			SpawnMob(decentP3id)
			decentP3id = decentP3id + 1
		until decentP3id == 16953438
		local SecretDecent1ID = 16953476 -- Spawn Odin Group
		repeat
			SpawnMob(SecretDecent1ID, 900)
			SecretDecent1ID = SecretDecent1ID + 1
		until SecretDecent1ID == 16953486
		SetServerVariable("DeadValk", 0)
		player:PrintToPlayer("A darkness looms in the air...", xi.msg.channel.NS_SAY)
		SpawnMob(16953455) -- 3rd Receptacle
		for i, partyMember in pairs(party) do
			partyMember:changeMusic(0, 30)
			partyMember:changeMusic(1, 30)
			partyMember:changeMusic(2, 30)
			partyMember:changeMusic(3, 30)
			partyMember:changeMusic(4, 30)
		end
	elseif GetServerVariable("Decent") == 3 and MobNumber == 16953455 then -- Spawn Final Group
		SetServerVariable("Decent", 4)
		local decentP4id = 16953460
		repeat
			SpawnMob(decentP4id)
			decentP4id = decentP4id + 1
		until decentP4id == 16953476
		GetNPCByID(16953347):setStatus(xi.status.NORMAL)
		GetNPCByID(16953348):setStatus(xi.status.NORMAL)
		local SecretDecent2ID = 16953486 -- Spawn Alexander Group
		repeat
			SpawnMob(SecretDecent2ID, 900)
			SecretDecent2ID = SecretDecent2ID +1
		until SecretDecent2ID == 16953498
		player:PrintToPlayer("A heavy light fills the region...", xi.msg.channel.NS_SAY)
		for i, partyMember in pairs(party) do
			partyMember:changeMusic(0, 37)
			partyMember:changeMusic(1, 37)
			partyMember:changeMusic(2, 37)
			partyMember:changeMusic(3, 37)
			partyMember:changeMusic(4, 37)
		end
	end
		
end

entity.onMobDespawn = function(mob)
	
end

return entity