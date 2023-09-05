-----------------------------------
-- Campaign Data
-----------------------------------
require("modules/module_utils")
require("scripts/globals/campaign")
-----------------------------------
local m = Module:new("campaign_data")

xi = xi or {}
xi.campaign = xi.campaign or {}

-- Promotion Credits required to receive each medal
xi.campaign.promotions =
{
    { xi.keyItem.BRONZE_RIBBON_OF_SERVICE, 10000, "Bronze Ribbon of Service" },
    { xi.keyItem.BRASS_RIBBON_OF_SERVICE,  11000, "Brass Ribbon of Service"  },
    { xi.keyItem.ALLIED_RIBBON_OF_BRAVERY, 12000, "Allied Ribbon of Bravery" },
    { xi.keyItem.ALLIED_RIBBON_OF_GLORY,   13000, "Allied Ribbon of Glory"   },
    { xi.keyItem.BRONZE_STAR,              14000, "Bronze Star"              },
    { xi.keyItem.STERLING_STAR,            15000, "Sterling Star"            },
    { xi.keyItem.MYTHRIL_STAR,             16000, "Mythril Star"             },
    { xi.keyItem.GOLDEN_STAR,              17000, "Golden Star"              },
    { xi.keyItem.COPPER_EMBLEM_OF_SERVICE, 18000, "Copper Emblem of Service" },
    { xi.keyItem.IRON_EMBLEM_OF_SERVICE,   19000, "Iron Emblem of Service"   },
    { xi.keyItem.STEELKNIGHT_EMBLEM,       20000, "Steelknight Emblem"       },
    { xi.keyItem.HOLYKNIGHT_EMBLEM,        21000, "Holyknight Emblem"        },
    { xi.keyItem.BRASS_WINGS_OF_SERVICE,   22000, "Brass Wings of Service"   },
    { xi.keyItem.MYTHRIL_WINGS_OF_SERVICE, 23000, "Mythril Wings of Service" },
    { xi.keyItem.WINGS_OF_INTEGRITY,       24000, "Wings of Integrity"       },
    { xi.keyItem.WINGS_OF_HONOR,           25000, "Wings of Honor"           },
    { xi.keyItem.STARLIGHT_MEDAL,          26000, "Starlight Medal"          },
    { xi.keyItem.MOONLIGHT_MEDAL,          27000, "Moonlight Medal"          },
    { xi.keyItem.DAWNLIGHT_MEDAL,          28000, "Dawnlight Medal"          },
    { xi.keyItem.MEDAL_OF_ALTANA,          30000, "Medal of Altana"          },
}

-- Promotion Credits received relative to the number of participants
xi.campaign.credits =
{
    win =
    {
        [1]  = 1000, -- N/A
        [2]  = 1100, -- N/A
        [3]  = 1200, -- Minumum number of participants
        [4]  = 1300,
        [6]  = 1400,
        [8]  = 1500,
        [10] = 1600,
        [12] = 1700,
        [14] = 1800,
        [16] = 1900,
        [18] = 2000, -- Maximum number of participants
    },

    loss =
    {
        [1]  =  100, -- N/A
        [2]  =  150, -- N/A
        [3]  =  200, -- Minumum number of participants
        [4]  =  250,
        [6]  =  300,
        [8]  =  350,
        [10] =  400,
        [12] =  450,
        [14] =  500,
        [16] =  550,
        [18] =  600, -- Maximum number of participants
    },
}

