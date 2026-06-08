-----------------------------------
-- Area: The Celestial Nexus
--  Mob: Eald'narche (Phase 2)
-- Zilart Mission 16 BCNM Fight
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(xi.immunity.SILENCE)
    mob:addImmunity(xi.immunity.PETRIFY)
    mob:addImmunity(xi.immunity.LIGHT_SLEEP)
    mob:addImmunity(xi.immunity.DARK_SLEEP)
    -- 60% fast cast, -75% physical damage taken, 10tp/tick regain, no standback
    mob:addMod(xi.mod.UFASTCAST, 60)
    mob:addMod(xi.mod.UDMGPHYS, -7500)
    mob:addMod(xi.mod.REGAIN, 100)
    mob:setMod(xi.mod.MDEF, 50)
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
    mob:setMobMod(xi.mobMod.TELEPORT_CD, 1)
    mob:setMobMod(xi.mobMod.TELEPORT_START, 988)
    mob:setMobMod(xi.mobMod.TELEPORT_END, 989)
    mob:setMobMod(xi.mobMod.TELEPORT_TYPE, 1)
end

entity.onMobSpawn = function(mob)
    
    mob:addMod(xi.mod.STR, 100)
    mob:addMod(xi.mod.VIT, 100)
    mob:addMod(xi.mod.INT, 100)
    mob:addMod(xi.mod.MND, 100)
    mob:addMod(xi.mod.CHR, 100)
    mob:addMod(xi.mod.AGI, 100)
    mob:addMod(xi.mod.DEX, 100)
    mob:addMod(xi.mod.DEF, 100)
    mob:addMod(xi.mod.RATT, 250)
    mob:addMod(xi.mod.ACC, 375)
    mob:addMod(xi.mod.ATT, 275)
    mob:addMod(xi.mod.MATT, 250)
    mob:addMod(xi.mod.MACC, 250)
    mob:addMod(xi.mod.MEVA, 200)
    mob:addMod(xi.mod.MDEF, 200)
    mob:setMod(xi.mod.EVA, 100)
    
    -- Resistances
    mob:setMod(xi.mod.EARTH_SDT, 100)
    mob:setMod(xi.mod.DARK_SDT, 100)
    mob:setMod(xi.mod.LIGHT_SDT, 100)
    mob:setMod(xi.mod.ICE_SDT, 100)
    mob:setMod(xi.mod.FIRE_SDT, 100)
    mob:setMod(xi.mod.WATER_SDT, 100)
    mob:setMod(xi.mod.THUNDER_SDT, 100)
    mob:setMod(xi.mod.WIND_SDT, 100)
    mob:setMod(xi.mod.SILENCERES, 100)
    mob:setMod(xi.mod.STUNRES, 50)
    mob:setMod(xi.mod.BINDRES, 50)
    mob:setMod(xi.mod.GRAVITYRES, 50)
    mob:setMod(xi.mod.SLEEPRES, 50)
    mob:setMod(xi.mod.POISONRES, 50)
    mob:setMod(xi.mod.PARALYZERES, 50)
    mob:setMod(xi.mod.LULLABYRES, 0)
    mob:setMod(xi.mod.FASTCAST, 50)
    
    -- Regen/Regain
    mob:addStatusEffect(xi.effect.REGEN,  { power = 25, duration = 0, origin = mob, tick = 3 })
    mob:addStatusEffect(xi.effect.REGAIN,  { power = 10, duration = 0, origin = mob, tick = 3 })
    
    mob:setMobMod(xi.mobMod.GA_CHANCE, 25)
    mob:setMagicCastingEnabled(false)
end

entity.onMobEngage = function(mob, target)
    -- Wait 20 seconds before casting
    mob:timer(20000, function(mobArg)
        mobArg:setMagicCastingEnabled(true)
    end)
end

return entity
