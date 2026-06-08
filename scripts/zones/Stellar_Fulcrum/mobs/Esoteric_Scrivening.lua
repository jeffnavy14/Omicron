-----------------------------------
-- Area: Stellar Fulcrum
-- Mob: Esoteric Scrivening
-----------------------------------
local ID = zones[xi.zone.STELLAR_FULCRUM]
-----------------------------------
---@type TMobEntity
local entity = {}

local scriveningConfig = {
    [xi.element.FIRE] = {
        weakness = xi.element.WATER,
        absorb = xi.mod.FIRE_ABSORB,
        enEffect = { effect = xi.effect.PLAGUE, power = 1, duration = 60 },
        aura = {
            { effect = xi.effect.BURN, power = 10 },
            { effect = xi.effect.ATTACK_DOWN, power = 50 }
        },
        model = 2139, -- Red Fetter
    },
    [xi.element.ICE] = {
        weakness = xi.element.FIRE,
        absorb = xi.mod.ICE_ABSORB,
        enEffect = { effect = xi.effect.PARALYSIS, power = 15, duration = 60 },
        aura = {
            { effect = xi.effect.FROST, power = 10 },
            { effect = xi.effect.MAGIC_ATK_DOWN, power = 50 }
        },
        model = 2140, -- Blue Fetter
    },
    [xi.element.WIND] = {
        weakness = xi.element.ICE,
        absorb = xi.mod.WIND_ABSORB,
        enEffect = { effect = xi.effect.SILENCE, power = 1, duration = 60 },
        aura = {
            { effect = xi.effect.CHOKE, power = 10 },
            { effect = xi.effect.EVASION_DOWN, power = 50 }
        },
        model = 2141, -- Green Fetter
    },
    [xi.element.EARTH] = {
        weakness = xi.element.WIND,
        absorb = xi.mod.EARTH_ABSORB,
        enEffect = { effect = xi.effect.SLOW, power = 1000, duration = 60 },
        aura = {
            { effect = xi.effect.RASP, power = 10 },
            { effect = xi.effect.DEFENSE_DOWN, power = 50 }
        },
        model = 2142, -- Yellow Fetter
    },
    [xi.element.THUNDER] = {
        weakness = xi.element.EARTH,
        absorb = xi.mod.LTNG_ABSORB,
        enEffect = { effect = xi.effect.STUN, power = 1, duration = 1 },
        aura = {
            { effect = xi.effect.SHOCK, power = 10 },
            { effect = xi.effect.ACCURACY_DOWN, power = 50 }
        },
        model = 2143, -- Purple Fetter
    },
    [xi.element.WATER] = {
        weakness = xi.element.THUNDER,
        absorb = xi.mod.WATER_ABSORB,
        enEffect = { effect = xi.effect.POISON, power = 100, duration = 60 },
        aura = {
            { effect = xi.effect.DROWN, power = 10 },
            { effect = xi.effect.MAGIC_DEF_DOWN, power = 50 }
        },
        model = 2144, -- Blue Fetter
    },
}

local TRANSFORMATION_TIME = 120 -- Seconds until transformation

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ALLI_HATE, 30)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar("SpawnTime", os.time())
    local element = mob:getLocalVar("ScriveningElement")
    if element == 0 then
        element = math.random(1, 6)
        mob:setLocalVar("ScriveningElement", element)
    end

    local config = scriveningConfig[element]
    if not config then config = scriveningConfig[xi.element.FIRE] end

    mob:setModelId(config.model)
    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
    mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
    mob:setMobMod(xi.mobMod.NO_DROPS, 1)

    -- High Physical Defense
    mob:addMod(xi.mod.DEF, 1000)

    -- Absorb Element
    mob:addMod(config.absorb, 100)

    -- Weakness
    local weaknessMod = 0
    if config.weakness == xi.element.FIRE then weaknessMod = xi.mod.FIRE_SDT
    elseif config.weakness == xi.element.ICE then weaknessMod = xi.mod.ICE_SDT
    elseif config.weakness == xi.element.WIND then weaknessMod = xi.mod.WIND_SDT
    elseif config.weakness == xi.element.EARTH then weaknessMod = xi.mod.EARTH_SDT
    elseif config.weakness == xi.element.THUNDER then weaknessMod = xi.mod.THUNDER_SDT
    elseif config.weakness == xi.element.WATER then weaknessMod = xi.mod.WATER_SDT
    end

    if weaknessMod ~= 0 then
        mob:setMod(weaknessMod, 2000) -- 200% damage taken
    end

    -- Auras
    for _, aura in ipairs(config.aura) do
        mob:addStatusEffect(aura.effect, { power = aura.power, subType = aura.effect, subPower = 800, tick = 3, duration = 3600, tier = xi.auraTarget.ENEMIES, flag = xi.effectFlag.AURA, origin = mob })
    end

    -- Transformation Timer
    mob:timer(TRANSFORMATION_TIME * 1000, function(m)
        if m:isAlive() and os.time() - m:getLocalVar("SpawnTime") >= (TRANSFORMATION_TIME - 5) then

            local bf = m:getBattlefield()
            if not bf then return end

            -- Find any living Kam'lanaut in the battlefield to use as a template
            local boss_template = nil
            for _, mob_check in ipairs(bf:getMobs(true, true)) do
                -- Check for main boss or clones
                if mob_check:isAlive() and string.find(mob_check:getName(), "Kamlanaut") then
                    boss_template = mob_check
                    break
                end
            end

            -- If no Kam'lanaut is alive, don't spawn a clone. Check for win condition.
            if not boss_template then
                -- If the only thing left alive is this scrivening, then the battle is won.
                local aliveCount = 0
                for _, mob in pairs(bf:getMobs(true, true)) do
                    if mob:isAlive() then
                        aliveCount = aliveCount + 1
                    end
                end

                if aliveCount <= 1 then
                    bf:setStatus(xi.battlefield.status.WON)
                end
                m:setHP(0)
                return
            end

            -- If we reach here, a boss template was found and we will transform.
            local x, y, z, rot = m:getXPos(), m:getYPos(), m:getZPos(), m:getRotPos()
            local zone = m:getZone()
            
 -- Find a free clone ID to spawn
            local cloneId = nil
            -- Check +1 to +4 offsets for available clones
            for i = 1, 4 do
                local id = ID.mob.KAMLANAUT_HTBF + i
                local mob = GetMobByID(id)
                
                -- If GetMobByID returns nil, the mob doesn't exist in the DB/Zone. 
                -- Break to avoid further warnings for subsequent missing IDs.
                if not mob then
                    break 
                end

                if not mob:isSpawned() then
                    cloneId = id
                    break
                end
            end

            -- Despawn the scrivening right before the clone spawns
            m:setHP(0)

            if cloneId then
                local clone = GetMobByID(cloneId)
                clone:setSpawn(x, y, z, rot)
                clone:setHP(clone:getMaxHP())
                SpawnMob(cloneId)

                -- Make the clone attack the main boss's target immediately
                local boss = GetMobByID(ID.mob.KAMLANAUT_HTBF)
                if boss then
                    local bossTarget = boss:getTarget()
                    if bossTarget then
                        clone:updateEnmity(bossTarget)
                    end
                end
            end
        end    
    end)
end

entity.onMobHit = function(mob, target)
    local element = mob:getLocalVar("ScriveningElement")
    local config = scriveningConfig[element]
    if config and config.enEffect then
        target:addStatusEffect(config.enEffect.effect, { power = config.enEffect.power, tick = 0, duration = config.enEffect.duration })
    end
end

return entity