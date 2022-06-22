-----------------------------------
-- Area: Escha Ru'Ahn
--  Mob: Greed
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Greed")
	 mob:setMobMod(xi.mobMod.MAGIC_COOL, 10)
	mob:addStatusEffect(xi.effect.FAST_CAST, 120)
	mob:addStatusEffect(xi.effect.ICE_SPIKES, 80, 3, 0)
end

return entity