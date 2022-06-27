-----------------------------------
-- Area: Escha Zi'Tah
--  Mob: Wrath's Pet
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Eivor")
	mob:setMobMod(xi.mobMod.DRAW_IN, 1)
	mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
	mob:setMobMod(xi.mobMod.SHARE_TARGET, 17957502)
end

return entity