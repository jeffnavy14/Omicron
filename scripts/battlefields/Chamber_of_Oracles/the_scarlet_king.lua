-----------------------------------
-- The Scarlet King
-- Chamber of Oracles KSNM30, Atropos Orb
-- !additem 1180
-----------------------------------
local chamberOfOraclesID = zones[xi.zone.CHAMBER_OF_ORACLES]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.CHAMBER_OF_ORACLES,
    battlefieldId    = xi.battlefield.id.SCARLET_KING,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 7, -- "The Scarlet King"
    entryNpc         = 'SC_Entrance',
    exitNpc          = 'Shimmering_Circle',
    requiredItems    = { xi.item.ATROPOS_ORB, wearMessage = chamberOfOraclesID.text.A_CRACK_HAS_FORMED, wornMessage = chamberOfOraclesID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Purson' })

content.loot =
{
    {
        { item = xi.item.GIL,                        weight = 1000, amount = 24000 }, -- gil
    },

    {
        { item = xi.item.MANTICORE_HIDE,             weight = 1000 }, -- Manticore Hide
    },

    {
        { item = xi.item.LOCK_OF_MANTICORE_HAIR,     weight = 700 }, -- Manticore Hair
        { item = xi.item.POLE_GRIP,                  weight = 100 }, -- Pole Grip
        { item = xi.item.SWORD_STRAP,                weight = 100 }, -- Sword Strap
        { item = xi.item.SPEAR_STRAP,                weight = 100 }, -- Spear Strap
    },

    {
        { item = xi.item.ARGENT_DAGGER,              weight = 200 }, -- Argent Dagger
        { item = xi.item.HONEBAMI,                   weight = 200 }, -- Honebami
        { item = xi.item.THANATOS_BASELARD,          weight = 200 }, -- Thanatos Baselard
        { item = xi.item.KING_MAKER,                 weight = 200 }, -- King Maker
        { item = xi.item.BALANS_SWORD,               weight = 200 }, -- Balans Sword
    },

    {
        { item = xi.item.VILE_ELIXIR_P1,             weight =  250 }, -- Vile Elixir +1
        { item = xi.item.VILE_ELIXIR,                weight =  750 }, -- Vile Elixir
    },

    {
        { item = xi.item.WOODVILLES_AXE,             weight = 200 }, -- Woodvilles Axe
        { item = xi.item.BALINS_SWORD,               weight = 200 }, -- Balin's Sword
        { item = xi.item.WYVERN_PERCH,               weight = 200 }, -- Wyvern Perch
        { item = xi.item.GAWAINS_AXE,                weight = 200 }, -- Gawains's Axe
        { item = xi.item.CAPRICORN_STAFF,            weight = 200 }, -- Capricorn Staff
    },

    {
        { item = xi.item.CHUNK_OF_DARKSTEEL_ORE,     weight =  70 }, -- Chunk of Darksteel Ore
        { item = xi.item.CHUNK_OF_GOLD_ORE,          weight =  50 }, -- Chunk of Gold Ore
        { item = xi.item.CHUNK_OF_PLATINUM_ORE,      weight =  50 }, -- Chunk of Platinum Ore
        { item = xi.item.CHUNK_OF_ADAMAN_ORE,        weight =  20 }, -- Chunk of Adaman Ore
        { item = xi.item.CHUNK_OF_ORICHALCUM_ORE,    weight =  20 }, -- Chunk of Orichalcum Ore
        { item = xi.item.GOLD_INGOT,                 weight =  20 }, -- Gold Ingot
        { item = xi.item.MAHOGANY_LOG,               weight =  60 }, -- Mahogany Log
        { item = xi.item.PETRIFIED_LOG,              weight =  40 }, -- Petrified Log
        { item = xi.item.PHOENIX_FEATHER,            weight =  40 }, -- Phoenix Feather
        { item = xi.item.PHILOSOPHERS_STONE,         weight =  30 }, -- Philosophers Stone
        { item = xi.item.VIAL_OF_BLACK_BEETLE_BLOOD, weight =  30 }, -- Vial of Black Beetle Blood
        { item = xi.item.SQUARE_OF_RAINBOW_CLOTH,    weight =  50 }, -- Square of Rainbow Cloth
        { item = xi.item.SQUARE_OF_RAXA,             weight =  20 }, -- Square of Raxa
        { item = xi.item.SCROLL_OF_THUNDER_III,      weight =  30 }, -- Scroll of Thunder III
        { item = xi.item.SCROLL_OF_CURE_V,           weight =  20 }, -- Scroll of Cure V
        { item = xi.item.SCROLL_OF_RAISE_III,        weight =  20 }, -- Scroll of Raise III
        { item = xi.item.RERAISER,                   weight =  30 }, -- Reraiser
        { item = xi.item.HI_RERAISER,                weight =  20 }, -- Hi-Reraiser
        { item = xi.item.NONE,                       weight = 400 }, -- Nothing
    },

    {
        { item = xi.item.SQUARE_OF_DAMASCENE_CLOTH, weight = 30 },  -- Square Of Damascene Cloth
        { item = xi.item.DAMASCUS_INGOT,            weight = 90 },  -- Damascus Ingot
        { item = xi.item.SPOOL_OF_MALBORO_FIBER,    weight = 30 },  -- Spool Of Malboro Fiber
        { item = xi.item.PHILOSOPHERS_STONE,        weight = 130 }, -- Philosophers Stone
        { item = xi.item.PHOENIX_FEATHER,           weight = 120 }, -- Phoenix Feather
        { item = xi.item.SQUARE_OF_RAXA,            weight = 100 }, -- Square Of Raxa
        { item = xi.item.NONE,                      weight = 500 }, -- Nothing
    }
}

return content:register()
