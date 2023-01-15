-----------------------------------
-- Area: Wajoam Woodlands
--  Mob: Haunted Chest
-----------------------------------

local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Opps Sorry")
    mob:setMobMod(xi.mobMod.DRAW_IN, 1)
    SetServerVariable("[Found]", 3)
   end

entity.onMobFight = function(mob, target)

end

entity.onMobDeath = function(mob, player)
    SetServerVariable("[TreasureHunt]", 0) 
    SetServerVariable("[Found]", 0)
  end

return entity