xi.campaign.forces =
{
    sandoria =
    {
        ROYAL_GUARDS                = 1,
        KNIGHTS_OF_THE_SAVAGE_HOUND = 2,
        KNIGHTS_OF_THE_SCARLET_BOAR = 3,
        KNIGHTS_OF_NORVALLEN        = 4,
        ORDER_OF_THE_ROYAL_KNIGHTS  = 5,
    },
    bastok   =
    {
        IRON_MUSKETEER_FIRST_BRIGADE      = 1,
        REPUBLICAN_LEGION_FIRST_DIVISION  = 2,
        REPUBLICAN_LEGION_SECOND_DIVISION = 3,
        GOLD_MUSKETEER_FIRST_BRIGADE      = 4,
        IRON_MUSKETEER_EIGHTH_BRIGADE     = 5,
    },
    windurst =
    {
        AQUARIAN_WAR_WARLOCKS = 1,
        SCORPION_WAR_WARLOCKS = 2,
        LIBRAN_WAR_WARLOCKS   = 3,
        PYTHON_MERCNARIES     = 4,
        WILDCAT_VOLUNTEERS    = 5,
    },
    orcish   =
    {
        STEELHIDE_HORDE     = 1,
        GWAJBOJS_GUTRENDERS = 2,
        SPINEBEAK_HORDE     = 3,
        CLAN_REAPER         = 4,
        MOONFANG_PACK       = 5,
    },
    quadav   =
    {
        DI_DHA_ELITE_GUARD         = 1,
        WAUGHROON_ARMORED_DIVISION = 2,
        BEADEAUX_VANGUARD          = 3,
        QULUN_ARMORED_DIVISION     = 4,
        GO_BHU_ELITE_RAIDER        = 5,
    },
    yagudo   =
    {
        TEMPLARS             = 1,
        DIVINE_DISSEMINATORS = 2,
        DIVINE_ASSASSISN     = 3,
        DIVINE_ASCETICS      = 4,
        PLENILUNE_RONIN      = 5,
    },
}

local basicResist =
{
    mods =
    {
        [xi.mod.STUNRES]     = 100,
        [xi.mod.BLINDRES]    = 100,
        [xi.mod.BINDRES]     = 100,
        [xi.mod.GRAVITYRES]  = 100,
        [xi.mod.SLEEPRES]    = 100,
        [xi.mod.POISONRES]   = 100,
        [xi.mod.PARALYZERES] = 100,
        [xi.mod.LULLABYRES]  = 100,
    },

    effects =
    {
        [xi.effect.REGAIN] = { 5, 3, 0 },
    },
}

