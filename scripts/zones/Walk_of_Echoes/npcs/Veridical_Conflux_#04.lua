-----------------------------------
-- Custom HTBF NPC Script
-- Can be used for multiple NPCs. Lockouts are managed by destination zone.
-----------------------------------
require("scripts/globals/npc_util")
require("scripts/utils/utils")

local entity = {}

local debug = true
local function debugPrint(msg)
    if debug then print("[CustomHTBF] " .. tostring(msg)) end
end

local blackStar = '\129\154'

-- Mod Name Lookup
local modNames = {}
for k, v in pairs(xi.mod) do modNames[v] = k end

-- Loot Tables
local remUpgradeItems = {
    [1] = { xi.item.BOULDER_CASE, xi.item.PLUTON_CASE, xi.item.BEITETSU_PARCEL }, -- Very Easy
    [2] = { xi.item.BOULDER_CASE, xi.item.PLUTON_CASE, xi.item.BEITETSU_PARCEL }, -- Easy
    [3] = { xi.item.BOULDER_CASE, xi.item.PLUTON_CASE, xi.item.BEITETSU_PARCEL }, -- Normal
    [4] = { xi.item.BOULDER_BOX, xi.item.PLUTON_BOX, xi.item.BEITETSU_BOX }, -- Difficult
    [5] = { xi.item.BOULDER_BOX, xi.item.PLUTON_BOX, xi.item.BEITETSU_BOX }, -- Very Difficult
}

local remsTales = {
    [1] = xi.item.COPY_OF_REMS_TALE_CHAPTER_1,
    [2] = xi.item.COPY_OF_REMS_TALE_CHAPTER_2,
    [3] = xi.item.COPY_OF_REMS_TALE_CHAPTER_3,
    [4] = xi.item.COPY_OF_REMS_TALE_CHAPTER_4,
    [5] = xi.item.COPY_OF_REMS_TALE_CHAPTER_5,
    [6] = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,
    [7] = xi.item.COPY_OF_REMS_TALE_CHAPTER_7,
    [8] = xi.item.COPY_OF_REMS_TALE_CHAPTER_8,
    [9] = xi.item.COPY_OF_REMS_TALE_CHAPTER_9,
    [10] = xi.item.COPY_OF_REMS_TALE_CHAPTER_10,
}

-- Global Storage for Configurations and State
xi.custom_htbf = xi.custom_htbf or {}
xi.confrontation = xi.confrontation or {}
xi.confrontation.lookup = xi.confrontation.lookup or {}
xi.custom_htbf.hiddenMobs = xi.custom_htbf.hiddenMobs or {}

