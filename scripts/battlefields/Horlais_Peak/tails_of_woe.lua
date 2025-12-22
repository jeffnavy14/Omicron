-----------------------------------
-- Tails of Woe
-- Horlais Peak BCNM40, Star Orb
-- !additem 1131
-----------------------------------
local horlaisID = zones[xi.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.HORLAIS_PEAK,
    battlefieldId    = xi.battlefield.id.TAILS_OF_WOE,
    maxPlayers       = 6,
    levelCap         = 40,
    timeLimit        = utils.minutes(30),
    index            = 1,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { xi.item.STAR_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        horlaisID.mob.HELLTAIL_HARRY + 8,
        horlaisID.mob.HELLTAIL_HARRY + 17,
        horlaisID.mob.HELLTAIL_HARRY + 26,
    },
})

content.groups =
{
    {
        mobIds =
        {
            {
                horlaisID.mob.HELLTAIL_HARRY,
                horlaisID.mob.HELLTAIL_HARRY + 1,
                horlaisID.mob.HELLTAIL_HARRY + 2,
                horlaisID.mob.HELLTAIL_HARRY + 3,
                horlaisID.mob.HELLTAIL_HARRY + 4,
                horlaisID.mob.HELLTAIL_HARRY + 5,
                horlaisID.mob.HELLTAIL_HARRY + 6,
                horlaisID.mob.HELLTAIL_HARRY + 7,
            },

            {
                horlaisID.mob.HELLTAIL_HARRY + 9,
                horlaisID.mob.HELLTAIL_HARRY + 10,
                horlaisID.mob.HELLTAIL_HARRY + 11,
                horlaisID.mob.HELLTAIL_HARRY + 12,
                horlaisID.mob.HELLTAIL_HARRY + 13,
                horlaisID.mob.HELLTAIL_HARRY + 14,
                horlaisID.mob.HELLTAIL_HARRY + 15,
                horlaisID.mob.HELLTAIL_HARRY + 16,
            },

            {
                horlaisID.mob.HELLTAIL_HARRY + 18,
                horlaisID.mob.HELLTAIL_HARRY + 19,
                horlaisID.mob.HELLTAIL_HARRY + 20,
                horlaisID.mob.HELLTAIL_HARRY + 21,
                horlaisID.mob.HELLTAIL_HARRY + 22,
                horlaisID.mob.HELLTAIL_HARRY + 23,
                horlaisID.mob.HELLTAIL_HARRY + 24,
                horlaisID.mob.HELLTAIL_HARRY + 25,
            },
        },

        allDeath = utils.bind(content.handleAllMonstersDefeated, content),
    },
}

