-----------------------------------
-- Area: Jade Sepulcher
-- BCNM:  Puppet in Peril II HTBF
-----------------------------------
local jadeSepulcherID = zones[xi.zone.JADE_SEPULCHER]
-----------------------------------

local content = Battlefield:new({
    zoneId                = xi.zone.JADE_SEPULCHER,
    battlefieldId         = xi.battlefield.id.PUPPET_IN_PERIL_II,
    canLoseExp            = false,
    allowTrusts           = true,
    maxPlayers            = 6,
    levelCap              = 99,
    timeLimit             = utils.minutes(30),
    index                 = 5,
    entryNpc              = '_1v0',
    exitNpcs              = { '_1v1', '_1v2', '_1v3' },
    requiredKeyItems = { xi.ki.PUPPET_IN_PERIL_PHANTOM_GEM, keep = false  },
})

content.groups =
{
    {
        mobIds =
        {
            { jadeSepulcherID.mob.MAMOOL_JA_UNSEEN_HTBF      }, -- 241.7711, -31.5431, 239.0438, 159
            { jadeSepulcherID.mob.MAMOOL_JA_UNSEEN_HTBF + 7  }, -- 0.789, 8.5000, -0.2412, 158
            { jadeSepulcherID.mob.MAMOOL_JA_UNSEEN_HTBF + 14 },-- -240.5868, 48.5000, -239.1030, 158
        },
        allDeath = function(battlefield, mob)
            battlefield:setLocalVar('[SpawnLancelord]', battlefield:getLocalVar('[SpawnLancelord]') +1)
        end,
    },
    {
        mobIds =
        {
            { jadeSepulcherID.mob.MAMOOL_JA_FLAMEREARER_HTBF      },-- 244.7644, -31.1628, 239.6185, 144
            { jadeSepulcherID.mob.MAMOOL_JA_FLAMEREARER_HTBF + 7  },-- 3.2212, 8.6344, 1.7963, 117
            { jadeSepulcherID.mob.MAMOOL_JA_FLAMEREARER_HTBF + 14 },-- -238.7326, 48.5000, -238.6066, 129
        },
        allDeath = function(battlefield, mob)
            battlefield:setLocalVar('[SpawnLancelord]', battlefield:getLocalVar('[SpawnLancelord]') +1)
        end,
    },
    {
        mobIds =
        {
            { jadeSepulcherID.mob.MAMOOL_JA_ISANGOMA_HTBF      },-- 246,1002, -31.0492, 243.0372, 121
            { jadeSepulcherID.mob.MAMOOL_JA_ISANGOMA_HTBF + 7  },-- 2.8961, 8.8946, 4.2043, 99
            { jadeSepulcherID.mob.MAMOOL_JA_ISANGOMA_HTBF + 14 },-- -237.811, 48.6941, -236.6441, 121
        },
        allDeath = function(battlefield, mob)
            battlefield:setLocalVar('[SpawnLancelord]', battlefield:getLocalVar('[SpawnLancelord]') +1)
        end,
    },
    {
        mobIds =
        {
            { jadeSepulcherID.mob.MAMOOL_JA_PROFLIGATE_HTBF      },-- 241.5989, -31.1523, 235.0241, 174
            { jadeSepulcherID.mob.MAMOOL_JA_PROFLIGATE_HTBF + 7  },-- 3.6058, 8.7719, -2.3333, 165
            { jadeSepulcherID.mob.MAMOOL_JA_PROFLIGATE_HTBF + 14 },-- -238.2886, 48.5472, -242.3815, 170
        },
        allDeath = function(battlefield, mob)
            battlefield:setLocalVar('[SpawnLancelord]', battlefield:getLocalVar('[SpawnLancelord]') +1)
        end,
    },
    {
        mobIds =
        {
            { jadeSepulcherID.mob.MAMOOL_JA_POLEMICIST_HTBF      },-- 239.5683, -31.0689, 233.3579, 191
            { jadeSepulcherID.mob.MAMOOL_JA_POLEMICIST_HTBF + 7  },-- 2.2063, 8.8454, -4.9297, 181
            { jadeSepulcherID.mob.MAMOOL_JA_POLEMICIST_HTBF + 14 },-- -239.4235, 48.8254, -244.5281, 179
        },
        allDeath = function(battlefield, mob)
            battlefield:setLocalVar('[SpawnLancelord]', battlefield:getLocalVar('[SpawnLancelord]') +1)
        end,
    },
    {
        mobIds =
        {
            { jadeSepulcherID.mob.LANCELORD_GAHEEL_JA_HTBF      },-- 241.7711, -31.5431, 239.0438, 159
            { jadeSepulcherID.mob.LANCELORD_GAHEEL_JA_HTBF + 7  },-- 0.789, 8.5000, -0.2412, 158
            { jadeSepulcherID.mob.LANCELORD_GAHEEL_JA_HTBF + 14 },-- -240.5868, 48.5000, -239.1030, 158
        },

        spawned = false,
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
}

content.loot =
{
    {
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_9,     weight =  1000},  
    },

    {
        { itemId = xi.item.NONE,                            weight = 750 }, -- nothing
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_9,     weight = 250}, 
    },
    --Unique Materials
    {
        { itemId = xi.item.NONE,                    weight = 143 }, -- nothing
        { itemId = xi.item.EXALTED_LOG,             weight = 142 }, -- Exalted Log
        { itemId = xi.item.HEPATIZON_ORE,           weight = 142 }, -- Hepatizon Ore
        { itemId = xi.item.MALIYAKALEYA_ORB,        weight = 142 }, -- Maliyakaleya Coral
        { itemId = xi.item.CHUNK_OF_BERYLLIUM_ORE,  weight = 142 }, -- Beryllium Ore
        { itemId = xi.item.SIFS_LOCK,               weight = 142 }, -- Sif's Lock
        { itemId = xi.item.SCARLETITE_INGOT,        weight = 142 }, -- Scarletite Ingot
    },
    --Weapons
    {
        { itemId = xi.item.NONE,                weight = 250 }, -- nothing
        { itemId = xi.item.DIVINATOR,        	weight = 187 },
        { itemId = xi.item.DIVINATOR_II,        weight = 187 },
        { itemId = xi.item.BESTAS_BANE,         weight = 187 }, 
        { itemId = xi.item.SERAPHICALLER,       weight = 187 }, 
    },
    --Armor
    {
        { itemId = xi.item.NONE,                weight = 334 }, -- nothing
        { itemId = xi.item.SAVAS_JAWSHAN,       weight = 222 },
        { itemId = xi.item.SIFAHIR_SLACKS,      weight = 222 },
        { itemId = xi.item.SAHIP_HELM,          weight = 222 },
        { itemId = xi.item.PRATIK_EARRING,      weight = 222 },

    },
}

return content:register()
