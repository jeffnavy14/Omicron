-----------------------------------
-- Area: The Celestial Nexus
--  Mob: Eald'narche (Phase 1)
-- Zilart Mission 16 BCNM Fight
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(xi.immunity.SILENCE)
    mob:addImmunity(xi.immunity.PETRIFY)
    mob:addImmunity(xi.immunity.LIGHT_SLEEP)
    mob:addImmunity(xi.immunity.DARK_SLEEP)
    --50% fast cast, no standback
    mob:setMod(xi.mod.UFASTCAST, 50)
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
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

    mob:setAutoAttackEnabled(false)
    mob:setUnkillable(true)
    mob:setMod(xi.mod.MDEF, 50)
    mob:setMobMod(xi.mobMod.SIGHT_RANGE, 30)
    mob:setMobMod(xi.mobMod.GA_CHANCE, 25)
    mob:addStatusEffect(xi.effect.PHYSICAL_SHIELD, { power = 1, origin = mob, icon = 0 })
    mob:addStatusEffect(xi.effect.ARROW_SHIELD, { power = 1, origin = mob, icon = 0 })
    mob:addStatusEffect(xi.effect.MAGIC_SHIELD, { power = 1, origin = mob, icon = 0 })
    mob:setMagicCastingEnabled(false)
end

entity.onMobEngage = function(mob, target)
    -- Wait 20 seconds before casting
    mob:timer(20000, function(mobArg)
        mobArg:setMagicCastingEnabled(true)
    end)

    GetMobByID(mob:getID() + 1):updateEnmity(target)
end

entity.onMobFight = function(mob, target)
    -- Instantly respawns orbital when they despawn
    local orbitals = { mob:getID() + 3, mob:getID() + 4 }
    xi.mob.callPets(mob, orbitals, { dieWithOwner = true, noAnimation = true })
end

return entity
