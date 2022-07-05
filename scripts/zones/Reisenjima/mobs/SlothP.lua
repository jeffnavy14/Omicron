-----------------------------------
-- Area: Reisenjima
--  Mob: Sloth
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Devoured Sloth")
mob:setLocalVar("twoHours", 0)
    mob:setAggressive(true)
    mob:setLocalVar("phase", 0)
   	 mob:setAggressive(true)
	 mob:setMobMod(xi.mobMod.MAGIC_COOL, 75)
	mob:setMobMod(xi.mobMod.DRAW_IN, 1)
	mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)

end



	  entity.onMobFight = function(mob, target, player)
  		local twoHours = mob:getLocalVar("twoHours")

	if
        mob:getLocalVar("twoHours") == 0 and
        mob:getHPP() < 75
    then
	 mob:useMobAbility(1010)
        mob:setLocalVar("twoHours", 1)
	end

	if
        mob:getLocalVar("twoHours") == 1 and
        mob:getHPP() < 48
    then
	 mob:useMobAbility(341)
        mob:setLocalVar("twoHours", 2)
	end

	if
        mob:getLocalVar("twoHours") == 2 and
        mob:getHPP() <30
    then
	 mob:useMobAbility(2248)
		mob:addStatusEffect(xi.effect.HASTE, 50)
        mob:setLocalVar("twoHours", 3)
	end


if 
		mob:getHPP() <50 and mob:getLocalVar("phase") == 0
      then 
		mob:setLocalVar("phase", 1)

	end
if
		mob:getLocalVar("phase") == 1
	then
		mob:addStatusEffect(xi.effect.BLAZE_SPIKES, 60, 3, 0)
		mob:addStatusEffect(xi.effect.ENSTONE, 100)
		mob:setLocalVar("phase", 2)
	end
end

return entity