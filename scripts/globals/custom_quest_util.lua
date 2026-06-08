----------------------------------------------------
-- Set up
-- add to global mobs.lua line 14 - xi.custom_quest.onMobDeathEx(mob, player, isKiller, isWeaponSkillKill)
-- add to global globals\hobbies\chocobo_digging\logic line 281,  xi.custom_quest.chocoboDigAdjustment(player) ** around the -- local function handleItemObtained(player, text, itemId) area
-- add to global globals\hobbies\helm\logic line 190, xi.custom_quest.helmAdjustment(player, helmType) ** around the -- success! reward item and decrement number of remaining uses on the point area of the code
-- add to any NPC, xi.custom_quest.onTrade(player, npc, trade)
-- add to same NPC, xi.custom_quest.onTrigger(player, npc)
-- settings/main DIG_FATIGUE needs to be adjusted to the correct amount you want the fatigue at
-- add !custquest command to modules commands
-- adjust for 75 job points ---> merit points ( player:getMeritCount() , player:setMerits(##) ) ** remove any NM that doesnt exist in 75
----------------------------------------------------

-- Fallback for getMidnight() after LSB time helper changes.
-- This variant returns the NEXT midnight in Japan Standard Time (UTC+09:00),
-- regardless of the server's local timezone or DST. It is guarded so it won't
-- override a project-provided implementation if one exists.
if getMidnight == nil then
    function getMidnight()
        local now = os.time()

        local utc_now_tbl = os.date('!*t', now)
        local utc_now_epoch = os.time(utc_now_tbl)
        local local_offset = os.difftime(now, utc_now_epoch)

        local jst_delta = -local_offset + 9 * 3600
        local now_jst_epoch = now + jst_delta

        local jst_tbl = os.date('*t', now_jst_epoch)
        jst_tbl.hour, jst_tbl.min, jst_tbl.sec = 0, 0, 0
        local today_jst_midnight_localized = os.time(jst_tbl) 

        local today_jst_midnight_epoch = today_jst_midnight_localized - jst_delta

        if now >= today_jst_midnight_epoch then
            return today_jst_midnight_epoch + 86400
        end
        return today_jst_midnight_epoch
    end
end
----------------------------------------------------

xi = xi or {}
xi.custom_quest = custom_quest or {}

local customQuestType =
{
    [1] = {'Daily',   5, 311, '[LD]CustomQuestDaily'},
    [2] = {'Weekly',  4, 312, '[LD]CustomQuestWeekly'},
    [3] = {'Monthly', 2, 313, '[LD]CustomQuestMonthly'},
   -- [4] = {'Special', 1, 314},
}
--[[
Daily	    Weekly	        Monthly
Crafting	Family Kills	Supreme kills
Digging	    WS Kills	    Provenance Kill
harvesting	NM Kills	    World Boss kill
logging	    NMH Kills	
mining		
excavation
job points


5 daily resets at jpmidnight
4 weekly resets at conquest tally
2 monthly resets at the begining of each monthly
All quests are based off of catagory and you cannot select a specific Quest
craft quests are selected from a pool of items and must be a signed
!custquest to keep track of your current quest and over all quest information
Weapon skill quests will count your weaponskills used and print out your total after the mob is dead
Rewards
Gil & Xp when completing a quest
Differenty types of currency when completing a quest 10 Domain points (Daily), 500 Hallmarks (Weekly), 2000 Gallantry (Monthly)
5% chance to receive a gobbie box reward when completing quest
Mile stone reward every 25 quests completed - Total Quest Completed Counter will reset after you have completed 250 quests
     tier 1 rewards 25 completed missions Kupon I-AF109 - Rem Tales
     tier 2 rewards 50 completed missions Kupon A-E+2 - empy +2 set
     tier 3 rewards 75 completed missions Kupon I-Seal - Emp Seals
     tier 4 rewards 100 completed missions Kupon I-AF119 - omen seals
     tier 5 rewards 125 completed missions Kupon I-Mat - Reforged mats +1 / +2
     tier 6 rewards 150 completed missions Ambuscade chit: footgear
     tier 7 rewards 175 completed missions Ambuscade chit: handgear
     tier 8 rewards 200 completed missions Ambuscade chit: headgear
     tier 9 rewards 225 completed missions Ambuscade chit: leggear
     tier 10 rewards 250 completed missions Ambuscade chit: bodygear
]]--

local customQuestId =
{    -- [Quest id] / objective / (eco or skill id or space holder) / objective amount / difficulty tier for rewards
    -----------------------------------
    -- KILL_ECOSYSTEM_QTY
    -----------------------------------
    [084] = {'Turn in Job Points',1,100,2},
    [085] = {'Kill Warder_of_Dignity', 1,1,3},
    [086] = {'Kill Warder_of_Faith', 1,1,3},
    [087] = {'Kill Warder_of_Fortitude', 1,1,3},
    [088] = {'Kill Warder_of_Hope', 1,1,3},
    [089] = {'Kill Warder_of_Justice', 1,1,3},
    [090] = {'Kill Warder_of_Love', 1,1,3},
    [091] = {'Kill Warder_of_Loyalty', 1,1,3},
    [092] = {'Kill Warder_of_Mercy', 1,1,3},
    [093] = {'Kill Warder_of_Prudence', 1,1,3},
    [094] = {'Kill Warder_of_Temperance', 1,1,3},
    [095] = {'Helm Chocobo Digging',1,10,1},
    [096] = {'Helm Harvesting', 1,10,1},
    [097] = {'Helm Loggin', 1,10,1},
    [098] = {'Helm Mining', 1,10,1},
    [099] = {'Helm Excavation', 1,10,1},
    [100] = {'Kill Amorph', 1,50,2}, -- Eco System Kills 50
    [101] = {'Kill Aquan', 2,50,2},
    [102] = {'Kill Arcana', 3,50,2},
    [103] = {'Kill Archaicachine', 4,50,2},
    [104] = {'Kill Elemental', 11,50,2}, -- removing Avatar mobs because it will be difficult to do 50
    [105] = {'Kill Beast', 6,50,2},
    [106] = {'Kill Beastman', 7,50,2},
    [107] = {'Kill Bird', 8,50,2},
    [108] = {'Kill Demon', 9,50,2},
    [109] = {'Kill Dragon', 10,50,2},
    [110] = {'Kill Elemental', 11,50,2},
    [111] = {'Kill Empty', 12,50,2},
    [112] = {'Kill Bird', 8,50,2}, -- removing Humanoid mobs because it will be difficult to do 50
    [113] = {'Kill Lizard', 14,50,2},
    [114] = {'Kill Luminian', 15,50,2},
    [115] = {'Kill Luminion', 16,50,2},
    [116] = {'Kill Plantoid', 17,50,2},
    [117] = {'Kill Beastman', 7,50,2}, -- removing Unclassified mobs because it will be difficult to do 50
    [118] = {'Kill Undead', 19,50,2},
    [119] = {'Kill Vermin', 20,50,2},
    [120] = {'Kill Voragean', 21,50,2},
    [121] = {'H2H Weaponskill', 1,50,2}, -- Weaponskill kills per weapon Type 50
    [122] = {'Dagger Weaponskill', 2,50,2},
    [123] = {'Sword Weaponskill', 3,50,2},
    [124] = {'Great Sword Weaponskill', 4,50,2},
    [125] = {'Axe Weaponskill', 5,50,2},
    [126] = {'Great Axe Weaponskill', 6,50,2},
    [127] = {'Scyth Weaponskill', 7,50,2},
    [128] = {'Polearm Weaponskill', 8,50,2},
    [129] = {'Katana Weaponskill', 9,50,2},
    [130] = {'Great Katana Weaponskill', 10,50,2},
    [131] = {'Club Weaponskill', 11,50,2},
    [132] = {'Staff Weaponskill', 12,50,2},
    [133] = {'Archery Weaponskill', 25,50,2},
    [134] = {'Marksmanship Weaponskill', 26,50,2},
    [135] = {'Kill Aglaophotis', 1,1,2}, -- Escha Notorious Monsters kill
    [136] = {'Kill Alpluachra', 1,1,2},
    [137] = {'Kill Angrboda', 1,1,2},
    [138] = {'Kill Blazewing', 1,1,2},
    [139] = {'Kill Brittlis', 1,1,2},
    [140] = {'Kill Bucca', 1,1,2},
    [141] = {'Kill Cunnast', 1,1,2},
    [142] = {'Kill Ferrodon', 1,1,2},
    [143] = {'Kill Fleetstalker', 1,1,2},
    [144] = {'Kill Gestalt', 1,1,2},
    [145] = {'Kill Gulltop', 1,1,2},
    [146] = {'Kill Ionos', 1,1,2},
    [147] = {'Kill Kamohoalii', 1,1,2},
    [148] = {'Kill Lustful_Lydia', 1,1,2},
    [149] = {'Kill Nosoi', 1,1,2},
    [150] = {'Kill Pazuzu', 1,1,2},
    [151] = {'Kill Puca', 1,1,2},
    [152] = {'Kill Revetaur', 1,1,2},
    [153] = {'Kill Sensual_Sandy', 1,1,2},
    [154] = {'Kill Shockmaw', 1,1,2},
    [155] = {'Kill Tangata_Manu', 1,1,2},
    [156] = {'Kill Umdhlebi', 1,1,2},
    [157] = {'Kill Urmahlullu', 1,1,2},
    [158] = {'Kill Vidala', 1,1,2},
    [159] = {'Kill Vyala', 1,1,2},
    [160] = {'Kill Wepwawet', 1,1,2},
    [161] = {'Kill Wrathare', 1,1,2},
    [162] = {'Kill Abununnu', 1,1,2}, -- VWNM Notorious Monster Kills
    [163] = {'Kill Aello', 1,1,2},
    [164] = {'Kill Agathos', 1,1,2},
    [165] = {'Kill Akupara', 1,1,2},
    [166] = {'Kill Akvan', 1,1,2},
    [167] = {'Kill Belphoebe', 1,1,2},
    [168] = {'Kill Bhishani', 1,1,2},
    [169] = {'Kill Bismarck', 1,1,2},
    [170] = {'Kill Botulus_Rex', 1,1,2},
    [171] = {'Kill Brekekekex', 1,1,2},
    [172] = {'Kill Cath_Palug', 1,1,2},
    [173] = {'Kill Celaeno', 1,1,2},
    [174] = {'Kill Cherufe', 1,1,2},
    [175] = {'Kill Cottus', 1,1,2},
    [176] = {'Kill Dimgruzub', 1,1,2},
    [177] = {'Kill Fjalar', 1,1,2},
    [178] = {'Kill Gasha', 1,1,2},
    [179] = {'Kill Gaunab', 1,1,2},
    [180] = {'Kill Giltine', 1,1,2},
    [181] = {'Kill Goji', 1,1,2},
    [182] = {'Kill Gugalanna', 1,1,2},
    [183] = {'Kill Gwynn_ap_Nudd', 1,1,2},
    [184] = {'Kill Hahava', 1,1,2},
    [185] = {'Kill Holy_Moly', 1,1,2},
    [186] = {'Kill Ig-Alima', 1,1,2},
    [187] = {'Kill Ildebrann', 1,1,2},
    [188] = {'Kill Isarukitsck', 1,1,2},
    [189] = {'Kill Kaggen', 1,1,2},
    [190] = {'Kill Kalasutrax', 1,1,2},
    [191] = {'Kill Kholomodumo', 1,1,2},
    [192] = {'Kill Krabimanjaro', 1,1,2},
    [193] = {'Kill Laidly_Laurence', 1,1,2},
    [194] = {'Kill Lancing_Lamorak', 1,1,2},
    [195] = {'Kill Lorbulcrud', 1,1,2},
    [196] = {'Kill Lord_Asag', 1,1,2},
    [197] = {'Kill Malleator_Maurok', 1,1,2},
    [198] = {'Kill Melancholic_Moira', 1,1,2},
    [199] = {'Kill Mellonia', 1,1,2},
    [200] = {'Kill Mimic_King', 1,1,2},
    [201] = {'Kill Modron', 1,1,2},
    [202] = {'Kill Morta', 1,1,2},
    [203] = {'Kill Murk-veined_Baneberry', 1,1,2},
    [204] = {'Kill Neith', 1,1,2},
    [205] = {'Kill Nympha_Eunomia', 1,1,2},
    [206] = {'Kill Ocythoe', 1,1,2},
    [207] = {'Kill Ogbunabali', 1,1,2},
    [208] = {'Kill Pancimanci', 1,1,2},
    [209] = {'Kill Pil', 1,1,2},
    [210] = {'Kill Qilin', 1,1,2},
    [211] = {'Kill Roly-Poly', 1,1,2},
    [212] = {'Kill Rw_Nw_Prt_M_Hrw', 1,1,2},
    [213] = {'Kill Sabotender_Campeador', 1,1,2},
    [214] = {'Kill Sallow_Seymour', 1,1,2},
    [215] = {'Kill Sarimanok', 1,1,2},
    [216] = {'Kill Smierc', 1,1,2},
    [217] = {'Kill Stachysaurus', 1,1,2},
    [218] = {'Kill Tangaroa', 1,1,2},
    [219] = {'Kill Taweret', 1,1,2},
    [220] = {'Kill Tsui-Goab', 1,1,2},
    [221] = {'Kill Uptala', 1,1,2},
    [222] = {'Kill Ushumgal', 1,1,2},
    [223] = {'Kill Vanasarvik', 1,1,2},
    [224] = {'Kill Virvatuli', 1,1,2},
    [225] = {'Kill Voidwrought', 1,1,2},
    [226] = {'Kill Yalungur', 1,1,2},
    [227] = {'Kill Yatagarasu', 1,1,2},
    [228] = {'Kill Vidmapire', 1,1,2}, -- Unity Notorious Monster Kills
    [229] = {'Kill Muut', 1,1,2},
    [230] = {'Kill Tumult_Curator', 1,1,2},
    [231] = {'Kill Lumber_Jill', 1,1,2},
    [232] = {'Kill Largantua', 1,1,2},
    [233] = {'Kill Sovereign_Behemoth', 1,1,2},
    [234] = {'Kill Intuila', 1,1,2},
    [235] = {'Kill Garbage_Gel', 1,1,2},
    [236] = {'Kill Abyssdiver', 1,1,2},
    [237] = {'Kill Shedu', 1,1,2},
    [238] = {'Kill Vedrfolnir', 1,1,2},
    [239] = {'Kill Orcfeltrap', 1,1,2},
    [240] = {'Kill Azrael', 1,1,2},
    [241] = {'Kill Hugemaw_Harold', 1,1,2},
    [242] = {'Kill Prickly_Pitriv', 1,1,2},
    [243] = {'Kill Cactrot_Veloz', 1,1,2},
    [244] = {'Kill Borealis_Shadow', 1,1,2},
    [245] = {'Kill Mephitas', 1,1,2},
    [246] = {'Kill Wyvernhunter_Bambrox', 1,1,2},
    [247] = {'Kill Coca', 1,1,2},
    [248] = {'Kill Emperor_Arthro', 1,1,2},
    [249] = {'Kill Sleepy_Mabel', 1,1,2},
    [250] = {'Kill Specter_Worm', 1,1,2},
    [251] = {'Kill Ironhorn_Baldurno', 1,1,2},
    [252] = {'Kill Voso', 1,1,2},
    [253] = {'Kill Immanibugard', 1,1,2},
    [254] = {'Kill Warblade_Beak', 1,1,2},
    [255] = {'Kill Tiyanak', 1,1,2},
    [256] = {'Kill Grand_Grenade', 1,1,2},
    [257] = {'Kill Joyous_Green', 1,1,2},
    [258] = {'Kill Jester_Malatrix', 1,1,2},
    [259] = {'Kill Centurio_XX-I', 1,1,2},
    [260] = {'Kill Douma_Weapon', 1,1,2},
    [261] = {'Kill Strix', 1,1,2},
    [262] = {'Kill Arke', 1,1,2},
    [263] = {'Kill Bakunawa', 1,1,2},
    [264] = {'Kill Bounding_Belinda', 1,1,2},
    [265] = {'Kill Serpopard_Ninlil', 1,1,2},
    [266] = {'Kill Azure-toothed_Clawberry', 1,1,2},
    [267] = {'Kill Ayapec', 1,1,2},
    [268] = {'Kill Keeper_of_Heiligtum', 1,1,2},
    [269] = {'Kill Camahueto', 1,1,2},
    [270] = {'Kill Valkurm_Imperator', 1,1,2},
    [271] = {'Kill Tolba', 1,1,2},
    [272] = {'Kill Kubool_Jas_Mhuufya', 1,1,2},
    [273] = {'Kill King_Uropygid', 1,1,2},
    [274] = {'Kill Beist', 1,1,2},
    [275] = {'Kill Woodland_Mender', 1,1,2},
    [276] = {'Kill Sybaritic_Samantha', 1,1,2},
    [277] = {'Kill Vermillion_Fishfly', 1,1,2},
    [278] = {'Kill Carousing_Celine', 1,1,2},
    [279] = {'Kill Volatile_Cluster', 1,1,2},
    [280] = {'Kill Glazemane', 1,1,2},
    [281] = {'Kill Hidhaegg', 1,1,2},
    [282] = {'Kill Thuban', 1,1,2},
    [283] = {'Kill Sarama', 1,1,2},
    [284] = {'Kill Ailmar', 1,1,2}, -- NMHunt Notorious Monsters T1
    [285] = {'Kill Amara', 1,1,2},
    [286] = {'Kill Aquarun', 1,1,2},
    [287] = {'Kill Axil', 1,1,2},
    [288] = {'Kill Bellas', 1,1,2},
    [289] = {'Kill Bonna', 1,1,2},
    [290] = {'Kill Brina', 1,1,2},
    [291] = {'Kill Celestia', 1,1,2},
    [292] = {'Kill Cluym', 1,1,2},
    [293] = {'Kill Daemeon', 1,1,2},
    [294] = {'Kill Dark Rain', 1,1,2},
    [295] = {'Kill Diamond', 1,1,2},
    [296] = {'Kill Dracyian', 1,1,2},
    [297] = {'Kill Edmyla', 1,1,2},
    [298] = {'Kill Elora', 1,1,2},
    [299] = {'Kill Estelar', 1,1,2},
    [300] = {'Kill Finrod', 1,1,2},
    [301] = {'Kill Fundar', 1,1,2},
    [302] = {'Kill Gelda', 1,1,2},
    [303] = {'Kill Golvig', 1,1,2},
    [304] = {'Kill Haemir', 1,1,2},
    [305] = {'Kill Igor', 1,1,2},
    [306] = {'Kill Ithi', 1,1,2},
    [307] = {'Kill Jhaan', 1,1,2},
    [308] = {'Kill Keara', 1,1,2},
    [309] = {'Kill Kyla', 1,1,2},
    [310] = {'Kill Lavatius', 1,1,2},
    [311] = {'Kill Lunarex', 1,1,2},
    [312] = {'Kill Malumka', 1,1,2},
    [313] = {'Kill Misi', 1,1,2},
    [314] = {'Kill Mysris', 1,1,2},
    [315] = {'Kill Nemredilth', 1,1,2},
    [316] = {'Kill Nindr', 1,1,2},
    [317] = {'Kill Olwyn', 1,1,2},
    [318] = {'Kill Orym', 1,1,2},
    [319] = {'Kill Pondra', 1,1,2},
    [320] = {'Kill Ragna', 1,1,2},
    [321] = {'Kill Rennyn', 1,1,2},
    [322] = {'Kill Sabir', 1,1,2},
    [323] = {'Kill Sapphire', 1,1,2},
    [324] = {'Kill Shikta', 1,1,2},
    [325] = {'Kill Slyvek', 1,1,2},
    [326] = {'Kill Star Light', 1,1,2},
    [327] = {'Kill Sunshine', 1,1,2},
    [328] = {'Kill Tanulia', 1,1,2},
    [329] = {'Kill Tisnip', 1,1,2},
    [330] = {'Kill Turvass', 1,1,2},
    [331] = {'Kill Vaegon', 1,1,2},
    [332] = {'Kill Vinelle', 1,1,2},
    [333] = {'Kill Wilkass', 1,1,2},
    [334] = {'Kill Akibrus', 1,1,2}, -- NMHunt Notorious Monsters T2
    [335] = {'Kill Amerstal', 1,1,2},
    [336] = {'Kill Asralyn', 1,1,2},
    [337] = {'Kill Ayldrad', 1,1,2},
    [338] = {'Kill Bellesta', 1,1,2},
    [339] = {'Kill Bonnwynn', 1,1,2},
    [340] = {'Kill Brobek', 1,1,2},
    [341] = {'Kill Chalia', 1,1,2},
    [342] = {'Kill Coalak', 1,1,2},
    [343] = {'Kill Daernip', 1,1,2},
    [344] = {'Kill Darvyn', 1,1,2},
    [345] = {'Kill Digroi', 1,1,2},
    [346] = {'Kill Dray', 1,1,2},
    [347] = {'Kill Eiki', 1,1,2},
    [348] = {'Kill Elwin', 1,1,2},
    [349] = {'Kill Fabien', 1,1,2},
    [350] = {'Kill Flammedra', 1,1,2},
    [351] = {'Kill Gaemon', 1,1,2},
    [352] = {'Kill Gembelle', 1,1,2},
    [353] = {'Kill Gremin', 1,1,2},
    [354] = {'Kill Hastos', 1,1,2},
    [355] = {'Kill Ilbryn', 1,1,2},
    [356] = {'Kill Jaderyn', 1,1,2},
    [357] = {'Kill Jinvia', 1,1,2},
    [358] = {'Kill Kezda', 1,1,2},
    [359] = {'Kill Kymil', 1,1,2},
    [360] = {'Kill Lavinia', 1,1,2},
    [361] = {'Kill Lymseia', 1,1,2},
    [362] = {'Kill Merlara', 1,1,2},
    [363] = {'Kill Misma', 1,1,2},
    [364] = {'Kill Mystique', 1,1,2},
    [365] = {'Kill Nesterin', 1,1,2},
    [366] = {'Kill Noi', 1,1,2},
    [367] = {'Kill Onas', 1,1,2},
    [368] = {'Kill Pearl Moon', 1,1,2},
    [369] = {'Kill Pondral', 1,1,2},
    [370] = {'Kill Ragriel', 1,1,2},
    [371] = {'Kill Reyda', 1,1,2},
    [372] = {'Kill Saeya', 1,1,2},
    [373] = {'Kill Sarielle', 1,1,2},
    [374] = {'Kill Shirmyl', 1,1,2},
    [375] = {'Kill Snowflake', 1,1,2},
    [376] = {'Kill Starburst', 1,1,2},
    [377] = {'Kill Sybella', 1,1,2},
    [378] = {'Kill Tazlen', 1,1,2},
    [379] = {'Kill Tisthel', 1,1,2},
    [380] = {'Kill Twilight', 1,1,2},
    [381] = {'Kill Vaella', 1,1,2},
    [382] = {'Kill Virfi', 1,1,2},
    [383] = {'Kill Wiska', 1,1,2},
    [384] = {'Kill Akkar', 1,1,2}, -- NMHunt Notorious Monsters T3
    [385] = {'Kill Angor', 1,1,2},
    [386] = {'Kill Astra', 1,1,2},
    [387] = {'Kill Azariah', 1,1,2},
    [388] = {'Kill Belstram', 1,1,2},
    [389] = {'Kill Bragi', 1,1,2},
    [390] = {'Kill Brulin', 1,1,2},
    [391] = {'Kill Chandrelle', 1,1,2},
    [392] = {'Kill Corym', 1,1,2},
    [393] = {'Kill Dagen', 1,1,2},
    [394] = {'Kill Delvin', 1,1,2},
    [395] = {'Kill Dimlinn', 1,1,2},
    [396] = {'Kill Drusila', 1,1,2},
    [397] = {'Kill Eilivur', 1,1,2},
    [398] = {'Kill Engar', 1,1,2},
    [399] = {'Kill Fada', 1,1,2},
    [400] = {'Kill Floki', 1,1,2},
    [401] = {'Kill Galdor', 1,1,2},
    [402] = {'Kill Glacitus', 1,1,2},
    [403] = {'Kill Gusak', 1,1,2},
    [404] = {'Kill Heptin', 1,1,2},
    [405] = {'Kill Ilyrana', 1,1,2},
    [406] = {'Kill Jai-Blynn', 1,1,2},
    [407] = {'Kill Jodis', 1,1,2},
    [408] = {'Kill Killin', 1,1,2},
    [409] = {'Kill Kyra', 1,1,2},
    [410] = {'Kill Lija', 1,1,2},
    [411] = {'Kill Lyra', 1,1,2},
    [412] = {'Kill Midnight', 1,1,2},
    [413] = {'Kill Mistmael', 1,1,2},
    [414] = {'Kill Nalra', 1,1,2},
    [415] = {'Kill Night Moon', 1,1,2},
    [416] = {'Kill Norok', 1,1,2},
    [417] = {'Kill Onnyx', 1,1,2},
    [418] = {'Kill Peregrine', 1,1,2},
    [419] = {'Kill Prodos', 1,1,2},
    [420] = {'Kill Rainbow', 1,1,2},
    [421] = {'Kill Rhenalyrr', 1,1,2},
    [422] = {'Kill Sakakara', 1,1,2},
    [423] = {'Kill Serpretus', 1,1,2},
    [424] = {'Kill Silver Star', 1,1,2},
    [425] = {'Kill Sola', 1,1,2},
    [426] = {'Kill Stardust', 1,1,2},
    [427] = {'Kill Syfas', 1,1,2},
    [428] = {'Kill Tendris', 1,1,2},
    [429] = {'Kill Tiznys', 1,1,2},
    [430] = {'Kill Twinkle', 1,1,2},
    [431] = {'Kill Vasha', 1,1,2},
    [432] = {'Kill Vixen', 1,1,2},
    [433] = {'Kill Wispmaral', 1,1,2},
    [434] = {'Kill Alea', 1,1,2}, -- NMHunt Notorious Monsters T4
    [435] = {'Kill Angun', 1,1,2},
    [436] = {'Kill Aura', 1,1,2},
    [437] = {'Kill Azryat', 1,1,2},
    [438] = {'Kill Blissia', 1,1,2},
    [439] = {'Kill Braka', 1,1,2},
    [440] = {'Kill Bulruk', 1,1,2},
    [441] = {'Kill Chemraul', 1,1,2},
    [442] = {'Kill Cosmic', 1,1,2},
    [443] = {'Kill Dagurt', 1,1,2},
    [444] = {'Kill Dermetris', 1,1,2},
    [445] = {'Kill Dorath', 1,1,2},
    [446] = {'Kill Duvrion', 1,1,2},
    [447] = {'Kill Elda', 1,1,2},
    [448] = {'Kill Eroan', 1,1,2},
    [449] = {'Kill Faelar', 1,1,2},
    [450] = {'Kill Foxfire', 1,1,2},
    [451] = {'Kill Gallious', 1,1,2},
    [452] = {'Kill Gogu', 1,1,2},
    [453] = {'Kill Gylledha', 1,1,2},
    [454] = {'Kill Horar', 1,1,2},
    [455] = {'Kill Ingivald', 1,1,2},
    [456] = {'Kill Jassin', 1,1,2},
    [457] = {'Kill Josidiah', 1,1,2},
    [458] = {'Kill Klayden', 1,1,2},
    [459] = {'Kill Kystal', 1,1,2},
    [460] = {'Kill Lipith', 1,1,2},
    [461] = {'Kill Majesty', 1,1,2},
    [462] = {'Kill Milky Way', 1,1,2},
    [463] = {'Kill Morthil', 1,1,2},
    [464] = {'Kill Narbeth', 1,1,2},
    [465] = {'Kill Nightshade', 1,1,2},
    [466] = {'Kill Nym', 1,1,2},
    [467] = {'Kill Ophelia', 1,1,2},
    [468] = {'Kill Pharom', 1,1,2},
    [469] = {'Kill Pyrder', 1,1,2},
    [470] = {'Kill Rammir', 1,1,2},
    [471] = {'Kill Rijjat', 1,1,2},
    [472] = {'Kill Salvor', 1,1,2},
    [473] = {'Kill Severin', 1,1,2},
    [474] = {'Kill Silvyr', 1,1,2},
    [475] = {'Kill Soldelle', 1,1,2},
    [476] = {'Kill Sterling', 1,1,2},
    [477] = {'Kill Syfyn', 1,1,2},
    [478] = {'Kill Thalia', 1,1,2},
    [479] = {'Kill Toki', 1,1,2},
    [480] = {'Kill Uldreiyn', 1,1,2},
    [481] = {'Kill Vayzen', 1,1,2},
    [482] = {'Kill Voggur', 1,1,2},
    [483] = {'Kill Wistari', 1,1,2},
    [484] = {'Kill Aleera', 1,1,2}, -- NMHunt Notorious Monsters T5
    [485] = {'Kill Anya', 1,1,2},
    [486] = {'Kill Auris', 1,1,2},
    [487] = {'Kill Azura', 1,1,2},
    [488] = {'Kill Blossom', 1,1,2},
    [489] = {'Kill Breya', 1,1,2},
    [490] = {'Kill Caelia', 1,1,2},
    [491] = {'Kill Ciradyl', 1,1,2},
    [492] = {'Kill Crystal', 1,1,2},
    [493] = {'Kill Darcassan', 1,1,2},
    [494] = {'Kill Devella', 1,1,2},
    [495] = {'Kill Doreah', 1,1,2},
    [496] = {'Kill Dynastra', 1,1,2},
    [497] = {'Kill Eldar', 1,1,2},
    [498] = {'Kill Erthel', 1,1,2},
    [499] = {'Kill Faelyn', 1,1,2},
    [500] = {'Kill Freya', 1,1,2},
    [501] = {'Kill Gandor', 1,1,2},
    [502] = {'Kill Gold Horn', 1,1,2},
    [503] = {'Kill Hadena', 1,1,2},
    [504] = {'Kill Hungus', 1,1,2},
    [505] = {'Kill Ioguss', 1,1,2},
    [506] = {'Kill Jayldrog', 1,1,2},
    [507] = {'Kill Kalodor', 1,1,2},
    [508] = {'Kill Kolzreid', 1,1,2},
    [509] = {'Kill Lago', 1,1,2},
    [510] = {'Kill Lofar', 1,1,2},
    [511] = {'Kill Malfas', 1,1,2},
    [512] = {'Kill Minelle', 1,1,2},
    [513] = {'Kill Mortusra', 1,1,2},
    [514] = {'Kill Narvari', 1,1,2},
    [515] = {'Kill Nightwind', 1,1,2},
    [516] = {'Kill Nyssa', 1,1,2},
    [517] = {'Kill Oribel', 1,1,2},
    [518] = {'Kill Phyrra', 1,1,2},
    [519] = {'Kill Quamara', 1,1,2},
    [520] = {'Kill Randil', 1,1,2},
    [521] = {'Kill Rorik', 1,1,2},
    [522] = {'Kill Sanguisus', 1,1,2},
    [523] = {'Kill Shadoras', 1,1,2},
    [524] = {'Kill Sirius', 1,1,2},
    [525] = {'Kill Solstice', 1,1,2},
    [526] = {'Kill Sudryl', 1,1,2},
    [527] = {'Kill Taena', 1,1,2},
    [528] = {'Kill Thingol', 1,1,2},
    [529] = {'Kill Turgon', 1,1,2},
    [530] = {'Kill Usha', 1,1,2},
    [531] = {'Kill Vesryn', 1,1,2},
    [532] = {'Kill Vyn', 1,1,2},
    [533] = {'Kill Withil', 1,1,2},
    [534] = {'Kill Alva', 1,1,2}, -- NMHunt Notorious Monsters T6
    [535] = {'Kill Aqrilla', 1,1,2},
    [536] = {'Kill Austi', 1,1,2},
    [537] = {'Kill Balrus', 1,1,2},
    [538] = {'Kill Bonesnapper', 1,1,2},
    [539] = {'Kill Brilbelle', 1,1,2},
    [540] = {'Kill Caldor', 1,1,2},
    [541] = {'Kill Ciscra', 1,1,2},
    [542] = {'Kill Daealla', 1,1,2},
    [543] = {'Kill Darfin', 1,1,2},
    [544] = {'Kill Dezaral', 1,1,2},
    [545] = {'Kill Drachenstein', 1,1,2},
    [546] = {'Kill Earthtaker', 1,1,2},
    [547] = {'Kill Electra', 1,1,2},
    [548] = {'Kill Esmeralla', 1,1,2},
    [549] = {'Kill Farkas', 1,1,2},
    [550] = {'Kill Frostar', 1,1,2},
    [551] = {'Kill Gaylia', 1,1,2},
    [552] = {'Kill Golden Moon', 1,1,2},
    [553] = {'Kill Haela', 1,1,2},
    [554] = {'Kill Igninitis', 1,1,2},
    [555] = {'Kill Ismzal', 1,1,2},
    [556] = {'Kill Jewel', 1,1,2},
    [557] = {'Kill Kalseru', 1,1,2},
    [558] = {'Kill Kuskyn', 1,1,2},
    [559] = {'Kill Laimus', 1,1,2},
    [560] = {'Kill Luna', 1,1,2},
    [561] = {'Kill Malok', 1,1,2},
    [562] = {'Kill Mireille', 1,1,2},
    [563] = {'Kill Myrinn', 1,1,2},
    [564] = {'Kill Neldor', 1,1,2},
    [565] = {'Kill Nightwing', 1,1,2},
    [566] = {'Kill Oddfinnur', 1,1,2},
    [567] = {'Kill Orion', 1,1,2},
    [568] = {'Kill Pindious', 1,1,2},
    [569] = {'Kill Quintus', 1,1,2},
    [570] = {'Kill Remus', 1,1,2},
    [571] = {'Kill Rotnam',1,1,2},
    [572] = {'Kill Saphil', 1,1,2},
    [573] = {'Kill Sheedra', 1,1,2},
    [574] = {'Kill Skeltos', 1,1,2},
    [575] = {'Kill Soril', 1,1,2},
    [576] = {'Kill Sulfu', 1,1,2},
    [577] = {'Kill Talila', 1,1,2},
    [578] = {'Kill Throar', 1,1,2},
    [579] = {'Kill Turilla', 1,1,2},
    [580] = {'Kill Usunaar', 1,1,2},
    [581] = {'Kill Viktas', 1,1,2},
    [582] = {'Kill Wilda', 1,1,2},
    [583] = {'Kill Wynstar', 1,1,2},
    [584] = {'Craft Woodworking Flute',17345,1,1},
    [585] = {'Craft Woodworking Maple Wand',17049,1,1},
    [586] = {'Craft Woodworking Ash Pole',17095,1,1},
    [587] = {'Craft Woodworking Ash Club',17024,1,1},
    [588] = {'Craft Woodworking Ash Clogs',12984,1,1},
    [589] = {'Craft Woodworking Holly Pole',17096,1,1},
    [590] = {'Craft Woodworking Windurstian Pole',17535,1,1},
    [591] = {'Craft Woodworking Windurstian Club',17444,1,1},
    [592] = {'Craft Woodworking Shortbow',17152,1,1},
    [593] = {'Craft Woodworking Bastokan Crossbow',17238,1,1},
    [594] = {'Craft Woodworking Boomerang',17280,1,1},
    [595] = {'Craft Woodworking Mana Wand',18402,1,1},
    [596] = {'Craft Woodworking Holly Clogs',12985,1,1},
    [597] = {'Craft Woodworking Holly Staff',17089,1,1},
    [598] = {'Craft Woodworking Windurstian Bow',17195,1,1},
    [599] = {'Craft Woodworking Chestnut Club',17025,1,1},
    [600] = {'Craft Woodworking San dOrian Bow',17197,1,1},
    [601] = {'Craft Woodworking Maple Harp',17353,1,1},
    [602] = {'Craft Woodworking San dOrian Clogs',14149,1,1},
    [603] = {'Craft Woodworking San dOrian Spear',18068,1,1},
    [604] = {'Craft Woodworking Yew Wand',17051,1,1},
    [605] = {'Craft Woodworking Windurstian Staff',17537,1,1},
    [606] = {'Craft Woodworking Harp',17354,1,1},
    [607] = {'Craft Woodworking Elm Staff',17090,1,1},
    [608] = {'Craft Woodworking Chestnut Sabots',12986,1,1},
    [609] = {'Craft Woodworking Chestnut Wand',17052,1,1},
    [610] = {'Craft Woodworking High Mana Wand',18403,1,1},
    [611] = {'Craft Woodworking Traversiere',17348,1,1},
    [612] = {'Craft Woodworking Composite Bow',17155,1,1},
    [613] = {'Craft Woodworking Oak Cudgel',17027,1,1},
    [614] = {'Craft Woodworking Ebony Sabots',12987,1,1},
    [615] = {'Craft Woodworking Oak Staff',17091,1,1},
    [616] = {'Craft Woodworking Elm Pole',17097,1,1},
    [617] = {'Craft Woodworking Rose Wand',17053,1,1},
    [618] = {'Craft Woodworking Passaddhi Staff',18606,1,1},
    [619] = {'Craft Woodworking Coated Shield',12406,1,1},
    [620] = {'Craft Woodworking Rose Harp',17355,1,1},
    [621] = {'Craft Woodworking Oak Pole',17098,1,1},
    [622] = {'Craft Woodworking Kaman',17156,1,1},
    [623] = {'Craft Woodworking Qi Staff',18611,1,1},
    [624] = {'Craft Woodworking Mythril Lance',16847,1,1},
    [625] = {'Craft Woodworking Lightning Bow',17240,1,1},
    [626] = {'Craft Woodworking Mahogany Staff',17092,1,1},
    [627] = {'Craft Woodworking Ebony Wand',17054,1,1},
    [628] = {'Craft Woodworking Cermet Lance',16849,1,1},
    [629] = {'Craft Woodworking Revenging Staff',17561,1,1},
    [630] = {'Craft Woodworking Mahogany Pole',17099,1,1},
    [631] = {'Craft Woodworking Rapid Bow',17157,1,1},
    [632] = {'Craft Smithing Bronze Dagger',16448,1,1},
    [633] = {'Craft Smithing Bronze Subligar',12832,1,1},
    [634] = {'Craft Smithing Bronze Sword',16535,1,1},
    [635] = {'Craft Smithing Faceguard',12432,1,1},
    [636] = {'Craft Smithing Scale Finger Gauntlets',12688,1,1},
    [637] = {'Craft Smithing Bronze Rod',17059,1,1},
    [638] = {'Craft Smithing Scale Greaves',12944,1,1},
    [639] = {'Craft Smithing Bronze Hammer',17042,1,1},
    [640] = {'Craft Smithing Aspis',12299,1,1},
    [641] = {'Craft Smithing Knife',16466,1,1},
    [642] = {'Craft Smithing Baghnakhs',16406,1,1},
    [643] = {'Craft Smithing Mace',17035,1,1},
    [644] = {'Craft Smithing Iron Sword',16536,1,1},
    [645] = {'Craft Smithing Windurstian Knife',17976,1,1},
    [646] = {'Craft Smithing Longsword',16566,1,1},
    [647] = {'Craft Smithing Zaghnal',16770,1,1},
    [648] = {'Craft Smithing Mythril Dagger',16451,1,1},
    [649] = {'Craft Smithing Iron Finger Gauntlets',14001,1,1},
    [650] = {'Craft Smithing Rod',17060,1,1},
    [651] = {'Craft Smithing Plain Pick',17955,1,1},
    [652] = {'Craft Smithing Mythril Knife',16467,1,1},
    [653] = {'Craft Smithing Iron Scale Mail',13783,1,1},
    [654] = {'Craft Smithing Windurstian Kukri',17978,1,1},
    [655] = {'Craft Smithing Twicer',18216,1,1},
    [656] = {'Craft Smithing Mythril Mace',17036,1,1},
    [657] = {'Craft Smithing Mythril Sword',16537,1,1},
    [658] = {'Craft Smithing Lucent Lance',18108,1,1},
    [659] = {'Craft Smithing Mythril Kukri',16475,1,1},
    [660] = {'Craft Smithing Falchion',16558,1,1},
    [661] = {'Craft Smithing Lucent Axe',18481,1,1},
    [662] = {'Craft Smithing Bastokan Sword',17672,1,1},
    [663] = {'Craft Smithing Bastokan Axe',17929,1,1},
    [664] = {'Craft Smithing Steel Visor',13873,1,1},
    [665] = {'Craft Smithing Bastokan Hammer',17452,1,1},
    [666] = {'Craft Smithing Darksteel Knife',16468,1,1},
    [667] = {'Craft Smithing Cuisses',12800,1,1},
    [668] = {'Craft Smithing Darksteel Sword',16538,1,1},
    [669] = {'Craft Smithing Plate Leggings',12928,1,1},
    [670] = {'Craft Smithing Steel Scale Mail',13785,1,1},
    [671] = {'Craft Smithing Breastplate',12544,1,1},
    [672] = {'Craft Smithing Gust Sword',18368,1,1},
    [673] = {'Craft Smithing Darksteel Falchion',16559,1,1},
    [674] = {'Craft Smithing Darksteel Sollerets',12939,1,1},
    [675] = {'Craft Smithing Darksteel Baselard',16457,1,1},
    [676] = {'Craft Smithing Darksteel Mufflers',12683,1,1},
    [677] = {'Craft Smithing Darksteel Kukri',16476,1,1},
    [678] = {'Craft Smithing Nodowa',13111,1,1},
    [679] = {'Craft Smithing Bascinet',12427,1,1},
    [680] = {'Craft Smithing Darksteel Katars',16400,1,1},
    [681] = {'Craft Smithing Darksteel Buckler',12302,1,1},
    [682] = {'Craft GoldSmithing Copper Hairpin',12496,1,1},
    [683] = {'Craft GoldSmithing Sapara',16551,1,1},
    [684] = {'Craft GoldSmithing Circlet',12472,1,1},
    [685] = {'Craft GoldSmithing Brass Cap',12449,1,1},
    [686] = {'Craft GoldSmithing Brass Axe',16641,1,1},
    [687] = {'Craft GoldSmithing Brass Mittens',12705,1,1},
    [688] = {'Craft GoldSmithing Brass Dagger',16449,1,1},
    [689] = {'Craft GoldSmithing Brass Knuckles',16391,1,1},
    [690] = {'Craft GoldSmithing Brass Leggings',12961,1,1},
    [691] = {'Craft GoldSmithing Bastokan Cap',13889,1,1},
    [692] = {'Craft GoldSmithing Brass Subligar',12833,1,1},
    [693] = {'Craft GoldSmithing Bastokan Mittens',14031,1,1},
    [694] = {'Craft GoldSmithing Brass Xiphos',16531,1,1},
    [695] = {'Craft GoldSmithing Bastokan Scythe',18038,1,1},
    [696] = {'Craft GoldSmithing Bastokan Subligar',14259,1,1},
    [697] = {'Craft GoldSmithing Silver Earring',13327,1,1},
    [698] = {'Craft GoldSmithing Bastokan Harness',14338,1,1},
    [699] = {'Craft GoldSmithing Brass Hammer',17043,1,1},
    [700] = {'Craft GoldSmithing Silver Hairpin',12495,1,1},
    [701] = {'Craft GoldSmithing Bastokan Circlet',13899,1,1},
    [702] = {'Craft GoldSmithing Brass Mask',12433,1,1},
    [703] = {'Craft GoldSmithing Brass Cuisses',12817,1,1},
    [704] = {'Craft GoldSmithing Poisona Ring',14654,1,1},
    [705] = {'Craft GoldSmithing Brass Scale Mail',12561,1,1},
    [706] = {'Craft GoldSmithing Chain Gorget',13082,1,1},
    [707] = {'Craft GoldSmithing Spark Dagger',17984,1,1},
    [708] = {'Craft GoldSmithing Chain Choker',13083,1,1},
    [709] = {'Craft GoldSmithing Silver Mittens',12681,1,1},
    [710] = {'Craft GoldSmithing Mythril Earring',13328,1,1},
    [711] = {'Craft GoldSmithing Veldt Axe',17968,1,1},
    [712] = {'Craft GoldSmithing Spark Lance',18078,1,1},
    [713] = {'Craft GoldSmithing Reraise Earring',14790,1,1},
    [714] = {'Craft GoldSmithing Silver Mail',12553,1,1},
    [715] = {'Craft GoldSmithing Mufflers',12682,1,1},
    [716] = {'Craft GoldSmithing Buckler',12301,1,1},
    [717] = {'Craft GoldSmithing Aero Mufflers',14989,1,1},
    [718] = {'Craft GoldSmithing San dOrian Sollerets',14141,1,1},
    [719] = {'Craft GoldSmithing San dOrian Mufflers',14033,1,1},
    [720] = {'Craft GoldSmithing San dOrian Helm',13891,1,1},
    [721] = {'Craft GoldSmithing Mythril Gorget',13084,1,1},
    [722] = {'Craft GoldSmithing Melody Earring',14725,1,1},
    [723] = {'Craft GoldSmithing Gold Hairpin',12494,1,1},
    [724] = {'Craft GoldSmithing Wing Gorget',13144,1,1},
    [725] = {'Craft GoldSmithing Gold Ring',13445,1,1},
    [726] = {'Craft GoldSmithing Mythril Sallet',12417,1,1},
    [727] = {'Craft GoldSmithing Mythril Leggings',12929,1,1},
    [728] = {'Craft GoldSmithing Mythril Gauntlets',12673,1,1},
    [729] = {'Craft GoldSmithing Mythril Breastplate',12545,1,1},
    [730] = {'Craft GoldSmithing Platinum Earring',13316,1,1},
    [731] = {'Craft GoldSmithing Platinum Ring',13447,1,1},
    [732] = {'Craft ClothCrafting Gloves',12720,1,1},
    [733] = {'Craft ClothCrafting Gaiters',12976,1,1},
    [734] = {'Craft ClothCrafting Cape',13583,1,1},
    [735] = {'Craft ClothCrafting Brais',12848,1,1},
    [736] = {'Craft ClothCrafting Vagabonds Hose',14290,1,1},
    [737] = {'Craft ClothCrafting Hachimaki',12456,1,1},
    [738] = {'Craft ClothCrafting Cuffs',12728,1,1},
    [739] = {'Craft ClothCrafting Mitts',12736,1,1},
    [740] = {'Craft ClothCrafting Slops',12856,1,1},
    [741] = {'Craft ClothCrafting Cotton Headgear',12465,1,1},
    [742] = {'Craft ClothCrafting Cotton Gloves',12721,1,1},
    [743] = {'Craft ClothCrafting Windurstian Tekko',14043,1,1},
    [744] = {'Craft ClothCrafting Cotton Cape',13584,1,1},
    [745] = {'Craft ClothCrafting Windurstian Kyahan',14151,1,1},
    [746] = {'Craft ClothCrafting Windurstian Headgear',13903,1,1},
    [747] = {'Craft ClothCrafting Windurstian Sitabaki',14269,1,1},
    [748] = {'Craft ClothCrafting San dOrian Tunic',14348,1,1},
    [749] = {'Craft ClothCrafting Fishermans Hose',14292,1,1},
    [750] = {'Craft ClothCrafting Linen Slops',12857,1,1},
    [751] = {'Craft ClothCrafting Socks',12978,1,1},
    [752] = {'Craft ClothCrafting Heko Obi',13204,1,1},
    [753] = {'Craft ClothCrafting Hose',12850,1,1},
    [754] = {'Craft ClothCrafting Soil Hachimaki',12458,1,1},
    [755] = {'Craft ClothCrafting Combat Mittens',15053,1,1},
    [756] = {'Craft ClothCrafting Cloak',12610,1,1},
    [757] = {'Craft ClothCrafting Soil Kyahan',12970,1,1},
    [758] = {'Craft ClothCrafting Soil Sitabaki',12842,1,1},
    [759] = {'Craft ClothCrafting Mist Mitts',14855,1,1},
    [760] = {'Craft ClothCrafting Soil Gi',12586,1,1},
    [761] = {'Craft ClothCrafting Mist Tunic',14423,1,1},
    [762] = {'Craft ClothCrafting Hemp Gorget',13085,1,1},
    [763] = {'Craft ClothCrafting Lilac Corsage',13931,1,1},
    [764] = {'Craft ClothCrafting Blink Band',15170,1,1},
    [765] = {'Craft ClothCrafting Wool Hose',12851,1,1},
    [766] = {'Craft ClothCrafting Chocobo Hose',14294,1,1},
    [767] = {'Craft ClothCrafting Silver Obi',13205,1,1},
    [768] = {'Craft ClothCrafting Black Slacks',12865,1,1},
    [769] = {'Craft ClothCrafting Black Tunic',12609,1,1},
    [770] = {'Craft ClothCrafting Black Cape',13577,1,1},
    [771] = {'Craft ClothCrafting Linen Doublet',13750,1,1},
    [772] = {'Craft ClothCrafting Qiqirn Sash',15907,1,1},
    [773] = {'Craft ClothCrafting Field Hose',14297,1,1},
    [774] = {'Craft ClothCrafting White Slacks',12867,1,1},
    [775] = {'Craft ClothCrafting White Cloak',12611,1,1},
    [776] = {'Craft ClothCrafting White Mitts',12737,1,1},
    [777] = {'Craft ClothCrafting Opaline Hose',14249,1,1},
    [778] = {'Craft ClothCrafting Accura Cape',11532,1,1},
    [779] = {'Craft ClothCrafting Silk Coat',12604,1,1},
    [780] = {'Craft ClothCrafting Silk Headband',12503,1,1},
    [781] = {'Craft ClothCrafting Vermillion Cloak',13748,1,1},
    [782] = {'Craft LeatherCraft Vagabonds Boots',14169,1,1},
    [783] = {'Craft LeatherCraft Leather Highboots',12952,1,1},
    [784] = {'Craft LeatherCraft Rabbit Mantle',13594,1,1},
    [785] = {'Craft LeatherCraft Leather Gloves',12696,1,1},
    [786] = {'Craft LeatherCraft Leather Trousers',12824,1,1},
    [787] = {'Craft LeatherCraft Lizard Belt',13193,1,1},
    [788] = {'Craft LeatherCraft Leather Belt',13192,1,1},
    [789] = {'Craft LeatherCraft Lizard Mantle',13592,1,1},
    [790] = {'Craft LeatherCraft Lizard Gloves',12697,1,1},
    [791] = {'Craft LeatherCraft Lizard Cesti',16386,1,1},
    [792] = {'Craft LeatherCraft Lizard Trousers',12825,1,1},
    [793] = {'Craft LeatherCraft Lizard Jerkin',12569,1,1},
    [794] = {'Craft LeatherCraft Leather Ring',13469,1,1},
    [795] = {'Craft LeatherCraft Chocobo Gloves',14072,1,1},
    [796] = {'Craft LeatherCraft Studded Bandana',12442,1,1},
    [797] = {'Craft LeatherCraft Armored Ring',15783,1,1},
    [798] = {'Craft LeatherCraft Studded Gloves',12698,1,1},
    [799] = {'Craft LeatherCraft Dhalmel Mantle',13588,1,1},
    [800] = {'Craft LeatherCraft Studded Boots',12954,1,1},
    [801] = {'Craft LeatherCraft San dOrian Bandana',13895,1,1},
    [802] = {'Craft LeatherCraft Breath Mantle',15486,1,1},
    [803] = {'Craft LeatherCraft San dOrian Gloves',14037,1,1},
    [804] = {'Craft LeatherCraft Studded Vest',12570,1,1},
    [805] = {'Craft LeatherCraft Wolf Mantle',13571,1,1},
    [806] = {'Craft LeatherCraft San dOrian Trousers',14265,1,1},
    [807] = {'Craft LeatherCraft Invisible Mantle',13685,1,1},
    [808] = {'Craft LeatherCraft Leather Gorget',13081,1,1},
    [809] = {'Craft LeatherCraft Cuir Bandana',12443,1,1},
    [810] = {'Craft LeatherCraft Wolf Gorget',13089,1,1},
    [811] = {'Craft LeatherCraft Cuir Gloves',12699,1,1},
    [812] = {'Craft LeatherCraft Barbarians Belt',13203,1,1},
    [813] = {'Craft LeatherCraft Cuir Highboots',12955,1,1},
    [814] = {'Craft LeatherCraft Waistbelt',13200,1,1},
    [815] = {'Craft LeatherCraft Tough Belt',15864,1,1},
    [816] = {'Craft LeatherCraft Powder Boots',15320,1,1},
    [817] = {'Craft LeatherCraft Haste Belt',15290,1,1},
    [818] = {'Craft LeatherCraft Corsette',13271,1,1},
    [819] = {'Craft LeatherCraft Ram Mantle',13570,1,1},
    [820] = {'Craft LeatherCraft Narasimhas Cesti',17505,1,1},
    [821] = {'Craft LeatherCraft High Breath Mantle',15487,1,1},
    [822] = {'Craft LeatherCraft Raptor Mantle',13593,1,1},
    [823] = {'Craft LeatherCraft Raptor Trousers',12828,1,1},
    [824] = {'Craft LeatherCraft Ice Trousers',15651,1,1},
    [825] = {'Craft LeatherCraft Raptor Jerkin',12572,1,1},
    [826] = {'Craft LeatherCraft Blizzard Gloves',14990,1,1},
    [827] = {'Craft LeatherCraft Smilodon Ring',15836,1,1},
    [828] = {'Craft LeatherCraft Bugard Strap',19017,1,1},
    [829] = {'Craft LeatherCraft Beak Trousers',12829,1,1},
    [830] = {'Craft LeatherCraft Beak Gloves',13700,1,1},
    [831] = {'Craft LeatherCraft Beak Jerkin',13699,1,1},
    [832] = {'Craft BoneCraft Xiphos',16530,1,1},
    [833] = {'Craft BoneCraft Shell Earring',13313,1,1},
    [834] = {'Craft BoneCraft Bone Hairpin',12505,1,1},
    [835] = {'Craft BoneCraft Eldritch Bone Hairpin',15268,1,1},
    [836] = {'Craft BoneCraft Shell Ring',13442,1,1},
    [837] = {'Craft BoneCraft Cat Baghnakhs',16405,1,1},
    [838] = {'Craft BoneCraft Manashell Ring',15782,1,1},
    [839] = {'Craft BoneCraft Windurstian Baghnakhs',17497,1,1},
    [840] = {'Craft BoneCraft Bone Ring',13441,1,1},
    [841] = {'Craft BoneCraft Bone Mask',12454,1,1},
    [842] = {'Craft BoneCraft Bone Mittens',12710,1,1},
    [843] = {'Craft BoneCraft Bone Leggings',12966,1,1},
    [844] = {'Craft BoneCraft Bone Subligar',12834,1,1},
    [845] = {'Craft BoneCraft Gemshorn',17351,1,1},
    [846] = {'Craft BoneCraft Bone Harness',12582,1,1},
    [847] = {'Craft BoneCraft Beetle Earring',13323,1,1},
    [848] = {'Craft BoneCraft Healing Harness',14495,1,1},
    [849] = {'Craft BoneCraft Horn Hairpin',12507,1,1},
    [850] = {'Craft BoneCraft San dOrian Horn',17835,1,1},
    [851] = {'Craft BoneCraft Beetle Mittens',12711,1,1},
    [852] = {'Craft BoneCraft Beetle Gorget',13090,1,1},
    [853] = {'Craft BoneCraft Beetle Leggings',12967,1,1},
    [854] = {'Craft BoneCraft Eldritch Horn Hairpin',15269,1,1},
    [855] = {'Craft BoneCraft Beetle Subligar',12835,1,1},
    [856] = {'Craft BoneCraft Beetle Harness',12583,1,1},
    [857] = {'Craft BoneCraft Horn Ring',13459,1,1},
    [858] = {'Craft BoneCraft Bone Knife',17610,1,1},
    [859] = {'Craft BoneCraft Mist Crown',15162,1,1},
    [860] = {'Craft BoneCraft Horn',17352,1,1},
    [861] = {'Craft BoneCraft Thunder Mittens',14987,1,1},
    [862] = {'Craft BoneCraft Carapace Gorget',13091,1,1},
    [863] = {'Craft BoneCraft Shock Subligar',15650,1,1},
    [864] = {'Craft BoneCraft High Healing Harness',14497,1,1},
    [865] = {'Craft BoneCraft Shell Hairpin',12506,1,1},
    [866] = {'Craft BoneCraft Turtle Bangles',13981,1,1},
    [867] = {'Craft BoneCraft Blood Stone',13199,1,1},
    [868] = {'Craft BoneCraft Stone Bangles',14988,1,1},
    [869] = {'Craft BoneCraft Beetle Knife',17612,1,1},
    [870] = {'Craft BoneCraft Healing Justaucorps',14496,1,1},
    [871] = {'Craft BoneCraft Macuahuitl',17713,1,1},
    [872] = {'Craft BoneCraft Beak Necklace',16263,1,1},
    [873] = {'Craft BoneCraft Ranging Knife',19119,1,1},
    [874] = {'Craft BoneCraft Fang Earring',13325,1,1},
    [875] = {'Craft BoneCraft Scorpion Mask',12451,1,1},
    [876] = {'Craft BoneCraft Crumhorn',17361,1,1},
    [877] = {'Craft BoneCraft Bone Patas',16420,1,1},
    [878] = {'Craft Alchemy Acid Baselard',16459,1,1},
    [879] = {'Craft Alchemy Acid Claws',16430,1,1},
    [880] = {'Craft Alchemy Acid Dagger',17605,1,1},
    [881] = {'Craft Alchemy Acid Knife',16501,1,1},
    [882] = {'Craft Alchemy Acid Kukri',16479,1,1},
    [883] = {'Craft Alchemy Bastokan Greaves',14147,1,1},
    [884] = {'Craft Alchemy Bastokan Scale Mail',14346,1,1},
    [885] = {'Craft Alchemy Bastokan Visor',13897,1,1},
    [886] = {'Craft Alchemy Bee Spatha',16572,1,1},
    [887] = {'Craft Alchemy Blind Dagger',16454,1,1},
    [888] = {'Craft Alchemy Blind Knife',16471,1,1},
    [889] = {'Craft Alchemy Cermet Knife',16469,1,1},
    [890] = {'Craft Alchemy Cermet Sword',16539,1,1},
    [891] = {'Craft Alchemy Divine Sword',16549,1,1},
    [892] = {'Craft Alchemy Fire Sword',16543,1,1},
    [893] = {'Craft Alchemy Flame Blade',16564,1,1},
    [894] = {'Craft Alchemy Flame Degen',16522,1,1},
    [895] = {'Craft Alchemy Frosty Cap',26728,1,1},
    [896] = {'Craft Alchemy Hallowed Sword',16550,1,1},
    [897] = {'Craft Alchemy Holy Degen',16523,1,1},
    [898] = {'Craft Alchemy Holy Mace',17041,1,1},
    [899] = {'Craft Alchemy Holy Sword',16581,1,1},
    [900] = {'Craft Alchemy Hushed Dagger',18008,1,1},
    [901] = {'Craft Alchemy Inferno Axe',16709,1,1},
    [902] = {'Craft Alchemy Inferno Sword',16594,1,1},
    [903] = {'Craft Alchemy Melt Claws',18357,1,1},
    [904] = {'Craft Alchemy Melt Dagger',18010,1,1},
    [905] = {'Craft Alchemy Melt Knife',18011,1,1},
    [906] = {'Craft Alchemy Melt Kukri',18013,1,1},
    [907] = {'Craft Alchemy Mokuto',16906,1,1},
    [908] = {'Craft Alchemy Poison Cesti',16387,1,1},
    [909] = {'Craft Alchemy Poison Claws',16417,1,1},
    [910] = {'Craft Alchemy Poison Dagger',16496,1,1},
    [911] = {'Craft Alchemy Poison Katars',16403,1,1},
    [912] = {'Craft Alchemy Poison Knife',16472,1,1},
    [913] = {'Craft Alchemy Poison Kukri',16478,1,1},
    [914] = {'Craft Alchemy Prominence Axe',18220,1,1},
    [915] = {'Craft Alchemy Sacred Degen',17683,1,1},
    [916] = {'Craft Alchemy Sacred Mace',18391,1,1},
    [917] = {'Craft Alchemy Sacred Sword',17682,1,1},
    [918] = {'Craft Alchemy Silence Baghnakhs',16429,1,1},
    [919] = {'Craft Alchemy Silence Dagger',16495,1,1},
    [920] = {'Craft Alchemy Venom Knife',16502,1,1},
    [921] = {'Craft Alchemy Vulcan Blade',17706,1,1},
    [922] = {'Craft Alchemy Vulcan Claymore',18379,1,1},
    [923] = {'Craft Alchemy Vulcan Degen',17705,1,1},
    [924] = {'Craft Alchemy Vulcan Sword',17704,1,1},
    [925] = {'Craft Alchemy Wax Sword',16600,1,1},

}

local tierRewards = -- Rewards can be changed from month to month
{
    [1] = { xi.item.MOG_KUPON_I_AF109 }, -- tier 1 rewards 25 completed missions Kupon I-AF109 - Rem Tales - 8729
    [2] = { xi.item.MOG_KUPON_A_E2 }, -- tier 2 rewards 50 completed missions Kupon A-E+2 - empy +2 set - 3441
    [3] = { xi.item.MOG_KUPON_I_SEAL }, -- tier 3 rewards 75 completed missions Kupon I-Seal - Emp Seals - 3442
    [4] = { xi.item.MOG_KUPON_I_AF119 }, -- tier 4 rewards 100 compelted missions Kupon I-AF119 - omen seals - 9170
    [5] = { xi.item.MOG_KUPON_I_MAT }, -- tier 5 rewards 125 compelted missions Kupon I-Mat - Reforged mats +1 / +2 - 8794
    [6] = { xi.item.AMBUSCADE_CHIT_FOOTGEAR }, -- tier 6 rewards 150 compelted missions Ambuscade chit: footgear - 9942
    [7] = { xi.item.AMBUSCADE_CHIT_HANDGEAR }, -- tier 7 rewards 175 compelted missions Ambuscade chit: handgear - 9940
    [8] = { xi.item.AMBUSCADE_CHIT_HEADGEAR }, -- tier 8 rewards 200 compelted missions Ambuscade chit: headgear - 9938
    [9] = { xi.item.AMBUSCADE_CHIT_LEGGEAR }, -- tier 9 rewards 225 compelted missions Ambuscade chit: leggear - 9941
    [10] = { xi.item.AMBUSCADE_CHIT_BODYGEAR }, -- tier 10 rewards 250 compelted missions Ambuscade chit: bodygear - 9939
}
-- Character variables - [LD]CustomQuest 15584050  1 = quest type, 5 = quest limit(shouldnt be used here), 584 = quest id, 050 = quest objective Count
-- Character variables - [LD]CustomQuestTotalDaily
--                       [LD]CustomQuestTotalWeekly
--                       [LD]CustomQuestTotalMonthly
--                       [LD]CustomQuestTotal
-- Character variables - [LD]CustomQuestTimeDaily - getMidnight()
--                       [LD]CustomQuestTimeWeekly - NextConquestTally()
--                       [LD]CustomQuestTimeMonthly
-- Character variables - [LD]CustomQuestXDaily - keeps track of canceled daily quests
--                       [LD]CustomQuestXWeekly - keeps track of canceled weekly quests
--                       [LD]CustomQuestXMonthly - keeps track of canceled monthly quests
-- Quest Break Down    - Daily Quest = Crafting, Digging, Harvesting, Logging, Mining, Excavation
--                     - Weekly Quest = Family Kills, WS Kills, NM Kills, NMH Kills
--                     - Monthly Quest = Supreme Kills, Provenance Kills

function totalCompletedReward(player) -- need to add into script and test
    local totalCompleted = player:getCharVar('[LD]CustomQuestTotal')
    local accomplishments = { { 1, 25 }, { 2, 50 }, { 3, 75 }, { 4, 100 }, { 5, 125 }, { 6, 150 }, { 7, 175 }, { 8, 200 }, { 9, 225 }, { 10, 250 } }

    for _, rewardTier in pairs(accomplishments) do
        if totalCompleted == rewardTier[2] then
            if player:getFreeSlotsCount() < 1 then
                player:printToPlayer('Your inventory is full and the item has been sent to your delivery box!',xi.msg.channel.SYSTEM_3)
                SendItemToDeliveryBox(player:getName(),  tierRewards[rewardTier[1]], 1,'QuestReward')
            else
                npcUtil.giveItem(player, tierRewards[rewardTier[1]])
            end

            if totalCompleted == 250 then
                player:setCharVar('[LD]CustomQuestTotal', 0)
            end
            return
        end
    end           
end

function randomReward(player, questType)
    -- local questVar = player:getCharVar('[LD]CustomQuest')
    -- local questParams = tostring(questVar)
    -- local questType = tonumber(questParams:sub(1,1))
    local rand = math.random(1,100)

    if rand < 5 * questType then
        if player:getFreeSlotsCount() < 1 then
            player:printToPlayer('Your inventory is full and the item has been sent to your delivery box!',xi.msg.channel.SYSTEM_3)
            SendItemToDeliveryBox(player:getName(), SelectDailyItem(player,6), 1,'QuestReward')
        else
            npcUtil.giveItem(player, SelectDailyItem(player,6))
        end
    end

    local randomNumber = math.random(2500, 7500)
    npcUtil.giveCurrency(player, 'gil', randomNumber)
    npcUtil.giveReward(player, { exp = randomNumber })
end

function deleteCustomQuest(player, questType)
    local varName = customQuestType[questType][4]
    local questVar = player:getCharVar(varName)
    local questParams = tostring(questVar)
    -- local questType = tonumber(questParams:sub(1,1))
    local questId = tonumber(questParams:sub(3,5))

    if questType == 1 then
        player:printToPlayer(string.format('You have chosen to cancel your Daily Quest - %s',customQuestId[questId][1]), 0, 'Quest NPC')
        player:setCharVar('[LD]CustomQuestTotalDaily', player:getCharVar('[LD]CustomQuestTotalDaily') + 1)
        player:setCharVar('[LD]CustomQuestXDaily', player:getCharVar('[LD]CustomQuestXDaily') +1)
        player:setCharVar(varName,0)
    elseif questType == 2 then
        player:printToPlayer(string.format('You have chosen to cancel your Weekly Quest - %s',customQuestId[questId][1]), 0, 'Quest NPC')
        player:setCharVar('[LD]CustomQuestTotalWeekly', player:getCharVar('[LD]CustomQuestTotalWeekly') + 1)
        player:setCharVar('[LD]CustomQuestXWeekly', player:getCharVar('[LD]CustomQuestXWeekly') +1)
        player:setCharVar(varName,0)
    elseif questType == 3 then
        player:printToPlayer(string.format('You have chosen to cancel your Monthly Quest - %s',customQuestId[questId][1]), 0, 'Quest NPC')
        player:setCharVar('[LD]CustomQuestTotalMonthly', player:getCharVar('[LD]CustomQuestTotalMonthly') + 1)
        player:setCharVar('[LD]CustomQuestXMonthly', player:getCharVar('[LD]CustomQuestXMonthly') +1)
        player:setCharVar(varName,0)
    end
end
--        311 - Congratulations! (Gold) Special
--        312 - Congratulations! (Green) Monthly
--        313 - Congratulations! (Silver) Weekly
--        314 - Congratulations! (Copper) Daily
function completeCustomQuest(player, questType)
    local varName = customQuestType[questType][4]
    local questVar = player:getCharVar(varName)
    local questParams = tostring(questVar)
    -- local questType = tonumber(questParams:sub(1,1))
    local questLimit = tonumber(questParams:sub(2,2))
    local questId = tonumber(questParams:sub(3,5))
    local questCount = tonumber(questParams:sub(6,8))

    if questVar > 0 then
        if questId == 84 then
            if player:getJobPoints(player:getMainJob()) >= 100 then
                player:delJobPoints(player:getMainJob(), 100)
                player:injectActionPacket(player:getID(), 4, customQuestType[questType][3], 0, 0, 0, 10, 1)
                player:printToPlayer(string.format('Congratulations! you have completed your %s Quest - %s',customQuestType[questType][1], customQuestId[questId][1]), 0, 'Quest NPC')
                player:setCharVar('[LD]CustomQuestTotalDaily', player:getCharVar('[LD]CustomQuestTotalDaily') + 1)
                player:setCharVar('[LD]CustomQuestTotal', player:getCharVar('[LD]CustomQuestTotal') +1)
                randomReward(player, questType)
                player:setCharVar(varName,0)
                player:addCurrency('domain_points', 10)
                player:printToPlayer(string.format('%s was awarded %i %s, for a total of %i.', player:getName(), 10, 'Domain Points', player:getCurrency('domain_points')),xi.msg.channel.SYSTEM_3)

                totalCompletedReward(player)
            end
        elseif questCount >= customQuestId[questId][3] then
            player:printToPlayer(string.format('Congratulations! you have completed your %s Quest - %s',customQuestType[questType][1], customQuestId[questId][1]), 0, 'Quest NPC')
            player:injectActionPacket(player:getID(), 4, customQuestType[questType][3], 0, 0, 0, 10, 1)
                if questType == 1 then
                    player:setCharVar('[LD]CustomQuestTotalDaily', player:getCharVar('[LD]CustomQuestTotalDaily') + 1)
                    player:setCharVar('[LD]CustomQuestTotal', player:getCharVar('[LD]CustomQuestTotal') +1 )
                    randomReward(player, questType)
                    player:setCharVar(varName,0)
                    player:addCurrency('domain_points', 10)
                    player:printToPlayer(string.format('%s was awarded %i %s, for a total of %i.', player:getName(), 10, 'Domain Points', player:getCurrency('domain_points')),xi.msg.channel.SYSTEM_3)
                    totalCompletedReward(player)
                elseif questType == 2 then
                    player:setCharVar('[LD]CustomQuestTotalWeekly', player:getCharVar('[LD]CustomQuestTotalWeekly') + 1)
                    player:setCharVar('[LD]CustomQuestTotal', player:getCharVar('[LD]CustomQuestTotal') +1)
                    randomReward(player, questType)
                    player:setCharVar(varName,0)
                    player:addCurrency('current_hallmarks', 500)
                    player:printToPlayer(string.format('%s was awarded %i %s, for a total of %i.', player:getName(), 500, 'Hallmarks', player:getCurrency('current_hallmarks')),xi.msg.channel.SYSTEM_3)
                    totalCompletedReward(player)
                elseif questType == 3 then
                    player:setCharVar('[LD]CustomQuestTotalMonthly', player:getCharVar('[LD]CustomQuestTotalMonthly') + 1)
                    player:setCharVar('[LD]CustomQuestTotal', player:getCharVar('[LD]CustomQuestTotal') +1)
                    randomReward(player, questType)
                    player:setCharVar(varName,0)
                    player:addCurrency('gallantry', 2000)
                    player:printToPlayer(string.format('%s was awarded %i %s, for a total of %i.', player:getName(), 2000, 'Gallantry', player:getCurrency('gallantry')),xi.msg.channel.SYSTEM_3)
                    totalCompletedReward(player)
                end
        end
    end
end

function checkQuestTimer(player)
    local daily = player:getCharVar('[LD]CustomQuestTimeDaily')
    local weekly = player:getCharVar('[LD]CustomQuestTimeWeekly')
    local monthly = player:getCharVar('[LD]CustomQuestTimeMonthly')

    local questVarDaily = player:getCharVar('[LD]CustomQuestDaily')
        if daily <= os.time() then
            if questVarDaily > 0 then
                player:setCharVar('[LD]CustomQuestDaily', 0)
                player:setCharVar('[LD]CustomQuestTotalDaily',0)
                player:setCharVar('[LD]CustomQuestTimeDaily', getMidnight())
                -- player:setCharVar('[LD]CustomQuestTotal')
                player:printToPlayer(string.format('You quest has expired, please select a new quest.'), 0, 'Quest NPC')
                player:setCharVar('[LD]CustomQuestXDaily',0)
            else
                player:setCharVar('[LD]CustomQuestTotalDaily',0)
                player:setCharVar('[LD]CustomQuestTimeDaily', getMidnight())
                player:setCharVar('[LD]CustomQuestXDaily',0)
            end
        end

        local questVarWeekly = player:getCharVar('[LD]CustomQuestWeekly')
        if weekly <= os.time() then
            if questVarWeekly > 0 then
                player:setCharVar('[LD]CustomQuestWeekly', 0)
                player:setCharVar('[LD]CustomQuestTotalWeekly',0)
                player:setCharVar('[LD]CustomQuestTimeWeekly', NextConquestTally())
                player:printToPlayer(string.format('You quest has expired, please select a new quest.'), 0, 'Quest NPC')
                player:setCharVar('[LD]CustomQuestXWeekly',0)
            else
                player:setCharVar('[LD]CustomQuestTotalWeekly',0)
                player:setCharVar('[LD]CustomQuestTimeWeekly', NextConquestTally())
                player:setCharVar('[LD]CustomQuestXWeekly',0)
            end
        end

        local questVarMonthly = player:getCharVar('[LD]CustomQuestMonthly')
        if monthly ~= tonumber(os.date('%m')) then
             if questVarMonthly > 0 then
                 player:setCharVar('[LD]CustomQuestMonthly', 0)
                 player:setCharVar('[LD]CustomQuestTotalMonthly',0)
                 player:setCharVar('[LD]CustomQuestTimeMonthly', tonumber(os.date('%m')))
                 player:printToPlayer(string.format('You quest has expired, please select a new quest.'), 0, 'Quest NPC')
                 player:setCharVar('[LD]CustomQuestXMonthly',0)
             else
                 player:setCharVar('[LD]CustomQuestTotalMonthly',0)
                 player:setCharVar('[LD]CustomQuestTimeMonthly', tonumber(os.date('%m')))
                 player:setCharVar('[LD]CustomQuestXMonthly',0)
             end
        end           
end

function checkQuestSignatureItem(player, trade)
    for i = 1, 3 do
        local varName = customQuestType[i][4]
        local questVar = player:getCharVar(varName)
        if questVar > 0 then
            local questParams = tostring(questVar)
            local questType = tonumber(questParams:sub(1,1))
            local questLimit = tonumber(questParams:sub(2,2))
            local questId = tonumber(questParams:sub(3,5))
            local itemId = customQuestId[questId][2]

            if npcUtil.tradeHasExactly(trade, { { itemId, 1 } }) and
                trade:getItem():getSignature() == player:getName() then
                return true, i
            end
        end
    end
    return false
end

local function delaySendMenu(player, menuToSend)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menuToSend)
    end)
