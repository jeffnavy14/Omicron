-----------------------------------
-- Area: Port Jeuno
--  NPC: Monisette
-- !pos -5 0.1 -10.872
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/settings/main")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}


-----------------------------------
-- artifact armor upgrade data
-- [combinationId] = {trade = {Base AF, Item, Job Ingredient, Slot Ingredient} reward = afReforged 109},
-----------------------------------
local afArmorReforged =
{
[  1] = {trade = {12511, {4064, 10}, 855, 844},   reward = 27663}, --	Pummeler's Mask  -- War
[  2] = {trade = {15225, {4064,	5}, 855, 844},	  reward = 27663}, --	Pummeler's Mask
[  3] = {trade = {12638, {4065,	10}, 855, 837},	  reward = 27807}, --	Pummeler's Lorica 
[  4] = {trade = {14473, {4065,	5}, 855, 837},	  reward = 27807}, --	Pummeler's Lorica 
[  5] = {trade = {13961, {4066, 10}, 855, 1110},  reward = 27943}, --	Pummeler's mufflers
[  6] = {trade = {14890, {4066, 5}, 855, 1110},	  reward = 27943}, --	Pummeler's mufflers
[  7] = {trade = {14214, {4067, 10}, 855, 836},   reward = 28090}, --	Pummeler's cuisses
[  8] = {trade = {15561, {4067, 5}, 855, 836},	  reward = 28090}, --	Pummeler's cuisses
[  9] = {trade = {14089, {4068, 10}, 855, 1311},  reward = 28223}, --	Pummeler's calligae
[ 10] = {trade = {15352, {4068, 5}, 855, 1311},	  reward = 28223}, --	Pummeler's calligae
[ 11] = {trade = {12512, {4064, 10}, 823, 844},   reward = 27664}, --	Anchorite's crown -- Mnk
[ 12] = {trade = {15226, {4064,	5}, 823, 844},	  reward = 27664}, --	Anchorite's crown
[ 13] = {trade = {12639, {4065,	10}, 823, 837},	  reward = 27808}, --	Anchorite's cyclas
[ 14] = {trade = {14474, {4065,	5}, 823, 837},	  reward = 27808}, --	Anchorite's cyclas
[ 15] = {trade = {13962, {4066, 10}, 823, 1110},  reward = 27944}, --	Anchorite's gloves
[ 16] = {trade = {14891, {4066, 5}, 823, 1110},	  reward = 27944}, --	Anchorite's gloves
[ 17] = {trade = {14215, {4067, 10}, 823, 836},   reward = 28091}, --	Anchorite's hose
[ 18] = {trade = {15562, {4067, 5}, 823, 836},	  reward = 28091}, --	Anchorite's hose
[ 19] = {trade = {14090, {4068, 10}, 823, 1311},  reward = 28224}, --	Anchorite's gaiters
[ 20] = {trade = {15353, {4068, 5}, 823, 1311},	  reward = 28224}, --	Anchorite's gaiters
[ 21] = {trade = {13855, {4064, 10}, 2340, 844},  reward = 27665}, --	Theophany cap -- Whm
[ 22] = {trade = {15227, {4064,	5}, 2340, 844},	  reward = 27665}, --	Theophany cap
[ 23] = {trade = {12640, {4065,	10}, 2340, 837},  reward = 27809}, --	Theophany bliaut 
[ 24] = {trade = {14475, {4065,	5}, 2340, 837},	  reward = 27809}, --	Theophany bliaut 
[ 25] = {trade = {13963, {4066, 10}, 2340, 1110}, reward = 27945}, --	Theophany mitts
[ 26] = {trade = {14892, {4066, 5}, 2340, 1110},  reward = 27945}, --	Theophany mitts
[ 27] = {trade = {14216, {4067, 10}, 2340, 836},  reward = 28092}, --	Theophany pantaloons
[ 28] = {trade = {15563, {4067, 5}, 2340, 836},	  reward = 28092}, --	Theophany pantaloons
[ 29] = {trade = {14091, {4068, 10}, 2340, 1311}, reward = 28225}, --	Theophany duckbills
[ 30] = {trade = {15354, {4068, 5}, 2340, 1311},  reward = 28225}, --	Theophany duckbills 
[ 31] = {trade = {13856, {4064, 10}, 2288, 844},  reward = 27666}, --	Spaekona's petasos -- Blm
[ 32] = {trade = {15228, {4064,	5}, 2288, 844},	  reward = 27666}, --	Spaekona's petasos
[ 33] = {trade = {12641, {4065,	10}, 2288, 837},  reward = 27810}, --	Spaekona's coat
[ 34] = {trade = {14476, {4065,	5}, 2288, 837},	  reward = 27810}, --	Spaekona's coat
[ 35] = {trade = {13964, {4066, 10}, 2288, 1110}, reward = 27946}, --	Spaekona's gloves
[ 36] = {trade = {14893, {4066, 5}, 2288, 1110},  reward = 27946}, --	Spaekona's gloves
[ 37] = {trade = {14217, {4067, 10}, 2288, 836},  reward = 28093}, --	Spaekona's tonban
[ 38] = {trade = {15564, {4067, 5}, 2288, 836},	  reward = 28093}, --	Spaekona's tonban
[ 39] = {trade = {14092, {4068, 10}, 2288, 1311}, reward = 28226}, --	Spaekona's sabots
[ 40] = {trade = {15355, {4068, 5}, 2288, 1311},  reward = 28226}, --	Spaekona's sabots
[ 41] = {trade = {12513, {4064, 10}, 2288, 844},  reward = 27667}, --	Atrophy chapeau -- Rdm
[ 42] = {trade = {15229, {4064,	5}, 1699, 844},	  reward = 27667}, --	Atrophy chapeau
[ 43] = {trade = {12642, {4065,	10}, 1699, 837},  reward = 27811}, --	Atrophy tabard
[ 44] = {trade = {14477, {4065,	5}, 1699, 837},	  reward = 27811}, --	Atrophy tabard 
[ 45] = {trade = {13965, {4066, 10}, 1699, 1110}, reward = 27947}, --	Atrophy gloves
[ 46] = {trade = {14894, {4066, 5}, 1699, 1110},  reward = 27947}, --	Atrophy gloves
[ 47] = {trade = {14218, {4067, 10}, 1699, 836},  reward = 28094}, --	Atrophy tights
[ 48] = {trade = {15565, {4067, 5}, 1699, 836},	  reward = 28094}, --	Atrophy tights
[ 49] = {trade = {14093, {4068, 10}, 1699, 1311}, reward = 28227}, --	Atrophy boots
[ 50] = {trade = {15356, {4068, 5}, 1699, 1311},  reward = 28227}, --	Atrophy boots
[ 51] = {trade = {12514, {4064, 10}, 823, 844},   reward = 27668}, --	Pillager's bonnet  -- Thf
[ 52] = {trade = {15230, {4064,	5}, 823, 844},	  reward = 27668}, --	Pillager's bonnet
[ 53] = {trade = {12643, {4065,	10}, 823, 837},	  reward = 27812}, --	Pillager's vest 
[ 54] = {trade = {14478, {4065,	5}, 823, 837},	  reward = 27812}, --	Pillager's vest
[ 55] = {trade = {13966, {4066, 10}, 823, 1110},  reward = 27948}, --	Pillager's armlets
[ 56] = {trade = {14895, {4066, 5}, 823, 1110},	  reward = 27948}, --	Pillager's armlets
[ 57] = {trade = {14219, {4067, 10}, 823, 836},   reward = 28095}, --	Pillager's culottes
[ 58] = {trade = {15566, {4067, 5}, 823, 836},	  reward = 28095}, --	Pillager's culottes
[ 59] = {trade = {14094, {4068, 10}, 823, 1311},  reward = 28228}, --	Pillager's poulaines
[ 60] = {trade = {15357, {4068, 5}, 823, 1311},	  reward = 28228}, --	Pillager's poulaines
[ 61] = {trade = {12515, {4064, 10}, 752, 844},   reward = 27669}, --	Reverence coronet -- Pld
[ 62] = {trade = {15231, {4064,	5}, 752, 844},	  reward = 27669}, --	Reverence coronet
[ 63] = {trade = {12644, {4065,	10}, 752, 837},	  reward = 27813}, --	Reverence surcoat
[ 64] = {trade = {14479, {4065,	5}, 752, 837},	  reward = 27813}, --	Reverence surcoat
[ 65] = {trade = {13967, {4066, 10}, 752, 1110},  reward = 27949}, --	Reverence gauntlets
[ 66] = {trade = {14896, {4066, 5}, 752, 1110},	  reward = 27949}, --	Reverence gauntlets
[ 67] = {trade = {14220, {4067, 10}, 752, 836},   reward = 28096}, --	Reverence breeches
[ 68] = {trade = {15567, {4067, 5}, 752, 836},	  reward = 28096}, --	Reverence breeches
[ 69] = {trade = {14095, {4068, 10}, 752, 1311},  reward = 28229}, --	Reverence leggings
[ 70] = {trade = {15358, {4068, 5}, 752, 1311},	  reward = 28229}, --	Reverence leggings
[ 71] = {trade = {12516, {4064, 10}, 664, 844},   reward = 27670}, --	Ignominy Burgeonet -- Drk
[ 72] = {trade = {15232, {4064,	5}, 664, 844},	  reward = 27670}, --	Ignominy Burgeonet
[ 73] = {trade = {12645, {4065,	10}, 664, 837},   reward = 27814}, --	Ignominy Cuirass 
[ 74] = {trade = {14480, {4065,	5}, 664, 837},	  reward = 27814}, --	Ignominy Cuirass 
[ 75] = {trade = {13968, {4066, 10}, 664, 1110},  reward = 27950}, --	Ignominy gauntlets
[ 76] = {trade = {14897, {4066, 5}, 664, 1110},   reward = 27950}, --	Ignominy gauntlets
[ 77] = {trade = {14221, {4067, 10}, 664, 836},   reward = 28097}, --	Ignominy Flanchard 
[ 78] = {trade = {15568, {4067, 5}, 664, 836},	  reward = 28097}, --	Ignominy Flanchard 
[ 79] = {trade = {14096, {4068, 10}, 664, 1311},  reward = 28230}, --	Ignominy sollerets
[ 80] = {trade = {15359, {4068, 5}, 664, 1311},   reward = 28230}, --	Ignominy sollerets 
[ 81] = {trade = {12517, {4064, 10}, 2288, 844},  reward = 27671}, --	Totemic Helm -- Bst
[ 82] = {trade = {15233, {4064,	5}, 2288, 844},	  reward = 27671}, --	Totemic Helm
[ 83] = {trade = {12646, {4065,	10}, 2288, 837},  reward = 27815}, --	Totemic Jackcoat
[ 84] = {trade = {14481, {4065,	5}, 2288, 837},	  reward = 27815}, --	Totemic Jackcoat
[ 85] = {trade = {13969, {4066, 10}, 2288, 1110}, reward = 27951}, --	Totemic Gloves
[ 86] = {trade = {14898, {4066, 5}, 2288, 1110},  reward = 27951}, --	Totemic Gloves
[ 87] = {trade = {14222, {4067, 10}, 2288, 836},  reward = 28098}, --	Totemic Trousers
[ 88] = {trade = {15569, {4067, 5}, 2288, 836},	  reward = 28098}, --	Totemic Trousers
[ 89] = {trade = {14097, {4068, 10}, 2288, 1311}, reward = 28231}, --	Totemic Gaiters
[ 90] = {trade = {15360, {4068, 5}, 2288, 1311},  reward = 28231}, --	Totemic Gaiters
[ 91] = {trade = {13857, {4064, 10}, 2288, 844},  reward = 27672}, --	Brioso Roundlet -- Brd
[ 92] = {trade = {15234, {4064,	5}, 2340, 844},	  reward = 27672}, --	Brioso Roundlet
[ 93] = {trade = {12647, {4065,	10}, 2340, 837},  reward = 27816}, --	Brioso Justaucorps
[ 94] = {trade = {14482, {4065,	5}, 2340, 837},	  reward = 27816}, --	Brioso Justaucorps 
[ 95] = {trade = {13970, {4066, 10}, 2340, 1110}, reward = 27952}, --	Brioso Cuffs
[ 96] = {trade = {14899, {4066, 5}, 2340, 1110},  reward = 27952}, --	Brioso Cuffs
[ 97] = {trade = {14223, {4067, 10}, 2340, 836},  reward = 28099}, --	Brioso Cannions
[ 98] = {trade = {15570, {4067, 5}, 2340, 836},	  reward = 28099}, --	Brioso Cannions
[ 99] = {trade = {14098, {4068, 10}, 2340, 1311}, reward = 28232}, --	Brioso Slippers
[100] = {trade = {15361, {4068, 5}, 2340, 1311},  reward = 28232}, --	Brioso Slippers
[101] = {trade = {12518, {4064, 10}, 2288, 844},  reward = 27673}, --	Orion Beret  -- Rng
[102] = {trade = {15235, {4064,	5}, 2288, 844},	  reward = 27673}, --	Orion Beret
[103] = {trade = {12648, {4065,	10}, 2288, 837},  reward = 27817}, --	Orion Jerkin 
[104] = {trade = {14483, {4065,	5}, 2288, 837},	  reward = 27817}, --	Orion Jerkin 
[105] = {trade = {13971, {4066, 10}, 2288, 1110}, reward = 27953}, --	Orion Bracers
[106] = {trade = {14900, {4066, 5}, 2288, 1110},  reward = 27953}, --	Orion Bracers
[107] = {trade = {14224, {4067, 10}, 2288, 836},  reward = 28100}, --	Orion Braccae
[108] = {trade = {15571, {4067, 5}, 2288, 836},	  reward = 28100}, --	Orion Braccae
[109] = {trade = {14099, {4068, 10}, 2288, 1311}, reward = 28233}, --	Orion Socks
[110] = {trade = {15362, {4068, 5}, 2288, 1311},  reward = 28233}, --	Orion Socks
[111] = {trade = {13868, {4064, 10}, 657, 844},   reward = 27674}, --	Wakido Kabuto -- Sam
[112] = {trade = {15236, {4064,	5}, 657, 844},	  reward = 27674}, --	Wakido Kabuto
[113] = {trade = {13781, {4065,	10}, 657, 837},	  reward = 27818}, --	Wakido Domaru
[114] = {trade = {14484, {4065,	5}, 657, 837},	  reward = 27818}, --	Wakido Domaru
[115] = {trade = {13972, {4066, 10}, 657, 1110},  reward = 27954}, --	Wakido Kote
[116] = {trade = {14901, {4066, 5}, 657, 1110},	  reward = 27954}, --	Wakido Kote
[117] = {trade = {14225, {4067, 10}, 657, 836},   reward = 28101}, --	Wakido Haidate
[118] = {trade = {15572, {4067, 5}, 657, 836},	  reward = 28101}, --	Wakido Haidate
[119] = {trade = {14100, {4068, 10}, 657, 1311},  reward = 28234}, --	Wakido Sune-Ate 
[120] = {trade = {15363, {4068, 5}, 657, 1311},	  reward = 28234}, --	Wakido Sune-Ate 
[121] = {trade = {13869, {4064, 10}, 657, 844},   reward = 27675}, --	Hachiya Hatsuburi		-- Nin
[122] = {trade = {15237, {4064,	5}, 657, 844},	  reward = 27675}, --	Hachiya Hatsuburi
[123] = {trade = {13782, {4065,	10}, 657, 837},   reward = 27819}, --	Hachiya Chainmail 
[124] = {trade = {14485, {4065,	5}, 657, 837},	  reward = 27819}, --	Hachiya Chainmail 
[125] = {trade = {13973, {4066, 10}, 657, 1110},  reward = 27955}, --	Hachiya Tekko
[126] = {trade = {14902, {4066, 5}, 657, 1110},   reward = 27955}, --	Hachiya Tekko
[127] = {trade = {14226, {4067, 10}, 657, 836},   reward = 28102}, --	Hachiya Hakama
[128] = {trade = {15573, {4067, 5}, 657, 836},	  reward = 28102}, --	Hachiya Hakama
[129] = {trade = {14101, {4068, 10}, 657, 1311},  reward = 28235}, --	Hachiya Kyahan
[130] = {trade = {15364, {4068, 5}, 657, 1311},   reward = 28235}, --	Hachiya Kyahan
[131] = {trade = {12519, {4064, 10}, 752, 844},   reward = 27676}, --	Vishap Armet -- Drg
[132] = {trade = {15238, {4064,	5}, 752, 844},	  reward = 27676}, --	Vishap Armet
[133] = {trade = {12649, {4065,	10}, 752, 837},   reward = 27820}, --	Vishap Mail
[134] = {trade = {14486, {4065,	5}, 752, 837},	  reward = 27820}, --	Vishap Mail
[135] = {trade = {13974, {4066, 10}, 752, 1110},  reward = 27956}, --	Vishap Finger Gauntlets
[136] = {trade = {14903, {4066, 5}, 752, 1110},   reward = 27956}, --	Vishap Finger Gauntlets
[137] = {trade = {14227, {4067, 10}, 752, 836},   reward = 28103}, --	Vishap Brais
[138] = {trade = {15574, {4067, 5}, 752, 836},	  reward = 28103}, --	Vishap Brais
[139] = {trade = {14102, {4068, 10}, 752, 1311},  reward = 28236}, --	Vishap Greaves
[140] = {trade = {15365, {4068, 5}, 752, 1311},   reward = 28236}, --	Vishap Greaves
[141] = {trade = {12520, {4064, 10}, 1699, 844},  reward = 27677}, --	Convoker's Horn 	-- Smn
[142] = {trade = {15239, {4064,	5}, 1699, 844},	  reward = 27677}, --	Convoker's Horn
[143] = {trade = {12650, {4065,	10}, 1699, 837},  reward = 27821}, --	Convoker's Doublet
[144] = {trade = {14487, {4065,	5}, 1699, 837},	  reward = 27821}, --	Convoker's Doublet
[145] = {trade = {13975, {4066, 10}, 1699, 1110}, reward = 27957}, --	Convoker's Bracers
[146] = {trade = {14904, {4066, 5}, 1699, 1110},  reward = 27957}, --	Convoker's Bracers
[147] = {trade = {14228, {4067, 10}, 1699, 836},  reward = 28104}, --	Convoker's Spats
[148] = {trade = {15575, {4067, 5}, 1699, 836},	  reward = 28104}, --	Convoker's Spats
[149] = {trade = {14103, {4068, 10}, 1699, 1311}, reward = 28237}, --	Convoker's Pigaches
[150] = {trade = {15366, {4068, 5}, 1699, 1311},  reward = 28237}, --	Convoker's Pigaches
[151] = {trade = {15265, {4064, 10}, 2340, 844},  reward = 27678}, --	Assimilator's Keffiyeh  -- Blu
[152] = {trade = {11464, {4064,	5}, 2340, 844},	  reward = 27678}, --	Assimilator's Keffiyeh
[153] = {trade = {14521, {4065,	10}, 2340, 837},  reward = 27822}, --	Assimilator's Jubbah 
[154] = {trade = {11291, {4065,	5}, 2340, 837},	  reward = 27822}, --	Assimilator's Jubbah
[155] = {trade = {14928, {4066, 10}, 2340, 1110}, reward = 27958}, --	Assimilator's Bazubands
[156] = {trade = {15024, {4066, 5}, 2340, 1110},  reward = 27958}, --	Assimilator's Bazubands
[157] = {trade = {15600, {4067, 10}, 2340, 836},  reward = 28105}, --	Assimilator's Shalwar
[158] = {trade = {16345, {4067, 5}, 2340, 836},	  reward = 28105}, --	Assimilator's Shalwar
[159] = {trade = {15684, {4068, 10}, 2340, 1311}, reward = 28238}, --	Assimilator's Charuqs
[160] = {trade = {11381, {4068, 5}, 2340, 1311},  reward = 28238}, --	Assimilator's Charuqs
[161] = {trade = {15266, {4064, 10}, 2340, 844},  reward = 27679}, --	Laksamana's Tricorne -- Cor
[162] = {trade = {11467, {4064,	5}, 2340, 844},	  reward = 27679}, --	Laksamana's Tricorne
[163] = {trade = {14522, {4065,	10}, 2340, 837},  reward = 27823}, --	Laksamana's Frac
[164] = {trade = {11294, {4065,	5}, 2340, 837},	  reward = 27823}, --	Laksamana's Frac
[165] = {trade = {14929, {4066, 10}, 2340, 1110}, reward = 27959}, --	Laksamana's Gants
[166] = {trade = {15027, {4066, 5}, 2340, 1110},  reward = 27959}, --	Laksamana's Gants
[167] = {trade = {15601, {4067, 10}, 2340, 836},  reward = 28106}, --	Laksamana's Trews
[168] = {trade = {16348, {4067, 5}, 2340, 836},	  reward = 28106}, --	Laksamana's Trews
[169] = {trade = {15685, {4068, 10}, 2340, 1311}, reward = 28239}, --	Laksamana's Bottes
[170] = {trade = {11384, {4068, 5}, 2340, 1311},  reward = 28239}, --	Laksamana's Bottes
[171] = {trade = {15267, {4064, 10},2340, 844},   reward = 27680}, --	Foire Taj -- Pup
[172] = {trade = {11470, {4064,	5}, 2340, 844},	  reward = 27680}, --	Foire Taj
[173] = {trade = {14523, {4065,	10}, 2340, 837},  reward = 27824}, --	Foire Tobe
[174] = {trade = {11297, {4065,	5}, 2340, 837},	  reward = 27824}, --	Foire Tobe 
[175] = {trade = {14930, {4066, 10}, 2340, 1110}, reward = 27960}, --	Foire Dastanas
[176] = {trade = {15030, {4066, 5}, 2340, 1110},  reward = 27960}, --	Foire Dastanas
[177] = {trade = {15602, {4067, 10}, 2340, 836},  reward = 28107}, --	Foire Churidars
[178] = {trade = {16351, {4067, 5}, 2340, 836},	  reward = 28107}, --	Foire Churidars 
[179] = {trade = {15686, {4068, 10}, 2340, 1311}, reward = 28240}, --	Foire Babouches
[180] = {trade = {11387, {4068, 5}, 2340, 1311},  reward = 28240}, --	Foire Babouches
[181] = {trade = {16138, {4064, 10}, 823, 844},   reward = 27681}, --	Maxixi Tiara		 -- DNC M
[182] = {trade = {11475, {4064,	5}, 823, 844},	  reward = 27681}, --	Maxixi Tiara
[183] = {trade = {14578, {4065,	10}, 823, 837},   reward = 27825}, --	Maxixi Casaque
[184] = {trade = {11302, {4065,	5}, 823, 837},	  reward = 27825}, --	Maxixi Casaque
[185] = {trade = {15002, {4066, 10}, 823, 1110},  reward = 27961}, --	Maxixi Bangles
[186] = {trade = {15035, {4066, 5}, 823, 1110},   reward = 27961}, --	Maxixi Bangles
[187] = {trade = {15659, {4067, 10}, 823, 836},   reward = 28108}, --	Maxixi Tights
[188] = {trade = {16357, {4067, 5}, 823, 836},	  reward = 28108}, --	Maxixi Tights
[189] = {trade = {15746, {4068, 10}, 823, 1311},  reward = 28241}, --	Maxixi Toe Shoes
[190] = {trade = {11393, {4068, 5}, 823, 1311},   reward = 28241}, --	Maxixi Toe Shoes
[191] = {trade = {16139, {4064, 10}, 823, 844},   reward = 27682}, --	Maxixi Tiara		 -- DNC F
[192] = {trade = {11476, {4064,	5}, 823, 844},	  reward = 27682}, --	Maxixi Tiara
[193] = {trade = {14579, {4065,	10}, 823, 837},   reward = 27826}, --	Maxixi Casaque
[194] = {trade = {11303, {4065,	5}, 823, 837},	  reward = 27826}, --	Maxixi Casaque
[195] = {trade = {15003, {4066, 10}, 823, 1110},  reward = 27962}, --	Maxixi Bangles
[196] = {trade = {15036, {4066, 5}, 823, 1110},   reward = 27962}, --	Maxixi Bangles
[197] = {trade = {15660, {4067, 10}, 823, 836},   reward = 28109}, --	Maxixi Tights
[198] = {trade = {16358, {4067, 5}, 823, 836},	  reward = 28109}, --	Maxixi Tights
[199] = {trade = {15747, {4068, 10}, 823, 1311},  reward = 28242}, --	Maxixi Toe Shoes
[200] = {trade = {11394, {4068, 5}, 823, 1311},   reward = 28242}, --	Maxixi Toe Shoes
[201] = {trade = {16140, {4064, 10}, 2288, 844},  reward = 27683}, --	Academic's Mortarboard	 -- Sch
[202] = {trade = {11477, {4064,	5}, 1699, 844},	  reward = 27683}, --	Academic's Mortarboard
[203] = {trade = {14580, {4065,	10}, 1699, 837},  reward = 27827}, --	Academic's Gown
[204] = {trade = {11304, {4065,	5}, 1699, 837},	  reward = 27827}, --	Academic's Gown 
[205] = {trade = {15004, {4066, 10}, 1699, 1110}, reward = 27963}, --	Academic's Bracers
[206] = {trade = {15037, {4066, 5}, 1699, 1110},  reward = 27963}, --	Academic's Bracers
[207] = {trade = {16311, {4067, 10}, 1699, 836},  reward = 28110}, --	Academic's Pants
[208] = {trade = {16359, {4067, 5}, 1699, 836},	  reward = 28110}, --	Academic's Pants
[209] = {trade = {15748, {4068, 10}, 1699, 1311}, reward = 28243}, --	Academic's Loafers
[210] = {trade = {11395, {4068, 5}, 1699, 1311},  reward = 28243}, --	Academic's Loafers
}

