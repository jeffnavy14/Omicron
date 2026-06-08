-----------------------------------
-- Area: Full Moon Fountain
-- Name: The Moonlit Path II
-----------------------------------
local fullMoonFountainID = zones[xi.zone.FULL_MOON_FOUNTAIN]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.FULL_MOON_FOUNTAIN,
    battlefieldId    = xi.battlefield.id.WAKING_THE_BEAST_FULLMOON_II,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 5,
    entryNpc         = 'MS_Entrance',
    exitNpc          = 'Moon_Spiral',
    requiredKeyItems = { xi.ki.WAKING_THE_BEAST_PHANTOM_GEM, keep = false  },
    allowTrusts      = true,
})


content.groups =
{
    {
        mobIds =
        {

            {
                fullMoonFountainID.mob.CARBUNCLE_PRIME_HTBF,
            },
            {
                fullMoonFountainID.mob.CARBUNCLE_PRIME_HTBF +1,
            },
            {
                fullMoonFountainID.mob.CARBUNCLE_PRIME_HTBF +2,
            },
        },

        allDeath = function(battlefield, mob)
            local players = battlefield:getPlayers()
            battlefield:setStatus(xi.battlefield.status.WON)
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
    {
        mobIds =
        {
           { fullMoonFountainID.mob.IFRIT_PRIME_HTBF,  },
           { fullMoonFountainID.mob.IFRIT_PRIME_HTBF +1},
           { fullMoonFountainID.mob.IFRIT_PRIME_HTBF +2}, 
        },
        spawned  = false,
        allDeath = function(battlefield, mob)
        battlefield:setLocalVar('[RemoveImmortal]', 0 )            
        end,
    },
    {
        mobIds =
        {
           { fullMoonFountainID.mob.SHIVA_PRIME_HTBF,  },
           { fullMoonFountainID.mob.SHIVA_PRIME_HTBF +1},
           { fullMoonFountainID.mob.SHIVA_PRIME_HTBF +2}, 
        },
        spawned  = false,
        allDeath = function(battlefield, mob)
        battlefield:setLocalVar('[RemoveImmortal]', 0 )         
        end,
    },
    {
        mobIds =
        {
           { fullMoonFountainID.mob.GARUDA_PRIME_HTBF,  },
           { fullMoonFountainID.mob.GARUDA_PRIME_HTBF +1},
           { fullMoonFountainID.mob.GARUDA_PRIME_HTBF +2}, 
        },
        spawned  = false,
        allDeath = function(battlefield, mob)
        battlefield:setLocalVar('[RemoveImmortal]', 0 )         
        end,
    },
    {
        mobIds =
        {
           { fullMoonFountainID.mob.TITAN_PRIME_HTBF,  },
           { fullMoonFountainID.mob.TITAN_PRIME_HTBF +1},
           { fullMoonFountainID.mob.TITAN_PRIME_HTBF +2},
        },
        spawned  = false,
        allDeath = function(battlefield, mob)
        battlefield:setLocalVar('[RemoveImmortal]', 0 )         
        end,
    },
    {
        mobIds =
        {
           { fullMoonFountainID.mob.RAMUH_PRIME_HTBF,  },
           { fullMoonFountainID.mob.RAMUH_PRIME_HTBF +1},
           { fullMoonFountainID.mob.RAMUH_PRIME_HTBF +2},
        },
        spawned  = false,
        allDeath = function(battlefield, mob)
        battlefield:setLocalVar('[RemoveImmortal]', 0 )         
        end,
    },
    {
        mobIds =
        {
           { fullMoonFountainID.mob.LEVIATHAN_PRIME_HTBF,  },
           { fullMoonFountainID.mob.LEVIATHAN_PRIME_HTBF +1},
           { fullMoonFountainID.mob.LEVIATHAN_PRIME_HTBF +2},
        },
        spawned  = false,
    },
}

content.loot =
{
    {
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_7,     weight =  1000},  
    },

    {
        { itemId = xi.item.NONE,                            weight = 750 }, -- nothing
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_7,     weight = 250}, 
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
        { itemId = xi.item.MARQUETRY_STAFF,        	weight = 333 }, 
    },
    --Armor
    {
        { itemId = xi.item.NONE,                    weight = 333 }, -- nothing
        { itemId = xi.item.LAPIDARY_TUNIC,          weight = 83 }, 
        { itemId = xi.item.DIAMANTAIRE_SOLLERETS,   weight = 84 }, 
        { itemId = xi.item.SATLADA_NECKLACE,        weight = 250 }, 
        { itemId = xi.item.ENGRAVED_BELT,           weight = 250 }, 
    },
}

return content:register()
