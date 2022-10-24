-----------------------------------
-- Zone: Abyssea-Attahwa
-- Sterilizer
-----------------------------------
local ID = 17658306
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Sterilizer")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("MegaMaidAA1", 1)
	if GetServerVariable("MegaMaidAA2") == 1 and
		GetServerVariable("MegaMaidAA3") == 1
	then
		SpawnMob(17658310):updateEnmity(player)
		player:PrintToPlayer("Initiating function('[MegaMaidAA]').Assemble", xi.msg.channel.NS_SAY)
	end		
end

return entity