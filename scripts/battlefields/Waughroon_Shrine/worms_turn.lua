-----------------------------------
-- The Worm's Turn
-- Waughroon Shrine BCNM40, Star Orb
-- !additem 1131
-----------------------------------
local waughroonID = zones[xi.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.WAUGHROON_SHRINE,
    battlefieldId    = xi.battlefield.id.WORMS_TURN,
    maxPlayers       = 6,
    levelCap         = 40,
    timeLimit        = utils.minutes(30),
    index            = 1,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { xi.item.STAR_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        waughroonID.mob.FLAYER_FRANZ + 16,
        waughroonID.mob.FLAYER_FRANZ + 33,
        waughroonID.mob.FLAYER_FRANZ + 50,
    },
})

content.groups =
{
    {
        mobIds =
        {
            {
                waughroonID.mob.FLAYER_FRANZ,
                waughroonID.mob.FLAYER_FRANZ + 1,
                waughroonID.mob.FLAYER_FRANZ + 2,
                waughroonID.mob.FLAYER_FRANZ + 3,
                waughroonID.mob.FLAYER_FRANZ + 4,
                waughroonID.mob.FLAYER_FRANZ + 5,
                waughroonID.mob.FLAYER_FRANZ + 6,
                waughroonID.mob.FLAYER_FRANZ + 7,
                waughroonID.mob.FLAYER_FRANZ + 8,
                waughroonID.mob.FLAYER_FRANZ + 9,
                waughroonID.mob.FLAYER_FRANZ + 10,
                waughroonID.mob.FLAYER_FRANZ + 11,
                waughroonID.mob.FLAYER_FRANZ + 12,
                waughroonID.mob.FLAYER_FRANZ + 13,
                waughroonID.mob.FLAYER_FRANZ + 14,
                waughroonID.mob.FLAYER_FRANZ + 15,
            },

            {
                waughroonID.mob.FLAYER_FRANZ + 17,
                waughroonID.mob.FLAYER_FRANZ + 18,
                waughroonID.mob.FLAYER_FRANZ + 19,
                waughroonID.mob.FLAYER_FRANZ + 20,
                waughroonID.mob.FLAYER_FRANZ + 21,
                waughroonID.mob.FLAYER_FRANZ + 22,
                waughroonID.mob.FLAYER_FRANZ + 23,
                waughroonID.mob.FLAYER_FRANZ + 24,
                waughroonID.mob.FLAYER_FRANZ + 25,
                waughroonID.mob.FLAYER_FRANZ + 26,
                waughroonID.mob.FLAYER_FRANZ + 27,
                waughroonID.mob.FLAYER_FRANZ + 28,
                waughroonID.mob.FLAYER_FRANZ + 29,
                waughroonID.mob.FLAYER_FRANZ + 30,
                waughroonID.mob.FLAYER_FRANZ + 31,
                waughroonID.mob.FLAYER_FRANZ + 32,
            },

            {
                waughroonID.mob.FLAYER_FRANZ + 34,
                waughroonID.mob.FLAYER_FRANZ + 35,
                waughroonID.mob.FLAYER_FRANZ + 36,
                waughroonID.mob.FLAYER_FRANZ + 37,
                waughroonID.mob.FLAYER_FRANZ + 38,
                waughroonID.mob.FLAYER_FRANZ + 39,
                waughroonID.mob.FLAYER_FRANZ + 40,
                waughroonID.mob.FLAYER_FRANZ + 41,
                waughroonID.mob.FLAYER_FRANZ + 42,
                waughroonID.mob.FLAYER_FRANZ + 43,
                waughroonID.mob.FLAYER_FRANZ + 44,
                waughroonID.mob.FLAYER_FRANZ + 45,
                waughroonID.mob.FLAYER_FRANZ + 46,
                waughroonID.mob.FLAYER_FRANZ + 47,
                waughroonID.mob.FLAYER_FRANZ + 48,
                waughroonID.mob.FLAYER_FRANZ + 49,
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
        { itemId = xi.item.SPIRIT_TORQUE,         weight = 500 },
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
        { itemId = xi.item.NEMESIS_EARRING,       weight = 500 },
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
        { itemId = xi.item.EARTH_MANTLE,          weight = 500 },
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
        { itemId = xi.item.STRIKE_SHIELD,         weight = 500 },
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
