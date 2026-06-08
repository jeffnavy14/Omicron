-----------------------------------
-- Area: Sacrarium
--  Mob: Slimey (Zerde)
-----------------------------------

local slimey = {}

local debug = true
local function debugPrint(msg)
    if debug then
        print("[Slimey] " .. tostring(msg))
    end
end

local mobConfig = {
    -- Change these coordinates to adjust Slimey's initial spawn location
    spawn = { x = 245.000, y = -2.000, z = -0.819, rot = 127 },
    
    -- Configure immunities (uncomment to apply)
    immunities = {
        -- xi.immunity.SLEEP,
        -- xi.immunity.SILENCE,
        -- xi.immunity.PARALYZE,
        -- xi.immunity.STUN,
        -- xi.immunity.TERROR,
    },

    -- Configure resistances
    resistances = {
        -- { mod = xi.mod.FIRERES, val = 100 },
        -- { mod = xi.mod.ICERES, val = 100 },
        -- { mod = xi.mod.WINDRES, val = 100 },
        -- { mod = xi.mod.EARTHRES, val = 100 },
        -- { mod = xi.mod.LTNGRES, val = 100 },
        -- { mod = xi.mod.WATERRES, val = 100 },
    },

    -- Configure spikes (set effect to xi.effect.BLAZE_SPIKES, xi.effect.ICE_SPIKES, or xi.effect.SHOCK_SPIKES. Set to nil to disable)
    spikes = {
        effect = nil,
        power = 100,
    },

    slimey = {
        name = "Slimey",
        -- Size 1.0, Model 3080 (0x0C08 -> 080C in little-endian)
        look = '00000c0800000000000000000000000000000000',
        groupId = 67,
        groupZoneId = 291,
        hppMod = 25, -- Base bonus HPP for this specific mob
    },
    dextrose = {
        name = "Brother Slimey",
        look = '0000080700000000000000000000000000000000',
        groupId = 51,
        groupZoneId = 62,
        hppMod = 50, -- Example: Brothers have 25% less HP
    },
    claret = {
        name = "Baby Slimey",
        look = '0000260100000000000000000000000000000000',
        groupId = 47,
        groupZoneId = 61,
        hppMod = -50, -- Example: Babies have 50% less HP
    }
}

local function applyCustomConfig(mob)
    if mobConfig.immunities then
        for _, immunity in ipairs(mobConfig.immunities) do
            mob:addImmunity(immunity)
        end
    end
    
    if mobConfig.resistances then
        for _, res in ipairs(mobConfig.resistances) do
            mob:setMod(res.mod, res.val)
        end
    end
    
    if mobConfig.spikes and mobConfig.spikes.effect then
        mob:addStatusEffect(mobConfig.spikes.effect, { power = mobConfig.spikes.power, duration = 0, origin = mob })
    end
end

local function applyConfrontation(mob, confId)
    if confId and confId > 0 then
        mob:addStatusEffect(xi.effect.CONFRONTATION, { power = confId, origin = mob })
        mob:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
    end
end

local auraSets = {
    {
        { effect = xi.effect.BURN, power = 10 },
        { effect = xi.effect.ATTACK_DOWN, power = 50 }
    },
    {
        { effect = xi.effect.CHOKE, power = 10 },
        { effect = xi.effect.EVASION_DOWN, power = 50 }
    },
    {
        { effect = xi.effect.RASP, power = 10 },
        { effect = xi.effect.DEFENSE_DOWN, power = 50 }
    },
    {
        { effect = xi.effect.SHOCK, power = 10 },
        { effect = xi.effect.ACCURACY_DOWN, power = 50 }
    }
}

local allAuras = {
    xi.effect.BURN, xi.effect.ATTACK_DOWN,
    xi.effect.CHOKE, xi.effect.EVASION_DOWN,
    xi.effect.RASP, xi.effect.DEFENSE_DOWN,
    xi.effect.SHOCK, xi.effect.ACCURACY_DOWN
}

