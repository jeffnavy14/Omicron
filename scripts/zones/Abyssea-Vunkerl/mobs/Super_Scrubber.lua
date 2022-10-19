-----------------------------------
-- Zone: Abyssea-Vunkerl
-- Super Scrubber
-----------------------------------
local ID = 17666534
-----------------------------------
local entity = {}
	
entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Super Scrubber")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("MegaMaidAV3", 1)
	if GetServerVariable("MegaMaidAV1") == 1 and
		GetServerVariable("MegaMaidAV2") == 1
	then
		SpawnMob(17666535):updateEnmity(player)
		player:PrintToPlayer("Initiating function('[MegaMaidAV]').Assemble", xi.msg.channel.NS_SAY)
	end		
end

return entity