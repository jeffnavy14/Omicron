-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Divine Might II
-----------------------------------
local laLoffID = zones[xi.zone.LALOFF_AMPHITHEATER]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.LALOFF_AMPHITHEATER,
    battlefieldId    = xi.battlefield.id.DIVINE_MIGHT_II,
    canLoseExp       = false,
    allowTrusts      = true,
    maxPlayers       = 18,
    levelCap         = 99,
    timeLimit        = utils.minutes(30),
    index            = 11,
    entryNpcs        = { 'qm1_1', 'qm1_2', 'qm1_3', 'qm1_4', 'qm1_5' },
    exitNpc          = 'qm2',
    requiredKeyItems = { xi.ki.P_PERPETRATOR_PHANTOM_GEM, keep = false  },
})

content.groups =
{
    {
        mobIds =
        {
            {
                laLoffID.mob.ARK_ANGEL_HM_HTBF + 40,      
                laLoffID.mob.ARK_ANGEL_MR_HTBF + 38,
                laLoffID.mob.ARK_ANGEL_EV_HTBF + 80,
                laLoffID.mob.ARK_ANGEL_TT_HTBF + 78,
                laLoffID.mob.ARK_ANGEL_GK_HTBF + 76,
            },
        },

        allDeath = function(battlefield, mob)
            local players = battlefield:getPlayers()
            if battlefield:getStatus() == xi.battlefield.status.WON then
                return
            end

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

    -- AAMR: Tiger
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_MR_HTBF +39 },
        },

        spawned = false,
    },

    -- AAMR: Mandragora
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_MR_HTBF + 40 },
        },

        spawned = false,
    },

    -- AAGK: Wyvern
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_GK_HTBF + 77 },
        },

        spawned = false,
    },
}

content.loot =
{ -- 1
    {
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,     weight =  166},
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_7,     weight =  166},
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_8,     weight =  166},
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_9,     weight =  166},
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_10,    weight =  166},        
    },

    { -- 2
        { itemId = xi.item.NONE,                            weight = 250 }, -- nothing
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,     weight = 125},
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_7,     weight = 125},
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_8,     weight = 125},
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_9,     weight = 125},
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_10,    weight = 125},
    },
    --Unique Materials
    { -- 3
        { itemId = xi.item.NONE,                        weight = 250 }, -- nothing
        { itemId = xi.item.VESTIGE_OF_A_BURIED_TRAIT,   weight = 125 }, -- Exalted Log
        { itemId = xi.item.EXALTED_LOG,                 weight = 125 }, -- Exalted Log
        { itemId = xi.item.HEPATIZON_ORE,               weight = 125 }, -- Hepatizon Ore
        { itemId = xi.item.MALIYAKALEYA_ORB,            weight = 125 }, -- Maliyakaleya Coral
        { itemId = xi.item.CHUNK_OF_BERYLLIUM_ORE,      weight = 125 }, -- Beryllium Ore
        { itemId = xi.item.SIFS_LOCK,                   weight = 125 }, -- Sif's Lock
    },
    --Weapons
    {-- 4
        { itemId = xi.item.NONE,                weight = 333 }, -- nothing
        { itemId = xi.item.SERAPHICALLER,       weight = 222 },
        { itemId = xi.item.DIVINATOR,           weight = 222 },
        { itemId = xi.item.DIVINATOR_II,         weight = 222 },
    },
    --Armor (TT)
    {--5
        { itemId = xi.item.NONE,                weight = 500 },
        { itemId = xi.item.CREMATIO_EARRING,    weight = 250 },
        { itemId = xi.item.FRAVASHI_MANTLE,     weight = 250 },
    },
    --Armor (HM)
    {--6
        { itemId = xi.item.NONE,                weight = 500 },
        { itemId = xi.item.LENTUS_GRIP,         weight = 250 },
        { itemId = xi.item.TRUX_EARRING,        weight = 250 },
    },
    --Armor (MR)
    {--7
        { itemId = xi.item.NONE,                weight = 500 },
        { itemId = xi.item.KYUJUTSUGI,          weight = 250 },
        { itemId = xi.item.GELAI_EARRING,       weight = 250 },
    },
    --Armor (GK)
    {--8
        { itemId = xi.item.NONE,                weight = 750 },
        { itemId = xi.item.TRIPUDIO_EARRING,    weight = 250 },
    },
    --Armor (EV)
    {--9
        { itemId = xi.item.NONE,                weight = 750 },
        { itemId = xi.item.SANARE_EARRING,      weight = 250 },
    },
}

return content:register()
