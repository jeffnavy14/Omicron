-----------------------------------
-- Zone: Abyssea-Attahwa
-- Dirt Seeker
-----------------------------------
local ID = 
	{
		17658300,
		17658301,
	}
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Dirt Seeker")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
end

return entity