-----------------------------------
-- Area: Escha Zi'Tah
--  Mob: Wrath's Pet
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Eivor")

end

return entity