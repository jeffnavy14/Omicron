-----------------------------------
-- Area: Full Moon Fountain
--  Mob: garuda Prime
-- Involved in Quest: waking the beast II HTBF
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
        mob:addMod(xi.mod.STR, 100) 
        mob:addMod(xi.mod.VIT, 100) 
        mob:addMod(xi.mod.INT, 100) 
        mob:addMod(xi.mod.MND, 100) 
        mob:addMod(xi.mod.CHR, 100) 
        mob:addMod(xi.mod.AGI, 100) 
        mob:addMod(xi.mod.DEX, 100) 
        mob:addMod(xi.mod.DEF, 100) 
        mob:addMod(xi.mod.RATT, 175) 
        mob:addMod(xi.mod.ACC, 350) 
        mob:addMod(xi.mod.ATT, 250) 
        mob:addMod(xi.mod.MATT, 50)
        mob:addMod(xi.mod.MACC, 50) 
        mob:addMod(xi.mod.MEVA, 200) 
        mob:addMod(xi.mod.MDEF, 200)
        mob:setMod(xi.mod.EVA, 100)
        mob:setMod(xi.mod.EARTH_SDT, 60)
        mob:setMod(xi.mod.DARK_SDT, 125)
        mob:setMod(xi.mod.LIGHT_SDT, 50)
        mob:setMod(xi.mod.ICE_SDT, 50)
        mob:setMod(xi.mod.FIRE_SDT, 50)
        mob:setMod(xi.mod.WATER_SDT, 50)
        mob:setMod(xi.mod.THUNDER_SDT, 50)
        mob:setMod(xi.mod.WIND_SDT, 550)
        mob:setMod(xi.mod.SILENCERES, 50) 
        mob:setMod(xi.mod.STUNRES, 10) 
        mob:setMod(xi.mod.BINDRES, 100) 
        mob:setMod(xi.mod.GRAVITYRES, 100) 
        mob:setMod(xi.mod.SLEEPRES, 100) 
        mob:setMod(xi.mod.POISONRES, 100) 
        mob:setMod(xi.mod.PARALYZERES, 100) 
        mob:setMod(xi.mod.LULLABYRES, 0) 
        mob:setMod(xi.mod.FASTCAST, 100)
        mob:addStatusEffect(xi.effect.REGEN,  { power = 25, tick = 3, duration = 0, origin = mob})
    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = 875, hpp = math.random(40, 60) }, -- uses Aerial Blast once while near 50% HPP.
        },
    })
end

entity.onMobFight = function(mob, target)

end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
