-----------------------------------
-- Zone: Abyssea-Misareaux
-- Super Scrubber
-----------------------------------
local ID = 17662514
-----------------------------------
local entity = {}
	
entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Super Scrubber")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("MegaMaidAM3", 1)
	if GetServerVariable("MegaMaidAM1") == 1 and
		GetServerVariable("MegaMaidAM2") == 1
	then
		SpawnMob(17662515):updateEnmity(player)
		player:PrintToPlayer("Initiating function('[MegaMaidAM]').Assemble", xi.msg.channel.NS_SAY)
	end		
end

return entity