-- Define your Battlefields here.
xi.custom_htbf.configs = xi.custom_htbf.configs or {}
xi.custom_htbf.configs[6] = {
            enabled = false,
            name = blackStar .. "1982 Tron",
            meritCost = 1,
            mobName = { "SARK", "Guard" },
            spawnDynamic = function(zone, confID, diffIndex)
                package.loaded["scripts/zones/Temenos/mobs/Jailer_of_Fortitude_HTBF"] = nil
                local fortScript = require("scripts/zones/Temenos/mobs/Jailer_of_Fortitude_HTBF")
                if fortScript and fortScript.spawn then
                    fortScript.spawn(zone, confID, diffIndex)
                end
            end,
            teleport = { x = 338.5581, y = -166.0000, z = -421.6475, rot = 224, zoneId = xi.zone.TEMENOS },
            clearRadius = 150,
            timeLimit = 30,
            remChapters = {
                [1] = false, [2] = false, [3] = false, [4] = false, [5] = false,
                [6] = false,  [7] = false,  [8] = false,  [9] = false,  [10] = false,
            },
            mobMods = {
                { mod = xi.mod.STR, val = 200, target = true },
                { mod = xi.mod.VIT, val = 200, target = true },
                { mod = xi.mod.INT, val = 274, target = true },
                { mod = xi.mod.MND, val = 200, target = true },
                { mod = xi.mod.CHR, val = 200, target = true },
                { mod = xi.mod.AGI, val = 200, target = true },
                { mod = xi.mod.DEX, val = 200, target = true },
                { mod = xi.mod.DEF, val = 200, target = true },
                { mod = xi.mod.RATT, val = 250, target = true },
                { mod = xi.mod.ACC, val = 375, target = true },
                { mod = xi.mod.ATT, val = 275, target = true },
                { mod = xi.mod.MATT, val = 250, target = true },
                { mod = xi.mod.MACC, val = 250, target = true },
                { mod = xi.mod.MEVA, val = 700, target = true },
                { mod = xi.mod.MDEF, val = 700, target = true },
                { mod = xi.mod.EVA, val = 1400, target = true },
            },
            difficulties = {
                { name = "Very Easy (Lvl: 113)",      mobLevel = 119, hppMod = 0, dropRateBonus = 0, statModMultiplier = 0.5, personalLoot = { remCount = 1, remItemCount = 0 }, lootIndex = 1 },
                { name = "Easy (Lvl: 116)",           mobLevel = 124, hppMod = 66.7, dropRateBonus = 10, statModMultiplier = 0.6, personalLoot = { remCount = 1, remItemCount = 1 }, lootIndex = 2 },
                { name = "Normal (Lvl: 119)",         mobLevel = 129, hppMod = 150, dropRateBonus = 20, statModMultiplier = 0.7, personalLoot = { remCount = 2, remItemCount = 1 }, lootIndex = 3 },
                { name = "Difficult (Lvl: 119+)",     mobLevel = 134, hppMod = 200, dropRateBonus = 40, statModMultiplier = 0.85, personalLoot = { remCount = 3, remItemCount = 2 }, lootIndex = 4 },
                { name = "Very Difficult (Lvl: ???)", mobLevel = 140, hppMod = 366.7, dropRateBonus = 90, statModMultiplier = 1.0, personalLoot = { remCount = 4, remItemCount = 2 }, lootIndex = 5 },
            },
            lootDelay = 10,
            loot = {
                -- Treasure pool loot goes here
                -- Crystals Pool: 1% VE to 10% VD
                {
                    groupChance = { 1, 2, 3, 5, 10 },
                    items = {
                        --{ itemId = xi.item.THOUGHT_CRYSTAL, type = "item" },
                        --{ itemId = xi.item.HOPE_CRYSTAL, type = "item" },
                        --{ itemId = xi.item.FULFILLMENT_CRYSTAL, type = "item" },
                    }
                },
                -- Materials Pool: 5% VE to 15% VD
                {
                    groupChance = { 5, 7, 10, 12, 15 },
                    items = {
                        --{ itemId = xi.item.INGOT_OF_BEFOULED_SILVER, type = "item" },
                        --{ itemId = xi.item.PIECE_OF_STAGHORN_CORAL, type = "item" },
                        --{ itemId = xi.item.SEALORD_SKIN, type = "item" },
                        --{ itemId = xi.item.SQUARE_OF_SEALORD_LEATHER, type = "item" },
                        --{ itemId = xi.item.MUCULENT_INGOT, type = "item" },
                        --{ itemId = xi.item.SQUARE_OF_PENELOPES_CLOTH, type = "item" },
                    }
                }
            }
        }

