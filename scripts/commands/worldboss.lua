-----------------------------------
-- func: fafnir
-- desc: Summon a fightable Fafnir (no loot)
-- note:
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = ''
}

local worldBoss =
{
[ 1] = { name = 'Hidhaegg',     groupId =  40,  groupZoneId = 153, look = '00000f0300000000000000000000000000000000'}, -- Hidhaegg
[ 2] = { name = 'Bahamut',      groupId =  35,  groupZoneId = 213, look = '00001b0500000000000000000000000000000000'}, -- Bahamut
[ 3] = { name = 'Morta',        groupId =  35,  groupZoneId =  68, look = '00002b0800000000000000000000000000000000'}, -- Morta
[ 4] = { name = 'Ig-Alima',     groupId =  71,  groupZoneId = 103, look = '00000b0800000000000000000000000000000000'}, -- Ig-Alima
[ 5] = { name = 'Kalasutrax',   groupId = 140,  groupZoneId =  96, look = '0000110800000000000000000000000000000000'}, -- Kalasutrax
[ 6] = { name = 'Ocythoe',      groupId = 156,  groupZoneId =  89, look = '0000130800000000000000000000000000000000'}, -- Ocythoe
[ 7] = { name = 'Uptala',       groupId =  17,  groupZoneId = 177, look = '0000390800000000000000000000000000000000'}, -- Uptala
[ 8] = { name = 'Aello',        groupId =  20,  groupZoneId = 130, look = '00003a0800000000000000000000000000000000'}, -- Aello
[ 9] = { name = 'Ildebrann',    groupId =  31,  groupZoneId = 205, look = '0000600200000000000000000000000000000000'}, -- Ildebrann
[10] = { name = 'Pil',          groupId =   4,  groupZoneId = 222, look = '0000360800000000000000000000000000000000'}, -- Pil
[11] = { name = 'Agathos',      groupId = 167,  groupZoneId =  91, look = '0000570900000000000000000000000000000000'}, -- Agathos
[12] = { name = 'Celaeno',      groupId =  34,  groupZoneId = 191, look = '00003e0800000000000000000000000000000000'}, -- Celaeno
[13] = { name = 'Hahava',       groupId =  44,  groupZoneId = 190, look = '00003f0800000000000000000000000000000000'}, -- Hahava
[14] = { name = 'Kholomodumo',  groupId = 156,  groupZoneId =  82, look = '0000950100000000000000000000000000000000'}, -- Kholomodumo
[15] = { name = 'Akupara',      groupId = 159,  groupZoneId =  97, look = '0000480900000000000000000000000000000000'}, -- Akupara
[16] = { name = 'Krabimanjaro', groupId =  52,  groupZoneId = 193, look = '0000660100000000000000000000000000000000'}, -- Krabimanjaro
[17] = { name = 'Fafnir',       groupId =   5,  groupZoneId = 154, look = '00000f0300000000000000000000000000000000'}, -- Fafnir
[18] = { name = 'Azi-Dahaka',   groupId =  64,  groupZoneId = 288, look = '0000600200000000000000000000000000000000'}, -- Azi-Dahaka
[19] = { name = 'Naga Raja',    groupId =  96,  groupZoneId = 289, look = '0000610200000000000000000000000000000000'}, -- Naga Raja
[20] = { name = 'Quetzalcoatl', groupId =  89,  groupZoneId = 291, look = '0000630200000000000000000000000000000000'}, -- Quetzalcoatl
[21] = { name = 'Crom Dubh',    groupId =  45,  groupZoneId = 291, look = '00002e0a00000000000000000000000000000000'}, -- Crom Dubh
[22] = { name = 'Oryx',         groupId =  56,  groupZoneId = 291, look = '0000b20800000000000000000000000000000000'}, -- Oryx
[23] = { name = 'Odin',         groupId =   1,  groupZoneId = 298, look = '0000250700000000000000000000000000000000'}, -- Odin
[24] = { name = 'Darkness',     groupId =   1,  groupZoneId = 293, look = '00007e0b00000000000000000000000000000000'}, -- Darkness
[25] = { name = 'Hades',        groupId =   1,  groupZoneId = 277, look = '0000710a00000000000000000000000000000000'}, -- Hades
[26] = { name = 'Lilith',       groupId =  57,  groupZoneId = 182, look = '00008e0800000000000000000000000000000000'}, -- Lilith
[27] = { name = 'Metus',        groupId =   8,  groupZoneId =  36, look = '00007b0b00000000000000000000000000000000'}, -- Metus
[28] = { name = 'White Dragon', groupId =   17, groupZoneId = 275, look = '00004b0a00000000000000000000000000000000'}, -- White Dragon
[29] = { name = 'Putraxia',     groupId =   17, groupZoneId = 275, look = '00003c0a00000000000000000000000000000000'}, -- Putraxia
}