xi.campaign.data =
{
    [xi.zone.EAST_RONFAURE_S] =
    {
        name = "East_Ronfaure_[S]",
        npcs =
        {
            [xi.campaign.control.Sandoria] =
            {
                guard = "Arlayse_RK", -- !pos 317.626 -29.909 -115.220 81
                -- 17109770 -- Flag
            },
            [xi.campaign.control.Bastok] =
            {
                guard = "Aged_Stone_LC",
                -- 17109771 -- Flag
            },
            [xi.campaign.control.Windurst] =
            {
                guard = "Mhik_Liusihlo_MC",
                -- 17109772 -- Flag
            },
            [xi.campaign.control.Beastman] =
            {
                guard = "Waldo_CA", -- 17109774
                -- 17109773 -- Flag
            },
        },
        defender =
        {
            { 310.774, -29.500, -118.595,  21 },
            { 304.452, -29.950, -120.200,  51 },
            { 299.733, -29.768, -120.616, 112 },
            { 294.327, -29.797, -116.571,  82 },
            { 290.349, -30.617, -110.233, 116 },
            { 313.229, -29.727, -124.992,  42 },
            { 318.168, -30.059, -123.869,  10 },
            { 321.768, -30.000, -119.308,  28 },
            { 319.802, -29.634, -113.018, 164 },
            { 326.825, -28.978, -112.980, 176 },
            { 324.137, -29.777, -105.830, 233 },
            { 320.466, -29.800,  -99.226, 212 },
            { 314.450, -29.692,  -98.557, 142 },
            { 316.999, -29.500,  -91.194, 202 },
            { 309.458, -28.353,  -90.475, 163 },
        },
        attacker =
        {
            { 332.498, -24.798, -134.066, 158 },
            { 330.995, -23.481, -139.870, 157 },
            { 341.911, -21.783, -132.185, 162 },
            { 337.680, -23.896, -130.580, 150 },
            { 336.571, -25.590, -125.221, 170 },
            { 332.217, -26.245, -127.840, 135 },
            { 339.243, -20.906, -144.667, 148 },
            { 336.799, -20.482, -149.124, 158 },
            { 344.841, -20.668, -139.391, 159 },
            { 348.415, -20.168, -138.435, 219 },
            { 350.646, -19.972, -143.918, 140 },
            { 346.412, -21.044, -127.716, 136 },
        },
		tower =
		{
             { 311.040, -29.743, -110.487, 0 },
		}
    },
    [xi.zone.WEST_SARUTABARUTA_S] =
    {
        name = "West_Sarutabaruta_[S]",
        npcs =
        {
            [xi.campaign.control.Sandoria] =
            {
                guard = "Mhik_Liusihlo_MC",
            },
            [xi.campaign.control.Bastok] =
            {
                guard = "Tenacious_Fool_LC",
            },
            [xi.campaign.control.Windurst] =
            {
                guard = "Mhik_Liusihlo_MC", --17167170
            },
            [xi.campaign.control.Beastman] =
            {
                guard = "Addison_CA",
            },
        },
        defender =
        {
             { -9.486 , -13.855, 293.183, 221 },
             { -21.003, -12.873, 317.593, 3   },
             { -20.100, -13.212, 319.251, 8   },
             { -7.856 , -12.741, 319.863, 55  },
             { -17.990, -13.506, 307.951, 251 },
             { -13.047, -13.085, 311.319, 227 },
             { -12.814, -13.101, 319.947, 22  },
             { -11.969, -13.765, 305.843, 22  },
             { -17.537, -13.403, 318.370, 7   },
        },
        attacker =
        {
             {-43.8144, -12.5722, 332.5255, 168 },
             {-51.2825, -13.3468, 323.1605, 88  },
             {-55.6276, -15.3566, 310.8596, 61  },
             {-57.7790, -15.1931, 303.1176, 82  },
             {-61.2474, -14.1578, 295.3569, 81  },
             {-60.8822, -14.3404, 287.3102, 57  },
             {-60.2758, -14.0410, 283.2480, 57  },
             {-55.8681, -14.0000, 279.5104, 0   },
             {-50.3297, -12.8566, 273.1737, 32  },
        },
		tower =
		{
             { -8.4188, -12.558, 309.573, 0 },
		}
    },
    [xi.zone.NORTH_GUSTABERG_S] =
    {
        name = "North_Gustaberg_[S]",
        npcs =
        {
            [xi.campaign.control.Sandoria] =
            {
                guard = "Estineau_RK",
            },
            [xi.campaign.control.Bastok] =
            {
                guard = "Jagged_Onyx_LC", -- 17138459
            },
            [xi.campaign.control.Windurst] =
            {
                guard = "Dhi_Emwaltih_MC",
            },
            [xi.campaign.control.Beastman] =
            {
                guard = "Uriah_CA",
            },
        },
        defender =
        {
             {-565.5496, 40.0826, 47.2187, 224 },
             {-563.7478, 40.0761, 48.9693, 224 },
             {-561.6595, 39.9829, 50.3100, 233 },
             {-559.5457, 40.0732, 51.6234, 233 },
             {-557.4495, 40.3906, 52.9765, 232 },
             {-555.6426, 40.5791, 54.6587, 224 },
             {-553.4348, 39.7475, 60.3859, 197 },
             {-552.2272, 39.6034, 69.3861, 195 },
             {-552.7524, 40.0137, 70.9075, 178 },
             {-554.5201, 40.1782, 73.6332, 165 },
             {-556.0112, 39.9919, 75.6379, 165 },
             {-557.5099, 40.0000, 77.6233, 165 },
             {-558.5200, 40.0000, 78.9609, 165 },
        },
        attacker =
        {
            {-516.8303, 41.2836 , 91.2390 ,  48 },
            {-512.2193, 40.0000 , 83.5325 ,  42 },
            {-510.6842, 40.2421 , 77.5359 ,  58 },
            {-509.6431, 39.7226 , 69.3588 ,  58 },
            {-511.1494, 40.1405 , 57.3898 ,  82 },
            {-516.7946, 39.6315 , 47.1158 ,  84 },
            {-514.7634, 40.1479 , 42.9840 ,  45 },
            {-514.7839, 40.1455 , 36.7898 ,  67 },
            {-518.8817, 39.8224 , 32.1793 ,  95 },
            {-523.1774, 40.4668 , 27.6855 ,  95 },
        },
		tower =
		{
             { -554.956, 39.505, 65.451, 0 },
		}	
	},
}

