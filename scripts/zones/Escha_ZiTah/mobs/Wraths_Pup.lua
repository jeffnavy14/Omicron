-----------------------------------
-- Area: Escha Zi'Tah
--  Mob: Wrath's Pet
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Eivor")
	mob:setMobMod(xi.mobMod.DRAW_IN, 1)
end

return entity