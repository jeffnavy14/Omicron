-----------------------------------
-- Area: Stellar Fulcrum
-- Name: Return to Delkfutt's Tower II
-----------------------------------
local stellarFulcrumID = zones[xi.zone.STELLAR_FULCRUM]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.STELLAR_FULCRUM,
    battlefieldId    = xi.battlefield.id.RETURN_TO_DELKFUTTS_TOWER_II,
    canLoseExp       = false,
    allowTrusts      = true,
    maxPlayers       = 6,
    levelCap         = 99,
    timeLimit        = utils.minutes(30),
    index            = 7, 
    area             = 1,
    entryNpc         = '_4z0',
    exitNpcs         = { '_4z1', '_4z2', '_4z3' },
    requiredKeyItems = { xi.ki.STELLAR_FULCRUM_PHANTOM_GEM, keep = false}, 
})

content.groups =
{
    {
        -- CHECK OFFSETS: HTBF offsets often differ from NQ
        mobIds =
        {
            stellarFulcrumID.mob.KAMLANAUT_HTBF,
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
        mobIds = { stellarFulcrumID.mob.ESOTERIC_SCRIVENING },
        spawned = false,
    },
    {
        mobIds =
        {
            stellarFulcrumID.mob.KAMLANAUT_HTBF + 1,
            stellarFulcrumID.mob.KAMLANAUT_HTBF + 2,
            stellarFulcrumID.mob.KAMLANAUT_HTBF + 3,
            stellarFulcrumID.mob.KAMLANAUT_HTBF + 4,
        },
        spawned = false,
    },
}

content.loot =
{
    {
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,     weight =  1000}, -- Rem Tale Ch 6 
    },

    {
        { itemId = xi.item.NONE,                            weight = 750 }, -- nothing
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,     weight =  50}, -- Rem Tale Ch 6 
    },

    {
        { itemId = xi.item.NONE,            weight = 250 }, -- nothing
        { itemId = xi.item.EXALTED_LOG,     weight = 250 }, -- Exalted Log
        { itemId = xi.item.HEPATIZON_ORE,   weight = 250 }, -- Hepatizon Ore
        { itemId = xi.item.WYRM_BLOOD,      weight = 250 }, -- Wyrm Blood
    },

    {
        { itemId = xi.item.NONE,                    weight = 50 }, -- nothing
        { itemId = xi.item.MESYOHI_SWORD,           weight = 10 }, -- Mes'yohi Sword
        { itemId = xi.item.MESYOHI_ROD,             weight = 10 }, -- Mes'yohi Rod
        { itemId = xi.item.SERAPHICALLER,           weight = 10 }, -- Seraphicaller
        { itemId = xi.item.DIVINATOR,               weight = 10 }, -- Divinator
        { itemId = xi.item.DIVINATOR_II,            weight = 10 }, -- Divinator II
    },

    {
        { itemId = xi.item.NONE,                weight = 50 }, -- nothing
        { itemId = xi.item.MESYOHI_HAUBERGEON,  weight = 2 }, -- 
        { itemId = xi.item.MESYOHI_SLACKS,      weight = 10 }, -- 
    },
}


return content:register()