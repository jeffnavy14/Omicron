-----------------------------------
-- Unity Wanted Battles Global
-----------------------------------
require('scripts/globals/npc_util')
require('scripts/utils/utils') -- file dir changed
require('scripts/globals/player')
-----------------------------------

xi = xi or {}
xi.unitywanted = xi.unitywanted or {}


xi.unitywanted.npc =
{
[xi.zone.ALZADAAL_UNDERSEA_RUINS] =
{
{VIDMAPIRE_1_QM = 17072390},
{VIDMAPIRE_2_QM = 17072391},
{VIDMAPIRE_3_QM = 17072392},
},
[xi.zone.ATTOHWA_CHASM] =
{
{MUUT_1_QM = 16806389},
{MUUT_2_QM = 16806390},
{MUUT_3_QM = 16806391},
},
--[xi.zone.AYDEEWA_SUBTERRANE�] =
--{
        --------------------------------------------
--},
[xi.zone.BATALLIA_DOWNS] =
{
{LUMBER_JILL_1_QM = 17207878}, -- updated
{LUMBER_JILL_2_QM = 17207879}, -- updated
{LUMBER_JILL_3_QM = 17207880}, -- updated
},
[xi.zone.BEAUCEDINE_GLACIER] =
{
{LARGANTUA_1_QM = 17232296}, -- updated
{LARGANTUA_2_QM = 17232297}, -- updated
{LARGANTUA_3_QM = 17232298}, -- updated
},
[xi.zone.BEHEMOTHS_DOMINION] =
{
{SOVEREIGN_BEHEMOTH_1_QM = 17297497},
{SOVEREIGN_BEHEMOTH_2_QM = 17297498},
{SOVEREIGN_BEHEMOTH_3_QM = 17297499},
},
[xi.zone.BIBIKI_BAY] =
{
{INTUILA_1_QM = 16794044},
{INTUILA_2_QM = 16794045},
{INTUILA_3_QM = 16794046},
},
[xi.zone.BOSTAUNIEUX_OUBLIETTE] =
{
{GARBAGE_GEL_1_QM = 17461593},
{GARBAGE_GEL_2_QM = 17461594},
{GARBAGE_GEL_3_QM = 17461595},
},
[xi.zone.BUBURIMU_PENINSULA] =
{
{ABYSSDIVER_1_QM = 17261206}, -- updated
{ABYSSDIVER_2_QM = 17261207}, -- updated
{ABYSSDIVER_3_QM = 17261208}, -- updated
},
[xi.zone.CAEDARVA_MIRE] =
{
{SHEDU_1_QM = 17101404},
{SHEDU_2_QM = 17101405},
{SHEDU_3_QM = 17101406},
},
[xi.zone.CAPE_TERIGGAN] =
{
{GLAZEMANE_1_QM = 17240524},
{GLAZEMANE_2_QM = 17240525},
{GLAZEMANE_3_QM = 17240526},
{VEDRFOLNIR_1_QM = 17240524},
{VEDRFOLNIR_2_QM = 17240525},
{VEDRFOLNIR_3_QM = 17240526},
},
[xi.zone.CARPENTERS_LANDING] =
{
{ORCFELTRAP_1_QM = 16785786},
{ORCFELTRAP_2_QM = 16785787},
{ORCFELTRAP_3_QM = 16785788},
},
[xi.zone.DEN_OF_RANCOR] =
{
{AZRAEL_1_QM = 17433102},
{AZRAEL_2_QM = 17433103},
{AZRAEL_3_QM = 17433104},
},
[xi.zone.EAST_RONFAURE] =
{
{HUGEMAW_HAROLD_1_QM = 17191542}, -- updated
{HUGEMAW_HAROLD_2_QM = 17191543}, -- updated
{HUGEMAW_HAROLD_3_QM = 17191544}, -- updated
},
[xi.zone.EAST_SARUTABARUTA] =
{
{PRICKLY_PITRIV_1_QM = 17253078}, -- updated
{PRICKLY_PITRIV_2_QM = 17253079}, -- updated
{PRICKLY_PITRIV_3_QM = 17253080}, -- updated
},
[xi.zone.EASTERN_ALTEPA_DESERT] =
{
{CACTROT_VELOZ_1_QM = 17244661}, -- updated
{CACTROT_VELOZ_2_QM = 17244662}, -- updated
{CACTROT_VELOZ_3_QM = 17244663}, -- updated
},
[xi.zone.FEIYIN] =
{
{BOREALIS_SHADOW_1_QM = 17613282},
{BOREALIS_SHADOW_2_QM = 17613283},
{BOREALIS_SHADOW_3_QM = 17613284},
{CAROUSING_CELINE_1_QM = 17613282},
{CAROUSING_CELINE_2_QM = 17613283},
{CAROUSING_CELINE_3_QM = 17613284},
},
[xi.zone.GARLAIGE_CITADEL] =
{
{MEPHITAS_1_QM = 17596876},
{MEPHITAS_2_QM = 17596877},
{MEPHITAS_3_QM = 17596878},
},
[xi.zone.GUSTAV_TUNNEL] =
{
{WYVERNHUNTER_BAMBROX_1_QM = 17645908},
{WYVERNHUNTER_BAMBROX_2_QM = 17645909},
{WYVERNHUNTER_BAMBROX_3_QM = 17645910},
},
[xi.zone.IFRITS_CAULDRON] =
{
{COCA_1_QM = 17617281},
{COCA_2_QM = 17617282},
{COCA_3_QM = 17617283},
},
[xi.zone.JUGNER_FOREST] =
{
{EMPEROR_ARTHRO_1_QM = 17203896}, -- updated
{EMPEROR_ARTHRO_2_QM = 17203897}, -- updated
{EMPEROR_ARTHRO_3_QM = 17203898}, -- updated
},
[xi.zone.KONSCHTAT_HIGHLANDS] =
{
{SLEEPY_MABEL_1_QM = 17220173},
{SLEEPY_MABEL_2_QM = 17220174},
{SLEEPY_MABEL_3_QM = 17220175},
},
[xi.zone.KUFTAL_TUNNEL] =
{
{SPECTER_WORM_1_QM = 17490331},
{SPECTER_WORM_2_QM = 17490332},
{SPECTER_WORM_3_QM = 17490333},
},
[xi.zone.LA_THEINE_PLATEAU] =
{
{IRONHORN_BALDURNO_1_QM = 17195685}, -- updated
{IRONHORN_BALDURNO_2_QM = 17195686}, -- updated
{IRONHORN_BALDURNO_3_QM = 17195687}, -- updated
},
[xi.zone.LABYRINTH_OF_ONZOZO] =
{
{VOSO_1_QM = 17649908},
{VOSO_2_QM = 17649909},
{VOSO_3_QM = 17649910},
},
[xi.zone.LUFAISE_MEADOWS] =
{
{IMMANIBUGARD_1_QM = 16875918},
{IMMANIBUGARD_2_QM = 16875919},
{IMMANIBUGARD_3_QM = 16875920},
{VERMILLION_FISHFLY_1_QM = 16875918},
{VERMILLION_FISHFLY_2_QM = 16875919},
{VERMILLION_FISHFLY_3_QM = 16875920},
},
[xi.zone.MERIPHATAUD_MOUNTAINS] =
{
{WARBLADE_BEAK_1_QM = 17265299}, -- updated
{WARBLADE_BEAK_2_QM = 17265300}, -- updated
{WARBLADE_BEAK_3_QM = 17265301}, -- updated
},
[xi.zone.MISAREAUX_COAST] =
{
{TIYANAK_1_QM = 16879997},
{TIYANAK_2_QM = 16879998},
{TIYANAK_3_QM = 16879999},
{VOLATILE_CLUSTER_1_QM = 16879997},
{VOLATILE_CLUSTER_2_QM = 16879998},
{VOLATILE_CLUSTER_3_QM = 16879999},
},
[xi.zone.MOUNT_ZHAYOLM] =
{
{GRAND_GRENADE_1_QM = 17027633},
{GRAND_GRENADE_2_QM = 17027634},
{GRAND_GRENADE_3_QM = 17027635},
{SARAMA_1_QM = 17027633},
{SARAMA_2_QM = 17027634},
{SARAMA_3_QM = 17027635},
},
[xi.zone.PASHHOW_MARSHLANDS] =
{
{JOYOUS_GREEN_1_QM = 17224358}, -- updated
{JOYOUS_GREEN_2_QM = 17224359}, -- updated
{JOYOUS_GREEN_3_QM = 17224360}, -- updated
},
[xi.zone.QUFIM_ISLAND] =
{
{JESTER_MALATRIX_1_QM = 17293791}, -- updated
{JESTER_MALATRIX_2_QM = 17293792}, -- updated
{JESTER_MALATRIX_3_QM = 17293793}, -- updated
},
[xi.zone.QUICKSAND_CAVES] =
{
{CENTURIO_XXI_1_QM = 17629791},
{CENTURIO_XXI_2_QM = 17629792},
{CENTURIO_XXI_3_QM = 17629793},
},
[xi.zone.ROMAEVE] =
{
{DOUMA_WEAPON_1_QM = 17277235},
{DOUMA_WEAPON_2_QM = 17277236},
{DOUMA_WEAPON_3_QM = 17277237},
},
[xi.zone.ROLANBERRY_FIELDS] =
{
{STRIX_1_QM = 17228385}, -- updated
{STRIX_2_QM = 17228386}, -- updated
{STRIX_3_QM = 17228387}, -- updated
},
[xi.zone.SAUROMUGUE_CHAMPAIGN] =
{
{ARKE_1_QM = 17269270}, -- updated
{ARKE_2_QM = 17269271}, -- updated
{ARKE_3_QM = 17269272}, -- updated
},
[xi.zone.SEA_SERPENT_GROTTO] =
{
{BAKUNAWA_1_QM = 17498679},
{BAKUNAWA_2_QM = 17498680},
{BAKUNAWA_3_QM = 17498681},
},
[xi.zone.SOUTH_GUSTABERG] =
{
{BOUNDING_BELINDA_1_QM = 17216189}, -- updated
{BOUNDING_BELINDA_2_QM = 17216190}, -- updated
{BOUNDING_BELINDA_3_QM = 17216191}, -- updated
},
[xi.zone.TAHRONGI_CANYON] =
{
{SERPOPARD_NINLIL_1_QM = 17257083}, -- updated
{SERPOPARD_NINLIL_2_QM = 17257084}, -- updated
{SERPOPARD_NINLIL_3_QM = 17257085}, -- updated
},
[xi.zone.TEMPLE_OF_UGGALEPIH] =
{
{AZURETOOTHED_CLAWBERRY_1_QM = 17429036},
{AZURETOOTHED_CLAWBERRY_2_QM = 17429037},
{AZURETOOTHED_CLAWBERRY_3_QM = 17429038},
},
[xi.zone.THE_BOYAHDA_TREE] =
{
{AYAPEC_1_QM = 17404422},
{AYAPEC_2_QM = 17404423},
{AYAPEC_3_QM = 17404424},
{HIDHAEGG_1_QM = 17404422},
{HIDHAEGG_2_QM = 17404423},
{HIDHAEGG_3_QM = 17404424},
},
[xi.zone.THE_SANCTUARY_OF_ZITAH] =
{
{KEEPER_OF_HEILIGTUM_1_QM = 17273424}, -- updated
{KEEPER_OF_HEILIGTUM_2_QM = 17273425}, -- updated
{KEEPER_OF_HEILIGTUM_3_QM = 17273426}, -- updated
},
[xi.zone.ULEGUERAND_RANGE] =
{
{CAMAHUETO_1_QM = 16798157},
{CAMAHUETO_2_QM = 16798158},
{CAMAHUETO_3_QM = 16798159},
},
[xi.zone.VALKURM_DUNES] =
{
{VALKURM_IMPERATOR_1_QM = 17199759},
{VALKURM_IMPERATOR_2_QM = 17199760},
{VALKURM_IMPERATOR_3_QM = 17199761},
},
[xi.zone.VALLEY_OF_SORROWS] =
{
{TOLBA_1_QM = 17301599},
{TOLBA_2_QM = 17301600},
{TOLBA_3_QM = 17301601},
},
[xi.zone.WAJAOM_WOODLANDS] =
{
{KUBOOL_JAS_MHUUFYA_1_QM = 16986835},
{KUBOOL_JAS_MHUUFYA_2_QM = 16986836},
{KUBOOL_JAS_MHUUFYA_3_QM = 16986837},
{THUBAN_1_QM = 16986835},
{THUBAN_2_QM = 16986836},
{THUBAN_3_QM = 16986837},
},
[xi.zone.WESTERN_ALTEPA_DESERT] =
{
{KING_UROPYGID_1_QM = 17289805}, -- updated
{KING_UROPYGID_2_QM = 17289806}, -- updated
{KING_UROPYGID_3_QM = 17289807}, -- updated
},
[xi.zone.XARCABARD] =
{
{BEIST_1_QM = 17236357}, -- updated
{BEIST_2_QM = 17236358}, -- updated
{BEIST_3_QM = 17236359}, -- updated
},
[xi.zone.YHOATOR_JUNGLE] =
{
{WOODLAND_MENDER_1_QM = 17285706}, -- updated
{WOODLAND_MENDER_2_QM = 17285707}, -- updated
{WOODLAND_MENDER_3_QM = 17285708}, -- updated
},
[xi.zone.YUHTUNGA_JUNGLE] =
{
{SYBARITIC_SAMANTHA_1_QM = 17281662},
{SYBARITIC_SAMANTHA_2_QM = 17281663},
{SYBARITIC_SAMANTHA_3_QM = 17281664},
},
}
------------------------------------------------------------------------------------------
xi.unitywanted.mob =
{
[xi.zone.ALZADAAL_UNDERSEA_RUINS] =
{
{VIDMAPIRE_1 = 17072180},
{VIDMAPIRE_2 = 17072181},
{VIDMAPIRE_3 = 17072182},
},
[xi.zone.ATTOHWA_CHASM] =
{
{MUUT_1 = 16806262},
{MUUT_2 = 16806271},
{MUUT_3 = 16806280},
},
--[xi.zone.AYDEEWA_SUBTERRANE�] =
--{
    --------------------------------------------
--},
[xi.zone.BATALLIA_DOWNS] =
{
{LUMBER_JILL_1 = 17207726},
{LUMBER_JILL_2 = 17207727},
{LUMBER_JILL_3 = 17207728},
},
[xi.zone.BEAUCEDINE_GLACIER] =
{
{LARGANTUA_1 = 17232163},
{LARGANTUA_2 = 17232164},
{LARGANTUA_3 = 17232175},
},
[xi.zone.BEHEMOTHS_DOMINION] =
{
{SOVEREIGN_BEHEMOTH_1 = 17297455},
{SOVEREIGN_BEHEMOTH_2 = 17297456},
{SOVEREIGN_BEHEMOTH_3 = 17297457},
},
[xi.zone.BIBIKI_BAY] =
{
{INTUILA_1 = 16793965},
{INTUILA_2 = 16793966},
{INTUILA_3 = 16793967},
},
[xi.zone.BOSTAUNIEUX_OUBLIETTE] =
{
{GARBAGE_GEL_1 = 17461480},
{GARBAGE_GEL_2 = 17461481},
{GARBAGE_GEL_3 = 17461482},
},
[xi.zone.BUBURIMU_PENINSULA] =
{
{ABYSSDIVER_1 = 17261050},
{ABYSSDIVER_2 = 17261051},
{ABYSSDIVER_3 = 17261052},
},
[xi.zone.CAEDARVA_MIRE] =
{
{SHEDU_1 = 17101232},
{SHEDU_2 = 17101233},
{SHEDU_3 = 17101234},
},
[xi.zone.CAPE_TERIGGAN] =
{
{GLAZEMANE_1 = 17240438},
{GLAZEMANE_2 = 17240439},
{GLAZEMANE_3 = 17240440},
{VEDRFOLNIR_1 = 17240435},
{VEDRFOLNIR_2 = 17240436},
{VEDRFOLNIR_3 = 17240437},
},
[xi.zone.CARPENTERS_LANDING] =
{
{ORCFELTRAP_1 = 16785724},
{ORCFELTRAP_2 = 16785725},
{ORCFELTRAP_3 = 16785726},
},
[xi.zone.DEN_OF_RANCOR] =
{
{AZRAEL_1 = 17433007},
{AZRAEL_2 = 17433008},
{AZRAEL_3 = 17433009},
},
[xi.zone.EAST_RONFAURE] =
{
{HUGEMAW_HAROLD_1 = 17191471},
{HUGEMAW_HAROLD_2 = 17191472},
{HUGEMAW_HAROLD_3 = 17191473},
},
[xi.zone.EAST_SARUTABARUTA] =
{
{PRICKLY_PITRIV_1 = 17252988},
{PRICKLY_PITRIV_2 = 17252989},
{PRICKLY_PITRIV_3 = 17252990},
},
[xi.zone.EASTERN_ALTEPA_DESERT] =
{
{CACTROT_VELOZ_1 = 17244582},
{CACTROT_VELOZ_2 = 17244583},
{CACTROT_VELOZ_3 = 17244584},
},
[xi.zone.FEIYIN] =
{
{BOREALIS_SHADOW_1 = 17613131},
{BOREALIS_SHADOW_2 = 17613135},
{BOREALIS_SHADOW_3 = 17613139},
{CAROUSING_CELINE_1 = 17613142},
{CAROUSING_CELINE_2 = 17613143},
{CAROUSING_CELINE_3 = 17613144},
},
[xi.zone.GARLAIGE_CITADEL] =
{
{MEPHITAS_1 = 17596733},
{MEPHITAS_2 = 17596734},
{MEPHITAS_3 = 17596735},
},
[xi.zone.GUSTAV_TUNNEL] =
{
{WYVERNHUNTER_BAMBROX_1 = 17645822},
{WYVERNHUNTER_BAMBROX_2 = 17645831},
{WYVERNHUNTER_BAMBROX_3 = 17645840},
},
[xi.zone.IFRITS_CAULDRON] =
{
{COCA_1 = 17617175},
{COCA_2 = 17617176},
{COCA_3 = 17617177},
},
[xi.zone.JUGNER_FOREST] =
{
{EMPEROR_ARTHRO_1 = 17203699},
{EMPEROR_ARTHRO_2 = 17203700},
{EMPEROR_ARTHRO_3 = 17203701},
},
[xi.zone.KONSCHTAT_HIGHLANDS] =
{
{SLEEPY_MABEL_1 = 17220096},
{SLEEPY_MABEL_2 = 17220097},
{SLEEPY_MABEL_3 = 17220098},
},
[xi.zone.KUFTAL_TUNNEL] =
{
{SPECTER_WORM_1 = 17490248},
{SPECTER_WORM_2 = 17490249},
{SPECTER_WORM_3 = 17490250},
},
[xi.zone.LA_THEINE_PLATEAU] =
{
{IRONHORN_BALDURNO_1 = 17195570},
{IRONHORN_BALDURNO_2 = 17195571},
{IRONHORN_BALDURNO_3 = 17195572},
},
[xi.zone.LABYRINTH_OF_ONZOZO] =
{
{VOSO_1 = 17649862},
{VOSO_2 = 17649863},
{VOSO_3 = 17649864},
},
[xi.zone.LUFAISE_MEADOWS] =
{
{IMMANIBUGARD_1 = 16875789},
{IMMANIBUGARD_2 = 16875790},
{IMMANIBUGARD_3 = 16875791},
{VERMILLION_FISHFLY_1 = 16875792},
{VERMILLION_FISHFLY_2 = 16875802},
{VERMILLION_FISHFLY_3 = 16875812},
},
[xi.zone.MERIPHATAUD_MOUNTAINS] =
{
{WARBLADE_BEAK_1 = 17265133},
{WARBLADE_BEAK_2 = 17265134},
{WARBLADE_BEAK_3 = 17265135},
},
[xi.zone.MISAREAUX_COAST] =
{
{TIYANAK_1 = 16879910},
{TIYANAK_2 = 16879911},
{TIYANAK_3 = 16879912},
{VOLATILE_CLUSTER_1 = 16879913},
{VOLATILE_CLUSTER_2 = 16879914},
{VOLATILE_CLUSTER_3 = 16879915},
},
[xi.zone.MOUNT_ZHAYOLM] =
{
{GRAND_GRENADE_1 = 17027501},
{GRAND_GRENADE_2 = 17027502},
{GRAND_GRENADE_3 = 17027503},
{SARAMA_1 = 17027504},
{SARAMA_2 = 17027505},
{SARAMA_3 = 17027506},
},
[xi.zone.PASHHOW_MARSHLANDS] =
{
{JOYOUS_GREEN_1 = 17224188},
{JOYOUS_GREEN_2 = 17224189},
{JOYOUS_GREEN_3 = 17224190},
},
[xi.zone.QUFIM_ISLAND] =
{
{JESTER_MALATRIX_1 = 17293663},
{JESTER_MALATRIX_2 = 17293664},
{JESTER_MALATRIX_3 = 17293665},
},
[xi.zone.QUICKSAND_CAVES] =
{
{CENTURIO_XXI_1 = 17629655},
{CENTURIO_XXI_2 = 17629656},
{CENTURIO_XXI_3 = 17629657},
},
[xi.zone.ROMAEVE] =
{
{DOUMA_WEAPON_1 = 17277147},
{DOUMA_WEAPON_2 = 17277154},
{DOUMA_WEAPON_3 = 17277161},
},
[xi.zone.ROLANBERRY_FIELDS] =
{
{STRIX_1 = 17228265},
{STRIX_2 = 17228266},
{STRIX_3 = 17228267},
},
[xi.zone.SAUROMUGUE_CHAMPAIGN] =
{
{ARKE_1 = 17269130},
{ARKE_2 = 17269131},
{ARKE_3 = 17269132},
},
[xi.zone.SEA_SERPENT_GROTTO] =
{
{BAKUNAWA_1 = 17498567},
{BAKUNAWA_2 = 17498570},
{BAKUNAWA_3 = 17498573},
},
[xi.zone.SOUTH_GUSTABERG] =
{
{BOUNDING_BELINDA_1 = 17216127},
{BOUNDING_BELINDA_2 = 17216128},
{BOUNDING_BELINDA_3 = 17216129},
},
[xi.zone.TAHRONGI_CANYON] =
{
{SERPOPARD_NINLIL_1 = 17256995},
{SERPOPARD_NINLIL_2 = 17256996},
{SERPOPARD_NINLIL_3 = 17256997},
},
[xi.zone.TEMPLE_OF_UGGALEPIH] =
{
{AZURETOOTHED_CLAWBERRY_1 = 17428836},
{AZURETOOTHED_CLAWBERRY_2 = 17428843},
{AZURETOOTHED_CLAWBERRY_3 = 17428850},
},
[xi.zone.THE_BOYAHDA_TREE] =
{
{AYAPEC_1 = 17404348},
{AYAPEC_2 = 17404349},
{AYAPEC_3 = 17404350},
{HIDHAEGG_1 = 17404351},
{HIDHAEGG_2 = 17404352},
{HIDHAEGG_3 = 17404353},
},
[xi.zone.THE_SANCTUARY_OF_ZITAH] =
{
{KEEPER_OF_HEILIGTUM_1 = 17273324},
{KEEPER_OF_HEILIGTUM_2 = 17273325},
{KEEPER_OF_HEILIGTUM_3 = 17273326},
},
[xi.zone.ULEGUERAND_RANGE] =
{
{CAMAHUETO_1 = 16798093},
{CAMAHUETO_2 = 16798094},
{CAMAHUETO_3 = 16798095},
},
[xi.zone.VALKURM_DUNES] =
{
{VALKURM_IMPERATOR_1 = 17199659},
{VALKURM_IMPERATOR_2 = 17199660},
{VALKURM_IMPERATOR_3 = 17199661},
},
[xi.zone.VALLEY_OF_SORROWS] =
{
{TOLBA_1 = 17301540},
{TOLBA_2 = 17301541},
{TOLBA_3 = 17301542},
},
[xi.zone.WAJAOM_WOODLANDS] =
{
{KUBOOL_JAS_MHUUFYA_1 = 16986595},
{KUBOOL_JAS_MHUUFYA_2 = 16986596},
{KUBOOL_JAS_MHUUFYA_3 = 16986597},
{THUBAN_1 = 16986601},
{THUBAN_2 = 16986602},
{THUBAN_3 = 16986603},
},
[xi.zone.WESTERN_ALTEPA_DESERT] =
{
{KING_UROPYGID_1 = 17289676},
{KING_UROPYGID_2 = 17289677},
{KING_UROPYGID_3 = 17289678},
},
[xi.zone.XARCABARD] =
{
{BEIST_1 = 17236242},
{BEIST_2 = 17236243},
{BEIST_3 = 17236244},
},
[xi.zone.YHOATOR_JUNGLE] =
{
{WOODLAND_MENDER_1 = 17285605},
{WOODLAND_MENDER_2 = 17285606},
{WOODLAND_MENDER_3 = 17285607},
},
[xi.zone.YUHTUNGA_JUNGLE] =
{
{SYBARITIC_SAMANTHA_1 = 17281512},
{SYBARITIC_SAMANTHA_2 = 17281513},
{SYBARITIC_SAMANTHA_3 = 17281514},
},
}

