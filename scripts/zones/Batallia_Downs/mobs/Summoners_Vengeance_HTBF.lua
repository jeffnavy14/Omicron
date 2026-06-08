-----------------------------------
-- Area: Batallia Downs
--  Mob: Summoner's Vengeance (HTBF)
-----------------------------------

xi.mix = xi.mix or {}
xi.mix.jobSpecial = require('scripts/mixins/job_special')

local summonersvengeance = {}

local debug = true
local function debugPrint(msg)
    if debug then print("[Summoners Vengeance] " .. tostring(msg)) end
end

local mobConfig = {
    immunities = {
        xi.immunity.GRAVITY,
        xi.immunity.BIND,
        xi.immunity.SILENCE,
        xi.immunity.BLIND,
        xi.immunity.LIGHT_SLEEP,
        xi.immunity.DARK_SLEEP,
        xi.immunity.TERROR,
    },
    
    -- 3x3 Grid centered around X: 196.811, Z: -567.2650
    avatars = {
        {
            name = "Carbuncle", look = '0000170300000000000000000000000000000000',
            groupId = 32, groupZoneId = 170,
            x = 196.811, z = -567.2650, -- Center
            specialId = 912, specialHpps = { math.random(60, 85), math.random(20, 45) },
            sdt = { {xi.mod.EARTH_SDT, 100}, {xi.mod.DARK_SDT, 100}, {xi.mod.LIGHT_SDT, 100}, {xi.mod.ICE_SDT, 100}, {xi.mod.FIRE_SDT, 100}, {xi.mod.WATER_SDT, 100}, {xi.mod.THUNDER_SDT, 100}, {xi.mod.WIND_SDT, 100} }
        },
        {
            name = "Diabolos", look = '0000790400000000000000000000000000000000',
            groupId = 6, groupZoneId = 10,
            x = 200.811, z = -563.2650, -- North-East
            specialId = 1911, specialHpps = { math.random(60, 85), math.random(20, 45) },
            sdt = { {xi.mod.EARTH_SDT, 100}, {xi.mod.DARK_SDT, 100}, {xi.mod.LIGHT_SDT, 100}, {xi.mod.ICE_SDT, 100}, {xi.mod.FIRE_SDT, 100}, {xi.mod.WATER_SDT, 100}, {xi.mod.THUNDER_SDT, 100}, {xi.mod.WIND_SDT, 100} }
        },
        {
            name = "Fenrir", look = '0000180300000000000000000000000000000000',
            groupId = 31, groupZoneId = 170,
            x = 200.811, z = -571.2650, -- South-East
            specialId = 839, specialHpps = { math.random(60, 85), math.random(20, 45) },
            sdt = { {xi.mod.EARTH_SDT, 100}, {xi.mod.DARK_SDT, 100}, {xi.mod.LIGHT_SDT, 100}, {xi.mod.ICE_SDT, 100}, {xi.mod.FIRE_SDT, 100}, {xi.mod.WATER_SDT, 100}, {xi.mod.THUNDER_SDT, 100}, {xi.mod.WIND_SDT, 100} }
        },
        {
            name = "Garuda", look = '00001c0300000000000000000000000000000000',
            groupId = 7, groupZoneId = 201,
            x = 192.811, z = -563.2650, -- North-West
            specialId = 875, specialHpps = { math.random(40, 60) },
            sdt = { {xi.mod.EARTH_SDT, 60}, {xi.mod.DARK_SDT, 125}, {xi.mod.LIGHT_SDT, 50}, {xi.mod.ICE_SDT, 50}, {xi.mod.FIRE_SDT, 50}, {xi.mod.WATER_SDT, 50}, {xi.mod.THUNDER_SDT, 50}, {xi.mod.WIND_SDT, 550} }
        },
        {
            name = "Ifrit", look = '0000190300000000000000000000000000000000',
            groupId = 6, groupZoneId = 207,
            x = 192.811, z = -571.2650, -- South-West
            specialId = 848, specialHpps = { math.random(40, 60) },
            sdt = { {xi.mod.EARTH_SDT, 60}, {xi.mod.DARK_SDT, 125}, {xi.mod.LIGHT_SDT, 50}, {xi.mod.ICE_SDT, 50}, {xi.mod.FIRE_SDT, 550}, {xi.mod.WATER_SDT, 50}, {xi.mod.THUNDER_SDT, 50}, {xi.mod.WIND_SDT, 50} }
        },
        {
            name = "Leviathan", look = '00001b0300000000000000000000000000000000',
            groupId = 6, groupZoneId = 211,
            x = 196.811, z = -563.2650, -- North
            specialId = 866, specialHpps = { math.random(40, 60) },
            sdt = { {xi.mod.EARTH_SDT, 60}, {xi.mod.DARK_SDT, 125}, {xi.mod.LIGHT_SDT, 50}, {xi.mod.ICE_SDT, 50}, {xi.mod.FIRE_SDT, 50}, {xi.mod.WATER_SDT, 550}, {xi.mod.THUNDER_SDT, 50}, {xi.mod.WIND_SDT, 50} }
        },
        {
            name = "Ramuh", look = '00001e0300000000000000000000000000000000',
            groupId = 8, groupZoneId = 202,
            x = 196.811, z = -571.2650, -- South
            specialId = 893, specialHpps = { math.random(40, 60) },
            sdt = { {xi.mod.EARTH_SDT, 60}, {xi.mod.DARK_SDT, 125}, {xi.mod.LIGHT_SDT, 50}, {xi.mod.ICE_SDT, 50}, {xi.mod.FIRE_SDT, 50}, {xi.mod.WATER_SDT, 50}, {xi.mod.THUNDER_SDT, 550}, {xi.mod.WIND_SDT, 50} }
        },
        {
            name = "Shiva", look = '00001d0300000000000000000000000000000000',
            groupId = 7, groupZoneId = 203,
            x = 200.811, z = -567.2650, -- East
            specialId = 884, specialHpps = { math.random(40, 60) },
            sdt = { {xi.mod.EARTH_SDT, 60}, {xi.mod.DARK_SDT, 125}, {xi.mod.LIGHT_SDT, 50}, {xi.mod.ICE_SDT, 550}, {xi.mod.FIRE_SDT, 50}, {xi.mod.WATER_SDT, 50}, {xi.mod.THUNDER_SDT, 50}, {xi.mod.WIND_SDT, 50} }
        },
        {
            name = "Titan", look = '00001a0300000000000000000000000000000000',
            groupId = 7, groupZoneId = 209,
            x = 192.811, z = -567.2650, -- West
            specialId = 857, specialHpps = { math.random(40, 60) },
            sdt = { {xi.mod.EARTH_SDT, 550}, {xi.mod.DARK_SDT, 125}, {xi.mod.LIGHT_SDT, 50}, {xi.mod.ICE_SDT, 50}, {xi.mod.FIRE_SDT, 50}, {xi.mod.WATER_SDT, 50}, {xi.mod.THUNDER_SDT, 50}, {xi.mod.WIND_SDT, 50} }
        }
    }
}

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

