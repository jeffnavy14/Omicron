-----------------------------------
-- Area: Stellar Fulcrum
--  Mob: Kam'lanaut (HTBF)
-----------------------------------
---
local ID = zones[xi.zone.STELLAR_FULCRUM]
local debug = false
---
---
---@type TMobEntity
local entity = {}

local skillToAbsorb =
{
    [823] = xi.mod.FIRE_ABSORB,  -- fire_blade
    [824] = xi.mod.ICE_ABSORB,   -- frost_blade
    [825] = xi.mod.WIND_ABSORB,  -- wind_blade2
    [826] = xi.mod.EARTH_ABSORB, -- earth_blade
    [827] = xi.mod.LTNG_ABSORB,  -- lightning_blade
    [828] = xi.mod.WATER_ABSORB, -- water_blade
}

local absorbToElement = {
    [xi.mod.FIRE_ABSORB]  = xi.element.FIRE,
    [xi.mod.ICE_ABSORB]   = xi.element.ICE,
    [xi.mod.WIND_ABSORB]  = xi.element.WIND,
    [xi.mod.EARTH_ABSORB] = xi.element.EARTH,
    [xi.mod.LTNG_ABSORB]  = xi.element.THUNDER,
    [xi.mod.WATER_ABSORB] = xi.element.WATER,
}

local damageTypeToAbsorb = {
    [xi.damageType.FIRE]    = xi.mod.FIRE_ABSORB,
    [xi.damageType.ICE]     = xi.mod.ICE_ABSORB,
    [xi.damageType.WIND]    = xi.mod.WIND_ABSORB,
    [xi.damageType.EARTH]   = xi.mod.EARTH_ABSORB,
    [xi.damageType.THUNDER] = xi.mod.LTNG_ABSORB,
    [xi.damageType.WATER]   = xi.mod.WATER_ABSORB,
}

local function spawnScrivening(mob, target, element)
    -- Only the main boss spawns Scrivenings
    if mob:getID() ~= ID.mob.KAMLANAUT_HTBF then
        return
    end

    -- Check if any clones are alive
    local bf = mob:getBattlefield()
    if bf then
        for _, m in pairs(bf:getMobs(true, true)) do
            if m:getID() ~= mob:getID() and m:getName() == mob:getName() and m:isSpawned() and m:isAlive() then
                return
            end
        end
    end

    local scrivening = GetMobByID(ID.mob.ESOTERIC_SCRIVENING)
    if scrivening and not scrivening:isSpawned() then
        scrivening:setLocalVar("ScriveningElement", element)
        -- Spawn 5 yalms away in a random direction
        local angle = math.random() * 2 * math.pi
        local dist = 5
        local x = mob:getXPos() + dist * math.cos(angle)
        local z = mob:getZPos() + dist * math.sin(angle)
        
        scrivening:setSpawn(x, mob:getYPos(), z, mob:getRotPos())
        SpawnMob(ID.mob.ESOTERIC_SCRIVENING)
        scrivening:updateEnmity(target)
    end
end

entity.onMobInitialize = function(mob)
    mob:addImmunity(xi.immunity.SILENCE)
    mob:addImmunity(xi.immunity.LIGHT_SLEEP)
    mob:addImmunity(xi.immunity.DARK_SLEEP)
end

-- NEW: Injected Stat Block for HTBF
entity.onMobSpawn = function(mob)
    if mob:getID() ~= ID.mob.KAMLANAUT_HTBF then
        mob:setMobMod(xi.mobMod.NO_DROPS, 1)
    end

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

    mob:addListener("TAKE_DAMAGE", "KAMLANAUT_ABSORB", function(m, damage, attacker, attackType, damageType)
        local currentAbsorb = m:getLocalVar('currentAbsorb')
        if currentAbsorb > 0 and damageTypeToAbsorb[damageType] == currentAbsorb then
            return -damage
        end
    end)
end

entity.onMobEngage = function(mob, target)
end

entity.onMobFight = function(mob, target)
    if mob:getTP() >= 1000 then
        local skillId = math.random(823, 828)
        mob:useMobAbility(skillId)
        mob:setTP(0)

        local absorbId = skillToAbsorb[skillId]
        if absorbId then
            -- remove previous absorb mod, if set
            local previousAbsorb = mob:getLocalVar('currentAbsorb')

            if previousAbsorb > 0 then
                mob:setMod(previousAbsorb, 0)
            end

            -- add new absorb mod
            mob:setLocalVar('currentAbsorb', absorbId)
            mob:setMod(absorbId, 100)

            -- Spawn Scrivening if HP < 50%
            if mob:getHPP() < 50 then
                if debug then
                    print("[Kamlanaut_HTBF] Spawning Scrivening for element: " .. tostring(absorbToElement[absorbId]))
                end
                spawnScrivening(mob, target, absorbToElement[absorbId])
            end
        end
    end
end

entity.onMobDespawn = function(mob)
    local scrivening = GetMobByID(ID.mob.ESOTERIC_SCRIVENING)
    if scrivening and scrivening:isSpawned() then
        DespawnMob(ID.mob.ESOTERIC_SCRIVENING)
    end
end

return entity