end

local function createAcceptQuestMenu(player, page)
    local mainYNQMenu     = {'Yes', 'No'}
    local linesPerPage = 5
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #mainYNQMenu)
    local options = {}
    for i = startIndex, endIndex do
        local YNMenu = mainYNQMenu[i]
        table.insert(options, {
            string.format('%s', YNMenu),
            function(player)
            if YNMenu == 'Yes' then -- 
               local selection = player:getCharVar('[LD]CustomQuestSelection')
               local questParams = tostring(selection)
               local questType = tonumber(questParams:sub(1,1))
               local varName = customQuestType[questType][4]
               player:setCharVar(varName, selection)
               player:setCharVar('[LD]CustomQuestSelection',0)
                local questVar = player:getCharVar(varName)
                local questLimit = tonumber(questParams:sub(2,2))
                local questId = tonumber(questParams:sub(3,5))
                   player:printToPlayer(string.format('You have activated the quest:'), 0, 'Quest NPC')
                   player:printToPlayer(string.format('%s', customQuestType[questType][1]), 0, 'Quest Type')
                   player:printToPlayer(string.format('%s', customQuestId[questId][1]), 0, 'Quest Name')
                   if questId == 84 then
                      player:printToPlayer(string.format('Exchange 100 Job Points!'), 0, 'Quest Objective')
                   elseif questId >= 85 and questId <= 94 then
                          player:printToPlayer(string.format('%s 1 time!', customQuestId[questId][1]), 0, 'Quest Objective')
                   elseif questId == 95 then 
                          player:printToPlayer(string.format('Successfully perform Chocobo Digging 10 time!'), 0, 'Quest Objective')
                   elseif questId >= 96 and questId <= 99 then 
                          player:printToPlayer(string.format('Successfully perform %s 10 times!', customQuestId[questId][1]), 0, 'Quest Objective')
                   elseif questId >= 100 and questId <= 120 then 
                          player:printToPlayer(string.format('%s mobs 50 times!', customQuestId[questId][1]), 0, 'Quest Objective')
                   elseif questId >= 121 and questId <= 134 then 
                          player:printToPlayer(string.format('Kill a monster using a %s 50 times!', customQuestId[questId][1]), 0, 'Quest Objective')
                   elseif questId >= 135 and questId <= 583 then 
                          player:printToPlayer(string.format('%s Notorius Monster 1 time!', customQuestId[questId][1]), 0, 'Quest Objective')
                   elseif questId >= 584 and questId <= 925 then 
                          player:printToPlayer(string.format('%s signed 1 time!', customQuestId[questId][1]), 0, 'Quest Objective')
                   end
            elseif YNMenu == 'No' then -- 
               player:setCharVar('[LD]CustomQuestSelection',0)
            end
        end
        })
    end
    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                createAcceptQuestMenu(player, page - 1)
            end
        })
    end
    if endIndex < #mainYNQMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                createAcceptQuestMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Accept Quest?',
        options = options
    })
