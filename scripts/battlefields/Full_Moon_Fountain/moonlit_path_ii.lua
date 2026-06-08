-----------------------------------
-- Area: Full Moon Fountain
-- Name: The Moonlit Path II
-----------------------------------
local fullMoonFountainID = zones[xi.zone.FULL_MOON_FOUNTAIN]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.FULL_MOON_FOUNTAIN,
    battlefieldId    = xi.battlefield.id.MOONLIT_PATH_II,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 4,
    entryNpc         = 'MS_Entrance',
    exitNpc          = 'Moon_Spiral',
    requiredKeyItems = { xi.ki.MOONLIT_PATH_PHANTOM_GEM, keep = false  },
    allowTrusts      = true,
})


content.groups =
{
    {
        mobIds =
        {
            { fullMoonFountainID.mob.FENRIR_PRIME_HTBF     },
            { fullMoonFountainID.mob.FENRIR_PRIME_HTBF + 1 },
            { fullMoonFountainID.mob.FENRIR_PRIME_HTBF + 2 },
        },

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
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,     weight =  1000}, -- Rem Tale Ch 6 
    },

    {
        { itemId = xi.item.NONE,                            weight = 750 }, -- nothing
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,     weight = 250}, -- Rem Tale Ch 6
    },
    --Unique Materials
    {
        { itemId = xi.item.NONE,                    weight = 167 }, -- nothing
        { itemId = xi.item.EXALTED_LOG,             weight = 166 }, -- Exalted Log
        { itemId = xi.item.HEPATIZON_ORE,           weight = 166 }, -- Hepatizon Ore
        { itemId = xi.item.MALIYAKALEYA_ORB,        weight = 166 }, -- Maliyakaleya Coral
        { itemId = xi.item.CHUNK_OF_BERYLLIUM_ORE,  weight = 166 }, -- Beryllium Ore
        { itemId = xi.item.SIFS_LOCK,               weight = 166 }, -- Sif's Lock
    },
    --Weapons
    {
        { itemId = xi.item.NONE,                   	weight = 667 }, -- nothing
        { itemId = xi.item.MEDEINA_KILIJ,        	weight = 333 }, -- Medeina Kilij
    },
    --Armor
    {
        { itemId = xi.item.NONE,                weight = 333 }, -- nothing
        { itemdi = xi.item.CAPITOLINE_STRAP,    weight = 166 },
        { itemId = xi.item.VRIKODARA_JUPON,     weight = 166 }, -- 
        { itemId = xi.item.MAIITSOH_HAUBE,      weight = 166 }, -- 
        { itemId = xi.item.LUPINE_CAPE,         weight = 166 }, -- 
    },
}


return content:register()
