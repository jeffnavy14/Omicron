xi = xi or {}
xi.oseem = xi.oseem or {}

-----------------------------------
-- ELIGIBLE GEAR & STONES
-----------------------------------
-- Mapped using the xi.item enumerator for server compatibility
xi.oseem.validGear = {
    [xi.item.HERCULEAN_HELM] = "Herculean",
    [xi.item.HERCULEAN_VEST] = "Herculean",
    [xi.item.MERLINIC_HOOD]  = "Merlinic",
    [xi.item.VALOROUS_MASK]  = "Valorous",
    [xi.item.ODYSSEAN_HELM]  = "Odyssean",
    [xi.item.CHIRONIC_HAT]   = "Chironic",
    -- Add the rest of your armor/weapons here using xi.item.ITEM_NAME
}

-- Because these stones are missing from your item.lua enum, 
-- we MUST use their hardcoded numeric IDs to prevent a 'nil index' crash.
xi.oseem.stones = {
    [9210] = "Pellucid",
    [9211] = "Fern",
    [9212] = "Taupe",
 -- [5903] = "DarkMatter",
}

-----------------------------------
-- STAT POOLS (Replace augIds with your server's IDs)
-----------------------------------
xi.oseem.pools = {
    -- SLOT 1: Combat Stats (Pellucid Focus)
    Combat = {
        { augId = 10, name = "Accuracy", min = 1, max = 30 },
        { augId = 11, name = "Attack", min = 1, max = 30 },
        { augId = 12, name = "Magic Accuracy", min = 1, max = 30 },
        { augId = 13, name = "Magic Atk. Bonus", min = 1, max = 30 },
    },
    
    -- SLOT 2: Special Stats (Fern Focus)
    Special = {
        { augId = 88, name = "Double Attack %", min = 1, max = 4, fernCap = 5 },
        { augId = 111, name = "Weapon Skill Damage %", min = 1, max = 4, fernCap = 5 },
        { augId = 91, name = "Store TP", min = 1, max = 7, fernCap = 8 },
        { augId = 68, name = "Phys. Damage Taken %", min = -1, max = -4, fernCap = -5 },
        { augId = 64, name = "Fast Cast", min = 1, max = 5, fernCap = 6 },
    },
    
    -- SLOT 3: Base Stats (Taupe Focus)
    BaseStats = {
        { augId = 1, name = "STR", min = 1, max = 10, taupeCap = 15 },
        { augId = 2, name = "DEX", min = 1, max = 10, taupeCap = 15 },
        { augId = 3, name = "VIT", min = 1, max = 10, taupeCap = 15 },
        { augId = 4, name = "AGI", min = 1, max = 10, taupeCap = 15 },
        { augId = 5, name = "INT", min = 1, max = 10, taupeCap = 15 },
        { augId = 6, name = "MND", min = 1, max = 10, taupeCap = 15 },
        { augId = 7, name = "CHR", min = 1, max = 10, taupeCap = 15 },
    }
}

-----------------------------------
-- THE RNG ENGINE
-----------------------------------
xi.oseem.rollNewAugments = function(stoneName, gearFamily)
    local results = {}
    
    local function addStat(id, val)
        table.insert(results, { id = id, value = val })
    end

    -- SLOT 1: Combat Stats (60% chance, 100% with Pellucid)
    if stoneName == "Pellucid" or math.random(1, 100) <= 60 then
        local stat = xi.oseem.pools.Combat[math.random(#xi.oseem.pools.Combat)]
        local power = math.random(stat.min, stat.max)
        addStat(stat.augId, power)
    end

    -- SLOT 2: Special Stats (60% chance, 100% with Fern)
    if stoneName == "Fern" or math.random(1, 100) <= 60 then
        local stat = xi.oseem.pools.Special[math.random(#xi.oseem.pools.Special)]
        local maxCap = stat.max
        if stoneName == "Fern" then maxCap = stat.fernCap end
        local power = math.random(stat.min, maxCap)
        addStat(stat.augId, power)
    end

    -- SLOT 3: Base Stats (60% chance, 100% with Taupe)
    if stoneName == "Taupe" or math.random(1, 100) <= 60 then
        local stat = xi.oseem.pools.BaseStats[math.random(#xi.oseem.pools.BaseStats)]
        local maxCap = stat.max
        if stoneName == "Taupe" then maxCap = stat.taupeCap end
        local power = math.random(stat.min, maxCap)
        addStat(stat.augId, power)
    end

    -- SLOT 4: Flat Accuracy (40% chance, unforced)
    if math.random(1, 100) <= 40 then
        addStat(10, math.random(1, 15)) -- 10 is standard Acc ID
    end

    -- SLOT 5: Flat Attack (40% chance, unforced)
    if math.random(1, 100) <= 40 then
        addStat(11, math.random(1, 15)) -- 11 is standard Atk ID
    end

    -- Enforce 4-slot limit for emulator stability
    while #results > 4 do
        table.remove(results)
    end

    return results
end

-----------------------------------
-- TEXT LOOKUP HELPER
-----------------------------------
xi.oseem.getAugName = function(searchId)
    if searchId == 10 then return "Accuracy" end
    if searchId == 11 then return "Attack" end

    for _, category in pairs(xi.oseem.pools) do
        for _, stat in pairs(category) do
            if stat.augId == searchId then return stat.name end
        end
    end
    return "Unknown Stat"
end