end

local function createMonthlySubQuestMenu(player, page)
    local mainMSQMenu     = { 'Warder NM' } --, 'World Boss'}

    local linesPerPage = 5
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #mainMSQMenu)
    local options = {}
    for i = startIndex, endIndex do
        local msQuestMenu = mainMSQMenu[i]
        table.insert(options, {
            string.format('%s', msQuestMenu),
            function(player)
            if msQuestMenu == 'Warder NM' then --
               local questWarders = math.random(85,94)
               player:setCharVar('[LD]CustomQuestSelection',player:getCharVar('[LD]CustomQuestSelection') + (questWarders * 1000) + 1000000)
               createAcceptQuestMenu(player, page)
 --[[
            elseif msQuestMenu == 'Provenance NM' then -- 
               local questProvenance = 94
               player:setCharVar('[LD]CustomQuestSelection',player:getCharVar('[LD]CustomQuestSelection') + (questProvenance * 1000) + 1000000)
               createAcceptQuestMenu(player, page)
            elseif msQuestMenu == 'World Boss' then --
               local questWB = 90
               player:setCharVar('[LD]CustomQuestSelection',player:getCharVar('[LD]CustomQuestSelection') + (questWB * 1000) + 1000000)
               createAcceptQuestMenu(player, page)
]]--
            end
        end
        })
    end
    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                createMonthlySubQuestMenu(player, page - 1)
            end
        })
    end
    if endIndex < #mainMSQMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                createMonthlySubQuestMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Quest Menu',
        options = options
    })