-----------------------------------
-- relic armor upgrade data
-- [combinationId] = {trade = {Base AF, Item, Job Ingredient, Slot Ingredient} reward = relicReforged 109},
-----------------------------------
local relicArmorReforged =
{
[211] = {trade = {15072, {4064, 10}, {1456, 2}, 1469, 844},  reward = 26624},   -- WAR
[212] = {trade = {15245, {4064, 5},  {1456, 1}, 1469, 844},  reward = 26624},
[213] = {trade = {15087, {4065, 10}, {1456, 2}, 1469, 837},  reward = 26800},
[214] = {trade = {14500, {4065, 5},  {1456, 1}, 1469, 837},  reward = 26800},
[215] = {trade = {15102, {4066, 10}, {1456, 2}, 1469, 1110}, reward = 26976},
[216] = {trade = {14909, {4066, 5},  {1456, 1}, 1469, 1110}, reward = 26976},
[217] = {trade = {15117, {4067, 10}, {1456, 2}, 1469, 836},  reward = 27152},
[218] = {trade = {15580, {4067, 5},  {1456, 1}, 1469, 836},  reward = 27152},
[219] = {trade = {15132, {4068, 10}, {1456, 2}, 1469, 1311}, reward = 27328},
[220] = {trade = {15665, {4068, 5},  {1456, 1}, 1469, 1311}, reward = 27328},
[221] = {trade = {15073, {4064, 10}, {1456, 2}, 1516, 844},  reward = 26626},   -- MNK
[222] = {trade = {15246, {4064, 5},  {1456, 1}, 1516, 844},  reward = 26626},
[223] = {trade = {15088, {4065, 10}, {1456, 2}, 1516, 837},  reward = 26802},
[224] = {trade = {14501, {4065, 5},  {1456, 1}, 1516, 837},  reward = 26802},
[225] = {trade = {15103, {4066, 10}, {1456, 2}, 1516, 1110}, reward = 26978},
[226] = {trade = {14910, {4066, 5},  {1456, 1}, 1516, 1110}, reward = 26978},
[227] = {trade = {15118, {4067, 10}, {1456, 2}, 1516, 836},  reward = 27154},
[228] = {trade = {15581, {4067, 5},  {1456, 1}, 1516, 836},  reward = 27154},
[229] = {trade = {15133, {4068, 10}, {1456, 2}, 1516, 1311}, reward = 27330},
[230] = {trade = {15666, {4068, 5},  {1456, 1}, 1516, 1311}, reward = 27330},
[231] = {trade = {15074, {4064, 10}, {1453, 2}, 1470, 844},  reward = 26628},   -- WHM
[232] = {trade = {15247, {4064, 5},  {1453, 1}, 1470, 844},  reward = 26628},
[233] = {trade = {15089, {4065, 10}, {1453, 2}, 1470, 837},  reward = 26804},
[234] = {trade = {14502, {4065, 5},  {1453, 1}, 1470, 837},  reward = 26804},
[235] = {trade = {15104, {4066, 10}, {1453, 2}, 1470, 1110}, reward = 26980},
[236] = {trade = {14911, {4066, 5},  {1453, 1}, 1470, 1110}, reward = 26980},
[237] = {trade = {15119, {4067, 10}, {1453, 2}, 1470, 836},  reward = 27156},
[238] = {trade = {15582, {4067, 5},  {1453, 1}, 1470, 836},  reward = 27156},
[239] = {trade = {15134, {4068, 10}, {1453, 2}, 1470, 1311}, reward = 27332},
[240] = {trade = {15667, {4068, 5},  {1453, 1}, 1470, 1311}, reward = 27332},
[241] = {trade = {15075, {4064, 10}, {1450, 2}, 1470, 844},  reward = 26630},   -- BLM
[242] = {trade = {15248, {4064, 5},  {1450, 1}, 1470, 844},  reward = 26630},
[243] = {trade = {15090, {4065, 10}, {1450, 2}, 1470, 837},  reward = 26806},
[244] = {trade = {14503, {4065, 5},  {1450, 1}, 1470, 837},  reward = 26806},
[245] = {trade = {15105, {4066, 10}, {1450, 2}, 1470, 1110}, reward = 26982},
[246] = {trade = {14912, {4066, 5},  {1450, 1}, 1470, 1110}, reward = 26982},
[247] = {trade = {15120, {4067, 10}, {1450, 2}, 1470, 836},  reward = 27158},
[248] = {trade = {15583, {4067, 5},  {1450, 1}, 1470, 836},  reward = 27158},
[249] = {trade = {15135, {4068, 10}, {1450, 2}, 1470, 1311}, reward = 27334},
[250] = {trade = {15668, {4068, 5},  {1450, 1}, 1470, 1311}, reward = 27334},
[251] = {trade = {15076, {4064, 10}, {1453, 2}, 1516, 844},  reward = 26632},   -- RDM
[252] = {trade = {15249, {4064, 5},  {1453, 1}, 1516, 844},  reward = 26632},
[253] = {trade = {15091, {4065, 10}, {1453, 2}, 1516, 837},  reward = 26808},
[254] = {trade = {14504, {4065, 5},  {1453, 1}, 1516, 837},  reward = 26808},
[255] = {trade = {15106, {4066, 10}, {1453, 2}, 1516, 1110}, reward = 26984},
[256] = {trade = {14913, {4066, 5},  {1453, 1}, 1516, 1110}, reward = 26984},
[257] = {trade = {15121, {4067, 10}, {1453, 2}, 1516, 836},  reward = 27160},
[258] = {trade = {15584, {4067, 5},  {1453, 1}, 1516, 836},  reward = 27160},
[259] = {trade = {15136, {4068, 10}, {1453, 2}, 1516, 1311}, reward = 27336},
[260] = {trade = {15669, {4068, 5},  {1453, 1}, 1516, 1311}, reward = 27336},
[261] = {trade = {15077, {4064, 10}, {1450, 2}, 1516, 844},  reward = 26634},   -- THF 
[262] = {trade = {15250, {4064, 5},  {1450, 1}, 1516, 844},  reward = 26634},
[263] = {trade = {15092, {4065, 10}, {1450, 2}, 1516, 837},  reward = 26810},
[264] = {trade = {14505, {4065, 5},  {1450, 1}, 1516, 837},  reward = 26810},
[265] = {trade = {15107, {4066, 10}, {1450, 2}, 1516, 1110}, reward = 26986},
[266] = {trade = {14914, {4066, 5},  {1450, 1}, 1516, 1110}, reward = 26986},
[267] = {trade = {15122, {4067, 10}, {1450, 2}, 1516, 836},  reward = 27162},
[268] = {trade = {15585, {4067, 5},  {1450, 1}, 1516, 836},  reward = 27162},
[269] = {trade = {15137, {4068, 10}, {1450, 2}, 1516, 1311}, reward = 27338},
[270] = {trade = {15670, {4068, 5},  {1450, 1}, 1516, 1311}, reward = 27338},
[271] = {trade = {15078, {4064, 10}, {1453, 2}, 1469, 844},  reward = 26636},   -- PLD
[272] = {trade = {15251, {4064, 5},  {1453, 1}, 1469, 844},  reward = 26636},
[273] = {trade = {15093, {4065, 10}, {1453, 2}, 1469, 837},  reward = 26812},
[274] = {trade = {14506, {4065, 5},  {1453, 1}, 1469, 837},  reward = 26812},
[275] = {trade = {15108, {4066, 10}, {1453, 2}, 1469, 1110}, reward = 26988},
[276] = {trade = {14915, {4066, 5},  {1453, 1}, 1469, 1110}, reward = 26988},
[277] = {trade = {15123, {4067, 10}, {1453, 2}, 1469, 836},  reward = 27164},
[278] = {trade = {15586, {4067, 5},  {1453, 1}, 1469, 836},  reward = 27164},
[279] = {trade = {15138, {4068, 10}, {1453, 2}, 1469, 1311}, reward = 27340},
[280] = {trade = {15671, {4068, 5},  {1453, 1}, 1469, 1311}, reward = 27340},
[281] = {trade = {15079, {4064, 10}, {1456, 2}, 1469, 844},  reward = 26638},   -- DRK
[282] = {trade = {15252, {4064, 5},  {1456, 1}, 1469, 844},  reward = 26638},
[283] = {trade = {15094, {4065, 10}, {1456, 2}, 1469, 837},  reward = 26814},
[284] = {trade = {14507, {4065, 5},  {1456, 1}, 1469, 837},  reward = 26814},
[285] = {trade = {15109, {4066, 10}, {1456, 2}, 1469, 1110}, reward = 26990},
[286] = {trade = {14916, {4066, 5},  {1456, 1}, 1469, 1110}, reward = 26990},
[287] = {trade = {15124, {4067, 10}, {1456, 2}, 1469, 836},  reward = 27166},
[288] = {trade = {15587, {4067, 5},  {1456, 1}, 1469, 836},  reward = 27166},
[289] = {trade = {15139, {4068, 10}, {1456, 2}, 1469, 1311}, reward = 27342},
[290] = {trade = {15672, {4068, 5},  {1456, 1}, 1469, 1311}, reward = 27342},
[291] = {trade = {15080, {4064, 10}, {1450, 2}, 1458, 844},  reward = 26640},   -- BST
[292] = {trade = {15253, {4064, 5},  {1450, 1}, 1458, 844},  reward = 26640},
[293] = {trade = {15095, {4065, 10}, {1450, 2}, 1458, 837},  reward = 26816},
[294] = {trade = {14508, {4065, 5},  {1450, 1}, 1458, 837},  reward = 26816},
[295] = {trade = {15110, {4066, 10}, {1450, 2}, 1458, 1110}, reward = 26992},
[296] = {trade = {14917, {4066, 5},  {1450, 1}, 1458, 1110}, reward = 26992},
[297] = {trade = {15125, {4067, 10}, {1450, 2}, 1458, 836},  reward = 27168},
[298] = {trade = {15588, {4067, 5},  {1450, 1}, 1458, 836},  reward = 27168},
[299] = {trade = {15140, {4068, 10}, {1450, 2}, 1458, 1311}, reward = 27344},
[300] = {trade = {15673, {4068, 5},  {1450, 1}, 1458, 1311}, reward = 27344},
[301] = {trade = {15081, {4064, 10}, {1456, 2}, 1516, 844},  reward = 26642},   -- BRD
[302] = {trade = {15254, {4064, 5},  {1456, 1}, 1516, 844},  reward = 26642},
[303] = {trade = {15096, {4065, 10}, {1456, 2}, 1516, 837},  reward = 26818},
[304] = {trade = {14509, {4065, 5},  {1456, 1}, 1516, 837},  reward = 26818},
[305] = {trade = {15111, {4066, 10}, {1456, 2}, 1516, 1110}, reward = 26994},
[306] = {trade = {14918, {4066, 5},  {1456, 1}, 1516, 1110}, reward = 26994},
[307] = {trade = {15126, {4067, 10}, {1456, 2}, 1516, 836},  reward = 27170},
[308] = {trade = {15589, {4067, 5},  {1456, 1}, 1516, 836},  reward = 27170},
[309] = {trade = {15141, {4068, 10}, {1456, 2}, 1516, 1311}, reward = 27346},
[310] = {trade = {15674, {4068, 5},  {1456, 1}, 1516, 1311}, reward = 27346},
[311] = {trade = {15082, {4064, 10}, {1450, 2}, 1516, 844},  reward = 26644},   -- RNG
[312] = {trade = {15255, {4064, 5},  {1450, 1}, 1516, 844},  reward = 26644},
[313] = {trade = {15097, {4065, 10}, {1450, 2}, 1516, 837},  reward = 26820},
[314] = {trade = {14510, {4065, 5},  {1450, 1}, 1516, 837},  reward = 26820},
[315] = {trade = {15112, {4066, 10}, {1450, 2}, 1516, 1110}, reward = 26996},
[316] = {trade = {14919, {4066, 5},  {1450, 1}, 1516, 1110}, reward = 26996},
[317] = {trade = {15127, {4067, 10}, {1450, 2}, 1516, 836},  reward = 27172},
[318] = {trade = {15590, {4067, 5},  {1450, 1}, 1516, 836},  reward = 27172},
[319] = {trade = {15142, {4068, 10}, {1450, 2}, 1516, 1311}, reward = 27348},
[320] = {trade = {15675, {4068, 5},  {1450, 1}, 1516, 1311}, reward = 27348},
[321] = {trade = {15083, {4064, 10}, {1456, 2}, 1466, 844},  reward = 26646},   -- SAM
[322] = {trade = {15256, {4064, 5},  {1456, 1}, 1466, 844},  reward = 26646},
[323] = {trade = {15098, {4065, 10}, {1456, 2}, 1466, 837},  reward = 26822},
[324] = {trade = {14511, {4065, 5},  {1456, 1}, 1466, 837},  reward = 26822},
[325] = {trade = {15113, {4066, 10}, {1456, 2}, 1466, 1110}, reward = 26998},
[326] = {trade = {14920, {4066, 5},  {1456, 1}, 1466, 1110}, reward = 26998},
[327] = {trade = {15128, {4067, 10}, {1456, 2}, 1466, 836},  reward = 27174},
[328] = {trade = {15591, {4067, 5},  {1456, 1}, 1466, 836},  reward = 27174},
[329] = {trade = {15143, {4068, 10}, {1456, 2}, 1466, 1311}, reward = 27350},
[330] = {trade = {15676, {4068, 5},  {1456, 1}, 1466, 1311}, reward = 27350},
[331] = {trade = {15084, {4064, 10}, {1456, 2}, 1466, 844},  reward = 26648},   -- NIN
[332] = {trade = {15257, {4064, 5},  {1456, 1}, 1466, 844},  reward = 26646},
[333] = {trade = {15099, {4065, 10}, {1456, 2}, 1466, 837},  reward = 26824},
[334] = {trade = {14512, {4065, 5},  {1456, 1}, 1466, 837},  reward = 26824},
[335] = {trade = {15114, {4066, 10}, {1456, 2}, 1466, 1110}, reward = 27000},
[336] = {trade = {14921, {4066, 5},  {1456, 1}, 1466, 1110}, reward = 27000},
[337] = {trade = {15129, {4067, 10}, {1456, 2}, 1466, 836},  reward = 27176},
[338] = {trade = {15592, {4067, 5},  {1456, 1}, 1466, 836},  reward = 27176},
[339] = {trade = {15144, {4068, 10}, {1456, 2}, 1466, 1311}, reward = 27352},
[340] = {trade = {15677, {4068, 5},  {1456, 1}, 1466, 1311}, reward = 27352},
[341] = {trade = {15085, {4064, 10}, {1453, 2}, 1516, 844},  reward = 26650},   -- DRG
[342] = {trade = {15258, {4064, 5},  {1453, 1}, 1516, 844},  reward = 26650},
[343] = {trade = {15100, {4065, 10}, {1453, 2}, 1516, 837},  reward = 26826},
[344] = {trade = {14513, {4065, 5},  {1453, 1}, 1516, 837},  reward = 26826},
[345] = {trade = {15115, {4066, 10}, {1453, 2}, 1516, 1110}, reward = 27002},
[346] = {trade = {14922, {4066, 5},  {1453, 1}, 1516, 1110}, reward = 27002},
[347] = {trade = {15130, {4067, 10}, {1453, 2}, 1516, 836},  reward = 27178},
[348] = {trade = {15593, {4067, 5},  {1453, 1}, 1516, 836},  reward = 27178},
[349] = {trade = {15145, {4068, 10}, {1453, 2}, 1516, 1311}, reward = 27354},
[350] = {trade = {15678, {4068, 5},  {1453, 1}, 1516, 1311}, reward = 27354},
[351] = {trade = {15086, {4064, 10}, {1450, 2}, 1464, 844},  reward = 26652},   -- SMN
[352] = {trade = {15259, {4064, 5},  {1450, 1}, 1464, 844},  reward = 26652},
[353] = {trade = {15101, {4065, 10}, {1450, 2}, 1464, 837},  reward = 26828},
[354] = {trade = {14514, {4065, 5},  {1450, 1}, 1464, 837},  reward = 26828},
[355] = {trade = {15116, {4066, 10}, {1450, 2}, 1464, 1110}, reward = 27004},
[356] = {trade = {14923, {4066, 5},  {1450, 1}, 1464, 1110}, reward = 27004},
[357] = {trade = {15131, {4067, 10}, {1450, 2}, 1464, 836},  reward = 27180},
[358] = {trade = {15594, {4067, 5},  {1450, 1}, 1464, 836},  reward = 27180},
[359] = {trade = {15146, {4068, 10}, {1450, 2}, 1464, 1311}, reward = 27356},
[360] = {trade = {15679, {4068, 5},  {1450, 1}, 1464, 1311}, reward = 27356},
[361] = {trade = {11465, {4064, 10}, {1453, 2}, 1516, 844},  reward = 26654},   -- BLU
[362] = {trade = {11466, {4064, 5},  {1453, 1}, 1516, 844},  reward = 26654},
[363] = {trade = {11292, {4065, 10}, {1453, 2}, 1516, 837},  reward = 26830},
[364] = {trade = {11293, {4065, 5},  {1453, 1}, 1516, 837},  reward = 26830},
[365] = {trade = {15025, {4066, 10}, {1453, 2}, 1516, 1110}, reward = 27006},
[366] = {trade = {15026, {4066, 5},  {1453, 1}, 1516, 1110}, reward = 27006},
[367] = {trade = {16346, {4067, 10}, {1453, 2}, 1516, 836},  reward = 27182},
[368] = {trade = {16347, {4067, 5},  {1453, 1}, 1516, 836},  reward = 27182},
[369] = {trade = {11382, {4068, 10}, {1453, 2}, 1516, 1311}, reward = 27358},
[370] = {trade = {11383, {4068, 5},  {1453, 1}, 1516, 1311}, reward = 27358},
[371] = {trade = {11468, {4064, 10}, {1456, 2}, 1470, 844},  reward = 26656},   -- COR
[372] = {trade = {11469, {4064, 5},  {1456, 1}, 1470, 844},  reward = 26656},
[373] = {trade = {11295, {4065, 10}, {1456, 2}, 1470, 837},  reward = 26832},
[374] = {trade = {11296, {4065, 5},  {1456, 1}, 1470, 837},  reward = 26832},
[375] = {trade = {15028, {4066, 10}, {1456, 2}, 1470, 1110}, reward = 27008},
[376] = {trade = {15029, {4066, 5},  {1456, 1}, 1470, 1110}, reward = 27008},
[377] = {trade = {16349, {4067, 10}, {1456, 2}, 1470, 836},  reward = 27184},
[378] = {trade = {16350, {4067, 5},  {1456, 1}, 1470, 836},  reward = 27184},
[379] = {trade = {11385, {4068, 10}, {1456, 2}, 1470, 1311}, reward = 27360},
[380] = {trade = {11386, {4068, 5},  {1456, 1}, 1470, 1311}, reward = 27360},
[381] = {trade = {11471, {4064, 10}, {1450, 2}, 1464, 844},  reward = 26658},   -- PUP
[382] = {trade = {11472, {4064, 5},  {1450, 1}, 1464, 844},  reward = 26658},
[383] = {trade = {11298, {4065, 10}, {1450, 2}, 1464, 837},  reward = 26834},
[384] = {trade = {11299, {4065, 5},  {1450, 1}, 1464, 837},  reward = 26834},
[385] = {trade = {15031, {4066, 10}, {1450, 2}, 1464, 1110}, reward = 27010},
[386] = {trade = {15032, {4066, 5},  {1450, 1}, 1464, 1110}, reward = 27010},
[387] = {trade = {16352, {4067, 10}, {1450, 2}, 1464, 836},  reward = 27186},
[388] = {trade = {16353, {4067, 5},  {1450, 1}, 1464, 836},  reward = 27186},
[389] = {trade = {11388, {4068, 10}, {1450, 2}, 1464, 1311}, reward = 27362},
[390] = {trade = {11389, {4068, 5},  {1450, 1}, 1464, 1311}, reward = 27362},
[391] = {trade = {11478, {4064, 10}, {1453, 2}, 1458, 844},  reward = 26660},   -- DNC
[392] = {trade = {11479, {4064, 5},  {1453, 1}, 1458, 844},  reward = 26660},
[393] = {trade = {11305, {4065, 10}, {1453, 2}, 1458, 837},  reward = 26836},
[394] = {trade = {11306, {4065, 5},  {1453, 1}, 1458, 837},  reward = 26836},
[395] = {trade = {15038, {4066, 10}, {1453, 2}, 1458, 1110}, reward = 27012},
[396] = {trade = {15039, {4066, 5},  {1453, 1}, 1458, 1110}, reward = 27012},
[397] = {trade = {16360, {4067, 10}, {1453, 2}, 1458, 836},  reward = 27188},
[398] = {trade = {16361, {4067, 5},  {1453, 1}, 1458, 836},  reward = 27188},
[399] = {trade = {11396, {4068, 10}, {1453, 2}, 1458, 1311}, reward = 27364},
[400] = {trade = {11397, {4068, 5},  {1453, 1}, 1458, 1311}, reward = 27364},
[401] = {trade = {11480, {4064, 10}, {1456, 2}, 1464, 844},  reward = 26662},   -- SCH
[402] = {trade = {11481, {4064, 5},  {1456, 1}, 1464, 844},  reward = 26662},
[403] = {trade = {11307, {4065, 10}, {1456, 2}, 1464, 837},  reward = 26838},
[404] = {trade = {11308, {4065, 5},  {1456, 1}, 1464, 837},  reward = 26838},
[405] = {trade = {15040, {4066, 10}, {1456, 2}, 1464, 1110}, reward = 27014},
[406] = {trade = {15041, {4066, 5},  {1456, 1}, 1464, 1110}, reward = 27014},
[407] = {trade = {16362, {4067, 10}, {1456, 2}, 1464, 836},  reward = 27190},
[408] = {trade = {16363, {4067, 5},  {1456, 1}, 1464, 836},  reward = 27190},
[409] = {trade = {11398, {4068, 10}, {1456, 2}, 1464, 1311}, reward = 27366},
[410] = {trade = {11399, {4068, 5},  {1456, 1}, 1464, 1311}, reward = 27366},
}
-----------------------------------
-- Empyerian armor upgrade data
-- [combinationId] = {trade = {Base AF, Item, Job Ingredient, Slot Ingredient} reward = empyReforged 109},
-----------------------------------
local empyArmorReforged =
{

}


