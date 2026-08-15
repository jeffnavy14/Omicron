-----------------------------------
-- Area: Apollyon
-----------------------------------
zones = zones or {}

zones[xi.zone.APOLLYON] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 6387, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6395, -- Obtained: <item>.
        GIL_OBTAINED                  = 6396, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6398, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS           = 7006, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY       = 7007, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!
        LOGIN_NUMBER                  = 7008, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        MEMBERS_LEVELS_ARE_RESTRICTED = 7028, -- Your party is unable to participate because certain members' levels are restricted.
        CONQUEST_BASE                 = 7073, -- Tallying conquest results...
    },
    mob =
    {
        -- CS_CARNAGECHIEF_JACKBODOKK = GetFirstID('Carnagechief_Jackbodokk'),
        -- CS_DEE_WAPA_THE_DESOLATOR  = GetFirstID('Dee_Wapa_the_Desolator'),
        -- CS_NAQBA_CHIRURGEON        = GetFirstID('NaQba_Chirurgeon'),

        -- NE_APOLLYON_SWEEPER_OFFSET   = GetFirstID('Apollyon_Sweeper'),
        -- NE_GOOBBUE_HARVESTER         = GetFirstID('Goobbue_Harvester'),
        -- NE_TROGLODYTE_DHALMEL_OFFSET = GetFirstID('Troglodyte_Dhalmel'),

        -- NW_APOLLYON_SCAVENGER_OFFSET = GetFirstID('Apollyon_Scavenger'),
        -- NW_BARDHA_OFFSET             = GetFirstID('Bardha'),
        -- NW_CYNOPROSOPI               = GetFirstID('Cynoprosopi'),
        -- NW_GORYNICH_OFFSET           = GetFirstID('Gorynich'),
        -- NW_KAISER_BEHEMOTH           = GetFirstID('Kaiser_Behemoth'),
        -- NW_MILLENARY_MOSSBACK        = GetFirstID('Millenary_Mossback'),
        -- NW_MOUNTAIN_BUFFALO_OFFSET   = GetFirstID('Mountain_Buffalo'),
        -- NW_PLUTO                     = GetFirstID('Pluto'),
        -- NW_ZLATOROG                  = GetFirstID('Zlatorog'),

        -- SE_ADAMANTSHELL_OFFSET = GetFirstID('Adamantshell'),
        -- SE_FLYING_SPEAR_OFFSET = GetFirstID('Flying_Spear'),
        -- SE_TIEHOLTSODI         = GetFirstID('Tieholtsodi'),

        -- SW_BOSS_JIDRA               = GetFirstID('Jidra_Boss'),
        -- SW_AIR_ELEMENTAL_OFFSET     = GetFirstID('Air_Elemental'),
        -- SW_DARK_ELEMENTAL_OFFSET    = GetFirstID('Dark_Elemental'),
        -- SW_EARTH_ELEMENTAL_OFFSET   = GetFirstID('Earth_Elemental'),
        -- SW_FIRE_ELEMENTAL_OFFSET    = GetFirstID('Fire_Elemental'),
        -- SW_ICE_ELEMENTAL_OFFSET     = GetFirstID('Ice_Elemental'),
        -- SW_LIGHT_ELEMENTAL_OFFSET   = GetFirstID('Light_Elemental'),
        -- SW_THUNDER_ELEMENTAL_OFFSET = GetFirstID('Thunder_Elemental'),
        -- SW_WATER_ELEMENTAL_OFFSET   = GetFirstID('Water_Elemental'),
    },
    npc =
    {
    },
}

return zones[xi.zone.APOLLYON]