end

local function createWeeklySubQuestMenu(player, page)
    local mainWSQMenu     = {'Family Kills', 'WS Kills', 'NM Kills'} 

    local linesPerPage = 5
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #mainWSQMenu)
    local options = {}
    for i = startIndex, endIndex do
        local wsQuestMenu = mainWSQMenu[i]
        table.insert(options, {
            string.format('%s', wsQuestMenu),
            function(player)
            if wsQuestMenu == 'Family Kills' then --
               local questEco = math.random(100,120)
               player:setCharVar('[LD]CustomQuestSelection',player:getCharVar('[LD]CustomQuestSelection') + (questEco * 1000) + 2000000)
               createAcceptQuestMenu(player, page)
            elseif wsQuestMenu == 'WS Kills' then --
               local questWS = math.random(121, 134)
               player:setCharVar('[LD]CustomQuestSelection',player:getCharVar('[LD]CustomQuestSelection') + (questWS * 1000) + 2000000)
               createAcceptQuestMenu(player, page)
            elseif wsQuestMenu == 'NM Kills' then --
               local questKillNM = math.random(135,583)
               player:setCharVar('[LD]CustomQuestSelection',player:getCharVar('[LD]CustomQuestSelection') + (questKillNM * 1000) + 2000000)
               createAcceptQuestMenu(player, page)
            end
        end
        })
    end
    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                createWeeklySubQuestMenu(player, page - 1)
            end
        })
    end
    if endIndex < #mainWSQMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                createWeeklySubQuestMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Quest Menu',
        options = options
    })
