-----------------------------------
-- Area: Empyreal_Paradox
-- Name: Dawn II (High-Tier Mission Battlefield)
-----------------------------------
local empyrealParadoxID = zones[xi.zone.EMPYREAL_PARADOX]
-----------------------------------

local content = Battlefield:new({
    zoneId          = xi.zone.EMPYREAL_PARADOX,
    battlefieldId   = xi.battlefield.id.DAWN_II,
    canLoseExp       = false,
    allowTrusts      = true,
    maxPlayers      = 6,
    levelCap        = 99,
    timeLimit       = utils.minutes(30),
    index           = 3,
    area            = 1,
    entryNpc      = 'TR_Entrance',
    exitNpc         = 'Transcendental_Radiance',
    requiredKeyItems = { xi.ki.DAWN_PHANTOM_GEM, keep = false },
})

content.groups =
{
    -- Phase 1
    {
        mobIds =
        {
            empyrealParadoxID.mob.PROMATHIA_HTBF,
        },

        allDeath = function(battlefield, mob)
            -- Spawn Phase 2 using the group index (2) defined below
            local players = battlefield:getPlayers()
            
            if #players > 0 then
                players[1]:timer(17000, function(p)
                    local phase2Id = empyrealParadoxID.mob.PROMATHIA_HTBF_2
                    if phase2Id and p:getBattlefield() then
                        SpawnMob(phase2Id)
                    end
                end)
            end
        end,
    },

    -- Phase 2
    {
        mobIds =
        {
            empyrealParadoxID.mob.PROMATHIA_HTBF_2,
        },

        spawned  = false,
        allDeath = function(battlefield, mob)
            local players = battlefield:getPlayers()
            battlefield:setStatus(xi.battlefield.status.WON)

            local rewardItems = { xi.item.BOULDER_CASE, xi.item.PLUTON_CASE, xi.item.BEITETSU_PARCEL }
            for _, player in ipairs(players) do
                local randomItem = rewardItems[math.random(#rewardItems)]
                npcUtil.giveItem(player, randomItem)
            end

            if #players > 0 then
                players[1]:timer(7000, function(p) -- timer to drop loot
                    local selectedLoot = utils.selectFromLootGroups(p, content.loot)
                    for _, item in ipairs(selectedLoot) do
                        if item.itemId ~= xi.item.NONE then
                            -- Add to treasure pool of the first player (shared with party)
                            p:addTreasure(item.itemId, mob)
                        end
                    end
                end)
            end
        end,
    },
}

content.loot =
{
    {
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_9,     weight =  1000}, -- Rem Tale Ch 9 
    },

    {
        { itemId = xi.item.NONE,                            weight = 750 }, -- nothing
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_9,     weight = 50}, -- Rem Tale Ch 9
    },
    --Unique Materials
    {
        { itemId = xi.item.NONE,                    weight = 150 }, -- nothing
        { itemId = xi.item.EXALTED_LOG,             weight = 150 }, -- Exalted Log
        { itemId = xi.item.HEPATIZON_ORE,           weight = 150 }, -- Hepatizon Ore
        { itemId = xi.item.MALIYAKALEYA_ORB,        weight = 150 }, -- Maliyakaleya Coral
        { itemId = xi.item.CHUNK_OF_BERYLLIUM_ORE,  weight = 150 }, -- Beryllium Ore
        { itemId = xi.item.SIFS_LOCK,               weight = 150 }, -- Sif's Lock
    },
    --Weapons
    {
        { itemId = xi.item.NONE,                   weight = 50 }, -- nothing
        { itemId = xi.item.FETTERING_BLADE,        weight = 10 }, -- Fettering Blade
        { itemId = xi.item.VENERY_BOW,             weight = 10 }, -- Venery bow
    },
    --Armor
    {
        { itemId = xi.item.NONE,            weight = 50 }, -- nothing
        { itemId = xi.item.GYVE_DOUBLET,    weight = 2 }, -- Gyve Doublet
        { itemId = xi.item.GYVE_TROUSERS,   weight = 10 }, -- Gyve Trousers
        { itemId = xi.item.LAIC_MANTLE,     weight = 10 }, -- Laic Mantle
        { itemId = xi.item.LATRIA_SASH,     weight = 10 }, -- Latria Sash
    },
}
return content:register()