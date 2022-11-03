-----------------------------------
-- Zone: Abyssea-Attahwa
-- Super Scrubber
-----------------------------------
local ID = 17658309
-----------------------------------
local entity = {}
	
entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Super Scrubber")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("MegaMaidAA3", 1)
	if GetServerVariable("MegaMaidAA1") == 1 and
		GetServerVariable("MegaMaidAA2") == 1
	then
		SpawnMob(17658310):updateEnmity(player)
		player:PrintToPlayer("Initiating function('[MegaMaidAA]').Assemble", xi.msg.channel.NS_SAY)
	end		
end

return entity