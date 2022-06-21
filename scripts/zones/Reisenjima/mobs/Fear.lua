-----------------------------------
-- Area: Reisenjima
--  Mob: Fear
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Fear")

end

return entity