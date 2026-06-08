-----------------------------------
-- Global Custom Entities
-- Registers custom NPCs and Mobs straight to the global xi namespace
-----------------------------------
xi = xi or {}
xi.custom_entities = xi.custom_entities or {}

-----------------------------------
-- NPCs Mappings
-----------------------------------
xi.custom_entities.npcs =
{
    [xi.zone.PORT_JEUNO] =
    {
        name = "Port_Jeuno",
        npcs = 
        {
            [xi.zone.PORT_JEUNO] =
            {
                enti    = "Monisette",
                synergy = "Synergy_Engineer",
                furnace = "Synergy_Furnace"
            }
        },   
    },
    [xi.zone.ESCHA_ZITAH] =
    {
        name = "Escha_ZiTah",
        npcs = 
        {
            [xi.zone.ESCHA_ZITAH] =
            {
                affi    = "Affi",
                geas_qm = "geas_qm"
            }
        },   
    },
    [xi.zone.ESCHA_RUAUN] =
    {
        name = "Escha_RuAun",
        npcs = 
        {
            [xi.zone.ESCHA_RUAUN] =
            {
                enti  = "Dremi"
            }
        },   
    },
    [xi.zone.OUTER_RAKAZNAR_U1] =
    {
        name = "Outer_RaKaznar_[U1]",
        npcs =
        {
            [xi.zone.OUTER_RAKAZNAR_U1] =
            {
                connection = "Connection",
                pillar     = "Pillar"
            }
        },
    },
    [xi.zone.ABDHALJS_ISLE_PURGONORGO] =
    {
        name = "Abdhaljs_Isle-Purgonorgo",
        npcs =
        {
            [xi.zone.ABDHALJS_ISLE_PURGONORGO] =
            {
                broken_shovel      = "Broken_Shovel",
                eliana             = "Eliana",
                mukiki             = "Mukiki",
                mute_goblin        = "Mute_Goblin",
                amchuchu           = "Amchuchu",
                mid                = "Mid",
                bob                = "Bob",
                sasarron           = "Sasarron",
                el_taz             = "El_Taz",
                aluni              = "Aluni",
                billy              = "Billy",
                davos              = "Davos",
                geralt             = "Geralt",
                rasalea            = "Rasalea",
                rowena             = "Rowena",
                tim_allen          = "Tim_Allen",
                polly              = "Polly",
                chirpadee          = "Chirpadee",
                virgil             = "Virgil",
                dorry              = "Dorry",
                borry              = "Borry",
                norry              = "Norry",
                yota_leheho        = "Yota_Leheho",
                narf               = "Narf",
                forage_point       = "Forage_Point",
                washup_point       = "Washup_Point",
                naakual_qm         = "Naakual_QM",
                mephist            = "Mephist",
            }
        },
    },
    [xi.zone.DIORAMA_ABDHALJS_GHELSBA] =
    {
        name = "Diorama_Abdhaljs-Ghelsba",
        npcs =
        {
            [xi.zone.DIORAMA_ABDHALJS_GHELSBA] =
            {
                return_waypoint = "Return_Waypoint",
                checkpoint      = "Checkpoint",
                broken_mantelet = "Broken_Mantelet",
                gf_spawner      = "GF_Spawner",
                tinkergong      = "Tinkergong",
                pitir_pot       = "Pitir_Pot"
            }
        },
    },
    [xi.zone.MAMOOK] =
    {
        name = "Mamook",
        npcs =
        {
            [xi.zone.MAMOOK] =
            {
                Astral_Plinth  = "Astral_Plinth"
            }
        },
    },
    [xi.zone.HALVUNG] =
    {
        name = "Halvung",
        npcs =
        {
            [xi.zone.HALVUNG] =
            {
                Astral_Plinth  = "Astral_Plinth"
            }
        },
    },
    [xi.zone.ARRAPAGO_REEF] =
    {
        name = "Arrapago_Reef",
        npcs =
        {
            [xi.zone.ARRAPAGO_REEF] =
            {
                Astral_Plinth  = "Astral_Plinth"
            }
        },
    },      
}

