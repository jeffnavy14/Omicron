-----------------------------------
-- Area: Escha Zi'Tah
--  Mob: Pride
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Pride")
    mob:setLocalVar("TwoHours", 0)
	mob:setMobMod(xi.mobMod.DRAW_IN, 1)
    mob:setAggressive(true)
	mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
end


	entity.onMobFight = function(mob, target)
  	local twoHourPer = mob:getLocalVar("twoHourPer")

	if
        mob:getLocalVar("TwoHours") == 0 and
        mob:getHPP() < 75
    then
	 mob:useMobAbility(694)
		mob:addMod(xi.mod.ATT, 40)
		mob:addMod(xi.mod.DEF, 40)
		mob:addMod(xi.mod.MDEF, 40)
        mob:setLocalVar("TwoHours", 1)
	end

	if
        mob:getLocalVar("TwoHours") == 1 and
        mob:getHPP() < 42
    then
	 mob:useMobAbility(688)
		mob:addMod(xi.mod.ATT, 40)
		mob:addMod(xi.mod.DEF, 40)
		mob:addMod(xi.mod.MDEF, 40)
        mob:setLocalVar("TwoHours", 2)
	end

	if
        mob:getLocalVar("TwoHours") == 2 and
        mob:getHPP() < 15
    then
	 mob:useMobAbility(690)
		mob:addMod(xi.mod.ATT, 40)
		mob:addMod(xi.mod.DEF, 40)
		mob:addMod(xi.mod.MDEF, 40)
        mob:setLocalVar("TwoHours", 3)
	end

end

return entity