local pos =  
{
  --  ULEGUERAND_RANGE                = 5,
    [ 1] = {zone = xi.zone.ULEGUERAND_RANGE, X = 110.2888,    Y = -124.2062,  Z = 488.5356,     Rot = 98},
    [ 2] = {zone = xi.zone.ULEGUERAND_RANGE, X = 465.1826,    Y = -60.1621,   Z = 193.4102,     Rot = 210},
    [ 3] = {zone = xi.zone.ULEGUERAND_RANGE, X = 417.1392,    Y = -4.9963,    Z = -167.1491,    Rot = 97},
    [ 4] = {zone = xi.zone.ULEGUERAND_RANGE, X = -183.1201,   Y = -20.2063,   Z = -346.8375,    Rot = 148},
    [ 5] = {zone = xi.zone.ULEGUERAND_RANGE, X = -551.1062,   Y = -19.7908,   Z = 32.4107,      Rot = 27},
  --  LUFAISE_MEADOWS                 = 24,
    [ 6] = {zone = xi.zone.LUFAISE_MEADOWS, X = 396.7154,    Y = 0.8013,     Z = -183.9518,    Rot = 175},
    [ 7] = {zone = xi.zone.LUFAISE_MEADOWS, X = 114.8687,    Y = -7.9151,    Z = -49.2612,     Rot = 170},
    [ 8] = {zone = xi.zone.LUFAISE_MEADOWS, X = -51.8684,    Y = -7.0259,    Z = -219.4293,    Rot = 54},
    [ 9] = {zone = xi.zone.LUFAISE_MEADOWS, X = -180.9711,   Y = -15.1360,   Z = 93.2001,      Rot = 145},
    [10] = {zone = xi.zone.LUFAISE_MEADOWS, X = 438.8385,    Y = -7.5842,    Z = 173.2133,     Rot = 126},
  --  MISAREAUX_COAST                 = 25,
    [11] = {zone = xi.zone.MISAREAUX_COAST, X = 524.4113,    Y = 16.3584,    Z = -363.8145,    Rot = 86},
    [12] = {zone = xi.zone.MISAREAUX_COAST, X = 463.4977,    Y = -23.3501,   Z = -250.2150,    Rot = 77},
    [13] = {zone = xi.zone.MISAREAUX_COAST, X = 30.0371,     Y = -15.1916,   Z = 17.1806,      Rot = 53},
    [14] = {zone = xi.zone.MISAREAUX_COAST, X = -269.8559,   Y = -31.2493,   Z = 185.5424,     Rot = 25},
    [15] = {zone = xi.zone.MISAREAUX_COAST, X = -17.1479,    Y = -23.4055,   Z = 499.8452,     Rot = 52},
  --WAJAOM_WOODLANDS                = 51,
    [16] = {zone = xi.zone.WAJAOM_WOODLANDS, X = 392.7431,    Y = -23.7671,   Z = 291.7522,     Rot = 96},
    [17] = {zone = xi.zone.WAJAOM_WOODLANDS, X = -260.3857,   Y = -23.5000,   Z = 398.9149,     Rot = 47},
    [18] = {zone = xi.zone.WAJAOM_WOODLANDS, X = -674.0640,   Y = -7.7646,    Z = -114.1270,    Rot = 25},
    [19] = {zone = xi.zone.WAJAOM_WOODLANDS, X = -477.8634,   Y = -7.5000,    Z = -459.1767,    Rot = 148},
    [20] = {zone = xi.zone.WAJAOM_WOODLANDS, X = -70.6221,    Y = -8.7903,    Z = -629.5294,    Rot = 192},
        --BHAFLAU_THICKETS                = 52,
    [21] = {zone = xi.zone.BHAFLAU_THICKETS, X = 322.8759,    Y = -10.9640,   Z = 58.4303,      Rot = 62},
    [22] = {zone = xi.zone.BHAFLAU_THICKETS, X = 302.5067,    Y = -10.6083,   Z = 237.7381,     Rot = 34},
    [23] = {zone = xi.zone.BHAFLAU_THICKETS, X = 21.5785,     Y = -18.1652,   Z = 270.0721,     Rot = 251},
    [24] = {zone = xi.zone.BHAFLAU_THICKETS, X = 311.7900,    Y = -23.6905,   Z = 434.8783,     Rot = 56},
    [25] = {zone = xi.zone.BHAFLAU_THICKETS, X = 20.8492,     Y = -35.2174,   Z = 557.5164,     Rot = 15},
        --MOUNT_ZHAYOLM                   = 61,
    [26] = {zone = xi.zone.MOUNT_ZHAYOLM, X = 886.7272,    Y = -13.9532,   Z = 315.6183,      Rot = 105},
    [27] = {zone = xi.zone.MOUNT_ZHAYOLM, X = 682.9779,    Y = -14.0000,   Z = -42.5466,      Rot = 153},
    [28] = {zone = xi.zone.MOUNT_ZHAYOLM, X = 256.0347,    Y = -17.5713,   Z = -236.9707,     Rot = 74},
    [29] = {zone = xi.zone.MOUNT_ZHAYOLM, X = -684.9326,   Y = -12.0000,   Z = -119.4912,     Rot = 238},
    [30] = {zone = xi.zone.MOUNT_ZHAYOLM, X = -446.6085,   Y = -14.2007,   Z = 391.7195,      Rot = 79},
        --LA_THEINE_PLATEAU               = 102,
    [31] = {zone = xi.zone.LA_THEINE_PLATEAU, X = 649.9268,    Y = 30.1141,   Z = -57.9295,     Rot = 145},
    [32] = {zone = xi.zone.LA_THEINE_PLATEAU, X = 239.1973,    Y = 19.2069,   Z = 101.1055,     Rot = 34},
    [33] = {zone = xi.zone.LA_THEINE_PLATEAU, X = 46.1823,     Y = 30.7017,   Z = -586.7975,    Rot = 203},
    [34] = {zone = xi.zone.LA_THEINE_PLATEAU, X = -643.1412,   Y = -8.0000,   Z = 161.2718,     Rot = 93},
    [35] = {zone = xi.zone.LA_THEINE_PLATEAU, X = -179.0552,   Y = 8.2980,    Z = 268.1519,     Rot = 48},
    --VALKURM_DUNES                   = 103,
    [36] = {zone = xi.zone.VALKURM_DUNES, X = 553.8656,    Y = -15.8135,  Z = 258.2708,     Rot = 62},
    [37] = {zone = xi.zone.VALKURM_DUNES, X = 0722.9982,   Y = 0.9716,    Z = -60.5469,     Rot = 132},
    [38] = {zone = xi.zone.VALKURM_DUNES, X = 283.8432,    Y = 3.2434,    Z = -146.1172,    Rot = 205},
    [39] = {zone = xi.zone.VALKURM_DUNES, X = -328.3090,   Y = -0.9138,   Z = -9.6801,      Rot = 235},
    [40] = {zone = xi.zone.VALKURM_DUNES, X = -753.6943,   Y = -4.0000,   Z = 158.9794,     Rot = 241},
        --BATALLIA_DOWNS                  = 105,
    [41] = {zone = xi.zone.BATALLIA_DOWNS, X = 287.1360,   Y = 8.1175,   Z = 168.6550,     Rot = 109},
    [42] = {zone = xi.zone.BATALLIA_DOWNS, X = 278.0640,   Y = 0.0000,   Z = -280.8077,    Rot = 134},
    [43] = {zone = xi.zone.BATALLIA_DOWNS, X = -196.3179,  Y = -25.1044, Z = -73.7027,     Rot = 37},
    [44] = {zone = xi.zone.BATALLIA_DOWNS, X = -473.8706,  Y = -15.6488, Z = 106.2756,     Rot = 4},
    [45] = {zone = xi.zone.BATALLIA_DOWNS, X = -230.8865,  Y = -7.7454,  Z = 400.6284,     Rot = 67},
        --NORTH_GUSTABERG                 = 106,
    [46] = {zone = xi.zone.NORTH_GUSTABERG, X = 278.6014,    Y = -60.0000,   Z = 503.0905,     Rot = 221},
    [47] = {zone = xi.zone.NORTH_GUSTABERG, X = 514.2790,    Y = -0.7437,    Z = 648.7913,     Rot = 93},
    [48] = {zone = xi.zone.NORTH_GUSTABERG, X = 260.3572,    Y = -8.7232,    Z = 931.9592,     Rot = 61},
    [49] = {zone = xi.zone.NORTH_GUSTABERG, X = -480.5803,   Y = 50.0000,    Z = 11.6195,      Rot = 29},
    [50] = {zone = xi.zone.NORTH_GUSTABERG, X = -627.1478,   Y = 39.4145,    Z = 4443.6123,    Rot = 45},
        --KONSCHTAT_HIGHLANDS             = 108,
    [51] = {zone = xi.zone.KONSCHTAT_HIGHLANDS, X = -301.1838,   Y = 43.7635,   Z = 444.5376,     Rot = 37},
    [52] = {zone = xi.zone.KONSCHTAT_HIGHLANDS, X = -674.4978,   Y = 8.2563,    Z = 129.1440,     Rot = 221},
    [53] = {zone = xi.zone.KONSCHTAT_HIGHLANDS, X = -314.8065,   Y = -39.8825,  Z = -309.0305,    Rot = 212},
    [54] = {zone = xi.zone.KONSCHTAT_HIGHLANDS, X = 427.2183,    Y = 10.1653,   Z = 82.5289,      Rot = 148},
    [55] = {zone = xi.zone.KONSCHTAT_HIGHLANDS, X = 499.0181,    Y = -15.2378,  Z = -403.4484,    Rot = 94},
        --PASHHOW_MARSHLANDS              = 109,
    [56] = {zone = xi.zone.PASHHOW_MARSHLANDS, X = 519.7661,    Y = 25,   Z = 556.1939,     Rot = 110},
    [57] = {zone = xi.zone.PASHHOW_MARSHLANDS, X = -396.5547,    Y = 24.8500,   Z = 509.2249,     Rot = 15},
    [58] = {zone = xi.zone.PASHHOW_MARSHLANDS, X = 132.0428,    Y = 24.3687,   Z = 143.5904,     Rot = 24},
    [59] = {zone = xi.zone.PASHHOW_MARSHLANDS, X = -429.6403,    Y = 24.6923,   Z = -257.3503,     Rot = 27},
    [60] = {zone = xi.zone.PASHHOW_MARSHLANDS, X = 258.3221,    Y = 25.000,   Z = -213.2717,     Rot = 219},
            --ROLANBERRY_FIELDS               = 110,
    [61] = {zone = xi.zone.ROLANBERRY_FIELDS, X = -622.3235,    Y = -23.2361,   Z = -119.1987,     Rot = 34},
    [62] = {zone = xi.zone.ROLANBERRY_FIELDS, X = -323.9983,    Y = 8.5857,   Z = 266.0361,     Rot = 68},
    [63] = {zone = xi.zone.ROLANBERRY_FIELDS, X = 242.5257,    Y = 8.6002,   Z = 211.7531,     Rot = 20},
    [64] = {zone = xi.zone.ROLANBERRY_FIELDS, X = 201.2032,    Y = -23.3386,   Z = -301.9445,     Rot = 219},
    [65] = {zone = xi.zone.ROLANBERRY_FIELDS, X = -309.2646,    Y = -22.1018,   Z = -626.9618,     Rot = 180},
        --BEAUCEDINE_GLACIER              = 111,
    [66] = {zone = xi.zone.BEAUCEDINE_GLACIER, X = 186.1861,    Y = 20.5772,   Z = 520.6742,     Rot = 18},
    [67] = {zone = xi.zone.BEAUCEDINE_GLACIER, X = 386.9787,    Y = 0.2607,   Z = -191.2811,     Rot = 127},
    [68] = {zone = xi.zone.BEAUCEDINE_GLACIER, X = -266.5952,    Y = -40.3103,   Z = -309.9124,     Rot = 61},
    [69] = {zone = xi.zone.BEAUCEDINE_GLACIER, X = -200.3598,    Y = -99.7893,   Z = 31.7640,     Rot = 84},
    [70] = {zone = xi.zone.BEAUCEDINE_GLACIER, X = -146.5347,    Y = -79.4580,   Z = 159.3076,     Rot = 47},
        --XARCABARD                       = 112,
    [71] = {zone = xi.zone.XARCABARD, X = 156.0231,    Y = -28.0045,   Z = 156.5378,     Rot = 54},
    [72] = {zone = xi.zone.XARCABARD, X = -145.8837,    Y = -23.3931,   Z = -42.0614,     Rot = 226},
    [73] = {zone = xi.zone.XARCABARD, X = 461.4723,    Y = -8.3350,   Z = 75.2249,     Rot = 107},
    [74] = {zone = xi.zone.XARCABARD, X = 409.6248,    Y = 0.2556,   Z = -195.5280,     Rot = 124},
    [75] = {zone = xi.zone.XARCABARD, X = 144.5136,    Y = -18.6982,   Z = -85.4452,     Rot = 24},
        --CAPE_TERIGGAN                   = 113,
    [76] = {zone = xi.zone.CAPE_TERIGGAN, X = -138.3897,    Y = 6.6615,   Z = -7.7059,     Rot = 64},
    [77] = {zone = xi.zone.CAPE_TERIGGAN, X = 68.3477,    Y = 3.8587,   Z = -149.5807,     Rot = 188},
    [78] = {zone = xi.zone.CAPE_TERIGGAN, X = 142.9641,    Y = 7.9355,   Z = 190.0676,     Rot = 150},
    [79] = {zone = xi.zone.CAPE_TERIGGAN, X = -40.3713,    Y = -7.9461,   Z = 274.9013,     Rot = 7},
    [80] = {zone = xi.zone.CAPE_TERIGGAN, X = -171.0389,    Y = -7.6005,   Z = 214.4183,     Rot = 250},
        --EASTERN_ALTEPA_DESERT           = 114,
    [81] = {zone = xi.zone.EASTERN_ALTEPA_DESERT, X = -109.1396,    Y = -7.6594,   Z = 363.1476,     Rot = 42},
    [82] = {zone = xi.zone.EASTERN_ALTEPA_DESERT, X = -320.8436,    Y = 0.0000,   Z = 78.2540,     Rot = 26},
    [83] = {zone = xi.zone.EASTERN_ALTEPA_DESERT, X = 41.4744,    Y = 8.0645,   Z = -394.6820,     Rot = 220},
    [84] = {zone = xi.zone.EASTERN_ALTEPA_DESERT, X = 335.2226,    Y = 0.1850,   Z = -93.0197,     Rot = 212},
    [85] = {zone = xi.zone.EASTERN_ALTEPA_DESERT, X = 17.9759,    Y = -33.8393,   Z = 107.2911,     Rot = 231},
        --BUBURIMU_PENINSULA              = 118,
    [86] = {zone = xi.zone.BUBURIMU_PENINSULA, X = 324.0651,    Y = 0.0000,   Z = 321.8222,     Rot = 46},
    [87] = {zone = xi.zone.BUBURIMU_PENINSULA, X = 490.9865,    Y = 0.4716,   Z = -6.4863,     Rot = 101},
    [88] = {zone = xi.zone.BUBURIMU_PENINSULA, X = -446.3343,    Y = -8.2590,   Z = -208.7674,     Rot = 26},
    [89] = {zone = xi.zone.BUBURIMU_PENINSULA, X = 76.4839,    Y = -8.1104,   Z = 45.7395,     Rot = 237},
    [90] = {zone = xi.zone.BUBURIMU_PENINSULA, X = -226.6701,    Y = 16.4155,   Z = -275.2890,     Rot = 55},
            --MERIPHATAUD_MOUNTAINS           = 119,
    [91] = {zone = xi.zone.MERIPHATAUD_MOUNTAINS, X = 619.8580,    Y = -23.7680,   Z = -46.6911,     Rot = 225},
    [92] = {zone = xi.zone.MERIPHATAUD_MOUNTAINS, X = 638.0681,    Y = -0.0121,   Z = -427.5651,     Rot = 249},
    [93] = {zone = xi.zone.MERIPHATAUD_MOUNTAINS, X = -514.0001,    Y = 8.9205,   Z = 338.3064,     Rot = 29},
    [94] = {zone = xi.zone.MERIPHATAUD_MOUNTAINS, X = -34.1760,    Y = 7.7656,   Z = -70.1864,     Rot = 145},
    [95] = {zone = xi.zone.MERIPHATAUD_MOUNTAINS, X = 194.5382,    Y = 0.1960,   Z = -492.5449,     Rot = 176},
            --SAUROMUGUE_CHAMPAIGN            = 120,
    [96] = {zone = xi.zone.SAUROMUGUE_CHAMPAIGN, X = 361.3416,    Y = 40.0000,   Z = 399.2678,     Rot = 80},
    [97] = {zone = xi.zone.SAUROMUGUE_CHAMPAIGN, X = -328.4420,    Y = 0.0395,   Z = 512.4392,     Rot = 102},
    [98] = {zone = xi.zone.SAUROMUGUE_CHAMPAIGN, X = 595.9960,    Y = -0.0009,   Z = -200.3910,     Rot = 127},
    [99] = {zone = xi.zone.SAUROMUGUE_CHAMPAIGN, X = -281.2194,    Y = 8.0845,   Z = 74.2894,     Rot = 4},
    [100] = {zone = xi.zone.SAUROMUGUE_CHAMPAIGN, X = 314.3055,    Y = -0.1075,   Z = -282.07777,     Rot = 86},
}