local uwej = 
{
{16785786, ORCFELTRAP_1_QM,              900, 1500, 16785724, ORCFELTRAP_1, 827, 119},
{16785787, ORCFELTRAP_2_QM,              900, 1500, 16785725, ORCFELTRAP_2, 827, 119},
{16785788, ORCFELTRAP_3_QM,              900, 1500, 16785726, ORCFELTRAP_3, 827, 119},
{16794044, INTUILA_1_QM,                 900, 1500, 16793965, INTUILA_1, 825, 119},
{16794045, INTUILA_2_QM,                 900, 1500, 16793966, INTUILA_2, 825, 119},
{16794046, INTUILA_3_QM,                 900, 1500, 16793967, INTUILA_3, 825, 119},
{16798157, CAMAHUETO_1_QM,               900, 2400, 16798093, CAMAHUETO_1, 862, 128},
{16798158, CAMAHUETO_2_QM,               900, 2400, 16798094, CAMAHUETO_2, 862, 128},
{16798159, CAMAHUETO_3_QM,               900, 2400, 16798095, CAMAHUETO_3, 862, 128},
{16806389, MUUT_1_QM,                    900, 2100, 16806262, MUUT_1, 861, 125},
{16806390, MUUT_2_QM,                    900, 2100, 16806271, MUUT_2, 861, 125},
{16806391, MUUT_3_QM,                    900, 2100, 16806280, MUUT_3, 861, 125},
{16875918, VERMILLION_FISHFLY_1_QM,      900, 2100, 16875792, VERMILLION_FISHFLY_1, 894, 125},
{16875919, VERMILLION_FISHFLY_2_QM,      900, 2100, 16875802, VERMILLION_FISHFLY_2, 894, 125},
{16875920, VERMILLION_FISHFLY_3_QM,      900, 2100, 16875812, VERMILLION_FISHFLY_3, 894, 125},
{16875918, IMMANIBUGARD_1_QM,            900, 1500, 16875789, IMMANIBUGARD_1, 859, 119},
{16875919, IMMANIBUGARD_2_QM,            900, 1500, 16875790, IMMANIBUGARD_2, 859, 119},
{16875920, IMMANIBUGARD_3_QM,            900, 1500, 16875791, IMMANIBUGARD_3, 859, 119},
{16879997, VOLATILE_CLUSTER_1_QM,        900, 2400, 16879913, VOLATILE_CLUSTER_1, 895, 128},
{16879998, VOLATILE_CLUSTER_2_QM,        900, 2400, 16879914, VOLATILE_CLUSTER_2, 895, 128},
{16879999, VOLATILE_CLUSTER_3_QM,        900, 2400, 16879915, VOLATILE_CLUSTER_3, 895, 128},
{16879997, TIYANAK_1_QM,                 900, 1800, 16879910, TIYANAK_1, 860, 122},
{16879998, TIYANAK_2_QM,                 900, 1800, 16879911, TIYANAK_2, 860, 122},
{16879999, TIYANAK_3_QM,                 900, 1800, 16879912, TIYANAK_3, 860, 122},
{16986835, KUBOOL_JAS_MHUUFYA_1_QM,      900, 2100, 16986595, KUBOOL_JAS_MHUUFYA_1, 896, 125},
{16986836, KUBOOL_JAS_MHUUFYA_2_QM,      900, 2100, 16986596, KUBOOL_JAS_MHUUFYA_2, 896, 125},
{16986837, KUBOOL_JAS_MHUUFYA_3_QM,      900, 2100, 16986597, KUBOOL_JAS_MHUUFYA_3, 896, 125},
{16986835, THUBAN_1_QM,                 1800, 3100, 16986601, THUBAN_1, 921, 135},
{16986836, THUBAN_2_QM,                 1800, 3100, 16986602, THUBAN_2, 921, 135},
{16986837, THUBAN_3_QM,                 1800, 3100, 16986603, THUBAN_3, 921, 135},
{17027633, GRAND_GRENADE_1_QM,           900, 2400, 17027501, GRAND_GRENADE_1, 897, 128},
{17027634, GRAND_GRENADE_2_QM,           900, 2400, 17027502, GRAND_GRENADE_2, 897, 128},
{17027635, GRAND_GRENADE_3_QM,           900, 2400, 17027503, GRAND_GRENADE_3, 897, 128},
{17027633, SARAMA_1_QM,                 1800, 3100, 17027504, SARAMA_1, 922, 135},
{17027634, SARAMA_2_QM,                 1800, 3100, 17027505, SARAMA_2, 922, 135},
{17027635, SARAMA_3_QM,                 1800, 3100, 17027506, SARAMA_3, 922, 135},
{17072390, VIDMAPIRE_1_QM,               900, 2400, 17072180, VIDMAPIRE_1, 899, 128},
{17072391, VIDMAPIRE_2_QM,               900, 2400, 17072181, VIDMAPIRE_2, 899, 128},
{17072392, VIDMAPIRE_3_QM,               900, 2400, 17072182, VIDMAPIRE_3, 899, 128},
{17101404, SHEDU_1_QM,                  1800, 3100, 17101232, SHEDU_1, 923, 135},
{17101405, SHEDU_2_QM,                  1800, 3100, 17101233, SHEDU_2, 923, 135},
{17101406, SHEDU_3_QM,                  1800, 3100, 17101234, SHEDU_3, 923, 135},
{17191542, HUGEMAW_HAROLD_1_QM,          900,  200, 17191471, HUGEMAW_HAROLD_1, 817, 99},
{17191543, HUGEMAW_HAROLD_2_QM,          900,  200, 17191472, HUGEMAW_HAROLD_2, 817, 99},
{17191544, HUGEMAW_HAROLD_3_QM,          900,  200, 17191473, HUGEMAW_HAROLD_3, 817, 99},
{17195685, IRONHORN_BALDURNO_1_QM,       900,  400, 17195570, IRONHORN_BALDURNO_1, 820, 99},
{17195686, IRONHORN_BALDURNO_2_QM,       900,  400, 17195571, IRONHORN_BALDURNO_2, 820, 99},
{17195687, IRONHORN_BALDURNO_3_QM,       900,  400, 17195572, IRONHORN_BALDURNO_3, 820, 99},
{17199760, VALKURM_IMPERATOR_2_QM,       900, 1500, 17199660, VALKURM_IMPERATOR_2, 822, 119},
{17199759, VALKURM_IMPERATOR_1_QM,       900, 1500, 17199659, VALKURM_IMPERATOR_1, 822, 119},
{17199761, VALKURM_IMPERATOR_3_QM,       900, 1500, 17199661, VALKURM_IMPERATOR_3, 822, 119},
{17203896, EMPEROR_ARTHRO_1_QM,          900, 1800, 17203699, EMPEROR_ARTHRO_1, 826, 122},
{17203897, EMPEROR_ARTHRO_2_QM,          900, 1800, 17203700, EMPEROR_ARTHRO_2, 826, 122},
{17203898, EMPEROR_ARTHRO_3_QM,          900, 1800, 17203701, EMPEROR_ARTHRO_3, 826, 122},
{17207878, LUMBER_JILL_1_QM,             900, 2100, 17207726, LUMBER_JILL_1, 828, 125},
{17207879, LUMBER_JILL_2_QM,             900, 2100, 17207727, LUMBER_JILL_2, 828, 125},
{17207880, LUMBER_JILL_3_QM,             900, 2100, 17207728, LUMBER_JILL_3, 828, 125},
{17216189, BOUNDING_BELINDA_1_QM,        900,  200, 17216127, BOUNDING_BELINDA_1, 818, 99},
{17216190, BOUNDING_BELINDA_2_QM,        900,  200, 17216128, BOUNDING_BELINDA_2, 818, 99},
{17216191, BOUNDING_BELINDA_3_QM,        900,  200, 17216129, BOUNDING_BELINDA_3, 818, 99},
{17220173, SLEEPY_MABEL_1_QM,            900,  400, 17220096, SLEEPY_MABEL_1, 821, 99},
{17220174, SLEEPY_MABEL_2_QM,            900,  400, 17220097, SLEEPY_MABEL_2, 821, 99},
{17220175, SLEEPY_MABEL_3_QM,            900,  400, 17220098, SLEEPY_MABEL_3, 821, 99},
{17224358, JOYOUS_GREEN_1_QM,            900, 1800, 17224188, JOYOUS_GREEN_1, 829, 122},
{17224359, JOYOUS_GREEN_2_QM,            900, 1800, 17224189, JOYOUS_GREEN_2, 829, 122},
{17224360, JOYOUS_GREEN_3_QM,            900, 1800, 17224190, JOYOUS_GREEN_3, 829, 122},
{17228388, STRIX_1_QM,                   900, 2100, 17228265, STRIX_1, 830, 125},
{17228386, STRIX_2_QM,                   900, 2100, 17228266, STRIX_2, 830, 125},
{17228387, STRIX_3_QM,                   900, 2100, 17228267, STRIX_3, 830, 125},
{17232296, LARGANTUA_1_QM,               900, 2100, 17232163, LARGANTUA_1, 833, 125},
{17232297, LARGANTUA_2_QM,               900, 2100, 17232164, LARGANTUA_2, 833, 125},
{17232298, LARGANTUA_3_QM,               900, 2100, 17232165, LARGANTUA_3, 833, 125},
{17236357, BEIST_1_QM,                   900, 2100, 17236242, BEIST_1, 834, 125},
{17236358, BEIST_2_QM,                   900, 2100, 17236243, BEIST_2, 834, 125},
{17236359, BEIST_3_QM,                   900, 2100, 17236244, BEIST_3, 834, 125},
{17240524, VEDRFOLNIR_1_QM,              900, 2400, 17240435, VEDRFOLNIR_1, 858, 128},
{17240525, VEDRFOLNIR_2_QM,              900, 2400, 17240436, VEDRFOLNIR_2, 858, 128},
{17240526, VEDRFOLNIR_3_QM,              900, 2400, 17240437, VEDRFOLNIR_3, 858, 128},
{17240524, GLAZEMANE_1_QM,               900, 2400, 17240438, GLAZEMANE_1, 919, 128},
{17240525, GLAZEMANE_2_QM,               900, 2400, 17240439, GLAZEMANE_2, 919, 128},
{17240526, GLAZEMANE_3_QM,               900, 2400, 17240440, GLAZEMANE_3, 919, 128},
{17244661, CACTROT_VELOZ_1_QM,           900, 1800, 17244582, CACTROT_VELOZ_1, 836, 122},
{17244662, CACTROT_VELOZ_2_QM,           900, 1800, 17244583, CACTROT_VELOZ_2, 836, 122},
{17244663, CACTROT_VELOZ_3_QM,           900, 1800, 17244584, CACTROT_VELOZ_3, 836, 122},
{17253078, PRICKLY_PITRIV_1_QM,          900,  200, 17252988, PRICKLY_PITRIV_1, 819, 99},
{17253079, PRICKLY_PITRIV_2_QM,          900,  200, 17252989, PRICKLY_PITRIV_2, 819, 99},
{17253080, PRICKLY_PITRIV_3_QM,          900,  200, 17252990, PRICKLY_PITRIV_3, 819, 99},
{17257083, SERPOPARD_NINLIL_1_QM,        900,  400, 17256995, SERPOPARD_NINLIL_1, 823, 99},
{17257084, SERPOPARD_NINLIL_2_QM,        900,  400, 17256996, SERPOPARD_NINLIL_2, 823, 99},
{17257085, SERPOPARD_NINLIL_3_QM,        900,  400, 17256997, SERPOPARD_NINLIL_3, 823, 99},
{17261206, ABYSSDIVER_1_QM,              900, 1500, 17261050, ABYSSDIVER_1, 824, 119},
{17261207, ABYSSDIVER_2_QM,              900, 1500, 17261051, ABYSSDIVER_2, 824, 119},
{17261208, ABYSSDIVER_3_QM,              900, 1500, 17261052, ABYSSDIVER_3, 824, 119},
{17265299, WARBLADE_BEAK_1_QM,           900, 1800, 17265134, WARBLADE_BEAK_2, 831, 122},
{17265300, WARBLADE_BEAK_2_QM,           900, 1800, 17265135, WARBLADE_BEAK_3, 831, 122},
{17265301, WARBLADE_BEAK_3_QM,           900, 1800, 17265133, WARBLADE_BEAK_1, 831, 122},
{17269271, ARKE_2_QM,                    900, 2100, 17269131, ARKE_2, 832, 125},
{17269270, ARKE_1_QM,                    900, 2100, 17269130, ARKE_1, 832, 125},
{17269272, ARKE_3_QM,                    900, 2100, 17269132, ARKE_3, 832, 125},
{17273424, KEEPER_OF_HEILIGTUM_1_QM,     900, 1800, 17273324, KEEPER_OF_HEILIGTUM_1, 855, 122},
{17273425, KEEPER_OF_HEILIGTUM_2_QM,     900, 1800, 17273325, KEEPER_OF_HEILIGTUM_2, 855, 122},
{17273426, KEEPER_OF_HEILIGTUM_3_QM,     900, 1800, 17273326, KEEPER_OF_HEILIGTUM_3, 855, 122},
{17277235, DOUMA_WEAPON_1_QM,            900, 2100, 17277147, DOUMA_WEAPON_1, 856, 125},
{17277236, DOUMA_WEAPON_2_QM,            900, 2100, 17277154, DOUMA_WEAPON_2, 856, 125},
{17277237, DOUMA_WEAPON_3_QM,            900, 2100, 17277161, DOUMA_WEAPON_3, 856, 125},
{17281662, SYBARITIC_SAMANTHA_1_QM,      900, 1500, 17281512, SYBARITIC_SAMANTHA_1, 854, 119},
{17281663, SYBARITIC_SAMANTHA_2_QM,      900, 1500, 17281513, SYBARITIC_SAMANTHA_2, 854, 119},
{17281664, SYBARITIC_SAMANTHA_3_QM,      900, 1500, 17281514, SYBARITIC_SAMANTHA_3, 854, 119},
{17285706, WOODLAND_MENDER_1_QM,         900, 1800, 17285605, WOODLAND_MENDER_1, 837, 122},
{17285707, WOODLAND_MENDER_2_QM,         900, 1800, 17285606, WOODLAND_MENDER_2, 837, 122},
{17285708, WOODLAND_MENDER_3_QM,         900, 1800, 17285607, WOODLAND_MENDER_3, 837, 122},
{17289805, KING_UROPYGID_1_QM,           900, 2100, 17289676, KING_UROPYGID_1, 857, 125},
{17289806, KING_UROPYGID_2_QM,           900, 2100 ,17289677, KING_UROPYGID_2, 857, 125},
{17289807, KING_UROPYGID_3_QM,           900, 2100 ,17289678, KING_UROPYGID_3, 857, 125},
{17293791, JESTER_MALATRIX_1_QM,         900, 1500 ,17293663, JESTER_MALATRIX_1, 835, 119},
{17293792, JESTER_MALATRIX_2_QM,         900, 1500 ,17293664, JESTER_MALATRIX_2, 835, 119},
{17293793, JESTER_MALATRIX_3_QM,         900, 1500 ,17293665, JESTER_MALATRIX_3, 835, 119},
{17297497, SOVEREIGN_BEHEMOTH_1_QM,      900, 3100 ,17297455, SOVEREIGN_BEHEMOTH_1, 914, 135},
{17297498, SOVEREIGN_BEHEMOTH_2_QM,      900, 3100 ,17297456, SOVEREIGN_BEHEMOTH_2, 914, 135},
{17297499, SOVEREIGN_BEHEMOTH_3_QM,      900, 3100 ,17297457, SOVEREIGN_BEHEMOTH_3, 914, 135},
{17301599, TOLBA_1_QM,                  1800, 3100 ,17301540, TOLBA_1, 916, 135},
{17301600, TOLBA_2_QM,                  1800, 3100 ,17301541, TOLBA_2, 916, 135},
{17301601, TOLBA_3_QM,                  1800, 3100 ,17301542, TOLBA_3, 916, 135},
{17404422, HIDHAEGG_1_QM,               1800, 3100, 17404351, HIDHAEGG_1, 915, 135},
{17404423, HIDHAEGG_2_QM,               1800, 3100, 17404352, HIDHAEGG_2, 915, 135},
{17404424, HIDHAEGG_3_QM,               1800, 3100, 17404353, HIDHAEGG_3, 915, 135},
{17404422, AYAPEC_1_QM,                  900, 2100 ,17404348, AYAPEC_1, 866, 125},
{17404423, AYAPEC_2_QM,                  900, 2100, 17404349, AYAPEC_2, 866, 125},
{17404424, AYAPEC_3_QM,                  900, 2100, 17404350, AYAPEC_3, 866, 125},
{17429036, AZURETOOTHED_CLAWBERRY_1_QM,  900, 2100, 17428836, AZURETOOTHED_CLAWBERRY_1, 893, 125},
{17429037, AZURETOOTHED_CLAWBERRY_2_QM,  900, 2100, 17428843, AZURETOOTHED_CLAWBERRY_2, 893, 125},
{17429038, AZURETOOTHED_CLAWBERRY_3_QM,  900, 2100, 17428850, AZURETOOTHED_CLAWBERRY_3, 893, 125},
{17433102, AZRAEL_1_QM,                  900, 2400, 17433007, AZRAEL_1, 868, 128},
{17433103, AZRAEL_2_QM,                  900, 2400, 17433008, AZRAEL_2, 868, 128},
{17433104, AZRAEL_3_QM,                  900, 2400, 17433009, AZRAEL_3, 868, 128},
{17461593, GARBAGE_GEL_1_QM,             900, 1800, 17461480, GARBAGE_GEL_1, 891, 122},
{17461594, GARBAGE_GEL_2_QM,             900, 1800, 17461481, GARBAGE_GEL_2, 891, 122},
{17461595, GARBAGE_GEL_3_QM,             900, 1800, 17461482, GARBAGE_GEL_3, 891, 122},
{17490331, SPECTER_WORM_1_QM,            900, 2100, 17490248, SPECTER_WORM_1, 867, 125},
{17490332, SPECTER_WORM_2_QM,            900, 2100, 17490249, SPECTER_WORM_2, 867, 125},
{17490333, SPECTER_WORM_3_QM,            900, 2100, 17490250, SPECTER_WORM_3, 867, 125},
{17498679, BAKUNAWA_1_QM,                900, 2100, 17498567, BAKUNAWA_1, 892, 125},
{17498680, BAKUNAWA_2_QM,                900, 2100, 17498570, BAKUNAWA_2, 892, 125},
{17498681, BAKUNAWA_3_QM,                900, 2100, 17498573, BAKUNAWA_3, 892, 125},
{17596876, MEPHITAS_1_QM,                900, 2100, 17596733, MEPHITAS_1, 864, 125},
{17596877, MEPHITAS_2_QM,                900, 2100, 17596734, MEPHITAS_2, 864, 125},
{17596878, MEPHITAS_3_QM,                900, 2100, 17596735, MEPHITAS_3, 864, 125},
{17613282, BOREALIS_SHADOW_1_QM,         900, 2400, 17613131, BOREALIS_SHADOW_1, 869, 128},
{17613283, BOREALIS_SHADOW_2_QM,         900, 2400, 17613135, BOREALIS_SHADOW_2, 869, 128},
{17613284, BOREALIS_SHADOW_3_QM,         900, 2400, 17613139, BOREALIS_SHADOW_3, 869, 128},
{17613282, CAROUSING_CELINE_1_QM,        900, 2400, 17613142, CAROUSING_CELINE_1, 918, 128},
{17613283, CAROUSING_CELINE_2_QM,        900, 2400, 17613143, CAROUSING_CELINE_2, 918, 128},
{17613284, CAROUSING_CELINE_3_QM,        900, 2400, 17613144, CAROUSING_CELINE_3, 918, 128},
{17617281, COCA_1_QM,                    900, 2100, 17617175, COCA_1, 865, 125},
{17617282, COCA_2_QM,                    900, 2100, 17617176, COCA_2, 865, 125},
{17617283, COCA_3_QM,                    900, 2100, 17617177, COCA_3, 865, 125},
{17629791, CENTURIO_XXI_1_QM,            900, 2100, 17629655, CENTURIO_XXI_1, 898, 125},
{17629792, CENTURIO_XXI_3_QM,            900, 2100, 17629656, CENTURIO_XXI_3, 898, 125},
{17629793, CENTURIO_XXI_2_QM,            900, 2100, 17629657, CENTURIO_XXI_2, 898, 125},
{17645908, WYVERNHUNTER_BAMBROX_1_QM,    900, 2400, 17645822, WYVERNHUNTER_BAMBROX_1, 920, 128},
{17645909, WYVERNHUNTER_BAMBROX_2_QM,    900, 2400, 17645831, WYVERNHUNTER_BAMBROX_2, 920, 128},
{17645910, WYVERNHUNTER_BAMBROX_3_QM,    900, 2400, 17645840, WYVERNHUNTER_BAMBROX_3, 920, 128},
{17649908, VOSO_1_QM,                    900, 1800, 17649862, VOSO_1, 863, 122},
{17649909, VOSO_2_QM,                    900, 1800, 17649863, VOSO_2, 863, 122},
{17649910, VOSO_3_QM,                    900, 1800, 17649864, VOSO_3, 863, 122},
}

