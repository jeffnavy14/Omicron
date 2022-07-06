-----------------------------------
-- Area: Reisenjima
--  Mob: Fear
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Faded Fear")
	mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
	mob:setMobMod(xi.mobMod.DRAW_IN, 1)
	mob:setLocalVar("Sins8", 0)
	    mob:setLocalVar("SkillUse", 0)
		mob:setUnkillable(true)
end


	entity.onMobFight = function(mob, target)

if 
		mob:getHPP() <25 and mob:getLocalVar("Sins8") == 0
      then 
		SpawnMob(mob:getID() + 1)
		mob:setLocalVar("Sins8", 1)
		mob:setUnkillable(false)
	end

	if
        mob:getLocalVar("SkillUse") == 0 and
        mob:getHPP() < 75
    then
	 mob:useMobAbility(957)
        mob:setLocalVar("SkillUse", 1)
	end

	if
        mob:getLocalVar("SkillUse") == 1 and
        mob:getHPP() < 42
    then
	 mob:useMobAbility(957)
      	mob:addStatusEffect(xi.effect.REGAIN, 50)
        mob:setLocalVar("SkillUse", 2)
	end

	if
        mob:getLocalVar("SkillUse") == 2 and
        mob:getHPP() < 15
    then
	 mob:useMobAbility(957)
      	mob:addStatusEffect(xi.effect.REGAIN, 75)
        mob:setLocalVar("SkillUse", 3)
	end

end

return entity