-----------------------------------
-- Royal Jelly
-- Waughroon Shrine BCNM40, Star Orb
-- !additem 1131
-----------------------------------
local waughroonID = zones[xi.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.WAUGHROON_SHRINE,
    battlefieldId    = xi.battlefield.id.ROYAL_JELLY,
    maxPlayers       = 3,
    levelCap         = 40,
    timeLimit        = utils.minutes(15),
    index            = 13,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { xi.item.STAR_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },

})

-- base queens that must be dead to get win, but doesn't start spawned
content:addEssentialMobs({ 'Queen_Jelly' })
content.groups[1].spawned = false

content:addEssentialMobs({ 'Princess_Jelly' })

content.loot =
{
    {
        { itemId = xi.item.GIL,                   weight = 1000, amount = 5000 },
    },

    {
        { itemId = xi.item.NONE,                  weight = 900 },
        { itemId = xi.item.ARCHERS_RING,          weight = 100 },
    },

    {
        { itemId = xi.item.MARKSMANS_RING,        weight = 400 },
        { itemId = xi.item.DUSKY_STAFF,           weight = 100 },
        { itemId = xi.item.HIMMEL_STOCK,          weight = 100 },
        { itemId = xi.item.SEALED_MACE,           weight = 100 },
        { itemId = xi.item.SHIKAR_BOW,            weight = 100 },
    },

    {
        { itemId = xi.item.MANA_RING,             weight = 400 },
        { itemId = xi.item.GRUDGE_SWORD,          weight = 100 },
        { itemId = xi.item.DE_SAINTRES_AXE,       weight = 100 },
        { itemId = xi.item.BUZZARD_TUCK,          weight = 100 },
        { itemId = xi.item.SCROLL_OF_UTSUSEMI_NI, weight = 100 },
    },

    {
        { itemId = xi.item.SCROLL_OF_ICE_SPIKES,  weight = 250 },
        { itemId = xi.item.SCROLL_OF_REFRESH,     weight = 200 },
        { itemId = xi.item.SCROLL_OF_UTSUSEMI_NI, weight = 150 },
        { itemId = xi.item.MYTHRIL_BEASTCOIN,     weight = 100 },
        { itemId = xi.item.GOLD_BEASTCOIN,        weight = 100 },
        { itemId = xi.item.BLACK_ROCK,            weight =  10 },
        { itemId = xi.item.BLUE_ROCK,             weight =  10 },
        { itemId = xi.item.GREEN_ROCK,            weight =  10 },
        { itemId = xi.item.PURPLE_ROCK,           weight =  10 },
        { itemId = xi.item.RED_ROCK,              weight =  10 },
        { itemId = xi.item.TRANSLUCENT_ROCK,      weight =  10 },
        { itemId = xi.item.WHITE_ROCK,            weight =  10 },
        { itemId = xi.item.YELLOW_ROCK,           weight =  10 },
        { itemId = xi.item.AMETRINE,              weight =  10 },
        { itemId = xi.item.BLACK_PEARL,           weight =  10 },
        { itemId = xi.item.GARNET,                weight =  10 },
        { itemId = xi.item.GOSHENITE,             weight =  10 },
        { itemId = xi.item.PEARL,                 weight =  10 },
        { itemId = xi.item.PERIDOT,               weight =  10 },
        { itemId = xi.item.SPHENE,                weight =  10 },
        { itemId = xi.item.TURQUOISE,             weight =  10 },
        { itemId = xi.item.ROSEWOOD_LOG,          weight =  10 },
        { itemId = xi.item.OAK_LOG,               weight =  10 },
        { itemId = xi.item.VILE_ELIXIR,           weight =  10 },
        { itemId = xi.item.RERAISER,              weight =  10 },
    },

    {
        { itemId = xi.item.FIRE_SPIRIT_PACT,      weight = 200 },
        { itemId = xi.item.SCROLL_OF_ABSORB_STR,  weight = 100 },
        { itemId = xi.item.SCROLL_OF_ERASE,       weight = 200 },
        { itemId = xi.item.SCROLL_OF_PHALANX,     weight = 200 },
        { itemId = xi.item.STEEL_SHEET,           weight = 150 },
        { itemId = xi.item.STEEL_INGOT,           weight = 150 },
    },

    {
        quantity = 2,
        { itemId = xi.item.VIAL_OF_SLIME_OIL,     weight = 1000 },
    },
}

return content:register()
