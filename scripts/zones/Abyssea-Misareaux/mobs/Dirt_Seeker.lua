-----------------------------------
-- Zone: Abyssea-Misareaux
-- Dirt Seeker
-----------------------------------
local ID = 
	{
		17662505,
		17662506,
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