local function applyAurasToAll(target)
    local currentTime = os.time()
    local nextAuraTime = target:getLocalVar('NextAuraTime')
    if currentTime < nextAuraTime then return end
    
    local confId = target:hasStatusEffect(xi.effect.CONFRONTATION) and target:getStatusEffect(xi.effect.CONFRONTATION):getPower() or 0
    
    if confId > 0 and xi.confrontation and xi.confrontation.lookup[confId] then
        local lookup = xi.confrontation.lookup[confId]
        local config = xi.custom_htbf and xi.custom_htbf.configs[lookup.configIndex]
        
        local diffIndex = target:getLocalVar("Slimey_Diff_Index")
        if diffIndex == 0 then diffIndex = 3 end
        
        local mult = 1.0
        if config and config.difficulties and config.difficulties[diffIndex] then
            mult = config.difficulties[diffIndex].statModMultiplier or 1.0
        end
        
        local auraSet = auraSets[math.random(1, #auraSets)]
        
        for _, id in ipairs(lookup.mobIds) do
            local m = GetMobByID(id)
            if m and m:isAlive() then
                for _, effectId in ipairs(allAuras) do
                    m:delStatusEffect(effectId)
                end
                for _, aura in ipairs(auraSet) do
                    local scaledPower = math.floor(aura.power * mult)
                    m:addStatusEffect(aura.effect, { power = scaledPower, subType = aura.effect, subPower = 5, tick = 3, duration = 30, tier = xi.auraTarget.ENEMIES, flag = xi.effectFlag.AURA, origin = m })
                end
                m:setLocalVar('NextAuraTime', currentTime + 60)
            end
        end
    end
end

local function setupSlimeyMechanics(mob)
    mob:addListener('WEAPONSKILL_TAKE', 'SLIMEY_AURA_ON_WS', function(target, user, wsid)
        applyAurasToAll(target)
    end)
end

local function applyDifficultyMods(mob, diffIndex, confId)
    if not confId or confId == 0 then return end
    local lookup = xi.confrontation.lookup[confId]
    if not lookup then return end

    local prefix = "Custom_HTBF"
    local config = xi.custom_htbf and xi.custom_htbf.configs[lookup.configIndex]
    
    if not config then return end

    local appliedVar = prefix .. "_Mods_Applied"
    if mob:getLocalVar(appliedVar) == 1 then return end
    mob:setLocalVar(appliedVar, 1)

    local diff = config.difficulties[diffIndex]
    if not diff then return end

    if diff.mobLevel then mob:setMobLevel(diff.mobLevel) end
    if diff.hppMod then
        mob:addMod(xi.mod.HPP, diff.hppMod)
        mob:updateHealth()
        mob:setHP(mob:getMaxHP())
    end

    local multiplier = diff.statModMultiplier or 1.0
    local combinedMobMods = {}
    if config.mobMods then for _, v in ipairs(config.mobMods) do table.insert(combinedMobMods, v) end end
    if diff.mobMods then for _, v in ipairs(diff.mobMods) do table.insert(combinedMobMods, v) end end

    if #combinedMobMods > 0 then
        for _, modData in ipairs(combinedMobMods) do
            local modID = modData.mod
            local targetVal = math.floor(modData.val * multiplier)

            if modData.target then
                local current = 0
                if modID == xi.mod.STR then current = mob:getStat(xi.mod.STR)
                elseif modID == xi.mod.DEX then current = mob:getStat(xi.mod.DEX)
                elseif modID == xi.mod.VIT then current = mob:getStat(xi.mod.VIT)
                elseif modID == xi.mod.AGI then current = mob:getStat(xi.mod.AGI)
                elseif modID == xi.mod.INT then current = mob:getStat(xi.mod.INT)
                elseif modID == xi.mod.MND then current = mob:getStat(xi.mod.MND)
                elseif modID == xi.mod.CHR then current = mob:getStat(xi.mod.CHR)
                elseif modID == xi.mod.ATT then current = mob:getStat(xi.mod.ATT)
                elseif modID == xi.mod.DEF then current = mob:getStat(xi.mod.DEF)
                elseif modID == xi.mod.ACC then current = mob:getMod(xi.mod.ACC)
                elseif modID == xi.mod.EVA then current = mob:getStat(xi.mod.EVA)
                elseif modID == xi.mod.RATT then current = mob:getMod(xi.mod.RATT)
                elseif modID == xi.mod.RACC then current = mob:getMod(xi.mod.RACC)
                elseif modID == xi.mod.MATT then current = mob:getMod(xi.mod.MATT)
                elseif modID == xi.mod.MACC then current = mob:getMod(xi.mod.MACC)
                elseif modID == xi.mod.MEVA then current = mob:getMod(xi.mod.MEVA)
                elseif modID == xi.mod.MDEF then current = mob:getMod(xi.mod.MDEF)
                end
                local diffVal = targetVal - current
                mob:addMod(modID, diffVal)
            elseif modData.set then
                mob:setMod(modID, targetVal)
            else
                mob:addMod(modID, targetVal)
            end
        end
    end
end

local function spawnSlimeSplit(zone, configNode, x, y, z, rot, level, confId, diffIndex, absorbMod, nextAuraTime)
    debugPrint("spawnSlimeSplit called for " .. configNode.name .. " at x: " .. tostring(x) .. " z: " .. tostring(z))
    local mob = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = configNode.name,
        look = configNode.look,
        groupId = configNode.groupId,
        groupZoneId = configNode.groupZoneId,
        x = x,
        y = y,
        z = z,
        rotation = rot,
        minLevel = level,
        maxLevel = level,
        onMobSpawn = function(m)
            m:setDropID(0)
            m:setMobMod(xi.mobMod.NO_DROPS, 1)
            m:setMobMod(xi.mobMod.NO_MOVE, 1)
            m:setMobMod(xi.mobMod.ROAM_DISTANCE, 0)
            m:setBaseSpeed(0)
            
            if absorbMod and absorbMod > 0 then
                m:setLocalVar("SlimeyAbsorbMod", absorbMod)
                m:setMod(absorbMod, 100)
            end
            
            if nextAuraTime and nextAuraTime > os.time() then
                m:setLocalVar("NextAuraTime", nextAuraTime)
            end
            
            m:setLocalVar("Slimey_Diff_Index", diffIndex)
            applyConfrontation(m, confId)
            applyCustomConfig(m)

            if configNode.hppMod and configNode.hppMod ~= 0 then
                m:addMod(xi.mod.HPP, configNode.hppMod)
                m:updateHealth()
                m:setHP(m:getMaxHP())
            end

            applyDifficultyMods(m, diffIndex, confId)
            setupSlimeyMechanics(m)

            -- Add to confrontation lookup so the heartbeat knows about this mob
            if confId > 0 and xi.confrontation and xi.confrontation.lookup[confId] then
                table.insert(xi.confrontation.lookup[confId].mobIds, m:getID())
                debugPrint("Added " .. configNode.name .. " (ID: " .. m:getID() .. ") to confrontation lookup.")
            end
        end,
        onMobEngage = function(m, target)
        end,
        onMobDeath = function(m, player, optParams)
            debugPrint(configNode.name .. " died.")
            if configNode.name == mobConfig.dextrose.name then
                local pos = m:getPos()
                local absorbModPass = m:getLocalVar("SlimeyAbsorbMod")
                local nextAuraTimePass = m:getLocalVar("NextAuraTime")
                -- Each Dextrose spawns 2 Clarets on death
                debugPrint("Spawning 2 Clarets from Dextrose death.")
                spawnSlimeSplit(zone, mobConfig.claret, pos.x + 2, pos.y, pos.z + 2, pos.rot, level, confId, diffIndex, absorbModPass, nextAuraTimePass)
                spawnSlimeSplit(zone, mobConfig.claret, pos.x - 2, pos.y, pos.z - 2, pos.rot, level, confId, diffIndex, absorbModPass, nextAuraTimePass)
            elseif configNode.name == mobConfig.claret.name then
                -- Once the final splits die, clear the lookup table to declare victory
                if confId > 0 and xi.confrontation.lookup[confId] then
                    local allDead = true
                    for _, id in ipairs(xi.confrontation.lookup[confId].mobIds) do
                        local otherMob = GetMobByID(id)
                        if otherMob and otherMob:isAlive() and otherMob:getID() ~= m:getID() then allDead = false break end
                    end
                    if allDead then
                        xi.confrontation.lookup[confId].mobIds = {}
                    end
                end
            end
        end,
        onMobDespawn = function(m)
            debugPrint(configNode.name .. " despawned.")
        end,
        releaseIdOnDisappear = true,
    })

    if mob then 
        mob:setSpawn(x, y, z, rot)
        mob:spawn() 
    else
        debugPrint("WARNING: Failed to insert dynamic entity for " .. configNode.name)
    end
