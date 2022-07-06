-----------------------------------
-- Area: Escha Ru'Ahn
--  Mob: Greed
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Faded Greed")
	 mob:setMobMod(xi.mobMod.MAGIC_COOL, 10)
	mob:addStatusEffect(xi.effect.FAST_CAST, 120)
	mob:addStatusEffect(xi.effect.ICE_SPIKES, 80, 3, 0)
    mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
	mob:setMobMod(xi.mobMod.DRAW_IN, 1)
		mob:setUnkillable(true)
	mob:setLocalVar("Sins6", 0)
end

	  entity.onMobFight = function(mob, target, player)

if 
		mob:getHPP() <25 and mob:getLocalVar("Sins6") == 0
      then 
		SpawnMob(mob:getID() + 1)
		mob:setLocalVar("Sins6", 1)
		mob:setUnkillable(false)
	end

end

return entity