end

local function createDailySubQuestMenu(player, page)
    local mainDSQMenu     = {'Crafting', 'Helm', 'Digging', 'JobPoints'}

    local linesPerPage = 6
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #mainDSQMenu)
    local options = {}
    for i = startIndex, endIndex do
        local dsQuestMenu = mainDSQMenu[i]
        table.insert(options, {
            string.format('%s', dsQuestMenu),
            function(player)
            if dsQuestMenu == 'Crafting' then --
               local questCrafting = math.random(584, 925)
               player:setCharVar('[LD]CustomQuestSelection',player:getCharVar('[LD]CustomQuestSelection') + (questCrafting * 1000) + 5000000)
               createAcceptQuestMenu(player, page)
            elseif dsQuestMenu == 'Digging' then -- 
               local questChocoDig = 95
               player:setCharVar('[LD]CustomQuestSelection',player:getCharVar('[LD]CustomQuestSelection') + (questChocoDig * 1000) + 5000000)
               createAcceptQuestMenu(player, page)
            elseif dsQuestMenu == 'Helm' then -- 
               local questHelm = math.random(96, 99)
               player:setCharVar('[LD]CustomQuestSelection',player:getCharVar('[LD]CustomQuestSelection') + (questHelm * 1000) + 5000000)
               createAcceptQuestMenu(player, page)
            elseif dsQuestMenu == 'JobPoints' then -- 
               local questJobPoints = 84
               player:setCharVar('[LD]CustomQuestSelection',player:getCharVar('[LD]CustomQuestSelection') + (questJobPoints * 1000) + 5000000)
               createAcceptQuestMenu(player, page)
            end
        end
        })
    end
    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                createDailySubQuestMenu(player, page - 1)
            end
        })
    end
    if endIndex < #mainDSQMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                createDailySubQuestMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Quest Menu',
        options = options
    })