end

slimey.spawn = function(zone)
    debugPrint("slimey.spawn called.")
    -- Using coordinates defined in mobConfig at the top of the file
    local x, y, z, rot = mobConfig.spawn.x, mobConfig.spawn.y, mobConfig.spawn.z, mobConfig.spawn.rot

    local mob = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = mobConfig.slimey.name,
        look = mobConfig.slimey.look,
        groupId = mobConfig.slimey.groupId,
        groupZoneId = mobConfig.slimey.groupZoneId,
        x = x,
        y = y,
        z = z,
        rotation = rot,
        minLevel = 119,
        maxLevel = 119,
        
        onMobSpawn = function(m)
            m:setDropID(0)
            m:setMobMod(xi.mobMod.NO_DROPS, 1)
            m:setMobMod(xi.mobMod.NO_MOVE, 1)
            m:setMobMod(xi.mobMod.ROAM_DISTANCE, 0)
            m:setBaseSpeed(0)
            
            local absorbs = {
                xi.mod.FIRE_ABSORB, xi.mod.ICE_ABSORB, xi.mod.WIND_ABSORB, xi.mod.EARTH_ABSORB,
                xi.mod.LTNG_ABSORB, xi.mod.WATER_ABSORB, xi.mod.LIGHT_ABSORB, xi.mod.DARK_ABSORB
            }
            local absorbMod = absorbs[math.random(1, #absorbs)]
            m:setLocalVar("SlimeyAbsorbMod", absorbMod)
            m:setMod(absorbMod, 100)
            applyCustomConfig(m)

            if mobConfig.slimey.hppMod and mobConfig.slimey.hppMod ~= 0 then
                m:addMod(xi.mod.HPP, mobConfig.slimey.hppMod)
                m:updateHealth()
                m:setHP(m:getMaxHP())
            end
            local pos = m:getPos()
            debugPrint("Slimey successfully spawned into the world at X: " .. pos.x .. " Y: " .. pos.y .. " Z: " .. pos.z)
            
            local function attemptSetup(mobRef, attempts)
                local z = mobRef:getZone()
                if not z then return end
                
                local confId = z:getLocalVar("ActiveCustomHTBF_ConfrontationID")
                
                if confId > 0 and xi.confrontation.lookup[confId] then
                    mobRef:addStatusEffect(xi.effect.CONFRONTATION, { power = confId, origin = mobRef })
                    mobRef:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
                    
                    local lookup = xi.confrontation.lookup[confId]
                    table.insert(lookup.mobIds, mobRef:getID())
                    
                    local diffIndex = 3
                    local varName = "Custom_HTBF_Diff_Index"
                    
                    for _, pId in ipairs(lookup.registeredPlayerIds) do
                        local p = GetPlayerByID(pId)
                        if p then
                            local idx = p:getCharVar(varName)
                            if idx > 0 then diffIndex = idx break end
                        end
                    end
                    
                    applyDifficultyMods(mobRef, diffIndex, confId)
                    mobRef:setLocalVar("Slimey_Diff_Index", diffIndex)
                    debugPrint("Base Slimey bound to Confrontation ID: " .. confId .. " at Difficulty Index: " .. diffIndex)
                else
                    if attempts > 0 then
                        mobRef:timer(500, function(m2) attemptSetup(m2, attempts - 1) end)
                    end
                end
            end
            
            setupSlimeyMechanics(m)
            
            attemptSetup(m, 10)
        end,

        onMobEngage = function(m, target)
            debugPrint("Slimey engaged by " .. target:getName())
        end,
        
        onMobDeath = function(m, player, optParams)
            debugPrint("Slimey died.")
            local z = m:getZone()
            local confId = m:hasStatusEffect(xi.effect.CONFRONTATION) and m:getStatusEffect(xi.effect.CONFRONTATION):getPower() or 0
            local diffIndex = m:getLocalVar("Slimey_Diff_Index") > 0 and m:getLocalVar("Slimey_Diff_Index") or 3
            local pos = m:getPos()
            local level = m:getMainLvl()
            local absorbModPass = m:getLocalVar("SlimeyAbsorbMod")
            local nextAuraTimePass = m:getLocalVar("NextAuraTime")

            debugPrint("Spawning 2 Dextrose splits from Slimey death.")
            spawnSlimeSplit(z, mobConfig.dextrose, pos.x + 2, pos.y, pos.z + 2, pos.rot, level, confId, diffIndex, absorbModPass, nextAuraTimePass)
            spawnSlimeSplit(z, mobConfig.dextrose, pos.x - 2, pos.y, pos.z - 2, pos.rot, level, confId, diffIndex, absorbModPass, nextAuraTimePass)
        end,
        
        onMobDespawn = function(mob)
            debugPrint("Slimey despawned.")
        end,

        releaseIdOnDisappear = true,
    })

    if mob then 
        mob:setSpawn(x, y, z, rot)
        mob:spawn() 
    else
        debugPrint("WARNING: Failed to insert dynamic entity for Slimey!")
    end
end

return slimey