commandObj.onTrigger = function(player)
--SetServerVariable('[WorldBossTimer]', os.time())
local varName     = '[WorldBossTimer]' 
local WorldBossTimer = GetServerVariable(varName)
if os.time() > WorldBossTimer then

local posz = math.random(1, 100)
            for k, v in pairs(pos) do
            if posz == k then
                    X = v.X
                    Y = v.Y
                    Z = v.Z
                    Rot = v.Rot
                    zonez = v.zone
               end
            end 

local rand = math.random(1, 29)
            for k, v in pairs(worldBoss) do
                    if rand == k then
                    namez = v.name
                    groupIdz = v.groupId
                    groupZoneIdz = v.groupZoneId
                    lookz = v.look
                    end
            end 

    local zone = GetZone(zonez)
    local mob = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = namez, 
        look = lookz,
        x = X,
        y = Y,
        z = Z,
        rotation = Rot,
        widescan = 1,
        groupId = groupIdz,
        groupZoneId = groupZoneIdz,   
         

        onMobSpawn = function(mob, playerArg, optParams)
        player:printToArea('----------------WORLD BOSS ANNOUCEMENT----------------', xi.msg.channel.SYSTEM_3, 0)
        player:printToArea(string.format('GM General : %s has been spotted in %s, Please help,  vanqish this evil demon!', namez, mob:getZoneName()), xi.msg.channel.SYSTEM_3, 0)
        mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 45)
        mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
        mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 5)
        mob:setMobMod(xi.mobMod.SIGHT_RANGE, 30)
        mob:setMobMod(xi.mobMod.SOUND_RANGE, 30)
        mob:setMobMod(xi.mobMod.DRAW_IN, 1)
        mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
        mob:setMobLevel(150)
        mob:addMod(xi.mod.MAIN_DMG_RATING, 50)
        mob:addMod(xi.mod.STR, 40)
        mob:addMod(xi.mod.VIT, 20)
        mob:addMod(xi.mod.INT, 50)
        mob:addMod(xi.mod.MND, 20)
        mob:addMod(xi.mod.CHR, 20)
        mob:addMod(xi.mod.AGI, 20)
        mob:addMod(xi.mod.DEX, 40)
        mob:setMod(xi.mod.DEFP, 0)
        mob:setMod(xi.mod.RATTP, 0)
        mob:addMod(xi.mod.DEFP, 475)
        mob:addMod(xi.mod.RATTP, 475)
        mob:addMod(xi.mod.ACC, 150)
        mob:setMod(xi.mod.EARTH_SDT, 128)
        mob:setMod(xi.mod.DARK_SDT, 250)
        mob:setMod(xi.mod.LIGHT_SDT, 200)
        mob:setMod(xi.mod.ICE_SDT, 200)
        mob:setMod(xi.mod.FIRE_SDT, 200)
        mob:setMod(xi.mod.WATER_SDT, 200)
        mob:setMod(xi.mod.THUNDER_SDT, 200)
        mob:setMod(xi.mod.WIND_SDT, 200)
        mob:setMod(xi.mod.SILENCERES, 100)
        mob:setMod(xi.mod.STUNRES, 50)
        mob:setMod(xi.mod.BINDRES, 100)
        mob:setMod(xi.mod.GRAVITYRES, 100)
        mob:setMod(xi.mod.SLEEPRES, 100)
        mob:setMod(xi.mod.POISONRES, 100)
        mob:setMod(xi.mod.PARALYZERES, 100)
        mob:setMod(xi.mod.LULLABYRES, 100)
        mob:setMod(xi.mod.FASTCAST, 10)
        mob:addStatusEffect(xi.effect.SHOCK_SPIKES, 50, 0, 0)
        mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
        mob:addStatusEffect(xi.effect.ENTHUNDER_II, 100, 0, 0)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 277)
        mob:setMobMod(xi.mobMod.SPELL_LIST, 24)
        end,

        onMobFight = function(mob, target)
        --local dmg = mob:takeDamage()
        local mobName = mob:getName(target)
        local varName = '[WB] dmg - ' .. mobName
        target:setCharVar(varName, 1)

        end, 

        onMobDeath = function(mob, playerArg, optParams)
        SetServerVariable('[WorldBossTimer]', (os.time() + 5))
        
        end,

        releaseIdOnDisappear = true,

        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
        mixins =
        {
            require('scripts/mixins/rage'),
            require('scripts/mixins/job_special'),
        },
        specialSpawnAnimation = true,
    })
    mob:setSpawn(X, Y, Z, Rot, zonez)
    mob:setDropID(184) -- loot id
    mob:setClaimable(false) -- allows everyone to attack him
    mob:spawn()

    player:printToPlayer(string.format('Spawning Fafnir (Lv: %i, HP: %i)\n%s', mob:getMainLvl(), mob:getMaxHP(), mob))
end
end
return commandObj