end

local function createQuestMenu(player, page)
    local mainQMenu     = {'Daily', 'Weekly', 'Monthly'} 

    local linesPerPage = 5
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #mainQMenu)
    local options = {}
    for i = startIndex, endIndex do
        local questMenu = mainQMenu[i]
        table.insert(options, {
            string.format('%s', questMenu),
            function(player) 
            if questMenu == 'Daily' then --
               if player:getCharVar('[LD]CustomQuestTotalDaily') >= 5 then
                  player:printToPlayer(string.format('You have reached the maximum limit of daily quests you can participate in!'), 0, 'Quest NPC')
               else
                    if player:getCharVar('[LD]CustomQuestDaily') > 0 then
                       player:printToPlayer(string.format('You currently have a quest active! Please finish or cancel the active quest.'), 0, 'Quest NPC')
                    else
                       player:setCharVar('[LD]CustomQuestSelection', 10000000)
                       createDailySubQuestMenu(player, page)
                    end
               end
            elseif questMenu == 'Weekly' then --
               if player:getCharVar('[LD]CustomQuestTotalWeekly') >= 4 then
                  player:printToPlayer(string.format('You have reached the maximum limit of weekly quests you can participate in!'), 0, 'Quest NPC')
               else
                   if player:getCharVar('[LD]CustomQuestWeekly') > 0 then
                      player:printToPlayer(string.format('You currently have a quest active! Please finish or cancel the active quest.'), 0, 'Quest NPC')
                   else
                      player:setCharVar('[LD]CustomQuestSelection', 20000000)
                      createWeeklySubQuestMenu(player, page)
                   end
               end
            elseif questMenu == 'Monthly' then --
               if player:getCharVar('[LD]CustomQuestTotalMonthly') >= 2 then
                  player:printToPlayer(string.format('You have reached the maximum limit of monthly quests you can participate in!'), 0, 'Quest NPC')
               else
                   if player:getCharVar('[LD]CustomQuestMonthly') > 0 then
                      player:printToPlayer(string.format('You currently have a quest active! Please finish or cancel the active quest.'), 0, 'Quest NPC')
                   else
                      player:setCharVar('[LD]CustomQuestSelection', 30000000)
                      createMonthlySubQuestMenu(player, page)
                   end
               end
            end
        end
        })
    end
    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                createQuestMenu(player, page - 1)
            end
        })
    end
    if endIndex < #mainQMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                createQuestMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Quest Menu',
        options = options
    })
