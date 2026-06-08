-----------------------------------
-- Area: Sealion's Den
-- Name: The Warrior's Path HTBF
-----------------------------------
local sealionsDenID = zones[xi.zone.SEALIONS_DEN]
-----------------------------------

local content = Battlefield:new({
    zoneId        = xi.zone.SEALIONS_DEN,
    battlefieldId = xi.battlefield.id.WARRIORS_PATH_II,
    canLoseExp    = false,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 99,
    timeLimit     = utils.minutes(30),
    index         = 2,
    entryNpc      = '_0w0',
    exitNpc       = 'Airship_Door',
    requiredKeyItems = { xi.ki.WARRIORS_PATH_PHANTOM_GEM, keep = false  },
})

content.groups =
{
    {
        mobIds =
        {
            { sealionsDenID.mob.TENZEN_HTBF     },
            { sealionsDenID.mob.TENZEN_HTBF + 4 },
            { sealionsDenID.mob.TENZEN_HTBF + 8 },
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

    {
        mobIds =
        {
            {
                sealionsDenID.mob.CHERUKIKI_HTBF         ,
                sealionsDenID.mob.KUKKI_CHEBUKKI_HTBF    ,
                sealionsDenID.mob.MAKKI_CHEBUKKI_HTBF    ,
            },

            {
                sealionsDenID.mob.CHERUKIKI_HTBF       +4,
                sealionsDenID.mob.KUKKI_CHEBUKKI_HTBF  +4,
                sealionsDenID.mob.MAKKI_CHEBUKKI_HTBF  +4,
            },

            {
                sealionsDenID.mob.CHERUKIKI_HTBF       +8,
                sealionsDenID.mob.KUKKI_CHEBUKKI_HTBF  +8,
                sealionsDenID.mob.MAKKI_CHEBUKKI_HTBF  +8,
            },
        },
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
        { itemId = xi.item.DIVINATOR,        	weight = 150 },
        { itemId = xi.item.DIVINATOR_II,        weight = 150 },
        { itemId = xi.item.GINSEN,        	    weight = 150 },
        { itemId = xi.item.HANGAKU_NO_YUMI,     weight = 150 }, 
        { itemId = xi.item.SERAPHICALLER,       weight = 150 }, 
    },
    --Armor
    {
        { itemId = xi.item.NONE,                    weight = 334 }, -- nothing
        { itemId = xi.item.SUKEROKU_HACHIMAKI,      weight = 222 },
        { itemId = xi.item.BATTLECAST_GAITERS,      weight = 222 },
        { itemId = xi.item.MIZUKAGE_NO_KUBIKAZARI,  weight = 222 },

    },
}

return content:register()