xi.unitywanted.qmOnTrigger = function(player, npc, mob, target)
    local function player_level()
        if player:getGMLevel() > 0 then
            return true
        end

        local party = player:getAlliance() or {}
        for _, partyMember in pairs(party) do
            if partyMember:getMainLvl() ~= 99 then
                return false
            end
        end

        return true
    end

    local function player_vwnm()
        if player:getGMLevel() > 0 then
            return true
        end

        local party = player:getAlliance() or {}
        for _, partyMember in pairs(party) do
            if partyMember:getCharVar('[VWNM]TKills') ~= 66 then
                return false
            end
        end

        return true
    end

    if not player_level() then        
            player:printToPlayer('You or a Party member do not meet the requirements to use the Ethereal Junction, Check your level!')
     elseif player:getZoneID() == 113 then
            player:startEvent(9003, 858, 919)
     elseif player:getZoneID() == 204 then
            player:startEvent(9003, 869, 918)
     elseif player:getZoneID() ==  24 then
            player:startEvent(9003, 859, 894)
     elseif player:getZoneID() ==  25 then
            player:startEvent(9003, 860, 895)
     elseif player:getZoneID() ==  61 then
            player:startEvent(9003, 897, 922)
     elseif player:getZoneID() ==  153 then
            player:startEvent(9003, 866, 915)
     elseif player:getZoneID() ==  51 then
            player:startEvent(9003, 896, 921)
     else
                    for _, entry in pairs(uwej) do
                    if npc:getID() == entry[1] then
                     local amount = entry[4] 
                           player:startEvent(9000, entry[7], amount, entry[8]) 
                     end
                    end 
     end