xi.custom_htbf.configs[7] = {
            enabled = true,
            name = blackStar .. "Apocalypse Nigh",
            meritCost = 15,
            mobName = { "Kamlanaut", "Eald'narche" },
            spawnDynamic = function(zone, confID, diffIndex)
                package.loaded["scripts/zones/Temenos/mobs/Apocalypse_Nigh_HTBF"] = nil
                local anScript = require("scripts/zones/Temenos/mobs/Apocalypse_Nigh_HTBF")
                if anScript and anScript.spawn then
                    anScript.spawn(zone, confID, diffIndex)
                end
            end,
            teleport = { x = 338.5581, y = -166.0000, z = -421.6475, rot = 224, zoneId = xi.zone.TEMENOS },
            clearRadius = 150,
            timeLimit = 30,
            remChapters = {
                [1] = true, [2] = true, [3] = true, [4] = true, [5] = true,
                [6] = true,  [7] = true,  [8] = true,  [9] = true,  [10] = true,
            },
            mobMods = {
                { mod = xi.mod.STR, val = 600, target = true },
                { mod = xi.mod.VIT, val = 200, target = true },
                { mod = xi.mod.INT, val = 274, target = true },
                { mod = xi.mod.MND, val = 200, target = true },
                { mod = xi.mod.CHR, val = 200, target = true },
                { mod = xi.mod.AGI, val = 200, target = true },
                { mod = xi.mod.DEX, val = 200, target = true },
                { mod = xi.mod.DEF, val = 600, target = true },
                { mod = xi.mod.RATT, val = 250, target = true },
                { mod = xi.mod.ACC, val = 775, target = true },
                { mod = xi.mod.ATT, val = 575, target = true },
                { mod = xi.mod.MATT, val = 250, target = true },
                { mod = xi.mod.MACC, val = 250, target = true },
                { mod = xi.mod.MEVA, val = 700, target = true },
                { mod = xi.mod.MDEF, val = 700, target = true },
                { mod = xi.mod.EVA, val = 1400, target = true },
            },
            difficulties = {
                --{ name = "Very Easy (Lvl: 113)",      mobLevel = 119, hppMod = 1058, dropRateBonus = 0, statModMultiplier = 0.5, personalLoot = { remCount = 1, remItemCount = 0 }, lootIndex = 1 },
                --{ name = "Easy (Lvl: 116)",           mobLevel = 124, hppMod = 2000, dropRateBonus = 10, statModMultiplier = 0.6, personalLoot = { remCount = 1, remItemCount = 1 }, lootIndex = 2 },
                { name = "Normal (Lvl: 119)",         mobLevel = 129, hppMod = 4833, dropRateBonus = 20, statModMultiplier = 0.7, personalLoot = { remCount = 2, remItemCount = 1 }, lootIndex = 3 },
                { name = "Difficult (Lvl: 119+)",     mobLevel = 134, hppMod = 6956, dropRateBonus = 40, statModMultiplier = 0.85, personalLoot = { remCount = 3, remItemCount = 1 }, lootIndex = 4 },
                { name = "Very Difficult (Lvl: ???)", mobLevel = 140, hppMod = 9553, dropRateBonus = 90, statModMultiplier = 1.0, personalLoot = { remCount = 4, remItemCount = 1 }, lootIndex = 5 },
            },
            lootDelay = 10,
            loot = {
                -- Treasure pool loot goes here
                -- Crystals Pool: 1% VE to 10% VD
                {
                    groupChance = { 1, 2, 3, 5, 10 },
                    items = {
                        { itemId = xi.item.ETHEREAL_SQUAMA, type = "item" },
                        { itemId = xi.item.VIAL_OF_BELLADONNA_SAP, type = "item" },
                    }
                },
                -- Materials Pool: 5% VE to 15% VD
                {
                    groupChance = { 0, 1, 2, 3, 5 },
                    items = {
                        { itemId = xi.item.TARTARIAN_CHAIN, type = "item" },
                        { itemId = xi.item.CHUNK_OF_PLOVID_FLESH, type = "item" },
                        { itemId = xi.item.DEFIANT_SCARF, type = "item" },
                        { itemId = xi.item.MACUIL_HORN, type = "item" },
                        { itemId = xi.item.VIAL_OF_DEFIANT_SWEAT, type = "item" },
                        { itemId = xi.item.VIAL_OF_PLOVID_EFFLUVIUM, type = "item" },
                        { itemId = xi.item.HADES_CLAW, type = "item" },
                        { itemId = xi.item.CEHUETZI_PELT, type = "item" },
                        { itemId = xi.item.MACUIL_PLATING, type = "item" },
                        { itemId = xi.item.CEHUETZI_CLAW, type = "item" },
                        { itemId = xi.item.BZTAVIAN_WING, type = "item" },
                    }
                }
            }
        }

local function respawnHiddenMobs(zoneId)
    if xi.custom_htbf.hiddenMobs and xi.custom_htbf.hiddenMobs[zoneId] then
        for _, mobId in ipairs(xi.custom_htbf.hiddenMobs[zoneId]) do
            local mob = GetMobByID(mobId)
            if mob and not mob:isSpawned() then
                SpawnMob(mobId)
            end
        end
        xi.custom_htbf.hiddenMobs[zoneId] = nil
    end
end

local function despawnAllBattleMobs(mobs)
    for _, mob in ipairs(mobs) do
        if mob and mob:isSpawned() then DespawnMob(mob:getID()) end
    end
end

local function isZoneOccupied(zoneId, config)
    local destZone = GetZone(zoneId)
    if not destZone then return false end

    local activeConfKey = nil
    for key, lookup in pairs(xi.confrontation.lookup or {}) do
        if lookup.zoneId == zoneId then
            activeConfKey = key
            break
        end
    end

    if activeConfKey then
        local lookup = xi.confrontation.lookup[activeConfKey]
        
        if lookup.isLooting and os.time() > (lookup.winTime or 0) + 240 then
            xi.confrontation.lookup[activeConfKey] = nil
            respawnHiddenMobs(zoneId)
            return false
        end

        local stillActive = false
        for _, pid in ipairs(lookup.registeredPlayerIds) do
            local p = GetPlayerByID(pid)
            if p and p:getZoneID() == zoneId then
                stillActive = true
                break
            end
        end

        if not stillActive then
            local mobs = {}
            for _, id in ipairs(lookup.mobIds or {}) do
                local m = GetMobByID(id)
                if m then table.insert(mobs, m) end
            end
            despawnAllBattleMobs(mobs)
            if lookup.cleanUp then lookup.cleanUp(true) end
            xi.confrontation.lookup[activeConfKey] = nil
            return false
        end
        
        return true
    end

    local mobNamesSet = {}
    if type(config.mobName) == "string" then mobNamesSet[config.mobName] = true
    elseif type(config.mobName) == "table" then
        for _, name in ipairs(config.mobName) do mobNamesSet[name] = true end
    end

    local strayMobs = false
    for _, mEntity in pairs(destZone:getMobs()) do
        if mEntity:isSpawned() and mobNamesSet[mEntity:getName()] then
            DespawnMob(mEntity:getID())
            strayMobs = true
        end
    end
    if strayMobs then respawnHiddenMobs(zoneId) end

    return false
