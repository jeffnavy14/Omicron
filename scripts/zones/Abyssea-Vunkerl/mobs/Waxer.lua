-----------------------------------
-- Zone: Abyssea-Vunkerl
-- Waxer
-----------------------------------
local ID = 17666533
-----------------------------------
local entity = {}
	
entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Waxer")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("MegaMaidAV2", 1)
	if GetServerVariable("MegaMaidAV1") == 1 and
		GetServerVariable("MegaMaidAV3") == 1
	then
		SpawnMob(17666535):updateEnmity(player)
		player:PrintToPlayer("Initiating function('[MegaMaidAV]').Assemble", xi.msg.channel.NS_SAY)
	end		
end

return entity