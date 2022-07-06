-----------------------------------
-- Area: Escha Zi'Tah
--  Mob: Rage
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Faded Rage")
	    mob:setLocalVar("SkillUse", 0)
	mob:setMobMod(xi.mobMod.DRAW_IN, 1)
    mob:setAggressive(true)
	mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
	mob:setLocalVar("Sins1", 0)
end


	entity.onMobFight = function(mob, target)
if 
		mob:getHPP() <25 and mob:getLocalVar("Sins1") == 0
      then 
		SpawnMob(mob:getID() + 1)
		mob:setLocalVar("Sins1", 1)
	end

	if
        mob:getLocalVar("SkillUse") == 0 and
        mob:getHPP() < 75
    then
	 mob:useMobAbility(255)
        mob:setLocalVar("SkillUse", 1)
	end

	if
        mob:getLocalVar("SkillUse") == 1 and
        mob:getHPP() < 42
    then
	 mob:useMobAbility(952)
        mob:setLocalVar("SkillUse", 2)
	end

	if
        mob:getLocalVar("SkillUse") == 2 and
        mob:getHPP() < 15
    then
	 mob:useMobAbility(655)
        mob:setLocalVar("SkillUse", 3)
	end

end

return entity
