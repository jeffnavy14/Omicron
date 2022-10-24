-----------------------------------
-- Zone: Abyssea-Misareaux
-- Sterilizer
-----------------------------------
local ID = 17662511
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Sterilizer")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("MegaMaidAM1", 1)
	if GetServerVariable("MegaMaidAM2") == 1 and
		GetServerVariable("MegaMaidAM3") == 1
	then
		SpawnMob(17662515):updateEnmity(player)
		player:PrintToPlayer("Initiating function('[MegaMaidAA]').Assemble", xi.msg.channel.NS_SAY)
	end		
end

return entity