-----------------------------------
-- Area: Jade Sepulcher
--   NM: Mamool ja profligate
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
local ID = zones[xi.zone.JADE_SEPULCHER]
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
end

entity.onMobSpawn = function(mob)
    local battlefield = mob:getBattlefield()
        mob:addMod(xi.mod.STR, 50) 
        mob:addMod(xi.mod.VIT, 50) 
        mob:addMod(xi.mod.INT, 50) 
        mob:addMod(xi.mod.MND, 50) 
        mob:addMod(xi.mod.CHR, 50) 
        mob:addMod(xi.mod.AGI, 50) 
        mob:addMod(xi.mod.DEX, 50) 
        mob:addMod(xi.mod.DEF, 50) 
        mob:addMod(xi.mod.RATT, 150) 
        mob:addMod(xi.mod.ACC, 275) 
        mob:addMod(xi.mod.ATT, 175) 
        mob:addMod(xi.mod.MATT, 50)
        mob:addMod(xi.mod.MACC, 50) 
        mob:addMod(xi.mod.MEVA, 100) 
        mob:addMod(xi.mod.MDEF, 100)
        mob:setMod(xi.mod.EVA, 50)
        mob:setMod(xi.mod.EARTH_SDT, 50)
        mob:setMod(xi.mod.DARK_SDT, 50)
        mob:setMod(xi.mod.LIGHT_SDT, 50)
        mob:setMod(xi.mod.ICE_SDT, 50)
        mob:setMod(xi.mod.FIRE_SDT, 50)
        mob:setMod(xi.mod.WATER_SDT, 50)
        mob:setMod(xi.mod.THUNDER_SDT, 50)
        mob:setMod(xi.mod.WIND_SDT, 50)
        mob:setMod(xi.mod.SILENCERES, 50) 
        mob:setMod(xi.mod.STUNRES, 10) 
        mob:setMod(xi.mod.BINDRES, 50) 
        mob:setMod(xi.mod.GRAVITYRES, 50) 
        mob:setMod(xi.mod.SLEEPRES, 50) 
        mob:setMod(xi.mod.POISONRES, 50) 
        mob:setMod(xi.mod.PARALYZERES, 50) 
        mob:setMod(xi.mod.LULLABYRES, 0) 
        mob:setMod(xi.mod.FASTCAST, 50)
        mob:addStatusEffect(xi.effect.REGEN,  { power = 25, tick = 3, duration = 0, origin = mob})
        mob:addStatusEffect(xi.effect.REGAIN,  { power = 10, tick = 3, duration = 0, origin = mob})
    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = xi.jsa.PERFECT_DODGE, hpp = math.random(10, 20)  },
        },
    })
end

entity.onMobFight = function(mob)

end

entity.onMobDisengage = function(mob)

end

entity.onMobDeath = function(mob, player, optParams)
local battlefield = mob:getBattlefield()
            if battlefield:getLocalVar('[SpawnLancelord]') == 5 then
               SpawnMob(ID.mob.LANCELORD_GAHEEL_JA_HTBF)
            end
end

entity.onMobDespawn = function(mob)

end

return entity