local function checkAllDead(m)
    debugPrint(m:getName() .. " died.")
    local confId = m:hasStatusEffect(xi.effect.CONFRONTATION) and m:getStatusEffect(xi.effect.CONFRONTATION):getPower() or 0
    if confId > 0 and xi.confrontation.lookup[confId] then
        local allDead = true
        for _, id in ipairs(xi.confrontation.lookup[confId].mobIds) do
            local otherMob = GetMobByID(id)
            if otherMob and otherMob:isAlive() and otherMob:getID() ~= m:getID() then 
                allDead = false 
                break 
            end
        end
        
        if allDead then
            xi.confrontation.lookup[confId].mobIds = {}
            debugPrint("All avatars defeated. Triggering win condition.")
        end
    end
end

local function linkBosses(m, target)
    local confId = m:hasStatusEffect(xi.effect.CONFRONTATION) and m:getStatusEffect(xi.effect.CONFRONTATION):getPower() or 0
    if confId > 0 and xi.confrontation.lookup[confId] then
        for _, id in ipairs(xi.confrontation.lookup[confId].mobIds) do
            local otherMob = GetMobByID(id)
            if otherMob and otherMob:isAlive() and otherMob:getID() ~= m:getID() and not otherMob:isEngaged() then
                otherMob:updateEnmity(target)
            end
        end
    end
end

