-----------------------------------
-- Area: Wajoam Woodlands
--  Mob: Cosmic Egg
-----------------------------------
require("scripts/globals/zone")


local entity = {}

entity.onMobSpawn = function(mob)
      mob:renameEntity(".")
    mob:setMobMod(xi.mobMod.DRAW_IN, 2)
	mob:setUnkillable(true)
   end



entity.onMobFight = function(mob, target)



	if 
		mob:getHPP() <100 and
		mob:getLocalVar("Summoned") == 0
	then	
	  mob:setLocalVar("Summoning", math.random(1,10))
		mob:setLocalVar("Summoned", 1)
	end


	if
		mob:getLocalVar("Summoning") == 1 and
		mob:getLocalVar("Summoned") == 1
	then
		GetMobByID(16986707):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986707):updateEnmity(target)
		mob:setLocalVar("Summoned", 2)

	elseif
		mob:getLocalVar("Summoning") == 2 and
		mob:getLocalVar("Summoned") == 1
	then
		GetMobByID(16986708):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986708):updateEnmity(target)
		mob:setLocalVar("Summoned", 2)

	elseif
		mob:getLocalVar("Summoning") == 3 and
		mob:getLocalVar("Summoned") == 1
	then
		GetMobByID(16986709):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986709):updateEnmity(target)
		mob:setLocalVar("Summoned", 2)

	elseif
		mob:getLocalVar("Summoning") == 4 and
		mob:getLocalVar("Summoned") == 1
	then
		GetMobByID(16986710):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986710):updateEnmity(target)
		mob:setLocalVar("Summoned", 2)

	elseif
		mob:getLocalVar("Summoning") == 5 and
		mob:getLocalVar("Summoned") == 1
	then
		GetMobByID(16986711):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986711):updateEnmity(target)
		mob:setLocalVar("Summoned", 2)

	elseif
		mob:getLocalVar("Summoning") == 6 and
		mob:getLocalVar("Summoned") == 1
	then
		GetMobByID(16986712):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986712):updateEnmity(target)
		mob:setLocalVar("Summoned", 2)

	elseif
		mob:getLocalVar("Summoning") == 7 and
		mob:getLocalVar("Summoned") == 1
	then
		GetMobByID(16986713):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986713):updateEnmity(target)
		mob:setLocalVar("Summoned", 2)

	elseif
		mob:getLocalVar("Summoning") == 8 and
		mob:getLocalVar("Summoned") == 1
	then
		GetMobByID(16986714):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986714):updateEnmity(target)
		mob:setLocalVar("Summoned", 2)

	elseif
		mob:getLocalVar("Summoning") == 9 and
		mob:getLocalVar("Summoned") == 1
	then
		GetMobByID(16986715):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986715):updateEnmity(target)
		mob:setLocalVar("Summoned", 2)

	elseif
		mob:getLocalVar("Summoning") == 10 and
		mob:getLocalVar("Summoned") == 1
	then
		GetMobByID(16986716):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986716):updateEnmity(target)
		mob:setLocalVar("Summoned", 2)
	end


	if
		mob:getLocalVar("Summoned") == 2
	then
		mob:setUnkillable(false)
	end



entity.onMobDeath = function(mob, player)
    SetServerVariable("[Hatched]", 0) 
    SetServerVariable("[Egg]", 0) 

  end
end

return entity