end

local function createCancelQuestMenu(player, page)
    local activeQuests = {}
    for i = 1, 3 do
        local varName = customQuestType[i][4]
        if player:getCharVar(varName) > 0 then
            table.insert(activeQuests, i)
        end
    end

    local linesPerPage = 5
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #activeQuests)
    local options = {}

    for i = startIndex, endIndex do
        local qType = activeQuests[i]
        local varName = customQuestType[qType][4]
        local questVar = player:getCharVar(varName)
        local questParams = tostring(questVar)
        local questId = tonumber(questParams:sub(3,5))
        local questName = customQuestId[questId][1]
        local typeName = customQuestType[qType][1]

        table.insert(options, {
            string.format('%s: %s', typeName, questName),
            function(player)
                deleteCustomQuest(player, qType)
            end
        })
    end

    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                createCancelQuestMenu(player, page - 1)
            end
        })
    end
    if endIndex < #activeQuests then
        table.insert(options, {
            'Next Page',
            function(player)
                createCancelQuestMenu(player, page + 1)
            end
        })
    end

    table.insert(options, {
        'Exit',
        function(player)
            return
        end
    })

    delaySendMenu(player, {
        title = 'Cancel Quest?',
        options = options
    })
end

local function createMainMenu(player, page)
    local mainMenu = {'Nothing for now!', 'Select Quest', 'Cancel Quest', 'Current Quest', 'Completed Quests'}

    local linesPerPage = 5
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #mainMenu)
    local options = {}
    for i = startIndex, endIndex do
        local menu = mainMenu[i]
        table.insert(options, {
            string.format('%s', menu),
            function(player)
            if menu == 'Select Quest' then --
               createQuestMenu(player, page)
            elseif menu == 'Cancel Quest' then --
                   local anyActive = false
                   for i = 1, 3 do
                       if player:getCharVar(customQuestType[i][4]) > 0 then anyActive = true break end
                   end
                   if anyActive then
                      player:printToPlayer(string.format('Canceling a quest will decrease your quest total limit.'), 0, 'Quest NPC')
                      createCancelQuestMenu(player, page)
                   else
                      player:printToPlayer(string.format('You do not have an active quest to cancel.'), 0, 'Quest NPC')
                   end
            elseif menu == 'Current Quest' then -- 
                local anyActive = false
                for i = 1, 3 do
                    local varName = customQuestType[i][4]
                    local questVar = player:getCharVar(varName)
                    if questVar > 0 then
                        anyActive = true
                        local questParams = tostring(questVar)
                        local questType = tonumber(questParams:sub(1,1))
                        local questLimit = tonumber(questParams:sub(2,2))
                        local questId = tonumber(questParams:sub(3,5))
                        local questCount = tonumber(questParams:sub(6,8))
                   player:printToPlayer(string.format('Your current quest is:'), 0, 'Quest NPC')
                   player:printToPlayer(string.format('%s', customQuestType[questType][1]), 0, 'Quest Type')
                   player:printToPlayer(string.format('%s', customQuestId[questId][1]), 0, 'Quest Name')
                   player:printToPlayer(string.format('%s of %s', questCount,customQuestId[questId][3]), 0, 'Quest Progress')
                    end
                end
                if not anyActive then
                   player:printToPlayer('You do not currently have an active quest!', 0, 'Quest NPC')
                end
            elseif menu == 'Completed Quests' then --
                player:printToPlayer(string.format('Your have completed:'), 0, 'Quest NPC')
                player:printToPlayer(string.format('Daily Quests [%s]', player:getCharVar('[LD]CustomQuestTotalDaily')), 0, 'Quest Results')
                player:printToPlayer(string.format('Weekly Quests [%s]', player:getCharVar('[LD]CustomQuestTotalWeekly')), 0, 'Quest Results')
                player:printToPlayer(string.format('Monthly Quests [%s]', player:getCharVar('[LD]CustomQuestTotalMonthly')), 0, 'Quest Results')
                player:printToPlayer(string.format('Quests Canceled Daily [%s]', player:getCharVar('[LD]CustomQuestXDaily')), 0, 'Quest Results')
                player:printToPlayer(string.format('Quests Canceled Weekly [%s]', player:getCharVar('[LD]CustomQuestXWeekly')), 0, 'Quest Results')
                player:printToPlayer(string.format('Quests Canceled Monthly [%s]', player:getCharVar('[LD]CustomQuestXMonthly')), 0, 'Quest Results')
                player:printToPlayer(string.format('Total Quests Completed [%s]', player:getCharVar('[LD]CustomQuestTotal')), 0, 'Quest Results')
                player:printToPlayer('Note: Quests Canceled and Daily / Weekly / Monthly Quest counts will reset after each time reset, Quest Total will not reset!', 0, 'Quest Results')
            end
        end
        })
    end
    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                createMainMenu(player, page - 1)
            end
        })
    end
    if endIndex < #mainMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                createMainMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Quest Menu',
        options = options
    })
end

xi.custom_quest.onTrade = function(player, npc, trade)
----------------------------------------------
-- LD quest signed crafting item
----------------------------------------------
    checkQuestTimer(player) -- check to see if quest has expired
    local found, qType = checkQuestSignatureItem(player, trade)
    if found then
        local varName = customQuestType[qType][4]
        local questVar = player:getCharVar(varName)
        local questParams = tostring(questVar)
        local questId = tonumber(questParams:sub(3,5))
            if questId >= 584 and
               questId <= 925 then
                 player:tradeComplete()
                 player:setCharVar(varName, questVar + 1 )
                 completeCustomQuest(player, qType)
            end
    end
end

xi.custom_quest.onTrigger = function(player, npc)
--[[
order of operation -
1. Check if timers are up to reset and not allow quest completion
2. Check to see if quest is completed and give reward
3. Create main menu
]]--
    checkQuestTimer(player) -- check to see if quest has expired
    for i = 1, 3 do
        local varName = customQuestType[i][4]
        local questVar = player:getCharVar(varName)
        if questVar > 0 then
            completeCustomQuest(player, i)
        end
    end
                player:timer(500, function()
                    -- Delay menu to allow congradulations animation to play
                       createMainMenu(player, 1)
                end)
