-----------------------------------
-- Area: Reisenjima Sanctorium
--  Mob: Dark Ixion
-----------------------------------

local darkixion = {}

local debug = true
local function debugPrint(msg)
    if debug then
        print("[Dark Ixion] " .. tostring(msg))
    end
end

local mobConfig = {
    -- Change these coordinates to adjust Dark Ixion's initial spawn location
    spawn = { x = -0.0645, y = 4.0000, z = 12.9772, rot = 63 },
    
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

    dark_ixion = {
        name = "Dark Ixion",
        look = '0000b20800000000000000000000000000000000',
        groupId = 41,
        groupZoneId = 81,
        hppMod = 0,
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

darkixion.spawn = function(zone)
    debugPrint("darkixion.spawn called.")
    -- Using coordinates defined in mobConfig at the top of the file
    local x, y, z, rot = mobConfig.spawn.x, mobConfig.spawn.y, mobConfig.spawn.z, mobConfig.spawn.rot

    local mob = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = mobConfig.dark_ixion.name,
        look = mobConfig.dark_ixion.look,
        groupId = mobConfig.dark_ixion.groupId,
        groupZoneId = mobConfig.dark_ixion.groupZoneId,
        x = x,
        y = y,
        z = z,
        rotation = rot,
        minLevel = 119,
        maxLevel = 119,
        modelSize = 5,
        
        onMobSpawn = function(m)
            m:setDropID(0)
            m:setMobMod(xi.mobMod.NO_DROPS, 1)
            m:setMobMod(xi.mobMod.ROAM_DISTANCE, 0)
            m:setBaseSpeed(0)
           

            applyCustomConfig(m)

            if mobConfig.dark_ixion.hppMod and mobConfig.dark_ixion.hppMod ~= 0 then
                m:addMod(xi.mod.HPP, mobConfig.dark_ixion.hppMod)
                m:updateHealth()
                m:setHP(m:getMaxHP())
            end
            local pos = m:getPos()
            debugPrint("Dark Ixion successfully spawned into the world at X: " .. pos.x .. " Y: " .. pos.y .. " Z: " .. pos.z)
            
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
                    mobRef:setLocalVar("Dark_Ixion_Diff_Index", diffIndex)
                    debugPrint("Base Dark Ixion bound to Confrontation ID: " .. confId .. " at Difficulty Index: " .. diffIndex)
                else
                    if attempts > 0 then
                        mobRef:timer(500, function(m2) attemptSetup(m2, attempts - 1) end)
                    end
                end
            end
            
            attemptSetup(m, 10)
        end,

        onMobEngage = function(m, target)
            debugPrint("Dark Ixion engaged by " .. target:getName())
        end,
        
        onMobFight = function(m, target)
            if m:getLocalVar("speed_restored") == 0 then
                m:setLocalVar("speed_restored", 1)
                m:setBaseSpeed(40) -- Restore standard movement speed
            end
        end,
        
        onMobDeath = function(m, player, optParams)
            debugPrint("Dark Ixion died.")
            local z = m:getZone()
            local confId = m:hasStatusEffect(xi.effect.CONFRONTATION) and m:getStatusEffect(xi.effect.CONFRONTATION):getPower() or 0

            if confId > 0 and xi.confrontation.lookup[confId] then
                xi.confrontation.lookup[confId].mobIds = {}
            end
        end,
        
        onMobDespawn = function(mob)
            debugPrint("Dark Ixion despawned.")
        end,

        releaseIdOnDisappear = true,
    })

    if mob then 
        mob:setSpawn(x, y, z, rot)
        mob:spawn() 
    else
        debugPrint("WARNING: Failed to insert dynamic entity for Dark Ixion!")
    end
end

return darkixion