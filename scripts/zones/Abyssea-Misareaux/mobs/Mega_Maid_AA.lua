-----------------------------------
-- Zone: Abyssea-Misareaux
-- Super Scrubber
-----------------------------------
local ID = 17662515
-----------------------------------
local entity = {}
	
entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Mega Maid AM")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("MegaMaidAM1", 0)
	SetServerVariable("MegaMaidAM2", 0)
	SetServerVariable("MegaMaidAM3", 0)
	SetServerVariable("[AAMisareaux]Active", 0)
	player:setCharVar("[Bastion]Misareaux", 2)
end

return entity