entity.onTrade = function(player, npc, trade)
        local tradedCombo = 0
		
		-- check for af upgrade trades
		if tradedCombo == 0 then
            for k, v in pairs(afArmorReforged) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                break
            end
        end
        -- check for relic upgrade trades
        if tradedCombo == 0 then
            for k, v in pairs(relicArmorReforged) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    break
                end
            end
		end
		-- check for Empyerian Upgrade Trades
		if tradedCombo == 0 then
            for k, v in pairs(empyArmorReforged) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    break
				end
			end
		end

        -- found a match
        if tradedCombo > 0 then

            player:confirmTrade()
            player:setCharVar("AFRupgrade", tradedCombo)
			player:setCharVar("AFRupgradeDay", getVanaMidnight())
            player:startEvent(388)
        end
    end
end

entity.onTrigger = function(player, npc, status)
    player:startEvent(385)
end

entity.onEventUpdate = function(player, csid, option)

end

entity.onEventFinish = function(player, csid, option)
	
		if csid == 388 then
        local afrUpgrade = player:getCharVar("AFRupgrade")
        local info = afArmorReforged[afrUpgrade]
        if info == nil then
            info = relicArmorReforged[afrUpgrade]
        end
		if info == nil then
            info = empyArmorReforged[afrUpgrade]
        end

        -- found a valid reward
        if info then  -- and player:getCharVar("AFRupgradeDay") < os.time() then 
		player:startEvent(386)
		npcUtil.giveItem(player, info.reward)
        player:setCharVar("AFRupgrade", 0)
		 -- player:setCharVar("AFRupgradeDay", 0)
		end
    end
end


return entity
