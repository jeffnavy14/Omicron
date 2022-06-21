-----------------------------------
-- Area: Reisenjima
--  Mob: Gluttony
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Gluttony")
    mob:setLocalVar("twoHours", 0)
    mob:setAggressive(true)
    mob:setLocalVar("phase", 0)
   	 mob:setAggressive(true)
		mob:setModelId(2672)

end



	  entity.onMobFight = function(mob, target, player)
  		local twoHours = mob:getLocalVar("twoHours")

	if
        mob:getLocalVar("twoHours") == 0 and
        mob:getHPP() < 75
    then
	 mob:useMobAbility(727)
		mob:addMod(xi.mod.ATT, 60)
		mob:addMod(xi.mod.DEF, 60)
		mob:addMod(xi.mod.MDEF, 60)
        mob:setLocalVar("twoHours", 1)
	end

	if
        mob:getLocalVar("twoHours") == 1 and
        mob:getHPP() < 48
    then
	 mob:useMobAbility(957)
		mob:addMod(xi.mod.ATT, 60)
		mob:addMod(xi.mod.DEF, 60)
		mob:addMod(xi.mod.MDEF, 60)
        mob:setLocalVar("twoHours", 2)
	end

	if
        mob:getLocalVar("twoHours") == 2 and
        mob:getHPP() <30
    then
	 mob:useMobAbility(695)
		mob:addMod(xi.mod.ATT, 80)
		mob:addMod(xi.mod.DEF, 80)
		mob:addMod(xi.mod.MDEF, 80)
		mob:addStatusEffect(xi.effect.HASTE, 120)
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
		mob:setModelId(1846)
		mob:addMod(xi.mod.ATT, 150)
		mob:addMod(xi.mod.DEF, 150)
		mob:addMod(xi.mod.MDEF, 100)
		mob:addMod(xi.mod.MATT, 50)
	 	mob:setMobMod(xi.mobMod.MAGIC_COOL, 20)
		mob:addStatusEffect(xi.effect.ICE_SPIKES, 60, 3, 0)
		mob:addStatusEffect(xi.effect.ENDARK, 40)
		mob:setLocalVar("phase", 2)
	end

		if 
		mob:hasStatusEffect(xi.effect.BLOOD_WEAPON) and mob:getLocalVar("phase") == 2 then
            mob:setMobMod(xi.mobMod.MAGIC_COOL, 60)
		mob:setMobMod(xi.mobMod.SPECIAL_COOL, 60)
		mob:setLocalVar("phase", 3)
	end
		if 
		not mob:hasStatusEffect(xi.effect.BLOOD_WEAPON) and mob:getLocalVar("phase") == 3 then
	 	mob:setMobMod(xi.mobMod.MAGIC_COOL, 20)
		mob:setMobMod(xi.mobMod.SPECIAL_COOL, 0)
	end
end


return entity