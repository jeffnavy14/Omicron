-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Ark Angels HTBF (Hume)
-----------------------------------
local laLoffID = zones[xi.zone.LALOFF_AMPHITHEATER]
-----------------------------------

local content = Battlefield:new({
    zoneId                = xi.zone.LALOFF_AMPHITHEATER,
    battlefieldId         = xi.battlefield.id.ARK_ANGELS_HM_II,
    allowTrusts           = true,
    maxPlayers            = 6,
    timeLimit             = utils.minutes(30),
    index                 = 6,
    entryNpc              = 'qm1_1',
    exitNpc               = 'qm2',
    requiredKeyItems      = { xi.ki.PHANTOM_GEM_OF_APATHY, keep = false  },
})

content.groups =
{
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_HM_HTBF     },
            { laLoffID.mob.ARK_ANGEL_HM_HTBF + 1 },
            { laLoffID.mob.ARK_ANGEL_HM_HTBF + 2 },
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
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,     weight =  1000},  
    },

    {
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,     weight = 1000}, 
    },
    --Unique Materials
    {
        { itemId = xi.item.NONE,                           weight = 250 }, -- nothing
        { itemId = xi.item.VESTIGE_OF_A_BURIED_TRAIT,      weight = 375 }, -- Exalted Log
        { itemId = xi.item.PIECE_OF_MALIYAKALEYA_CORAL,    weight = 375 }, -- Sif's Lock
    },
    --Weapons
    {
        { itemId = xi.item.NONE,              weight = 500 }, -- nothing
        { itemId = xi.item.CASTIGATION,       weight = 250 },
        { itemId = xi.item.ANAHERA_SABER,     weight = 250 },  
    },
    --Armor
    {
        { itemId = xi.item.NONE,                weight = 333 }, -- nothing
        { itemId = xi.item.LITHELIMB_CAP,       weight = 250 },
        { itemId = xi.item.BLOODRAIN_STRAP,     weight = 250 }, 
        { itemId = xi.item.MANABYSS_PIGACHES,   weight = 167 }, 
    },
}

return content:register()
