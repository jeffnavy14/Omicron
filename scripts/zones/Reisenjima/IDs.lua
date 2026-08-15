-----------------------------------
-- Area: Reisenjima
-----------------------------------
zones = zones or {}

zones[xi.zone.REISENJIMA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 6387, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6395, -- Obtained: <item>.
        GIL_OBTAINED                  = 6396, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6398, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED                = 6404, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY       = 6409, -- There is nothing out of the ordinary here.
        CARRIED_OVER_POINTS           = 7006, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY       = 7007, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!
        LOGIN_NUMBER                  = 7008, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        MEMBERS_LEVELS_ARE_RESTRICTED = 7028, -- Your party is unable to participate because certain members' levels are restricted.
        YOU_HAVE_USED                 = 7623, -- You have used <item>.
    },
    mob =
    {
        ASCENDED_BEETLE        = GetFirstID('Ascended_Beetle'),
        ASCENDED_CHAPULI       = GetFirstID('Ascended_Chapuli'),
        ASCENDED_CHIGOE        = GetFirstID('Ascended_Chigoe'),
        ASCENDED_CYHIRAETH     = GetFirstID('Ascended_Cyhiraeth'),
        ASCENDED_FAAZ          = GetFirstID('Ascended_Faaz'),
        ASCENDED_GEFYRST       = GetFirstID('Ascended_Gefyrst'),
        ASCENDED_HIPPOGRYPH    = GetFirstID('Ascended_Hippogryph'),
        ASCENDED_LUCANI        = GetFirstID('Ascended_Lucani'),
        ASCENDED_LUCKYBUG      = GetFirstID('Ascended_Luckybug'),
        ASCENDED_MANTIS        = GetFirstID('Ascended_Mantis'),
        ASCENDED_MOSQUITO      = GetFirstID('Ascended_Mosquito'),
        ASCENDED_NARAKA        = GetFirstID('Ascended_Naraka'),
        ASCENDED_PANOPT        = GetFirstID('Ascended_Panopt'),
        ASCENDED_POROGGO       = GetFirstID('Ascended_Poroggo'),
        ASCENDED_PORXIE        = GetFirstID('Ascended_Porxie'),
        ASCENDED_TIGER         = GetFirstID('Ascended_Tiger'),
        ASCENDED_UNGEWEDER     = GetFirstID('Ascended_Ungeweder'),
        HEAVENLY_VEELA         = GetFirstID('Heavenly_Veela'),
        RAMPAGING_BEETLE       = GetTableOfIDs('Rampaging_Beetle'),
        AGITATED_CHAPULI       = GetTableOfIDs('Agitated_Chapuli'),
        ARBOREAL_CHIGOE        = GetTableOfIDs('Arboreal_Chigoe'),
        ASPHYXIATING_CYHIRAETH = GetTableOfIDs('Asphyxiating_Cyhiraeth'),
        INDOMITABLE_FAAZ       = GetTableOfIDs('Indomitable_Faaz'),
        WATER_ELEMENTAL        = GetTableOfIDs('Water_Elemental'),
        QUARRELSOME_HIPPOGRYPH = GetTableOfIDs('Quarrelsome_Hippogryph'),
        LUCANI                 = GetTableOfIDs('Lucani'),
        GLOWERING_LADYBUG      = GetTableOfIDs('Glowering_Ladybug'),
        TERRITORIAL_MANTIS     = GetTableOfIDs('Territorial_Mantis'),
        DEVOURING_MOSQUITO     = GetTableOfIDs('Devouring_Mosquito'),
        IGNOBLE_SKELETON       = GetTableOfIDs('Ignoble_Skeleton'),
        PERFERVID_NARAKA       = GetTableOfIDs('Perfervid_Naraka'),
        OBSTREPEROUS_PANOPT    = GetTableOfIDs('Obstreperous_Panopt'),
        LENTIC_TOAD            = GetTableOfIDs('Lentic_Toad'),
        PORXIE                 = GetTableOfIDs('Porxie'),
        SNAGGLETOOTHED_TIGER   = GetTableOfIDs('Snaggletoothed_Tiger'),
        THUNDER_ELEMENTAL      = GetTableOfIDs('Thunder_Elemental'),
        WANTON_DANAID          = GetTableOfIDs('Wanton_Danaid'),
        OFFICIOUS_UNSEELIE     = GetTableOfIDs('Officious_Unseelie'),
        MIREU                  = GetFirstID('Mireu'),
        QUETZALCOATL           = GetFirstID('Quetzalcoatl'),
    },
    npc =
    {
    },
}

return zones[xi.zone.REISENJIMA]