end

local function applyMobMods(mob, lookup)
    if mob:getLocalVar("Custom_HTBF_Mods_Applied") == 1 then return end
    mob:setLocalVar("Custom_HTBF_Mods_Applied", 1)

    if lookup.mobLevel then mob:setMobLevel(lookup.mobLevel) end
    if lookup.hppMod then
        mob:addMod(xi.mod.HPP, lookup.hppMod)
        mob:updateHealth()
        mob:setHP(mob:getMaxHP())
    end

    local multiplier = lookup.statModMultiplier or 1.0
    if lookup.mobMods then
        for _, modData in ipairs(lookup.mobMods) do
            local val = modData.val
            local modID = modData.mod
            local targetVal = math.floor(val * multiplier)

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
                local diff = targetVal - current
                mob:addMod(modID, diff)
            elseif modData.set then
                mob:setMod(modID, targetVal)
            else
                mob:addMod(modID, targetVal)
            end
        end
    end
end

local function onConfrontationLose(player, lookupKey)
    player:printToPlayer("Battlefield failed. Warping out.", xi.msg.channel.SYSTEM_3)
    if not player:isAlive() then player:setHP(1) end
    player:timer(100, function(p)
        p:setPos(-420, 14, -49, 192, xi.zone.WALK_OF_ECHOES) -- Adjust fallback zone
    end)
end

