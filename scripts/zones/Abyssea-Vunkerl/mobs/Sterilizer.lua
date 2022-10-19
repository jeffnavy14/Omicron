-----------------------------------
-- Zone: Abyssea-Vunkerl
-- Sterilizer
-----------------------------------
local ID = 17666531
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Sterilizer")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("MegaMaidAV1", 1)
	if GetServerVariable("MegaMaidAV2") == 1 and
		GetServerVariable("MegaMaidAV3") == 1
	then
		SpawnMob(17666535):updateEnmity(player)
		player:PrintToPlayer("Initiating function('[MegaMaidAV]').Assemble", xi.msg.channel.NS_SAY)
	end		
end

return entity