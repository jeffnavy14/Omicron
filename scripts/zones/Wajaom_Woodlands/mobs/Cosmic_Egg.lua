-----------------------------------
-- Area: Wajoam Woodlands
--  Mob: Cosmic Egg
-----------------------------------

local entity = {}

entity.onMobSpawn = function(mob)
      mob:renameEntity(".")
    mob:setMobMod(xi.mobMod.DRAW_IN, 2)
     SetServerVariable("[Hatch]", 3)
		mob:setUnkillable(true)
   end



entity.onMobFight = function(mob, target)



	if 
		mob:getHPP() <100 and
		GetServerVariable("Summoned") == 0
	then	
	  SetServerVariable("Summoning", math.random(1,10))
		SetServerVariable("Summoned", 1)
	end


	if
		GetServerVariable("Summoning") == 1 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986707):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986707):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 2 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986708):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986708):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 3 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986709):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986709):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 4 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986710):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986710):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 5 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986711):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986711):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 6 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986712):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986712):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 7 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986713):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986713):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 8 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986714):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986714):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 9 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986715):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986715):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 10 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986716):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986716):updateEnmity(target)
		SetServerVariable("Summoned", 2)
	end


	if
		GetServerVariable("Summoned") == 2
	then
		mob:setUnkillable(false)
	end



entity.onMobDeath = function(mob, player)
    SetServerVariable("[EggHunt]", 0) 
    SetServerVariable("[Hatch]", 0) 

  end
end

return entity