end

xi.custom_quest.onMobInitialize = function(mob)

end

xi.custom_quest.onMobSpawn = function(mob)

end

xi.custom_quest.onMobEngage = function(mob, target)

end

xi.custom_quest.onMobFight = function(mob, target)

end

xi.custom_quest.onMobDisengage = function(mob)

end

xi.custom_quest.onWeaponskillHit = function(mob, attacker, weaponskill)

end

xi.custom_quest.helmAdjustment = function(player, helmType) -- added to global helm.lua line 1552,
    for i = 1, 3 do
    local varName = customQuestType[i][4]
    local questVar = player:getCharVar(varName)
    if questVar > 0 then
    local questParams = tostring(questVar)
    local questType = tonumber(questParams:sub(1,1))
    local questId = tonumber(questParams:sub(3,5))
    local questCount = tonumber(questParams:sub(6,8))
        if helmType == xi.helmType.LOGGING then
           if questId == 97 then
              if questCount < 10 then 
                 player:setCharVar(varName,questVar + 1 )
                        player:printToPlayer(string.format('Level Down %s Quest!',customQuestType[questType][1]),8)
                        player:printToPlayer(string.format('%s Count: %s of %s.',customQuestId[questId][1],questCount + 1,customQuestId[questId][3] ),8)
              --   print('LOGGING')
              end
           end
        elseif helmType == xi.helmType.MINING then
               if questId == 98 then
                  if questCount < 10 then 
                     player:setCharVar(varName,questVar + 1 )
                        player:printToPlayer(string.format('Level Down %s Quest!',customQuestType[questType][1]),8)
                        player:printToPlayer(string.format('%s Count: %s of %s.',customQuestId[questId][1],questCount + 1,customQuestId[questId][3] ),8)
                  --   print('MINING')
                  end
               end
        elseif helmType == xi.helmType.EXCAVATION then
               if questId == 99 then
                  if questCount < 10 then 
                     player:setCharVar(varName,questVar + 1 )
                        player:printToPlayer(string.format('Level Down %s Quest!',customQuestType[questType][1]),8)
                        player:printToPlayer(string.format('%s Count: %s of %s.',customQuestId[questId][1],questCount + 1,customQuestId[questId][3] ),8)
                  --   print('EXCAVATION')
                  end
               end
        elseif helmType == xi.helmType.HARVESTING then
               if questId == 96 then
                  if questCount < 10 then 
                     player:setCharVar(varName,questVar + 1 )
                        player:printToPlayer(string.format('Level Down %s Quest!',customQuestType[questType][1]),8)
                        player:printToPlayer(string.format('%s Count: %s of %s.',customQuestId[questId][1],questCount + 1,customQuestId[questId][3] ),8)
                  --   print('HARVESTING')
                  end
               end
        end
    end
    end
end

xi.custom_quest.chocoboDigAdjustment = function(player) -- added to global chocobo_digging.lua line 965,
    for i = 1, 3 do
    local varName = customQuestType[i][4]
    local questVar = player:getCharVar(varName)
    if questVar > 0 then
    local questParams = tostring(questVar)
    local questType = tonumber(questParams:sub(1,1))
    local questId = tonumber(questParams:sub(3,5))
    local questCount = tonumber(questParams:sub(6,8))
           if questId == 95 then
              if questCount < 10 then 
                 player:setCharVar(varName,questVar + 1 )
                        player:printToPlayer(string.format('Level Down %s Quest!',customQuestType[questType][1]),8)
                        player:printToPlayer(string.format('%s Count: %s of %s.',customQuestId[questId][1],questCount + 1,customQuestId[questId][3] ),8)
              --   print('DIGGING')
              end
           end
    end
    end
end

xi.custom_quest.onMobDeathEx = function(mob, player, isKiller, isWeaponSkillKill)
    for i = 1, 3 do
    local varName = customQuestType[i][4]
    local questVar = player:getCharVar(varName)
    if questVar > 0 then
    local questParams = tostring(questVar)
    local questType = tonumber(questParams:sub(1,1))
    local questLimit = tonumber(questParams:sub(2,2))
    local questId = tonumber(questParams:sub(3,5))
    local questCount = tonumber(questParams:sub(6,8))

 -- if questId ~= nil then -- Original check to see if they have a quest active
----------------------------------------------
-- LS quest to Kill Provenance Water or Supreme
----------------------------------------------
    if player then
        if questId >= 85 and questId <= 94 and
            mob:getName() == customQuestId[questId][1]:sub(6) then
                player:setCharVar(varName, questVar +1)
                player:printToPlayer(string.format('Level Down %s Quest!',customQuestType[questType][1]),8)
                player:printToPlayer(string.format('%s Count: %s of %s.',customQuestId[questId][1],questCount + 1,customQuestId[questId][3] ),8)
        end
    end
        

----------------------------------------------
-- LS quest to Kill 50 mobs of a eco system
----------------------------------------------
    if player and
       not mob:isNM() then
       if player:checkDifficulty(mob) >= 1 then -- Incrediably Easy Prey +
            if questId >= 100 and
               questId <= 120 then
                   local questEco = customQuestId[questId][2]
                       if mob:getEcosystem() == questEco then
                             if isKiller then
                               if questCount < 50 then
                                player:setCharVar(varName, questVar +1)
                                player:printToPlayer(string.format('Level Down %s Quest!',customQuestType[questType][1]),8)
                                player:printToPlayer(string.format('%s Count: %s of %s.',customQuestId[questId][1],questCount + 1,customQuestId[questId][3] ),8)
                               end
                             end
                       end
----------------------------------------------
-- LS quest defeat mob with 50 weaponskill
----------------------------------------------
            elseif questId >= 121 and
                   questId <= 132 then
                       local weapon = player:getStorageItem(0, 0, xi.slot.MAIN)
                       local meleeskilltype = 0
                         if weapon == nil then
                            meleeskilltype = 1 -- to account for h2h without weapon equipped
                         else
                            meleeskilltype = weapon:getSkillType()
                         end
                            if isWeaponSkillKill == true and 
                               meleeskilltype == customQuestId[questId][2] then
                                if questCount < 50 then
                                    player:setCharVar(varName, questVar +1)
                                    player:printToPlayer(string.format('Level Down %s Quest!',customQuestType[questType][1]),8)
                                    player:printToPlayer(string.format('%s Kill Count: %s of %s.',customQuestId[questId][1],questCount + 1,customQuestId[questId][3]),8)
                                end
                            end
            elseif questId >= 133 and
                   questId <= 134 then
                       local range  = player:getStorageItem(0, 0, xi.slot.RANGED) -- archery 25, marksmenship 26
                       local rangeskilltype = 0
                       if range ~= nil then
                           rangeskilltype = range:getSkillType()
                       end
                            if isWeaponSkillKill == true and 
                               rangeskilltype == customQuestId[questId][2] then
                                if questCount < 50 then
                                    player:setCharVar(varName, questVar +1)
                                    player:printToPlayer(string.format('Level Down %s Quest!',customQuestType[questType][1]),8)
                                    player:printToPlayer(string.format('%s Count: %s of %s.',customQuestId[questId][1],questCount + 1,customQuestId[questId][3]),8)
                                end
                            end                   
            end
       end
    end
----------------------------------------------
-- LS quest to Kill NM's
----------------------------------------------
    if player then
        if questId >= 135 and
            questId <= 283 then
                if questCount < 1 then
                    if mob:getName() == customQuestId[questId][1]:sub(6) then
                        player:setCharVar(varName, questVar +1)
                        player:printToPlayer(string.format('Level Down %s Quest!',customQuestType[questType][1]),8)
                        player:printToPlayer(string.format('%s Count: %s of %s.',customQuestId[questId][1],questCount + 1,customQuestId[questId][3]),8)
                    end
                end
----------------------------------------------
-- LS quest to Kill NM Hunt NM's
----------------------------------------------
        elseif questId >= 284 and
            questId <= 583 then
                if questCount < 1 then
                    if mob:getName():sub(6) == customQuestId[questId][1]:sub(6) then
                        player:setCharVar(varName, questVar +1)
                        player:printToPlayer(string.format('Level Down %s Quest!',customQuestType[questType][1]),8)
                        player:printToPlayer(string.format('%s Count: %s of %s.',customQuestId[questId][1],questCount + 1,customQuestId[questId][3]),8)
                    end
                end
       end
    end
 -- end
    end
    end
end

xi.custom_quest.onMobDespawn = function(mob)

end

xi.custom_quest.onMobDeath = function(mob, player, optParams)

end

xi.custom_quest.getQuestInfo = function(player) -- for use in player command
    local anyActive = false
    for i = 1, 3 do
        local varName = customQuestType[i][4]
        local questVar = player:getCharVar(varName)
        if questVar > 0 then
            anyActive = true
            local questParams = tostring(questVar)
            local questType = tonumber(questParams:sub(1,1))
            local questLimit = tonumber(questParams:sub(2,2))
            local questId = tonumber(questParams:sub(3,5))
            local questCount = tonumber(questParams:sub(6,8))

            player:printToPlayer(string.format('Your current quest is:'), 0, 'Quest NPC')
            player:printToPlayer(string.format('%s', customQuestType[questType][1]), 0, 'Quest Type')
            player:printToPlayer(string.format('%s', customQuestId[questId][1]), 0, 'Quest Name')
            player:printToPlayer(string.format('%s of %s', questCount,customQuestId[questId][3]), 0, 'Quest Progress')
        end
    end

    if not anyActive then
        player:printToPlayer('You do not currently have an active quest!', 0, 'Quest NPC')
        return
    end

    player:printToPlayer(string.format('Your have completed:'), 0, 'Quest NPC')
    player:printToPlayer(string.format('Daily Quests [%s]', player:getCharVar('[LD]CustomQuestTotalDaily')), 0, 'Quest Results')
    player:printToPlayer(string.format('Weekly Quests [%s]', player:getCharVar('[LD]CustomQuestTotalWeekly')), 0, 'Quest Results')
    player:printToPlayer(string.format('Monthly Quests [%s]', player:getCharVar('[LD]CustomQuestTotalMonthly')), 0, 'Quest Results')
    player:printToPlayer(string.format('Quests Canceled Daily [%s]', player:getCharVar('[LD]CustomQuestXDaily')), 0, 'Quest Results')
    player:printToPlayer(string.format('Quests Canceled Weekly [%s]', player:getCharVar('[LD]CustomQuestXWeekly')), 0, 'Quest Results')
    player:printToPlayer(string.format('Quests Canceled Monthly [%s]', player:getCharVar('[LD]CustomQuestXMonthly')), 0, 'Quest Results')
    player:printToPlayer(string.format('Total Quests Completed [%s]', player:getCharVar('[LD]CustomQuestTotal')), 0, 'Quest Results')
    player:printToPlayer('Note: Quests Canceled and Daily / Weekly / Monthly Quest counts will reset after each time reset, Quest Total will not reset!', 0, 'Quest Results')

end

xi.custom_quest.completeCurrentQuest = function(player) -- for use of GM Command
    for i = 1, 3 do
    local varName = customQuestType[i][4]
    local questVar = player:getCharVar(varName)
    local questParams = tostring(questVar)
    local questType = tonumber(questParams:sub(1,1))
    local questLimit = tonumber(questParams:sub(2,2))
    local questId = tonumber(questParams:sub(3,5))
    local questCount = tonumber(questParams:sub(6,8))
    local questTotalCount = customQuestId[questId][3]
    local difference = questTotalCount - questCount

    if questVar > 0 then
        player:setCharVar(varName, questVar + difference)
        player:printToPlayer(string.format('Level Down %s Quest Completed!',customQuestType[questType][1]),8)
        player:printToPlayer(string.format('%s', customQuestType[questType][1]), 0, 'Quest Type')
        player:printToPlayer(string.format('%s', customQuestId[questId][1]), 0, 'Quest Name')
        player:printToPlayer(string.format('%s of %s', customQuestId[questId][3],customQuestId[questId][3]), 0, 'Quest Progress')
        completeCustomQuest(player, i)
    end
    end
end

xi.custom_quest.setCurrentQuest = function(player, questId) -- for use of GM Command
    -- local questVar = player:getCharVar('[LD]CustomQuest')
    local dailyQuest =  15000000
    local weeklyQuest = 22000000
    local monthlyQuest = 31000000
    local questIdCalc = questId * 1000
   
    if questId >= 85 and questId <= 94 then -- monthly
        player:setCharVar('[LD]CustomQuestMonthly', monthlyQuest + questIdCalc)
    elseif questId >= 100 and questId <= 583 then -- Weekly
        player:setCharVar('[LD]CustomQuestWeekly', weeklyQuest + questIdCalc)
    elseif questId >= 95 and questId <= 99 then -- daily
        player:setCharVar('[LD]CustomQuestDaily', dailyQuest + questIdCalc)
    elseif questId >= 584 and questId <= 925 then -- daily
        player:setCharVar('[LD]CustomQuestDaily', dailyQuest + questIdCalc)
    elseif questId == 84 then -- daily
        player:setCharVar('[LD]CustomQuestDaily', dailyQuest + questIdCalc)
    end
end
