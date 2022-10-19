-----------------------------------
-- Zone: Abyssea-Misareaux
-- Waxer
-----------------------------------
local ID = 17662513
-----------------------------------
local entity = {}
	
entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Waxer")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("MegaMaidAM2", 1)
	if GetServerVariable("MegaMaidAM1") == 1 and
		GetServerVariable("MegaMaidAM3") == 1
	then
		SpawnMob(17662515):updateEnmity(player)
		player:PrintToPlayer("Initiating function('[MegaMaidAM]').Assemble", xi.msg.channel.NS_SAY)
	end		
end

return entity