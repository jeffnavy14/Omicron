-----------------------------------
-- Area: Escha_RuAun
-----------------------------------
zones = zones or {}

zones[xi.zone.ESCHA_RUAUN] =
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
    },
    mob =
    {
        WARDER_OF_DIGNITY    = GetFirstID('Warder_of_Dignity'),
        WARDER_OF_FAITH      = GetFirstID('Warder_of_Faith'),
        WARDER_OF_FORTITUDE  = GetFirstID('Warder_of_Fortitude'),
        WARDER_OF_HOPE       = GetFirstID('Warder_of_Hope'),
        WARDER_OF_JUSTICE    = GetFirstID('Warder_of_Justice'),
        WARDER_OF_LOVE       = GetFirstID('Warder_of_Love'),
        WARDER_OF_LOYALTY    = GetFirstID('Warder_of_Loyalty'),
        WARDER_OF_MERCY      = GetFirstID('Warder_of_Mercy'),
        WARDER_OF_PRUDENCE   = GetFirstID('Warder_of_Prudence'),
        WARDER_OF_TEMPERANCE = GetFirstID('Warder_of_Temperance'),
		KIRIN				 = GetFirstID('Kirin'),
        KOURYU               = GetFirstID('Kouryu'),
        ESCHAN_LIMULE        = GetTableOfIDs('Eschan_Limule'),
        ESCHAN_EUVHI         = GetTableOfIDs('Eschan_Euvhi'),
        ESCHAN_GHRAH         = GetTableOfIDs('Eschan_Ghrah'),
        ESCHAN_PHUABO        = GetTableOfIDs('Eschan_Phuabo'),
        ESCHAN_XZOMIT        = GetTableOfIDs('Eschan_Xzomit'),
        ESCHAN_YOVRA         = GetTableOfIDs('Eschan_Yovra'),
        ESCHAN_CLIONID       = GetTableOfIDs('Eschan_Clionid'),
        ESCHAN_MUREX         = GetTableOfIDs('Eschan_Murex'),
        ESCHAN_HPEMDE        = GetTableOfIDs('Eschan_Hpemde'),
        ESCHAN_ZDEI          = GetTableOfIDs('Eschan_Zdei'),
        MIREU                = GetFirstID('Mireu'),
        NAGA_RAJA            = GetFirstID('Naga_Raja'),
    },
    npc =
    {
    },
}

return zones[xi.zone.ESCHA_RUAUN]