local function onConfrontationWin(player, lookupKey)
    local lookup = xi.confrontation.lookup[lookupKey]
    if not lookup then return end
    
    local config = xi.custom_htbf.configs[lookup.configIndex]
    if not config then return end

    local diffIndex = player:getCharVar("Custom_HTBF_Diff_Index")
    diffIndex = diffIndex > 0 and diffIndex or 3
    local difficulty = config.difficulties[diffIndex]

    if player:getLocalVar("Custom_HTBF_Win_Processed") == 1 then return end
    player:setLocalVar("Custom_HTBF_Win_Processed", 1)
    player:setCharVar("Custom_HTBF_Wins_" .. lookup.configIndex, player:getCharVar("Custom_HTBF_Wins_" .. lookup.configIndex) + 1)

    player:printToPlayer("You have 3 minutes before you are removed from the Battlefield.", xi.msg.channel.SYSTEM_3)
    player:countdown(180)

    local personalLootConfig = difficulty and difficulty.personalLoot
    local remChapters = config and config.remChapters
    local lootTable = config and config.loot

    local mob = nil
    if lookup.mobIds and #lookup.mobIds > 0 then
        for _, id in ipairs(lookup.mobIds) do
            local m = GetMobByID(id)
            if m then
                mob = m
                break
            end
        end
    end

    local thLevel = lookup.thLevel or 0

    local function everyoneHasItem(itemId)
        local party = player:getParty() or { player }
        for _, member in ipairs(party) do
            local hasIt = false
            for loc = 0, 17 do
                if member:hasItem(itemId, loc) then
                    hasIt = true
                    break
                end
            end
            if not hasIt then return false end
        end
        return true
    end

    -- Distribute Loot (Treasure Pool)
    if lootTable and not lookup.treasureGenerated then
        lookup.treasureGenerated = true
        debugPrint("Loot table found. Processing drops with TH Level: " .. tostring(thLevel))
        for _, group in ipairs(lootTable) do
            local baseRate = 0
            if type(group.groupChance) == "table" then
                local idx = difficulty.lootIndex or diffIndex
                baseRate = (group.groupChance[idx] or 0) * 10
            else
                baseRate = ((group.groupChance or 0) + (difficulty.dropRateBonus or 0)) * 10
            end
            
            local clampedBase = xi.combat.treasureHunter.getDropRate(0, baseRate)
            local clampedTH = xi.combat.treasureHunter.getDropRate(thLevel, baseRate)
            local thBonus = math.max(0, clampedTH - clampedBase)
            local rate = math.min(1000, baseRate + thBonus)
            local roll = math.random(1, 1000)
            
            debugPrint(string.format("Group Loot Check - TH Level: %d, Base Rate: %d, Modified Rate: %d | Roll: %d", thLevel, baseRate, rate, roll))

            if roll <= rate then
                if group.items and #group.items > 0 then
                    local eligibleItems = {}
                    for _, item in ipairs(group.items) do
                        if not (item.type == "equipment" and everyoneHasItem(item.itemId)) then
                            table.insert(eligibleItems, item)
                        end
                    end

                    if #eligibleItems > 0 then
                        local item = eligibleItems[math.random(1, #eligibleItems)]
                        debugPrint("Adding treasure: " .. tostring(item.itemId))
                        if mob then
                            player:addTreasure(item.itemId, mob)
                        else
                            npcUtil.giveItem(player, { { item.itemId, 1 } })
                        end
                    else
                        debugPrint("Skipping treasure group (Everyone has all equipment)")
                    end
                end
            end
        end
    end

    -- Give Rems
    if personalLootConfig and personalLootConfig.remCount > 0 and remChapters then
        local validChapters = {}
        for ch, enabled in pairs(remChapters) do
            if enabled and remsTales[ch] then table.insert(validChapters, remsTales[ch]) end
        end
        if #validChapters > 0 then
            local drops = {}
            for i = 1, personalLootConfig.remCount do
                local itemId = validChapters[math.random(#validChapters)]
                drops[itemId] = (drops[itemId] or 0) + 1
            end
            local itemsToGive = {}
            for itemId, count in pairs(drops) do table.insert(itemsToGive, { itemId, count }) end
            npcUtil.giveItem(player, itemsToGive)
        end
    end
    -- Give R/E/M items
    local diffRemItems = remUpgradeItems[diffIndex] or {}
    if personalLootConfig and personalLootConfig.remItemCount > 0 and #diffRemItems > 0 then
        for i = 1, personalLootConfig.remItemCount do
            local randomItem = diffRemItems[math.random(#diffRemItems)]
            if randomItem and not npcUtil.giveItem(player, { { randomItem, 1 } }) then break end
        end
    end

    player:timer(180000, function(p_timed)
        local zId = config.teleport.zoneId
        if p_timed:getZoneID() == zId then
            p_timed:printToPlayer("Battlefield closed. Warping out.", xi.msg.channel.SYSTEM_3)
            p_timed:setPos(-420, 14, -49, 192, xi.zone.WALK_OF_ECHOES) -- Adjust fallback zone
        end
        p_timed:setLocalVar("Custom_HTBF_Win_Processed", 0)
        
        -- Clear the lock if the zone is finally empty of active looters
        local destZone = GetZone(zId)
        if destZone then
            local stillActive = false
            if xi.confrontation.lookup[lookupKey] then
                for _, pid in ipairs(xi.confrontation.lookup[lookupKey].registeredPlayerIds) do
                    local p = GetPlayerByID(pid)
                    if p and p:getZoneID() == zId then
                        stillActive = true
                        break
                    end
                end
            end
            if not stillActive then
                respawnHiddenMobs(zId)
                xi.confrontation.lookup[lookupKey] = nil
            end
        end
    end)
end

local function checkConfrontation(lookupKey)
    local lookup = xi.confrontation.lookup[lookupKey]
    if not lookup then return end
    local config = xi.custom_htbf.configs[lookup.configIndex]

    local players, mobs = {}, {}
    for _, id in ipairs(lookup.registeredPlayerIds) do
        local p = GetPlayerByID(id)
        if p then table.insert(players, p) end
    end
    for _, id in ipairs(lookup.mobIds) do
        local m = GetMobByID(id)
        if m then table.insert(mobs, m) end
    end

    local validPlayerCount, validMobCount = 0, 0

    for _, p in ipairs(players) do
        if p:getZoneID() == lookup.zoneId then
            if p:isAlive() then
                validPlayerCount = validPlayerCount + 1

                if not lookup.playerLoaded then lookup.playerLoaded = {} end
                if not lookup.playerLoaded[p:getID()] then
                    lookup.playerLoaded[p:getID()] = os.time() + 12
                elseif os.time() >= lookup.playerLoaded[p:getID()] then
                    if not p:hasStatusEffect(xi.effect.CONFRONTATION) then
                        p:addStatusEffect(xi.effect.CONFRONTATION, { power = lookupKey, origin = p })
                        p:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
                        p:printToPlayer("Begin Battle", xi.msg.channel.SYSTEM_3)
                        local remaining = lookup.timeLimit - os.time()
                        if remaining > 0 then
                            p:countdown(remaining)
                        end
                    end
                end
            end
        end
    end

    if lookup.isSpawning then
        local destZone = GetZone(lookup.zoneId)
        if config and destZone then
            if not config.spawnDynamic then
                local mobNames = {}
                if type(config.mobName) == "string" then table.insert(mobNames, config.mobName)
                elseif type(config.mobName) == "table" then mobNames = config.mobName end

                local diffIndex = 3
                if players[1] then
                    diffIndex = players[1]:getCharVar("Custom_HTBF_Diff_Index")
                    diffIndex = diffIndex > 0 and diffIndex or 3
                end
                local diff = config.difficulties[diffIndex]
                local combinedMobMods = {}
                if config.mobMods then for _, v in ipairs(config.mobMods) do table.insert(combinedMobMods, v) end end
                if diff.mobMods then for _, v in ipairs(diff.mobMods) do table.insert(combinedMobMods, v) end end

                for _, mName in ipairs(mobNames) do
                    local mobList = destZone:queryEntitiesByName(mName)
                    if mobList then
                        for _, mEntity in ipairs(mobList) do
                            if mEntity:isSpawned() then
                                local dist = math.sqrt(math.pow(mEntity:getXPos() - config.teleport.x, 2) + math.pow(mEntity:getZPos() - config.teleport.z, 2))
                                if dist <= (config.clearRadius or 60) then
                                    local found = false
                                    for _, existingId in ipairs(lookup.mobIds) do
                                        if existingId == mEntity:getID() then found = true break end
                                    end
                                    if not found then
                                        table.insert(lookup.mobIds, mEntity:getID())
                                        table.insert(mobs, mEntity)
                                        applyMobMods(mEntity, { mobLevel = diff.mobLevel, hppMod = diff.hppMod, statModMultiplier = diff.statModMultiplier, mobMods = combinedMobMods })
                                        mEntity:addStatusEffect(xi.effect.CONFRONTATION, { power = lookupKey, origin = mEntity })
                                        mEntity:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            
            if #lookup.mobIds > 0 then
                lookup.isSpawning = false
            end
        end
    end

    for _, m in ipairs(mobs) do
        if m:isAlive() then 
            validMobCount = validMobCount + 1 
            if m.getTHlevel then
                lookup.thLevel = math.max(lookup.thLevel or 0, m:getTHlevel())
            end
        end
    end

    local didWin, didLose = false, false

    if validPlayerCount == 0 then
        if not lookup.wipeTimer then
            lookup.wipeTimer = os.time() + 30
        elseif os.time() >= lookup.wipeTimer then
            didLose = true
        end
    else
        lookup.wipeTimer = nil
    end

    if lookup.timeLimit and os.time() > lookup.timeLimit then didLose = true end
    if not didLose and validMobCount == 0 and validPlayerCount > 0 and not lookup.isSpawning then
        if not lookup.winTimer then
            lookup.winTimer = os.time() + 3
        elseif os.time() >= lookup.winTimer then
            didWin = true
        end
    else
        lookup.winTimer = nil
    end

    if didWin or didLose then
        for _, p in ipairs(players) do
            if p:isPC() then
                p:delStatusEffect(xi.effect.CONFRONTATION)
                p:setCharVar("Custom_HTBF_ConfrontationID", 0) -- Scrub old vars
                p:countdown(0)
                if didWin and lookup.onWin then lookup.onWin(p, lookupKey)
                elseif didLose and lookup.onLose then lookup.onLose(p, lookupKey) end
            end
        end
        if didLose then despawnAllBattleMobs(mobs) end
        if lookup.cleanUp then lookup.cleanUp(didLose) end
        
        if didLose then
            xi.confrontation.lookup[lookupKey] = nil
        else
            lookup.isLooting = true
            lookup.winTime = os.time()
        end
    else
        local anchor = nil
        for _, p in ipairs(players) do
            if p:getZoneID() == lookup.zoneId then
                anchor = p
                break
            end
        end
        if not anchor and mobs[1] then anchor = mobs[1] end
        if not anchor then anchor = lookup.npc end

        if anchor then
            anchor:timer(2000, function() checkConfrontation(lookupKey) end)
        else
            if lookup.cleanUp then lookup.cleanUp(true) end
            xi.confrontation.lookup[lookupKey] = nil
        end
    end
end

local function enterBattlefield(player, configId, difficultyIndex, npc)
    local config = xi.custom_htbf.configs[configId]
    local destZoneId = config.teleport.zoneId
    local destZone = GetZone(destZoneId)
    
    if isZoneOccupied(destZoneId, config) then
        player:printToPlayer("The battlefield is currently occupied. Please wait.", xi.msg.channel.SYSTEM_3)
        return
    end

    local party = player:getParty() or { player }
    local playerList = {}
    local registeredPlayerIds = {}

    for _, member in ipairs(party) do
        if member:getZoneID() == player:getZoneID() then
            if config.meritCost and member:getMeritCount() < config.meritCost then
                player:printToPlayer(string.format("%s does not have enough merits.", member:getName()), xi.msg.channel.SYSTEM_3)
                return
            end
            table.insert(playerList, member)
            table.insert(registeredPlayerIds, member:getID())
            member:setCharVar("Custom_HTBF_Diff_Index", difficultyIndex)
        end
    end

    local confID = configId + 1000
    
    local timeLimitSeconds = (config.timeLimit or 30) * 60
    local attemptStartTime = os.time()

    -- Immediately create the lookup so dynamic mobs can register themselves
    xi.confrontation.lookup[confID] = {
        startTime = attemptStartTime,
        registeredPlayerIds = registeredPlayerIds,
        mobIds = {}, 
        timeLimit = attemptStartTime + timeLimitSeconds,
        isSpawning = true, -- Prevents instant-win triggers during spawn
        onLose = onConfrontationLose,
        onWin = onConfrontationWin,
        zoneId = destZoneId,
        configIndex = configId,
        npc = npc,
        cleanUp = function(isLoss)
            if destZone then destZone:setLocalVar("ActiveCustomHTBF_ConfrontationID", 0) end
            if isLoss then 
                respawnHiddenMobs(destZoneId) 
            end
        end
    }
    checkConfrontation(confID)

    npc:timer(timeLimitSeconds * 1000 + 10000, function()
        local lookup = xi.confrontation.lookup[confID]
        if lookup and lookup.startTime == attemptStartTime then
            
            for _, pid in ipairs(lookup.registeredPlayerIds) do
                local p = GetPlayerByID(pid)
                if p and p:getZoneID() == destZoneId then
                    p:delStatusEffect(xi.effect.CONFRONTATION)
                    p:setCharVar("Custom_HTBF_ConfrontationID", 0)
                    p:countdown(0)
                    if not p:isAlive() then p:setHP(1) end
                    p:printToPlayer("Battlefield failed. Warping out.", xi.msg.channel.SYSTEM_3)
                    p:timer(100, function(p2)
                        p2:setPos(-420, 14, -49, 192, xi.zone.WALK_OF_ECHOES)
                    end)
                end
            end
            
            local mobsToClear = {}
            for _, id in ipairs(lookup.mobIds or {}) do
                local m = GetMobByID(id)
                if m then table.insert(mobsToClear, m) end
            end
            despawnAllBattleMobs(mobsToClear)
            
            if lookup.cleanUp then lookup.cleanUp(true) end
            xi.confrontation.lookup[confID] = nil
        end
    end)

    for _, member in ipairs(playerList) do
        if config.meritCost then member:setMerits(member:getMeritCount() - config.meritCost) end
        member:setCharVar("Custom_HTBF_ConfrontationID", 0) -- Scrub old vars
        member:setCharVar("Custom_HTBF_Pending_Entry", 0)
        member:setCharVar("Custom_HTBF_Attempts_" .. configId, member:getCharVar("Custom_HTBF_Attempts_" .. configId) + 1)
        
        member:delStatusEffect(xi.effect.CONFRONTATION)
        member:setPos(config.teleport.x, config.teleport.y, config.teleport.z, config.teleport.rot, config.teleport.zoneId)
    end

    if destZone then
        destZone:setLocalVar("ActiveCustomHTBF_ConfrontationID", confID)
        -- Clear arena of unauthorized players / bystanders
        for _, pInZone in pairs(destZone:getPlayers()) do
            local dist = math.sqrt(math.pow(pInZone:getXPos() - config.teleport.x, 2) + math.pow(pInZone:getZPos() - config.teleport.z, 2))
            if dist <= (config.clearRadius or 60) then
                local isAuthorized = false
                for _, authorizedP in ipairs(playerList) do
                    if authorizedP:getID() == pInZone:getID() then
                        isAuthorized = true
                        break
                    end
                end
                if not isAuthorized then
                    if not (pInZone:isAlive() and pInZone:hasStatusEffect(xi.effect.CONFRONTATION)) then
                        pInZone:printToPlayer("Clearing the Battlefield.", xi.msg.channel.SYSTEM_3)
                        pInZone:setPos(-420, 14, -49, 192, xi.zone.WALK_OF_ECHOES)
                    end
                end
            end
        end

        xi.custom_htbf.hiddenMobs = xi.custom_htbf.hiddenMobs or {}
        local hiddenMobs = {}
        local mobNamesSet = {}
        if type(config.mobName) == "string" then
            mobNamesSet[config.mobName] = true
        elseif type(config.mobName) == "table" then
            for _, name in ipairs(config.mobName) do mobNamesSet[name] = true end
        end

        for _, m in pairs(destZone:getMobs()) do
            if m:isSpawned() then
                if not mobNamesSet[m:getName()] then
                    local dist = math.sqrt(math.pow(m:getXPos() - config.teleport.x, 2) + math.pow(m:getZPos() - config.teleport.z, 2))
                    if dist <= (config.clearRadius or 60) then
                        table.insert(hiddenMobs, m:getID())
                        DespawnMob(m:getID())
                    end
                elseif config.spawnDynamic then
                    DespawnMob(m:getID())
                end
            end
        end
        xi.custom_htbf.hiddenMobs[destZoneId] = hiddenMobs

        if config.spawnDynamic then
            config.spawnDynamic(destZone, confID, difficultyIndex)
        end
    end
end

local function initiateBattle(player, npc, configId, difficultyIndex)
    local config = xi.custom_htbf.configs[configId]
    if player:checkSoloPartyAlliance() == 2 then
        player:printToPlayer("You cannot enter with an alliance.", xi.msg.channel.SYSTEM_3)
        return
    end

    local party = player:getParty() or { player }
    local membersInZone = {}
    
    for _, member in ipairs(party) do
        if member:getZoneID() == player:getZoneID() then
            table.insert(membersInZone, member)
            if config.meritCost and member:getMeritCount() < config.meritCost then
                player:printToPlayer(string.format("%s does not have enough merits.", member:getName()), xi.msg.channel.SYSTEM_3)
                return
            end
        end
    end

    player:timer(50, function(p)
        p:customMenu({
            title = string.format("Enter %s?", config.name),
            options = {
                { "Yes", function(p2) p2:timer(50, function(p3) enterBattlefield(p3, configId, difficultyIndex, npc) end) end },
                { "No", function(p2) end }
            }
        })
    end)
end

entity.onTrigger = function(player, npc)
    -- Auto-clear stale locks if the server rebooted or script was reloaded
    local confluxConfigs = {6, 7}
    local isOccupied = false

    for _, myConfigId in ipairs(confluxConfigs) do
        local config = xi.custom_htbf.configs[myConfigId]
        if config and config.enabled then
            if isZoneOccupied(config.teleport.zoneId, config) then
                isOccupied = true
                break
            end
        end
    end

    player:setCharVar("Custom_HTBF_Pending_Entry", 0) -- Clean up any stuck states

    local leader = player:getPartyLeader()
    if leader and leader:getID() ~= player:getID() then
        player:printToPlayer("Only the party leader can start the battlefield.", xi.msg.channel.SYSTEM_3)
        return
    end

    if isOccupied then
        player:printToPlayer("The battlefield is currently occupied. Please wait.", xi.msg.channel.SYSTEM_3)
        return
    end

    local menuOptions = {}
    for _, configId in ipairs(confluxConfigs) do
        local config = xi.custom_htbf.configs[configId]
        if config and config.enabled then
            local wins = player:getCharVar("Custom_HTBF_Wins_" .. configId)
            local attempts = player:getCharVar("Custom_HTBF_Attempts_" .. configId)
            local menuText = string.format("%s - W: %d | A: %d", config.name, wins, attempts)
            table.insert(menuOptions, { menuText, function(p)
                local diffOptions = {}
                for i, diff in ipairs(config.difficulties) do
                    table.insert(diffOptions, { diff.name, function(p2) 
                        p2:timer(50, function(p3) initiateBattle(p3, npc, configId, i) end) 
                    end })
                end
                table.insert(diffOptions, { "Back", function(p2) end })
                p:timer(50, function(p_timed) p_timed:customMenu({ title = "Select Difficulty", options = diffOptions }) end)
            end})
        end
    end

    if #menuOptions == 0 then
        player:printToPlayer("There are no battlefields currently available.", xi.msg.channel.SYSTEM_3)
        return
    end
    
    table.insert(menuOptions, { "Cancel", function(p) end })
    player:customMenu({ title = "Select a Battlefield", options = menuOptions })
end

return entity