local function bindToConfrontation(mobRef, attempts)
    local z = mobRef:getZone()
    if not z then return end
    
    local confId = z:getLocalVar("ActiveCustomHTBF_ConfrontationID")
    if confId > 0 and xi.confrontation.lookup[confId] then
        applyConfrontation(mobRef, confId)
        local lookup = xi.confrontation.lookup[confId]
        table.insert(lookup.mobIds, mobRef:getID())
        
        local diffIndex = 3
        for _, pId in ipairs(lookup.registeredPlayerIds) do
            local p = GetPlayerByID(pId)
            if p then
                local idx = p:getCharVar("Custom_HTBF_Diff_Index")
                if idx > 0 then diffIndex = idx break end
            end
        end
        
        applyDifficultyMods(mobRef, diffIndex, confId)
        mobRef:setLocalVar("SummonersVengeance_Diff_Index", diffIndex)
        debugPrint(mobRef:getName() .. " bound to Confrontation ID: " .. confId)
    else
        if attempts > 0 then
            mobRef:timer(500, function(m2) bindToConfrontation(m2, attempts - 1) end)
        end
    end
end

summonersvengeance.spawn = function(zone)
    debugPrint("Summoners_Vengeance_HTBF.spawn called.")
    
    for _, cfg in ipairs(mobConfig.avatars) do
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = cfg.name,
            look = cfg.look,
            groupId = cfg.groupId,
            groupZoneId = cfg.groupZoneId,
            x = cfg.x, y = 16.1621, z = cfg.z, rotation = 174,
            minLevel = 119, maxLevel = 119,
            
            onMobSpawn = function(m)
                m:setDropID(0)
                m:setMobMod(xi.mobMod.NO_DROPS, 1)
                m:setMobMod(xi.mobMod.ROAM_DISTANCE, 0)
                m:setBaseSpeed(0)
                
                for _, immunity in ipairs(mobConfig.immunities) do m:addImmunity(immunity) end
                
                m:addMod(xi.mod.STR, 100) m:addMod(xi.mod.VIT, 100) m:addMod(xi.mod.INT, 100) m:addMod(xi.mod.MND, 100) m:addMod(xi.mod.CHR, 100)
                m:addMod(xi.mod.AGI, 100) m:addMod(xi.mod.DEX, 100) m:addMod(xi.mod.DEF, 100) m:addMod(xi.mod.RATT, 175) m:addMod(xi.mod.ACC, 350)
                m:addMod(xi.mod.ATT, 250) m:addMod(xi.mod.MATT, 50) m:addMod(xi.mod.MACC, 50) m:addMod(xi.mod.MEVA, 200) m:addMod(xi.mod.MDEF, 200)
                m:setMod(xi.mod.EVA, 100) m:setMod(xi.mod.SILENCERES, 50) m:setMod(xi.mod.STUNRES, 10) m:setMod(xi.mod.BINDRES, 100) m:setMod(xi.mod.GRAVITYRES, 100)
                m:setMod(xi.mod.SLEEPRES, 100) m:setMod(xi.mod.POISONRES, 100) m:setMod(xi.mod.PARALYZERES, 100) m:setMod(xi.mod.LULLABYRES, 0) m:setMod(xi.mod.FASTCAST, 100)
                m:addStatusEffect(xi.effect.REGEN, { power = 25, tick = 3, duration = 0, origin = m })
                if cfg.name == "Fenrir" or cfg.name == "Diabolos" or cfg.name == "Carbuncle" then
                    m:addStatusEffect(xi.effect.REGAIN, { power = 10, tick = 3, duration = 0, origin = m })
                end
                for _, res in ipairs(cfg.sdt) do m:setMod(res[1], res[2]) end
                
                local specials = {}
                for _, hpp in ipairs(cfg.specialHpps) do table.insert(specials, { id = cfg.specialId, hpp = hpp }) end
                
                if type(xi.mix.jobSpecial) == "function" then
                    xi.mix.jobSpecial(m, { specials = specials })
                end
                
                bindToConfrontation(m, 10)
            end,
            onMobEngage = function(m, target) linkBosses(m, target) end,
            onMobFight = function(m, target) if m:getLocalVar("speed_restored") == 0 then m:setLocalVar("speed_restored", 1) m:setBaseSpeed(40) end end,
            onMobDeath = function(m, player, optParams) checkAllDead(m) end,
            releaseIdOnDisappear = true,
        })
        if mob then mob:setSpawn(cfg.x, 16.1621, cfg.z, 174); mob:spawn() end
    end
end

return summonersvengeance