end


xi.unitywanted.qmOnEventUpdate = function(player, csid, option, npc)
local zonez = player:getZoneID()

if zonez == 113 then
if csid == 9003 and option == 13 then
 player:updateEvent(858, 2400, 128) 
elseif csid == 9003 and option == 14 then
player:updateEvent(919, 2400, 128)
end
end
if zonez == 204 then
if csid == 9003 and option == 13 then
player:updateEvent(869, 2400, 128)
elseif csid == 9003 and option == 14 then
player:updateEvent(918, 2400, 128)
end
end
if zonez == 24 then
if csid == 9003 and option == 13 then
player:updateEvent(859, 1500, 119)
elseif csid == 9003 and option == 14 then
player:updateEvent(894, 2100, 125)
end
end
if zonez == 25 then
if csid == 9003 and option == 13 then
player:updateEvent(860, 1800, 122)
elseif csid == 9003 and option == 14 then
player:updateEvent(895, 2400, 128)
end
end
if zonez == 61 then
if csid == 9003 and option == 13 then
player:updateEvent(897, 2400, 128)
elseif csid == 9003 and option == 14 then
player:updateEvent(922, 3100, 135)
end
end
if zonez == 153 then
if csid == 9003 and option == 13 then
player:updateEvent(866, 2100, 125)
elseif csid == 9003 and option == 14 then
player:updateEvent(915, 3100, 135)
end
end
if zonez == 51 then
if csid == 9003 and option == 13 then
player:updateEvent(896, 2100, 125)
elseif csid == 9003 and option == 14 then
player:updateEvent(921, 3100, 135)
end
end
end