-----------------------------------
-- Mobs Mappings
-----------------------------------
xi.custom_entities.mobs =
{
    [xi.zone.ESCHA_ZITAH] =
    {
        name = "Escha_ZiTah",
        mobs = 
        {
            [xi.zone.ESCHA_ZITAH] =
            {
                Aglaophotis        = "Aglaophotis",
                Alpluachra         = "Alpluachra",
                Azi_Dahaka         = "Azi_Dahaka",
                Azi_Dahakas_Dragon = "Azi_Dahakas_Dragon",
                Angrboda           = "Angrboda",
                Blazewing          = "Blazewing",
                Brittlis           = "Brittlis",
                Bucca              = "Bucca",
                Cunnast            = "Cunnast",
                Ferrodon           = "Ferrodon",
                Fleetstalker       = "Fleetstalker",
                Gestalt            = "Gestalt",
                Gulltop            = "Gulltop",
                Ionos              = "Ionos",
                Kamohoalii         = "Kamohoalii",
                Lustful_Lydia      = "Lustful_Lydia",
                Nosoi              = "Nosoi",
                Pazuzu             = "Pazuzu",
                Pride              = "Pride",
                Puca               = "Puca",
                Rage               = "Rage",
                Revetaur           = "Revetaur",
                Sensual_Sandy      = "Sensual_Sandy",
                Shockmaw           = "Shockmaw",
                Tangata_Manu       = "Tangata_Manu",
                Umdhlebi           = "Umdhlebi",
                Urmahlullu         = "Urmahlullu",
                Vidala             = "Vidala",
                Vyala              = "Vyala",
                Wepwawet           = "Wepwawet",
                Wrath              = "Wrath",
                Wrathare           = "Wrathare",
                Wraths_Pup         = "Wraths_Pup",
            }
        },
    },
    [xi.zone.ABDHALJS_ISLE_PURGONORGO] =
    {
        name = "Abdhaljs_Isle-Purgonorgo",
        mobs =
        {
            [xi.zone.ABDHALJS_ISLE_PURGONORGO] =
            {
                lost_gnat          = "Lost_Gnat",
                dread_fly          = "Dread_Fly",
                dread_spider       = "Dread_Spider",
                dread_lucani       = "Dread_Lucani",
                lost_frog          = "Lost_Frog",
                dread_cracklaw     = "Dread_Cracklaw",
                dread_pugil        = "Dread_Pugil",
                dread_kraken       = "Dread_Kraken",
                lost_panopt        = "Lost_Panopt",
                dread_goobue       = "Dread_Goobue",
                dread_mandragora   = "Dread_Mandragora",
                dread_morbol       = "Dread_Morbol",
                lost_gnole         = "Lost_Gnole",
                dread_raaz         = "Dread_Raaz",
                dread_rabbit       = "Dread_Rabbit",
                dread_yztarg       = "Dread_Yztarg",
                lost_eft           = "Lost_Eft",
                dread_lizard       = "Dread_Lizard",
                dread_matamata     = "Dread_Matamata",
                dread_wivre        = "Dread_Wivre",
                lost_tulfaires     = "Lost_Tulfaires",
                dread_apkallu      = "Dread_Apkallu",
                dread_colibri      = "Dread_Colibri",
                dread_hippogryph   = "Dread_Hippogryph",
                grievous_gnat      = "Grievous_Gnat",
                grievous_frog      = "Grievous_Frog",
                grievous_panopt    = "Grievous_Panopt",
                grievous_gnole     = "Grievous_Gnole",
                grievous_eft       = "Grievous_Eft",
                grievous_tulfaires = "Grievous_Tulfaires",
                tchakka            = "Tchakka",
                yumcax             = "Yumcax",
                kumhau            = "Kumhau",
                achuka            = "Achuka",
                hurkan            = "Hurkan",
                colkhab           = "Colkhab",
                scarmiglione       = "Scarmiglione",
                cagnazzo           = "Cagnazzo",
                barbariccia        = "Barbariccia",
                rubicante          = "Rubicante"
            }
        },
    },
    [xi.zone.DIORAMA_ABDHALJS_GHELSBA] =
    {
        name = "Diorama_Abdhaljs-Ghelsba",
        mobs =
        {
            [xi.zone.DIORAMA_ABDHALJS_GHELSBA] =
            {
                dread_clionid   = "Dread_Clionid",
                dread_craver    = "Dread_Craver",
                dread_gorger    = "Dread_Gorger",
                dread_limule    = "Dread_Limule",
                dread_seether   = "Dread_Seether",
                dread_thinker   = "Dread_Thinker",
                dread_wanderer  = "Dread_Wanderer",
                dread_weeper    = "Dread_Weeper",
                fenrir          = "Fenrir",
                king            = "King",
                knight          = "Knight",
                lost_murex      = "Lost_Murex",
                odin            = "Odin",
                pawn            = "Pawn",
                queen           = "Queen",
                receptacle      = "Receptacle",
                rook            = "Rook",
                thor            = "Thor",
                valkyrie        = "Valkyrie",
                CD_07           = "CD-07",
                AT_08           = "AT-08",
                RA_09           = "RA-09",
                HA_10           = "HA-10",
                AS_11           = "AS-11",
                SA_12           = "SA-12",
                RR_13           = "RR-13",
                RD_14           = "RD-14",
                CD_15           = "CD-15",
                AT_16           = "AT-16",
                TD_17           = "TD-17",
                CD_18           = "CD-18",
                ES_19           = "ES-19",
                DD_20           = "DD-20",
                CD_21           = "CD-21",
                AM_22           = "AM-22",
                HA_23           = "HA-23",
                Beta_Ultima     = "Beta-Ultima",
                ES_25           = "ES-25",
                DD_26           = "DD-26",
                RA_27           = "RA-27",
                GC_28           = "GC-28",
                Beta_Omega      = "Beta-Omega",
                Duster          = "Duster",
                Burner          = "Burner",
                Gust            = "Gust",
                Dripper         = "Dripper",
                Froster         = "Froster",
                Sparker         = "Sparker",
                Lumin           = "Lumin",
                Dimmer          = "Dimmer",
                Tombstone       = "Tombstone",
                Shiny_Weapon    = "Shiny_Weapon",
                Emerald_Golem   = "Emerald_Golem",
                Effigy          = "Effigy",
                Mighty_Weapon   = "Mighty_Weapon",
                Magic_Pony      = "Magic_Pony",
                Idol            = "Idol",
                Odd_Weapon      = "Odd_Weapon",
                Pigmeister      = "Pigmeister",
                Lithic_One      = "Lithic_One",
                Giant_Stomp     = "Giant_Stomp",
                Giant_Sweep     = "Giant_Sweep",
                Giant_Wack      = "Giant_Wack",
                Angry_Fae       = "Angry_Fae",
                Lucky_Chest     = "Lucky_Chest",
                Samael          = "Samael",
                Ire             = "Ire",
                Foil            = "Foil",
                Thwart          = "Thwart",
                Bitter          = "Bitter",
                Annoy           = "Annoy",
                Vex             = "Vex",
                Agregate        = "Agregate",
                Azazel          = "Azazel",
                Oriens          = "Oriens",
                Woe             = "Woe",
                Azrael          = "Azrael",
                Amaymon         = "Amaymon",
                Fear            = "Fear",
                Mahazael        = "Mahazael",
                Paymon          = "Paymon",
                Thoughtless     = "Thoughtless",
                Aeacus          = "Aeacus",
                Egyn            = "Egyn",
                Rhadamanthus    = "Rhadamanthus",
                Minos           = "Minos",
                Hellhound       = "Hellhound",
                Sin_Behemoth    = "Sin_Behemoth",
                Fafnir          = "Fafnir",
                Lightscale      = "Lightscale",
                Stonescale      = "Stonescale",
                Flamescale      = "Flamescale",
                Cloudscale      = "Cloudscale",
                Dewscale        = "Dewscale",
                Icescale        = "Icescale",
                Stormscale      = "Stormscale",
                Ouryu           = "Ouryu",
                Anantaboga      = "Anantaboga",
                Shadescale      = "Shadescale",
                Jormungand      = "Jormungand",
                Ash             = "Ash",
                Dire_Puk        = "Dire_Puk",
                Vrtra           = "Vrtra",
                Galarhigg       = "Galarhigg",
                Dire_Dahak      = "Dire_Dahak",
                Tiamat          = "Tiamat",
                Ying            = "Ying",
                Yang            = "Yang",
                Seiryu          = "Seiryu",
                Dire_Wyvern     = "Dire_Wyvern",
                Crystalscale    = "Crystalscale"
            }
        },
    },
    [xi.zone.RUAUN_GARDENS] =
    {
        name = "RuAun_Gardens",
        mobs = 
        {
            [xi.zone.RUAUN_GARDENS] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.CASTLE_ZVAHL_BAILEYS] =
    {
        name = "Castle_Zvahl_Baileys",
        mobs = 
        {
            [xi.zone.CASTLE_ZVAHL_BAILEYS] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.THE_ELDIEME_NECROPOLIS] =
    {
        name = "The_Eldieme_Necropolis",
        mobs = 
        {
            [xi.zone.THE_ELDIEME_NECROPOLIS] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.BEADEAUX] =
    {
        name = "Beadeaux",
        mobs = 
        {
            [xi.zone.BEADEAUX] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.MONASTIC_CAVERN] =
    {
        name = "Monastic_Cavern",
        mobs = 
        {
            [xi.zone.MONASTIC_CAVERN] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.CASTLE_OZTROJA] =
    {
        name = "Castle_Oztroja",
        mobs = 
        {
            [xi.zone.CASTLE_OZTROJA] =
            {
                mimic = "Mimic"
            }
        },
    },   
    [xi.zone.THE_BOYAHDA_TREE] =
    {
        name = "The_Boyahda_Tree",
        mobs = 
        {
            [xi.zone.THE_BOYAHDA_TREE] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.TEMPLE_OF_UGGALEPIH] =
    {
        name = "Temple_of_Uggalepih",
        mobs = 
        {
            [xi.zone.TEMPLE_OF_UGGALEPIH] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.DEN_OF_RANCOR] =
    {
        name = "Den_of_Rancor",
        mobs = 
        {
            [xi.zone.DEN_OF_RANCOR] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.TORAIMARAI_CANAL] =
    {
        name = "Toraimarai_Canal",
        mobs = 
        {
            [xi.zone.TORAIMARAI_CANAL] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.KUFTAL_TUNNEL] =
    {
        name = "Kuftal_Tunnel",
        mobs = 
        {
            [xi.zone.KUFTAL_TUNNEL] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.SEA_SERPENT_GROTTO] =
    {
        name = "Sea_Serpent_Grotto",
        mobs = 
        {
            [xi.zone.SEA_SERPENT_GROTTO] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.VELUGANNON_PALACE] =
    {
        name = "VeLugannon_Palace",
        mobs = 
        {
            [xi.zone.VELUGANNON_PALACE] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.CRAWLERS_NEST] =
    {
        name = "Crawlers_Nest",
        mobs = 
        {
            [xi.zone.CRAWLERS_NEST] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.GARLAIGE_CITADEL] =
    {
        name = "Garlaige_Citadel",
        mobs = 
        {
            [xi.zone.GARLAIGE_CITADEL] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.IFRITS_CAULDRON] =
    {
        name = "Ifrits_Cauldron",
        mobs = 
        {
            [xi.zone.IFRITS_CAULDRON] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.QUICKSAND_CAVES] =
    {
        name = "Quicksand_Caves",
        mobs = 
        {
            [xi.zone.QUICKSAND_CAVES] =
            {
                mimic = "Mimic"
            }
        },
    },
    [xi.zone.DYNAMIS_BASTOK_D] =
    {
        name = "Dynamis-Bastok_[D]",
        mobs = 
        {
            [xi.zone.DYNAMIS_BASTOK_D] =
            {
                Squadron_Weaponmaster = "Squadron_Weaponmaster"
            }
        },
    },
    [xi.zone.MAMOOK] =
    {
        name = "Mamook",
        mobs =
        {
            [xi.zone.MAMOOK] =
            {
                Archaic_Mirror = "Archaic_Mirror"
            }
        },
    },
    [xi.zone.HALVUNG] =
    {
        name = "Halvung",
        mobs =
        {
            [xi.zone.HALVUNG] =
            {
                Archaic_Mirror = "Archaic_Mirror"
            }
        },
    },
    [xi.zone.ARRAPAGO_REEF] =
    {
        name = "Arrapago_Reef",
        mobs =
        {
            [xi.zone.ARRAPAGO_REEF] =
            {
                Archaic_Mirror = "Archaic_Mirror"
            }
        },
    },   
    [xi.zone.AL_ZAHBI] =
    {
        name = "Al_Zahbi",
        mobs =
        {
            [xi.zone.AL_ZAHBI] =
            {
                -- Allies --
                General_Rughadjeen     = "General_Rughadjeen",
                General_Gadalar        = "General_Gadalar",
                General_Najelith       = "General_Najelith",
                General_Zazarg         = "General_Zazarg",
                General_Mihli          = "General_Mihli",
                Volunteer              = "Volunteer",
                Imperial_Trooper       = "Imperial_Trooper",
                Immortal_Guard         = "Immortal_Guard",
                Qiqirn_Freelance       = "Qiqirn_Freelance",
                Qiqirn_Mine            = "Qiqirn_Mine",
                Goblin_Lansquenet      = "Goblin_Lansquenet",
                Bastion_Gate           = "Bastion_Gate",
                City_Gate              = "City_Gate",
                -- Mamool Ja --
                Decimator_Mabel_Ja     = "Decimator_Mabel_Ja",
                Mamool_Ja_Sapper       = "Mamool_Ja_Sapper",
                Mamool_Ja_Hospitaler   = "Mamool_Ja_Hospitaler",
                Mamool_Ja_Fetial       = "Mamool_Ja_Fetial",
                Mamool_Ja_Spotter      = "Mamool_Ja_Spotter",
                Mamool_Ja_Handler      = "Mamool_Ja_Handler",
                Mamool_Ja_Cataphract   = "Mamool_Ja_Cataphract",
                Mamool_Ja_Entrancer    = "Mamool_Ja_Entrancer",
                Mamool_Jas_Lizard      = "Mamool_Jas_Lizard",
                Phantasmal_Puk         = "Phantasmal_Puk",
                Dive_Puk               = "Dive_Puk",
                Scout_Puk              = "Scout_Puk",
                Thunderclap_Sareel_Ja  = "Thunderclap_Sareel_Ja",
                Thunderbolt_Piraal_Ja  = "Thunderbolt_Piraal_Ja",
                Raid_Raptor            = "Raid_Raptor",
                Fleetfingered_Mobel_Ja = "Fleetfingered_Mobel_Ja",
                Panurgic_Ryubool_Ja    = "Panurgic_Ryubool_Ja",
                Mamool_Ja_Ravager      = "Mamool_Ja_Ravager",
                Attack_Ziz             = "Attack_Ziz",
                Sagelord_Molaal_Ja     = "Sagelord_Molaal_Ja",
                Strifelord_Bakool_Ja   = "Strifelord_Bakool_Ja",
                Mamool_Jas_Wyvern      = "Mamool_Jas_Wyvern",
                Brontobugard           = "Brontobugard",
                Bull_Bugard            = "Bull_Bugard",
                Gulool_Ja_Ja           = "Gulool_Ja_Ja",
                Eidolic_Qufeel_Ja      = "Eidolic_Qufeel_Ja",
                Searing_Vogaal_Ja      = "Searing_Vogaal_Ja",
                Scalding_Fafool_Ja     = "Scalding_Fafool_Ja",
                Mamool_Ja_Hussar       = "Mamool_Ja_Hussar",
                Illuyankas             = "Illuyankas",
                Battering_Bugard       = "Battering_Bugard",
                War_Wyvern             = "War_Wyvern",
                Poroggo_Charmer        = "Poroggo_Charmer",
                -- Trolls --
                Troll_Paviser          = "Troll_Paviser",
                Troll_Stormer          = "Troll_Stormer",
                Troll_Hoplite          = "Troll_Hoplite",
                Troll_Pezhetairoi      = "Troll_Pezhetairoi",
                Troll_Cannoneer        = "Troll_Cannoneer",
                Troll_Velites          = "Troll_Velites",
                Troll_Speculator       = "Troll_Speculator",
                Trolls_Automaton       = "Trolls_Automaton",
                Flame_Eruca            = "Flame_Eruca",
                War_Wamouracampa       = "War_Wamouracampa",
                Incendiary_Bombs       = "Incendiary_Bombs",
                Fighting_Flan          = "Fighting_Flan",
                Siege_Scorpion          = "Siege_Scorpion",
                War_Wamoura            = "War_Wamoura",
                Aerial_Torpedo         = "Aerial_Torpedo",
                Bombshells             = "Bombshells",
                Vyurvarjur_the_Nimble  = "Vyurvarjur_the_Nimble",
                Troll_Forager          = "Troll_Forager",
                Killing_Claw           = "Killing_Claw",
                Slaughterous_Scorpion  = "Slaughterous_Scorpion",
                Gurfurlur_the_Menacing = "Gurfurlur_the_Menacing",
                Gere                   = "Gere",
                Girzorhor_the_Imprudent= "Girzorhor_the_Imprudent",
                Surmerdar_the_Unbridled= "Surmerdar_the_Unbridled",
                Dartorgor_the_Austere  = "Dartorgor_the_Austere",
                Vorporlor_the_Barbaric = "Vorporlor_the_Barbaric",
                Vorjirzur_the_Valiant  = "Vorjirzur_the_Valiant",
                Wordorbor_the_Artificer= "Wordorbor_the_Artificer",
                Cobalt_Sentinel        = "Cobalt_Sentinel",
                White_Sentinel         = "White_Sentinel",
                Hazel_Sentinel         = "Hazel_Sentinel",
                Carmine_Sentinel       = "Carmine_Sentinel",
                Xarhorkur_the_Claviger = "Xarhorkur_the_Claviger",
                Zurmurwur_the_Ruthless = "Zurmurwur_the_Ruthless",
                Troll_Destroyer        = "Troll_Destroyer",
                -- Lamia --
                Lamia_Immolator        = "Lamia_Immolator",
                Lamia_Jaeger           = "Lamia_Jaeger",
                Lamia_Commandress      = "Lamia_Commandress",
                Lamias_Elemental       = "Lamias_Elemental",
                Lamias_Avatar          = "Lamias_Avatar",
                Lamia_Rover            = "Lamia_Rover",
                Merrow_Seafarer        = "Merrow_Seafarer",
                Merrow_Cantatrice      = "Merrow_Cantatrice",
                Merrow_Shiranuhi       = "Merrow_Shiranuhi",
                Gespenst               = "Gespenst",
                Assault_Draugar        = "Assault_Draugar",
                Draugars_Wyvern        = "Draugars_Wyvern",
                Assault_Bhoot          = "Assault_Bhoot",
                Qutrub_Extortionist    = "Qutrub_Extortionist",
                Qutrub_Wastrel         = "Qutrub_Wastrel",
                Expunger               = "Expunger",
                Bhoot_Invader          = "Bhoot_Invader",
                Bhoot_Intruder         = "Bhoot_Intruder",
                Lamia_No4              = "Lamia_No4",
                Lamia_Freebooter       = "Lamia_Freebooter",
                Pining_Abazohn         = "Pining_Abazohn",
                Qutrub_Forayer         = "Qutrub_Forayer",
                Medusa                 = "Medusa",
                Nemean_Lion            = "Nemean_Lion",
                Lamia_No34             = "Lamia_No34",
                Lamia_No21             = "Lamia_No21",
                Lamia_No15             = "Lamia_No15",
                Merrow_No11            = "Merrow_No11",
                Lamia_No9              = "Lamia_No9",
                Merrow_No12            = "Merrow_No12",
                Lamia_No3              = "Lamia_No3",
                Lamia_No2              = "Lamia_No2",
                Acrolith               = "Acrolith"
            }
        },
    },
    [xi.zone.WAJAOM_WOODLANDS] =
    {
        name = "Wajaom_Woodlands",
        mobs =
        {
            [xi.zone.WAJAOM_WOODLANDS] =
            {
                -- Mamool Ja --
                Mamool_Ja_Sapper       = "Mamool_Ja_Sapper",
                Mamool_Ja_Hospitaler   = "Mamool_Ja_Hospitaler",
                Mamool_Ja_Fetial       = "Mamool_Ja_Fetial",
                Mamool_Ja_Spotter      = "Mamool_Ja_Spotter",
                Mamool_Ja_Handler      = "Mamool_Ja_Handler",
                Mamool_Jas_Lizard      = "Mamool_Jas_Lizard",
                Mamool_Ja_Cataphract   = "Mamool_Ja_Cataphract",
                Mamool_Jas_Wyvern      = "Mamool_Jas_Wyvern",
                Mamool_Ja_Entrancer    = "Mamool_Ja_Entrancer",
                Scout_Puk              = "Scout_Puk",
                Raid_Raptor            = "Raid_Raptor",
                Attack_Ziz             = "Attack_Ziz",
                Battering_Bugard       = "Battering_Bugard",
                War_Wyvern             = "War_Wyvern",
                Poroggo_Charmer        = "Poroggo_Charmer",
                Gulool_Ja_Ja           = "Gulool_Ja_Ja",
                Decimator_Mabel_Ja     = "Decimator_Mabel_Ja",
                Thunderclap_Sareel_Ja  = "Thunderclap_Sareel_Ja",
                Thunderbolt_Piraal_Ja  = "Thunderbolt_Piraal_Ja",
                Panurgic_Ryubool_Ja    = "Panurgic_Ryubool_Ja",
                Sagelord_Molaal_Ja     = "Sagelord_Molaal_Ja",
                Strifelord_Bakool_Ja   = "Strifelord_Bakool_Ja",
                Eidolic_Qufeel_Ja      = "Eidolic_Qufeel_Ja",
                Searing_Vogaal_Ja      = "Searing_Vogaal_Ja",
                Mamool_Ja_Hussar       = "Mamool_Ja_Hussar",
                -- Trolls --
                Troll_Paviser          = "Troll_Paviser",
                Troll_Stormer          = "Troll_Stormer",
                Troll_Hoplite          = "Troll_Hoplite",
                Troll_Pezhetairoi      = "Troll_Pezhetairoi",
                Troll_Cannoneer        = "Troll_Cannoneer",
                Troll_Velites          = "Troll_Velites",
                Troll_Speculator       = "Troll_Speculator",
                Trolls_Automaton       = "Trolls_Automaton",
                Flame_Eruca            = "Flame_Eruca",
                War_Wamouracampa       = "War_Wamouracampa",
                Incendiary_Bombs       = "Incendiary_Bombs",
                Fighting_Flan          = "Fighting_Flan",
                Siege_Scorpion          = "Siege_Scorpion",
                War_Wamoura            = "War_Wamoura",
                Gurfurlur_the_Menacing = "Gurfurlur_the_Menacing",
                Girzorhor_the_Imprudent= "Girzorhor_the_Imprudent",
                Surmerdar_the_Unbridled= "Surmerdar_the_Unbridled",
                Dartorgor_the_Austere  = "Dartorgor_the_Austere",
                Vorporlor_the_Barbaric = "Vorporlor_the_Barbaric",
                Vorjirzur_the_Valiant  = "Vorjirzur_the_Valiant",
                Wordorbor_the_Artificer= "Wordorbor_the_Artificer",
                Cobalt_Sentinel        = "Cobalt_Sentinel",
                White_Sentinel         = "White_Sentinel",
                Hazel_Sentinel         = "Hazel_Sentinel",
                Carmine_Sentinel       = "Carmine_Sentinel",
                Xarhorkur_the_Claviger = "Xarhorkur_the_Claviger",
                Zurmurwur_the_Ruthless = "Zurmurwur_the_Ruthless",
                Troll_Destroyer        = "Troll_Destroyer",
                -- Lamia --
                Lamia_Immolator        = "Lamia_Immolator",
                Lamia_Jaeger           = "Lamia_Jaeger",
                Lamia_Commandress      = "Lamia_Commandress",
                Lamias_Elemental       = "Lamias_Elemental",
                Lamias_Avatar          = "Lamias_Avatar",
                Lamia_Rover            = "Lamia_Rover",
                Merrow_Seafarer        = "Merrow_Seafarer",
                Merrow_Cantatrice      = "Merrow_Cantatrice",
                Merrow_Shiranuhi       = "Merrow_Shiranuhi",
                Gespenst               = "Gespenst",
                Assault_Draugar        = "Assault_Draugar",
                Draugars_Wyvern        = "Draugars_Wyvern",
                Assault_Bhoot          = "Assault_Bhoot",
                Qutrub_Extortionist    = "Qutrub_Extortionist",
                Qutrub_Wastrel         = "Qutrub_Wastrel",
                Expunger               = "Expunger",
                Medusa                 = "Medusa",
                Lamia_No34             = "Lamia_No34",
                Lamia_No21             = "Lamia_No21",
                Lamia_No15             = "Lamia_No15",
                Merrow_No11            = "Merrow_No11",
                Lamia_No9              = "Lamia_No9",
                Merrow_No12            = "Merrow_No12",
                Lamia_No3              = "Lamia_No3",
                Lamia_No2              = "Lamia_No2"
            }
        },
    },
    [xi.zone.THE_COLOSSEUM] =
    {
        name = "The_Colosseum",
        mobs =
        {
            [xi.zone.THE_COLOSSEUM] =
            {
                Lucky_Rabbit      = "Lucky_Rabbit",
                Lucky_Tink        = "Lucky_Tink",
                Leprechan         = "Leprechan?",
                Albatross         = "Albatross",
                Annoyed_Avian     = "Annoyed_Avian",
                Zeid              = "Zeid",
                Furry_Thief       = "Furry_Thief",
                Sad_Egghunter     = "Sad_Egghunter",
                Proto_Egg         = "Proto_Egg",
                Festive_Turkey    = "Festive_Turkey",
                Leafy             = "Leafy",
                Unhappy_Bloom     = "Unhappy_Bloom",
                Queen_Bee         = "Queen Bee",
                Flutterfly        = "Flutterfly",
                Blooming_Bark     = "Blooming_Bark",
                Tzii_Xoca         = "Tzii_Xoca",
                Unshaven_Gurfurry = "Unshaven_Gurfurry",
                Don_Tonby         = "Don_Tonby",
                Some_Duke_Botym   = "Some_Duke_Botym",
                Blarney           = "Blarney",
                Not_Demetrie      = "Not_Demetrie",
                Trion             = "Trion",
                King_of_Hearts    = "King_of_Hearts",
                Rughadjeen         = "Rughadjeen",
                August            = "August",
                Berated_Birdie    = "Berated_Birdie",
                Volker            = "Volker",
                Iron_Eater        = "Iron_Eater",
                Bloomer           = "Bloomer",
                Sprout            = "Sprout",
                Bee_Guard         = "Bee_Guard",
                Sprouted_Seed     = "Sprouted_Seed",
                Underlord_Bekgud  = "Underlord_Bekgud",
                Gritty_ZuDoo      = "Gritty_ZuDoo",
                Galuul_Na_Na      = "Galuul_Na_Na",
                Maduse            = "Maduse",
                Fishy_Fisher      = "Fishy_Fisher",
                Buggy_Bugger      = "Buggy_Bugger",
                Marquis_Ellucin   = "Marquis_Ellucin",
                Marquis_Emun      = "Marquis_Emun",
                Little_Lizzie_Yi  = "Little_Lizzie_Yi",
                Little_Lizzie_Ya  = "Little_Lizzie_Ya",
                Curilla           = "Curilla",
                Excenmille        = "Excenmille",
                Ajido_Marujido    = "Ajido_Marujido",
                Shantotto         = "Shantotto",
                Mihli_Aliapoh     = "Mihli_Aliapoh",
                Najelith          = "Najelith",
                Darrcuiln         = "Darrcuiln",
                Morimar           = "Morimar",
                Deme_Shadow       = "Deme_Shadow"
            }
        },
    },
}