content.loot =
{
    {
        { itemId = xi.item.GIL,                   weight = 1000, amount = 6000 },
    },

    {
        { itemId = xi.item.DRUIDS_ROPE,           weight = 500 },
        { itemId = xi.item.GOLD_BEASTCOIN,        weight =  25 },
        { itemId = xi.item.MYTHRIL_BEASTCOIN,     weight =  25 },
        { itemId = xi.item.BLACK_ROCK,            weight =  25 },
        { itemId = xi.item.BLUE_ROCK,             weight =  25 },
        { itemId = xi.item.GREEN_ROCK,            weight =  25 },
        { itemId = xi.item.PURPLE_ROCK,           weight =  25 },
        { itemId = xi.item.RED_ROCK,              weight =  25 },
        { itemId = xi.item.TRANSLUCENT_ROCK,      weight =  25 },
        { itemId = xi.item.WHITE_ROCK,            weight =  25 },
        { itemId = xi.item.YELLOW_ROCK,           weight =  25 },
        { itemId = xi.item.AMETRINE,              weight =  25 },
        { itemId = xi.item.BLACK_PEARL,           weight =  25 },
        { itemId = xi.item.GARNET,                weight =  25 },
        { itemId = xi.item.GOSHENITE,             weight =  25 },
        { itemId = xi.item.PEARL,                 weight =  25 },
        { itemId = xi.item.PERIDOT,               weight =  25 },
        { itemId = xi.item.SPHENE,                weight =  25 },
        { itemId = xi.item.TURQUOISE,             weight =  25 },
        { itemId = xi.item.OAK_LOG,               weight =  25 },
        { itemId = xi.item.VILE_ELIXIR,           weight =  25 },
    },

    {
        { itemId = xi.item.AEGIS_RING,            weight = 500 },
        { itemId = xi.item.GOLD_BEASTCOIN,        weight =  25 },
        { itemId = xi.item.MYTHRIL_BEASTCOIN,     weight =  25 },
        { itemId = xi.item.BLACK_ROCK,            weight =  25 },
        { itemId = xi.item.BLUE_ROCK,             weight =  25 },
        { itemId = xi.item.GREEN_ROCK,            weight =  25 },
        { itemId = xi.item.PURPLE_ROCK,           weight =  25 },
        { itemId = xi.item.RED_ROCK,              weight =  25 },
        { itemId = xi.item.TRANSLUCENT_ROCK,      weight =  25 },
        { itemId = xi.item.WHITE_ROCK,            weight =  25 },
        { itemId = xi.item.YELLOW_ROCK,           weight =  25 },
        { itemId = xi.item.AMETRINE,              weight =  25 },
        { itemId = xi.item.BLACK_PEARL,           weight =  25 },
        { itemId = xi.item.GARNET,                weight =  25 },
        { itemId = xi.item.GOSHENITE,             weight =  25 },
        { itemId = xi.item.PEARL,                 weight =  25 },
        { itemId = xi.item.PERIDOT,               weight =  25 },
        { itemId = xi.item.SPHENE,                weight =  25 },
        { itemId = xi.item.TURQUOISE,             weight =  25 },
        { itemId = xi.item.OAK_LOG,               weight =  25 },
        { itemId = xi.item.RERAISER,              weight =  25 },
    },

    {
        { itemId = xi.item.BLITZ_RING,            weight = 500 },
        { itemId = xi.item.GOLD_BEASTCOIN,        weight =  25 },
        { itemId = xi.item.MYTHRIL_BEASTCOIN,     weight =  25 },
        { itemId = xi.item.BLACK_ROCK,            weight =  25 },
        { itemId = xi.item.BLUE_ROCK,             weight =  25 },
        { itemId = xi.item.GREEN_ROCK,            weight =  25 },
        { itemId = xi.item.PURPLE_ROCK,           weight =  25 },
        { itemId = xi.item.RED_ROCK,              weight =  25 },
        { itemId = xi.item.TRANSLUCENT_ROCK,      weight =  25 },
        { itemId = xi.item.WHITE_ROCK,            weight =  25 },
        { itemId = xi.item.YELLOW_ROCK,           weight =  25 },
        { itemId = xi.item.AMETRINE,              weight =  25 },
        { itemId = xi.item.BLACK_PEARL,           weight =  25 },
        { itemId = xi.item.GARNET,                weight =  25 },
        { itemId = xi.item.GOSHENITE,             weight =  25 },
        { itemId = xi.item.PEARL,                 weight =  25 },
        { itemId = xi.item.PERIDOT,               weight =  25 },
        { itemId = xi.item.SPHENE,                weight =  25 },
        { itemId = xi.item.TURQUOISE,             weight =  25 },
        { itemId = xi.item.ROSEWOOD_LOG,          weight =  25 },
        { itemId = xi.item.OAK_LOG,               weight =  25 },
    },

    {
        { itemId = xi.item.TUNDRA_MANTLE,         weight = 500 },
        { itemId = xi.item.GOLD_BEASTCOIN,        weight =  25 },
        { itemId = xi.item.MYTHRIL_BEASTCOIN,     weight =  25 },
        { itemId = xi.item.BLACK_ROCK,            weight =  25 },
        { itemId = xi.item.BLUE_ROCK,             weight =  25 },
        { itemId = xi.item.GREEN_ROCK,            weight =  25 },
        { itemId = xi.item.PURPLE_ROCK,           weight =  25 },
        { itemId = xi.item.RED_ROCK,              weight =  25 },
        { itemId = xi.item.TRANSLUCENT_ROCK,      weight =  25 },
        { itemId = xi.item.WHITE_ROCK,            weight =  25 },
        { itemId = xi.item.YELLOW_ROCK,           weight =  25 },
        { itemId = xi.item.AMETRINE,              weight =  25 },
        { itemId = xi.item.BLACK_PEARL,           weight =  25 },
        { itemId = xi.item.GARNET,                weight =  25 },
        { itemId = xi.item.GOSHENITE,             weight =  25 },
        { itemId = xi.item.PEARL,                 weight =  25 },
        { itemId = xi.item.PERIDOT,               weight =  25 },
        { itemId = xi.item.SPHENE,                weight =  25 },
        { itemId = xi.item.TURQUOISE,             weight =  25 },
        { itemId = xi.item.ROSEWOOD_LOG,          weight =  25 },
        { itemId = xi.item.OAK_LOG,               weight =  25 },
    },

    {
        quantity = 2,
        { itemId = xi.item.SCROLL_OF_ICE_SPIKES,  weight =  50 },
        { itemId = xi.item.SCROLL_OF_REFRESH,     weight = 300 },
        { itemId = xi.item.SCROLL_OF_UTSUSEMI_NI, weight = 150 },
        { itemId = xi.item.FIRE_SPIRIT_PACT,      weight = 150 },
        { itemId = xi.item.SCROLL_OF_ABSORB_STR,  weight =  50 },
        { itemId = xi.item.SCROLL_OF_ERASE,       weight = 150 },
        { itemId = xi.item.SCROLL_OF_PHALANX,     weight = 150 },
    },
}

return content:register()