xi.unitywanted.qmOnEventFinish = function(player, npc, option)
    local amount = player:getCurrency('unity_accolades')
    local level = player:getMainLvl()
    local party = player:getParty() -- getPartyWithTrusts()
               for _, entry in pairs(uwej) do
    if       option == entry[7] and
             amount <= entry[4] then
             player:printToPlayer('You do not have enough Unity Accolades to proceed!')  
    end
    end
           for _, entry in pairs(uwej) do
       local mob = GetMobByID(entry[5])
       local cost = entry[4]
        if 
                 option == entry[7] and 
                 amount >= entry[4] and
                 npc:getID() == entry[1] then
	      if
  		        not GetMobByID(entry[5]):isSpawned() then
    	    if
 	             npcUtil.popFromEJ(player, npc, entry[5], params) then
                 player:delCurrency('unity_accolades', entry[4])

                 ---------------------------------------------------
                 ---------------------------------------------------
                -- mob:addStatusEffect(xi.effect.BATTLEFIELD, 2, 0, 0, 0, 0, 0, 0, 0)
                 for _, partyMemeber in pairs(party) do 
                -- partyMemeber:addStatusEffect(xi.effect.BATTLEFIELD, 2, 0, 0, 0, 0, 0, 0, 0)
                 partyMemeber:countdown(entry[3])
                 end
                 ---------------------------------------------------
                 ---------------------------------------------------  
                 ---------------------------------------------------
                 ---------------------------------------------------                 
            end 
          end
       end
    end 