xi.campaign.allies =
{
    [xi.campaign.control.Sandoria] =
    {
        [xi.campaign.forces.sandoria.ROYAL_GUARDS] =
        {
            name = "Royal Guards",
            mobs =
            {
                name        = "Royal Guard",
                groupZoneId = 80,
                groupId     = 2,
                
            },

            boss =
            {
                name        = "Valaineral R Davilles",
                groupZoneId = 80,
                groupId     = 1,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
        },
        [xi.campaign.forces.sandoria.KNIGHTS_OF_THE_SAVAGE_HOUND] =
        {
            name = "Savage Hound",
            mobs =
            {
                name        = "Savage Hound Condottiere",
                groupZoneId = 80,
                groupId     = 4,
                
            },

            boss =
            {
                name        = "Leonoyne",
                groupZoneId = 80,
                groupId     = 3,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
		},
        [xi.campaign.forces.sandoria.KNIGHTS_OF_THE_SCARLET_BOAR] =
        {
            name = "SCARLET BOAR",
            mobs =
            {
                name        = "Scarlet Boar Esquire",
                groupZoneId = 80,
                groupId     = 6,
                
            },

            boss =
            {
                name        = "Ashmea Greinner",
                groupZoneId = 80,
                groupId     = 5,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
		},
        [xi.campaign.forces.sandoria.KNIGHTS_OF_NORVALLEN] =
        {
            name = "KNIGHTS OF NORVALLEN",
            mobs =
            {
                name        = "Norvallen Knight",
                groupZoneId = 80,
                groupId     = 8,
                
            },

            boss =
            {
                name        = "Feldrautte Rouhent",
                groupZoneId = 80,
                groupId     = 7,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
        },
        [xi.campaign.forces.sandoria.ORDER_OF_THE_ROYAL_KNIGHTS] =
        {
            name = "ORDER OF THE ROYAL KNIGHTS",
            mobs =
            {
                name        = "Royal Knight",
                groupZoneId = 80,
                groupId     = 10,
                
            },

            boss =
            {
                name        = "Yrvaulair Cousseraux",
                groupZoneId = 80,
                groupId     = 9,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
        },
    },
	[xi.campaign.control.Windurst] =
    {
        [xi.campaign.forces.windurst.AQUARIAN_WAR_WARLOCKS] =
        {
            name = "Aquarian_Caster",
            mobs =
            {
                name        = "Aquarian Caster",
                groupZoneId = 94,
                groupId     = 4,
                
            },

            boss =
            {
                name        = "Kayeel-Payeel",
                groupZoneId = 94,
                groupId     = 1,
				
                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },		
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
        },
        [xi.campaign.forces.windurst.SCORPION_WAR_WARLOCKS] =
        {
            name = "Scorpion War Warlocks",
            mobs =
            {
                name        = "Scorpion Caster",
                groupZoneId = 94,
                groupId     = 7,        
            },
            boss =
            {
                name        = "Gariri",
                groupZoneId = 94,
                groupId     = 5,
                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },
                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },
                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
        },
        [xi.campaign.forces.windurst.LIBRAN_WAR_WARLOCKS] =
        {
            name = "Libran War Warlocks",
            mobs =
            {
                name        = "Libran Caster",
                groupZoneId = 94,
                groupId     = 9,
                
            },

            boss =
            {
                name        = "Zolku-Azolku",
                groupZoneId = 94,
                groupId     = 8,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
        },
        [xi.campaign.forces.windurst.PYTHON_MERCNARIES] =
        {
            name = "Python Mercenaries",
            mobs =
            {
                name        = "Python Mercenary",
                groupZoneId = 94,
                groupId     = 13,
                
            },

            boss =
            {
                name        = "Lhu Mhakaracca",
                groupZoneId = 94,
                groupId     = 10,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
        },
        [xi.campaign.forces.windurst.WILDCAT_VOLUNTEERS] =
        {
            name = "Wildcat Volunteers",
            mobs =
            {
                name        = "Wildcat Volunteer",
                groupZoneId = 94,
                groupId     = 15,
                
            },

            boss =
            {
                name        = "Haja Zhwan",
                groupZoneId = 94,
                groupId     = 14,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
        },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
	},
	[xi.campaign.control.Bastok] =
    {
        [xi.campaign.forces.bastok.IRON_MUSKETEER_FIRST_BRIGADE] =
        {
            name = "1st Iron Musketeer",
            mobs =
            {
                name        = "1st Iron",
                groupZoneId = 88,
                groupId     = 63,
                
            },

            boss =
            {
                name        = "Bartholomaus",
                groupZoneId = 88,
                groupId     = 62,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
        },
        [xi.campaign.forces.bastok.REPUBLICAN_LEGION_FIRST_DIVISION] =
        {
            name = "REPUBLICAN FIRST DIVISION",
            mobs =
            {
                name        = "1st Legionnaire",
                groupZoneId = 88,
                groupId     = 65,
                
            },

            boss =
            {
                name        = "Maximilian",
                groupZoneId = 88,
                groupId     = 64,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
        },
        [xi.campaign.forces.bastok.REPUBLICAN_LEGION_SECOND_DIVISION] =
        {
            name = "Republican Legion Second Division",
            mobs =
            {
                name        = "2nd_Legionnaire",
                groupZoneId = 88,
                groupId     = 67,
                
            },

            boss =
            {
                name        = "Ludwig",
                groupZoneId = 88,
                groupId     = 66,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
        },
        [xi.campaign.forces.bastok.GOLD_MUSKETEER_FIRST_BRIGADE] =
        {
            name = "Gold Musketeer First Brigade",
            mobs =
            {
                name        = "1st Gold Musketeer",
                groupZoneId = 88,
                groupId     = 69,
                
            },

            boss =
            {
                name        = "Elivira",
                groupZoneId = 88,
                groupId     = 68,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },
        },
        [xi.campaign.forces.bastok.IRON_MUSKETEER_EIGHTH_BRIGADE] =
        {
            name = "Iron Musketeer Eighth Brigade",
            mobs =
            {
                name        = "8th Iron Musketeer",
                groupZoneId = 88,
                groupId     = 71,
                
            },

            boss =
            {
                name        = "Kurt",
                groupZoneId = 88,
                groupId     = 70,
                

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                effects  =
                {
                    [xi.effect.REFRESH] = { 5, 3, 0 },
                },

                template = basicResist,
            },
			tower =
            {
                name        = "I R Tower",
                groupZoneId = 69,
                groupId     = 46,
                template = basicResist,
            },			
        },
	},
}

xi.campaign.enemies =
{
    [xi.campaign.control.Sandoria] =
    {
        [xi.campaign.forces.orcish.STEELHIDE_HORDE] =
        {
            name = "Steelhide Horde",
            mobs =
            {
                name        = "Steelhide Protector",
                groupZoneId = 80,
                groupId     = 30,
				
                agro        = xi.detects.SIGHT,
                template = basicResist,
            },
            boss =
            {
                name        = "Conqueror Bakgodek",
                groupZoneId = 80,
                groupId     = 29,
				
                agro        = xi.detects.SIGHT,
                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },
                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.orcish.GWAJBOJS_GUTRENDERS] =
        {
            name = "GWAJBOJS_GUTRENDERS",
            mobs =
            {
                name        = "Gutrender Trooper",
                groupZoneId = 80,
                groupId     = 32,
				
                agro        = xi.detects.SIGHT,

                template = basicResist,
            },

            boss =
            {
                name        = "One-eyed Gwajboj",
                groupZoneId = 80,
                groupId     = 31,
				
                agro        = xi.detects.SIGHT,

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.orcish.SPINEBEAK_HORDE] =
        {
            name = "SPINEBEAK HORDE",
            mobs =
            {
                name        = "Spinebeak Neckchopper",
                groupZoneId = 80,
                groupId     = 34,
				
                agro        = xi.detects.SIGHT,

                template = basicResist,
            },

            boss =
            {
                name        = "Deathlord Rojgnoj",
                groupZoneId = 80,
                groupId     = 33,
				
                agro        = xi.detects.SIGHT,

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.orcish.CLAN_REAPER] =
        {
            name = "CLAN REAPER",
            mobs =
            {
                name        = "Clan Reaper Grunt",
                groupZoneId = 80,
                groupId     = 37,
				
                agro        = xi.detects.SIGHT,

                template = basicResist,
            },

            boss = 
            {
                name        = "Jagidbod of Clan Reaper",  -- TODO Add Pet Watmachine
                groupZoneId = 80,
                groupId     = 36,
				
                agro        = xi.detects.SIGHT,

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.orcish.MOONFANG_PACK] =
        {
            name = "MOONFANG PACK",
            mobs =
            {
                name        = "Moonfang Warrior",
                groupZoneId = 80,
                groupId     = 40,
				
                agro        = xi.detects.SIGHT,

                template = basicResist,
            },

            boss =
            {
                name        = "Alpha Gnole Anders",
                groupZoneId = 80,
                groupId     = 38,
				
                agro        = xi.detects.SIGHT,

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
	},
	[xi.campaign.control.Windurst] =
    {
        [xi.campaign.forces.yagudo.TEMPLARS] =
        {
            name = "Divine Templar",
            mobs =
            {
                name        = "Divine Templar",
                groupZoneId = 94,
                groupId     = 42,
                agro        = xi.detects.SIGHT,
				

                template = basicResist,
            },

            boss =
            {
                name        = "Vee Qiqa the Decreer",
                groupZoneId = 94,
                groupId     = 40,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.yagudo.DIVINE_DISSEMINATORS] =
        {
            name = "Divine Disseminators",
            mobs =
            {
                name        = "Divine Disseminator",
                groupZoneId = 94,
                groupId     = 44,
                agro        = xi.detects.SIGHT,
				

                template = basicResist,
            },

            boss =
            {
                name        = "Moo Ouzi the Swiftblade",
                groupZoneId = 94,
                groupId     = 43,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.yagudo.DIVINE_ASSASSISN] =
        {
            name = "Divine Assassins",
            mobs =
            {
                name        = "Divine Assassin",
                groupZoneId = 94,
                groupId     = 46,
                agro        = xi.detects.SIGHT,
				

                template = basicResist,
            },

            boss =
            {
                name        = "Muu Buxu the Elusive",
                groupZoneId = 94,
                groupId     = 45,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
					
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.yagudo.DIVINE_ASCETICS] =
        {
            name = "Divine Ascetics",
            mobs =
            {
                name        = "Divine Ascetic",
                groupZoneId = 94,
                groupId     = 48,
                agro        = xi.detects.SIGHT,
				

                template = basicResist,
            },

            boss =
            {
                name        = "Dee Xalmo the Grim",
                groupZoneId = 94,
                groupId     = 47,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.yagudo.PLENILUNE_RONIN] =
        {
            name = "Plenilune Ronin",
            mobs =
            {
                name        = "Plenilune Ronin",
                groupZoneId = 94,
                groupId     = 50,
                agro        = xi.detects.SIGHT,
				

                template = basicResist,
            },

            boss =
            {
                name        = "Kazan the Peerless",
                groupZoneId = 94,
                groupId     = 49,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
    },
	[xi.campaign.control.Bastok] =
    {
        [xi.campaign.forces.quadav.DI_DHA_ELITE_GUARD] =
        {
            name = "Di'Dha Elite Guard",
            mobs =
            {
                name        = "DiDhas_Elite_Guard",
                groupZoneId = 87,
                groupId     = 33,
                agro        = xi.detects.SIGHT,
				

                template = basicResist,
            },

            boss =
            {
                name        = "DiDha Adamantfist",
                groupZoneId = 87,
                groupId     = 32,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.quadav.WAUGHROON_ARMORED_DIVISION] =
        {
            name = "Waughroon Armored Division",
            mobs =
            {
                name        = "Waughroon Heavyshell",
                groupZoneId = 87,
                groupId     = 35,
                agro        = xi.detects.SIGHT,
				

                template = basicResist,
            },

            boss =
            {
                name        = "BoDho Hundredfist",
                groupZoneId = 87,
                groupId     = 35,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.quadav.BEADEAUX_VANGUARD] =
        {
            name = "Beadeaux Vanguard",
            mobs =
            {
                name        = "Beadeaux Vanguard",
                groupZoneId = 87,
                groupId     = 37,
                agro        = xi.detects.SIGHT,
				

                template = basicResist,
            },

            boss =
            {
                name        = "DeVyu Headhunter",
                groupZoneId = 87,
                groupId     = 36,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.quadav.QULUN_ARMORED_DIVISION] =
        {
            name = "Qulun Armored Division",
            mobs =
            {
                name        = "Qulun Heavyshell",
                groupZoneId = 87,
                groupId     = 39,
                agro        = xi.detects.SIGHT,
				

                template = basicResist,
            },

            boss =
            {
                name        = "BiGho Headtaker",
                groupZoneId = 87,
                groupId     = 39,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
        [xi.campaign.forces.quadav.GO_BHU_ELITE_RAIDER] =
        {
            name = "Go'Bhu Elite Raiders",
            mobs =
            {
                name        = "GoBhus Elite Raider",
                groupZoneId = 87,
                groupId     = 41,
                agro        = xi.detects.SIGHT,
				

                template = basicResist,
            },

            boss =
            {
                name        = "GoBhu Herohunter",
                groupZoneId = 87,
                groupId     = 40,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
			other =
            {
                name        = "Dark Demetrie",
                groupZoneId = 135,
                groupId     = 1,
                agro        = xi.detects.SIGHT,
				

                mods     =
                {
                    [xi.mod.MAIN_DMG_RATING] =  55,
                },

                template = basicResist,
            },
        },
    },
}

return m