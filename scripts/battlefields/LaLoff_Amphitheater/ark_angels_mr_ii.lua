-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Ark Angels HTBF (Mithra)
-----------------------------------
local laLoffID = zones[xi.zone.LALOFF_AMPHITHEATER]
-----------------------------------

local content = Battlefield:new({
    zoneId                = xi.zone.LALOFF_AMPHITHEATER,
    battlefieldId         = xi.battlefield.id.ARK_ANGELS_MR_II,
    allowTrusts           = true,
    maxPlayers            = 6,
    timeLimit             = utils.minutes(30),
    index                 = 8,
    entryNpc              = 'qm1_3',
    exitNpc               = 'qm2',
    requiredKeyItems      = { xi.ki.PHANTOM_GEM_OF_ENVY, keep = false  },
})

content.groups =
{
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_MR_HTBF     },
            { laLoffID.mob.ARK_ANGEL_MR_HTBF + 1 },
            { laLoffID.mob.ARK_ANGEL_MR_HTBF + 2 },
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

    -- Tiger Pets
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_MR + 3 }, -- check these
            { laLoffID.mob.ARK_ANGEL_MR + 4 },
            { laLoffID.mob.ARK_ANGEL_MR + 5 },
        },

        spawned = false,
    },

    -- Mandragora Pets
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_MR + 6 },
            { laLoffID.mob.ARK_ANGEL_MR + 7 },
            { laLoffID.mob.ARK_ANGEL_MR + 8 },
        },

        spawned = false,
    },
}

content.loot =
{
    {
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_8,     weight =  1000},  
    },

    {
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_8,     weight = 1000}, 
    },
    --Unique Materials
    {
        { itemId = xi.item.NONE,                           weight = 250 }, -- nothing
        { itemId = xi.item.VESTIGE_OF_A_BURIED_TRAIT,      weight = 375 }, 
        { itemId = xi.item.CHUNK_OF_BERYLLIUM_ORE,         weight = 375 }, 
    },
    --Weapons
    {
        { itemId = xi.item.NONE,              weight = 500 }, -- nothing
        { itemId = xi.item.RAIMITSUKANE,      weight = 250 },
        { itemId = xi.item.ANAHERA_TABAR,     weight = 250 },  
    },
    --Armor
    {
        { itemId = xi.item.NONE,              weight = 334 }, -- nothing
        { itemId = xi.item.REGIMEN_MITTENS,   weight = 250 },
        { itemId = xi.item.FELISTRIS_MASK,    weight = 250 }, 
        { itemId = xi.item.SEKHMET_CORSET,    weight = 167 }, 
    },
}

return content:register()
