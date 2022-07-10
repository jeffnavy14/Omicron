-----------------------------------
-- Area: Reisenjima
--  Mob: Sin Eater
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Sin Eater")
    mob:setLocalVar("twoHours", 0)
    mob:setLocalVar("Sins", 0)
    SetServerVariable("[Innocence]", 0)
    mob:setAggressive(true)
    mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
	mob:setMobMod(xi.mobMod.DRAW_IN, 2)
	mob:setMobMod(xi.mobMod.LINK_RADIUS, 20)
	mob:setMobMod(xi.mobMod.SIGHT_RANGE, 30)
	mob:setMobMod(xi.mobMod.SOUND_RANGE, 30)
	mob:setMobMod(xi.mobMod.ROAM_COOL, 1) 
	mob:addStatusEffect(xi.effect.DRAIN_SAMBA, 100, 0, 0)
    mob:setUnkillable(true)
end


	entity.onMobFight = function(mob, target)


if 
		mob:getHPP() <100 and mob:getLocalVar("Sins") == 0
      then 
		SpawnMob(mob:getID() + 1)
		mob:setLocalVar("Sins", 1)
	end

	if
        mob:getLocalVar("twoHours") == 0 and
        mob:getHPP() < 75
    then
	 mob:useMobAbility(690)
        mob:setLocalVar("twoHours", 1)
	end

	if
        mob:getLocalVar("twoHours") == 1 and
        mob:getHPP() < 42
    then
	 mob:useMobAbility(693)
        mob:setLocalVar("twoHours", 2)
	end

	if
        mob:getLocalVar("twoHours") == 2 and
        mob:getHPP() <30
    then
	 mob:useMobAbility(688)
        mob:setLocalVar("twoHours", 3)
	end

if   	GetServerVariable("[Innocence]") == 1
    then
    mob:setUnkillable(false)
	end
end

return entity