end

function npcUtil.popFromEJ(player, npc, mobId, params)
    local qmId = npc:getID()

    -- default params
    if not params then
        params = {}
    end

    if params.claim == nil or type(params.claim) ~= 'boolean' then
        params.claim = true
    end

    if params.hide == nil or type(params.hide) ~= 'number' then
        params.hide = xi.settings.main.FORCE_SPAWN_QM_RESET_TIME
    end

    -- get list of mobs to pop
    local mobs = {}
    if type(mobId) == 'number' then
        table.insert(mobs, mobId)
    elseif type(mobId) == 'table' then
        for _, v in pairs(mobId) do
            if type(v) == 'number' then
                table.insert(mobs, v)
            end
        end
    end

    -- make sure none are spawned
    for k, v in pairs(mobs) do
        local mob = GetMobByID(v)
        if mob == nil or mob:isSpawned() then
            return false
        else
            mobs[k] = mob
        end
    end

    -- hide qm
    if params.hide > 0 then
        npc:setStatus(xi.status.DISAPPEAR)
    end

    -- spawn mobs and give each a listener that will show QM after they are all dead
    for _, mob in pairs(mobs) do
        -- choose random position uniformly from within radius
        if params.radius and type(params.radius) == 'number' then
            local r = params.radius * math.sqrt(math.random())
            local theta = math.random() * 2 * math.pi
            local x = r * math.cos(theta)
            local z = r * math.sin(theta)
            mob:setSpawn(npc:getXPos() + x, npc:getYPos(), npc:getZPos() + z)
        end

        -- spawn 
        mob:spawn()


        -- claim
        if params.claim then
            mob:updateClaim(player)
        end

        -- look
        if params.look then
            mob:lookAt(player:getPos())
        end

        -- reappear the QM when all spawned mobs are dead, plus params.hide seconds
        if params.hide > 0 then
            local myId = mob:getID()
            mob:setLocalVar('ej', qmId)
            mob:addListener('DESPAWN', 'EJ_'..myId, function(m)
                m:removeListener('EJ_'..myId)

                for _, v in pairs(mobs) do
                    if v:isAlive() then
                        return false
                    end
                end

                GetNPCByID(m:getLocalVar('ej')):updateNPCHideTime(1, params.hide)
            end)
        end

        -- add in a spawn message if has one
        if params.message then
            player:messageSpecial(params.message)
        end
    end

    return true
end



