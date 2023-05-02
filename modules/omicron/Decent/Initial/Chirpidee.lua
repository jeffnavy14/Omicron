-----------------------------------
-- NPC to augment EschaGear
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("Chirpadee")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)
	
local tradedCombo = 0

local tradeTablePathA =
{
	[ 1] = { trade = { 26791, {9086, 3} }, base = 26791, aug1 =  79, aug1MAX = 25, aug2 =  39, aug2MAX =  6, aug3 =  54, aug3MAX = 3, aug4 = 78, aug4MAX = 0 }, -- Eschite Helm
	[ 2] = { trade = { 26947, {9086, 3} }, base = 26947, aug1 =  79, aug1MAX = 25, aug2 =  39, aug2MAX =  6, aug3 =  54, aug3MAX = 3, aug4 = 78, aug4MAX = 0 }, -- Eschite Breastplate
	[ 3] = { trade = { 27097, {9086, 3} }, base = 27097, aug1 =  79, aug1MAX = 25, aug2 =  39, aug2MAX =  6, aug3 =  54, aug3MAX = 3, aug4 = 78, aug4MAX = 0 }, -- Eschite Gauntlets
	[ 4] = { trade = { 27282, {9086, 3} }, base = 27282, aug1 =  79, aug1MAX = 25, aug2 =  39, aug2MAX =  6, aug3 =  54, aug3MAX = 3, aug4 = 78, aug4MAX = 0 }, -- Eschite Cuisses
	[ 5] = { trade = { 27457, {9086, 3} }, base = 27457, aug1 =  79, aug1MAX = 25, aug2 =  39, aug2MAX =  6, aug3 =  54, aug3MAX = 3, aug4 = 78, aug4MAX = 0 }, -- Eschite Greaves
	[ 6] = { trade = { 26792, {9086, 3} }, base = 26792, aug1 =  78, aug1MAX = 24, aug2 = 514, aug2MAX =  9, aug3 = 356, aug3MAX = 4, aug4 =  0, aug4MAX = 0 }, -- Despair Helm
	[ 7] = { trade = { 26948, {9086, 3} }, base = 26948, aug1 =  78, aug1MAX = 24, aug2 = 514, aug2MAX =  9, aug3 = 356, aug3MAX = 4, aug4 =  0, aug4MAX = 0 }, -- Despair Mail
	[ 8] = { trade = { 27098, {9086, 3} }, base = 27098, aug1 =  78, aug1MAX = 24, aug2 = 514, aug2MAX =  9, aug3 = 356, aug3MAX = 4, aug4 =  0, aug4MAX = 0 }, -- Despair Finger Gauntlets
	[ 9] = { trade = { 27293, {9086, 3} }, base = 27293, aug1 =  78, aug1MAX = 24, aug2 = 514, aug2MAX =  9, aug3 = 356, aug3MAX = 4, aug4 =  0, aug4MAX = 0 }, -- Despair Cuisses
	[10] = { trade = { 27458, {9086, 3} }, base = 27458, aug1 =  78, aug1MAX = 24, aug2 = 514, aug2MAX =  9, aug3 = 356, aug3MAX = 4, aug4 =  0, aug4MAX = 0 }, -- Despair Greaves
	[11] = { trade = { 26793, {9086, 3} }, base = 26793, aug1 = 512, aug1MAX =  9, aug2 =  23, aug2MAX = 14, aug3 = 195, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Naga Somen
	[12] = { trade = { 26949, {9086, 3} }, base = 26949, aug1 = 512, aug1MAX =  9, aug2 =  23, aug2MAX = 14, aug3 = 195, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Naga Samue
	[13] = { trade = { 27099, {9086, 3} }, base = 27099, aug1 = 512, aug1MAX =  9, aug2 =  23, aug2MAX = 14, aug3 = 195, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Naga Tekko
	[14] = { trade = { 27284, {9086, 3} }, base = 27284, aug1 = 512, aug1MAX =  9, aug2 =  23, aug2MAX = 14, aug3 = 195, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Naga Hakama
	[15] = { trade = { 27459, {9086, 3} }, base = 27459, aug1 = 512, aug1MAX =  9, aug2 =  23, aug2MAX = 14, aug3 = 195, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Naga Kyahan
	[16] = { trade = { 26794, {9086, 3} }, base = 26794, aug1 = 513, aug1MAX =  9, aug2 = 512, aug2MAX =  6, aug3 = 516, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Rawhide Mask
	[17] = { trade = { 26950, {9086, 3} }, base = 26950, aug1 = 513, aug1MAX =  9, aug2 = 512, aug2MAX =  6, aug3 = 516, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Rawhide Vest
	[18] = { trade = { 27100, {9086, 3} }, base = 27100, aug1 = 513, aug1MAX =  9, aug2 = 512, aug2MAX =  6, aug3 = 516, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Rawhide Gloves
	[19] = { trade = { 27285, {9086, 3} }, base = 27285, aug1 = 513, aug1MAX =  9, aug2 = 512, aug2MAX =  6, aug3 = 516, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Rawhide Trousers
	[20] = { trade = { 27460, {9086, 3} }, base = 27460, aug1 = 513, aug1MAX =  9, aug2 = 512, aug2MAX =  6, aug3 = 516, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Rawhide Boots
	[21] = { trade = { 26795, {9086, 3} }, base = 26795, aug1 = 515, aug1MAX =  9, aug2 = 139, aug2MAX =  9, aug3 = 195, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Beret
	[22] = { trade = { 26951, {9086, 3} }, base = 26951, aug1 = 515, aug1MAX =  9, aug2 = 139, aug2MAX =  9, aug3 = 195, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Doublet
	[23] = { trade = { 27101, {9086, 3} }, base = 27101, aug1 = 515, aug1MAX =  9, aug2 = 139, aug2MAX =  9, aug3 = 195, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Cuffs
	[24] = { trade = { 27286, {9086, 3} }, base = 27286, aug1 = 515, aug1MAX =  9, aug2 = 139, aug2MAX =  9, aug3 = 195, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Pants
	[25] = { trade = { 27461, {9086, 3} }, base = 27461, aug1 = 515, aug1MAX =  9, aug2 = 139, aug2MAX =  9, aug3 = 195, aug3MAX = 6, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Gaiters
	[26] = { trade = { 26796, {9086, 3} }, base = 26796, aug1 =  83, aug1MAX = 16, aug2 = 516, aug2MAX =  6, aug3 = 141, aug3MAX = 5, aug4 = 82, aug4MAX = 0 }, -- Psycloth Tiara
	[27] = { trade = { 26952, {9086, 3} }, base = 26952, aug1 =  83, aug1MAX = 16, aug2 = 516, aug2MAX =  6, aug3 = 141, aug3MAX = 5, aug4 = 82, aug4MAX = 0 }, -- Psycloth Vest
	[28] = { trade = { 27102, {9086, 3} }, base = 27102, aug1 =  83, aug1MAX = 16, aug2 = 516, aug2MAX =  6, aug3 = 141, aug3MAX = 5, aug4 = 82, aug4MAX = 0 }, -- Psycloth Manillas
	[29] = { trade = { 27287, {9086, 3} }, base = 27287, aug1 =  83, aug1MAX = 16, aug2 = 516, aug2MAX =  6, aug3 = 141, aug3MAX = 5, aug4 = 82, aug4MAX = 0 }, -- Psycloth Lappas
	[30] = { trade = { 27462, {9086, 3} }, base = 27462, aug1 =  83, aug1MAX = 16, aug2 = 516, aug2MAX =  6, aug3 = 141, aug3MAX = 5, aug4 = 82, aug4MAX = 0 }, -- Psycloth Boots
	[31] = { trade = { 26797, {9086, 3} }, base = 26797, aug1 =  83, aug1MAX = 16, aug2 = 329, aug2MAX =  6, aug3 =  40, aug3MAX = 5, aug4 = 82, aug4MAX = 0 }, -- Vanya Hood
	[32] = { trade = { 26953, {9086, 3} }, base = 26953, aug1 =  83, aug1MAX = 16, aug2 = 329, aug2MAX =  6, aug3 =  40, aug3MAX = 5, aug4 = 82, aug4MAX = 0 }, -- Vanya Robe
	[33] = { trade = { 27103, {9086, 3} }, base = 27103, aug1 =  83, aug1MAX = 16, aug2 = 329, aug2MAX =  6, aug3 =  40, aug3MAX = 5, aug4 = 82, aug4MAX = 0 }, -- Vanya Cuffs
	[34] = { trade = { 27288, {9086, 3} }, base = 27288, aug1 =  83, aug1MAX = 16, aug2 = 329, aug2MAX =  6, aug3 =  40, aug3MAX = 5, aug4 = 82, aug4MAX = 0 }, -- Vanya Slops
	[35] = { trade = { 27463, {9086, 3} }, base = 27463, aug1 =  83, aug1MAX = 16, aug2 = 329, aug2MAX =  6, aug3 =  40, aug3MAX = 5, aug4 = 82, aug4MAX = 0 }, -- Vanya Clogs
}

local tradeTablePathB =
{
	[ 1] = { trade = { 26791, {9086, 3} }, base = 26791, aug1 =  83, aug1MAX = 24, aug2 =  23, aug2MAX =  9, aug3 =  39, aug3MAX =  6, aug4 =  9, aug4MAX = 4 }, -- Eschite Helm
	[ 2] = { trade = { 26947, {9086, 3} }, base = 26947, aug1 =  83, aug1MAX = 24, aug2 =  23, aug2MAX =  9, aug3 =  39, aug3MAX =  6, aug4 =  9, aug4MAX = 4 }, -- Eschite Breastplate
	[ 3] = { trade = { 27097, {9086, 3} }, base = 27097, aug1 =  83, aug1MAX = 24, aug2 =  23, aug2MAX =  9, aug3 =  39, aug3MAX =  6, aug4 =  9, aug4MAX = 4 }, -- Eschite Gauntlets
	[ 4] = { trade = { 27282, {9086, 3} }, base = 27282, aug1 =  83, aug1MAX = 24, aug2 =  23, aug2MAX =  9, aug3 =  39, aug3MAX =  6, aug4 =  9, aug4MAX = 4 }, -- Eschite Cuisses
	[ 5] = { trade = { 27457, {9086, 3} }, base = 27457, aug1 =  83, aug1MAX = 24, aug2 =  23, aug2MAX =  9, aug3 =  39, aug3MAX =  6, aug4 =  9, aug4MAX = 4 }, -- Eschite Greaves
	[ 6] = { trade = { 26792, {9086, 3} }, base = 26792, aug1 = 512, aug1MAX = 11, aug2 = 514, aug2MAX =  6, aug3 =  49, aug3MAX =  1, aug4 =  0, aug4MAX = 0 }, -- Despair Helm
	[ 7] = { trade = { 26948, {9086, 3} }, base = 26948, aug1 = 512, aug1MAX = 11, aug2 = 514, aug2MAX =  6, aug3 =  49, aug3MAX =  1, aug4 =  0, aug4MAX = 0 }, -- Despair Mail
	[ 8] = { trade = { 27098, {9086, 3} }, base = 27098, aug1 = 512, aug1MAX = 11, aug2 = 514, aug2MAX =  6, aug3 =  49, aug3MAX =  1, aug4 =  0, aug4MAX = 0 }, -- Despair Finger Gauntlets
	[ 9] = { trade = { 27293, {9086, 3} }, base = 27293, aug1 = 512, aug1MAX = 11, aug2 = 514, aug2MAX =  6, aug3 =  49, aug3MAX =  1, aug4 =  0, aug4MAX = 0 }, -- Despair Cuisses
	[10] = { trade = { 27458, {9086, 3} }, base = 27458, aug1 = 512, aug1MAX = 11, aug2 = 514, aug2MAX =  6, aug3 =  49, aug3MAX =  1, aug4 =  0, aug4MAX = 0 }, -- Despair Greaves
	[11] = { trade = { 26793, {9086, 3} }, base = 26793, aug1 =  78, aug1MAX = 24, aug2 = 514, aug2MAX =  9, aug3 =  31, aug3MAX = 19, aug4 =  0, aug4MAX = 0 }, -- Naga Somen
	[12] = { trade = { 26949, {9086, 3} }, base = 26949, aug1 =  78, aug1MAX = 24, aug2 = 514, aug2MAX =  9, aug3 =  31, aug3MAX = 19, aug4 =  0, aug4MAX = 0 }, -- Naga Samue
	[13] = { trade = { 27099, {9086, 3} }, base = 27099, aug1 =  78, aug1MAX = 24, aug2 = 514, aug2MAX =  9, aug3 =  31, aug3MAX = 19, aug4 =  0, aug4MAX = 0 }, -- Naga Tekko
	[14] = { trade = { 27284, {9086, 3} }, base = 27284, aug1 =  78, aug1MAX = 24, aug2 = 514, aug2MAX =  9, aug3 =  31, aug3MAX = 19, aug4 =  0, aug4MAX = 0 }, -- Naga Hakama
	[15] = { trade = { 27459, {9086, 3} }, base = 27459, aug1 =  78, aug1MAX = 24, aug2 = 514, aug2MAX =  9, aug3 =  31, aug3MAX = 19, aug4 =  0, aug4MAX = 0 }, -- Naga Kyahan
	[16] = { trade = { 26794, {9086, 3} }, base = 26794, aug1 =  79, aug1MAX = 16, aug2 =  23, aug2MAX = 14, aug3 =  31, aug3MAX = 19, aug4 = 78, aug4MAX = 0 }, -- Rawhide Mask
	[17] = { trade = { 26950, {9086, 3} }, base = 26950, aug1 =  79, aug1MAX = 16, aug2 =  23, aug2MAX = 14, aug3 =  31, aug3MAX = 19, aug4 = 78, aug4MAX = 0 }, -- Rawhide Vest
	[18] = { trade = { 27100, {9086, 3} }, base = 27100, aug1 =  79, aug1MAX = 16, aug2 =  23, aug2MAX = 14, aug3 =  31, aug3MAX = 19, aug4 = 78, aug4MAX = 0 }, -- Rawhide Gloves
	[19] = { trade = { 27285, {9086, 3} }, base = 27285, aug1 =  79, aug1MAX = 16, aug2 =  23, aug2MAX = 14, aug3 =  31, aug3MAX = 19, aug4 = 78, aug4MAX = 0 }, -- Rawhide Trousers
	[20] = { trade = { 27460, {9086, 3} }, base = 27460, aug1 =  79, aug1MAX = 16, aug2 =  23, aug2MAX = 14, aug3 =  31, aug3MAX = 19, aug4 = 78, aug4MAX = 0 }, -- Rawhide Boots
	[21] = { trade = { 26795, {9086, 3} }, base = 26795, aug1 = 513, aug1MAX =  6, aug2 = 515, aug2MAX =  9, aug3 = 212, aug3MAX = 14, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Beret
	[22] = { trade = { 26951, {9086, 3} }, base = 26951, aug1 = 513, aug1MAX =  6, aug2 = 515, aug2MAX =  9, aug3 = 212, aug3MAX = 14, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Doublet
	[23] = { trade = { 27101, {9086, 3} }, base = 27101, aug1 = 513, aug1MAX =  6, aug2 = 515, aug2MAX =  9, aug3 = 212, aug3MAX = 14, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Cuffs
	[24] = { trade = { 27286, {9086, 3} }, base = 27286, aug1 = 513, aug1MAX =  6, aug2 = 515, aug2MAX =  9, aug3 = 212, aug3MAX = 14, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Pants
	[25] = { trade = { 27461, {9086, 3} }, base = 27461, aug1 = 513, aug1MAX =  6, aug2 = 515, aug2MAX =  9, aug3 = 212, aug3MAX = 14, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Gaiters
	[26] = { trade = { 26796, {9086, 3} }, base = 26796, aug1 =  35, aug1MAX =  9, aug2 =  53, aug2MAX = 14, aug3 = 517, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Tiara
	[27] = { trade = { 26952, {9086, 3} }, base = 26952, aug1 =  35, aug1MAX =  9, aug2 =  53, aug2MAX = 14, aug3 = 517, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Vest
	[28] = { trade = { 27102, {9086, 3} }, base = 27102, aug1 =  35, aug1MAX =  9, aug2 =  53, aug2MAX = 14, aug3 = 517, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Manillas
	[29] = { trade = { 27287, {9086, 3} }, base = 27287, aug1 =  35, aug1MAX =  9, aug2 =  53, aug2MAX = 14, aug3 = 517, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Lappas
	[30] = { trade = { 27462, {9086, 3} }, base = 27462, aug1 =  35, aug1MAX =  9, aug2 =  53, aug2MAX = 14, aug3 = 517, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Boots
	[31] = { trade = { 26797, {9086, 3} }, base = 26797, aug1 = 289, aug1MAX = 19, aug2 = 323, aug2MAX =  6, aug3 =  55, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Vanya Hood
	[32] = { trade = { 26953, {9086, 3} }, base = 26953, aug1 = 289, aug1MAX = 19, aug2 = 323, aug2MAX =  6, aug3 =  55, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Vanya Robe
	[33] = { trade = { 27103, {9086, 3} }, base = 27103, aug1 = 289, aug1MAX = 19, aug2 = 323, aug2MAX =  6, aug3 =  55, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Vanya Cuffs
	[34] = { trade = { 27288, {9086, 3} }, base = 27288, aug1 = 289, aug1MAX = 19, aug2 = 323, aug2MAX =  6, aug3 =  55, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Vanya Slops
	[35] = { trade = { 27463, {9086, 3} }, base = 27463, aug1 = 289, aug1MAX = 19, aug2 = 323, aug2MAX =  6, aug3 =  55, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Vanya Clogs
}

local tradeTablePathC =
{
	[ 1] = { trade = { 26791, {9086, 3} }, base = 26791, aug1 =   37, aug1MAX = 14, aug2 =   53, aug2MAX = 14, aug3 =   39, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Eschite Helm
	[ 2] = { trade = { 26947, {9086, 3} }, base = 26947, aug1 =   37, aug1MAX = 14, aug2 =   53, aug2MAX = 14, aug3 =   39, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Eschite Breastplate
	[ 3] = { trade = { 27097, {9086, 3} }, base = 27097, aug1 =   37, aug1MAX = 14, aug2 =   53, aug2MAX = 14, aug3 =   39, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Eschite Gauntlets
	[ 4] = { trade = { 27282, {9086, 3} }, base = 27282, aug1 =   37, aug1MAX = 14, aug2 =   53, aug2MAX = 14, aug3 =   39, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Eschite Cuisses
	[ 5] = { trade = { 27457, {9086, 3} }, base = 27457, aug1 =   37, aug1MAX = 14, aug2 =   53, aug2MAX = 14, aug3 =   39, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Eschite Greaves
	[ 6] = { trade = { 26792, {9086, 3} }, base = 26792, aug1 =   23, aug1MAX =  9, aug2 = 1794, aug2MAX =  6, aug3 =  112, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Despair Helm
	[ 7] = { trade = { 26948, {9086, 3} }, base = 26948, aug1 =   23, aug1MAX =  9, aug2 = 1794, aug2MAX =  6, aug3 =  112, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Despair Mail
	[ 8] = { trade = { 27098, {9086, 3} }, base = 27098, aug1 =   23, aug1MAX =  9, aug2 = 1794, aug2MAX =  6, aug3 =  112, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Despair Finger Gauntlets
	[ 9] = { trade = { 27293, {9086, 3} }, base = 27293, aug1 =   23, aug1MAX =  9, aug2 = 1794, aug2MAX =  6, aug3 =  112, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Despair Cuisses
	[10] = { trade = { 27458, {9086, 3} }, base = 27458, aug1 =   23, aug1MAX =  9, aug2 = 1794, aug2MAX =  6, aug3 =  112, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Despair Greaves
	[11] = { trade = { 26793, {9086, 3} }, base = 26793, aug1 = 1474, aug1MAX = 30, aug2 = 1475, aug2MAX =  3, aug3 = 1476, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Naga Somen
	[12] = { trade = { 26949, {9086, 3} }, base = 26949, aug1 = 1474, aug1MAX = 30, aug2 = 1475, aug2MAX =  3, aug3 = 1476, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Naga Samue
	[13] = { trade = { 27099, {9086, 3} }, base = 27099, aug1 = 1474, aug1MAX = 30, aug2 = 1475, aug2MAX =  3, aug3 = 1476, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Naga Tekko
	[14] = { trade = { 27284, {9086, 3} }, base = 27284, aug1 = 1474, aug1MAX = 30, aug2 = 1475, aug2MAX =  3, aug3 = 1476, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Naga Hakama
	[15] = { trade = { 27459, {9086, 3} }, base = 27459, aug1 = 1474, aug1MAX = 30, aug2 = 1475, aug2MAX =  3, aug3 = 1446, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Naga Kyahan
	[16] = { trade = { 26794, {9086, 3} }, base = 26794, aug1 =   23, aug1MAX = 14, aug2 = 1478, aug2MAX = 10, aug3 =  123, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Rawhide Mask
	[17] = { trade = { 26950, {9086, 3} }, base = 26950, aug1 =   23, aug1MAX = 14, aug2 = 1478, aug2MAX = 10, aug3 =  123, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Rawhide Vest
	[18] = { trade = { 27100, {9086, 3} }, base = 27100, aug1 =   23, aug1MAX = 14, aug2 = 1478, aug2MAX = 10, aug3 =  123, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Rawhide Gloves
	[19] = { trade = { 27285, {9086, 3} }, base = 27285, aug1 =   23, aug1MAX = 14, aug2 = 1478, aug2MAX = 10, aug3 =  123, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Rawhide Trousers
	[20] = { trade = { 27460, {9086, 3} }, base = 27460, aug1 =   23, aug1MAX = 14, aug2 = 1478, aug2MAX = 10, aug3 =  123, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Rawhide Boots
	[21] = { trade = { 26795, {9086, 3} }, base = 26795, aug1 =   79, aug1MAX = 16, aug2 =   23, aug2MAX = 19, aug3 =   25, aug3MAX = 14, aug4 = 78, aug4MAX = 0 }, -- Pursuer's Beret
	[22] = { trade = { 26951, {9086, 3} }, base = 26951, aug1 =   79, aug1MAX = 16, aug2 =   23, aug2MAX = 19, aug3 =   25, aug3MAX = 14, aug4 = 78, aug4MAX = 0 }, -- Pursuer's Doublet
	[23] = { trade = { 27101, {9086, 3} }, base = 27101, aug1 =   79, aug1MAX = 16, aug2 =   23, aug2MAX = 19, aug3 =   25, aug3MAX = 14, aug4 = 78, aug4MAX = 0 }, -- Pursuer's Cuffs
	[24] = { trade = { 27286, {9086, 3} }, base = 27286, aug1 =   79, aug1MAX = 16, aug2 =   23, aug2MAX = 19, aug3 =   25, aug3MAX = 14, aug4 = 78, aug4MAX = 0 }, -- Pursuer's Pants
	[25] = { trade = { 27461, {9086, 3} }, base = 27461, aug1 =   79, aug1MAX = 16, aug2 =   23, aug2MAX = 19, aug3 =   25, aug3MAX = 14, aug4 = 78, aug4MAX = 0 }, -- Pursuer's Gaiters
	[26] = { trade = { 26796, {9086, 3} }, base = 26796, aug1 = 1479, aug1MAX = 20, aug2 = 101, aug2MAX =  14, aug3 =  104, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Tiara
	[27] = { trade = { 26952, {9086, 3} }, base = 26952, aug1 = 1479, aug1MAX = 20, aug2 = 101, aug2MAX =  14, aug3 =  104, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Vest
	[28] = { trade = { 27102, {9086, 3} }, base = 27102, aug1 = 1479, aug1MAX = 20, aug2 = 101, aug2MAX =  14, aug3 =  104, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Manillas
	[29] = { trade = { 27287, {9086, 3} }, base = 27287, aug1 = 1479, aug1MAX = 20, aug2 = 101, aug2MAX =  14, aug3 =  104, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Lappas
	[30] = { trade = { 27462, {9086, 3} }, base = 27462, aug1 = 1479, aug1MAX = 20, aug2 = 101, aug2MAX =  14, aug3 =  104, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Boots
	[31] = { trade = { 26797, {9086, 3} }, base = 26797, aug1 =  517, aug1MAX =  9, aug2 =  53, aug2MAX =  14, aug3 =  141, aug3MAX =  5, aug4 =  0, aug4MAX = 0 }, -- Vanya Hood
	[32] = { trade = { 26953, {9086, 3} }, base = 26953, aug1 =  517, aug1MAX =  9, aug2 =  53, aug2MAX =  14, aug3 =  141, aug3MAX =  5, aug4 =  0, aug4MAX = 0 }, -- Vanya Robe
	[33] = { trade = { 27103, {9086, 3} }, base = 27103, aug1 =  517, aug1MAX =  9, aug2 =  53, aug2MAX =  14, aug3 =  141, aug3MAX =  5, aug4 =  0, aug4MAX = 0 }, -- Vanya Cuffs
	[34] = { trade = { 27288, {9086, 3} }, base = 27288, aug1 =  517, aug1MAX =  9, aug2 =  53, aug2MAX =  14, aug3 =  141, aug3MAX =  5, aug4 =  0, aug4MAX = 0 }, -- Vanya Slops
	[35] = { trade = { 27463, {9086, 3} }, base = 27463, aug1 =  517, aug1MAX =  9, aug2 =  53, aug2MAX =  14, aug3 =  141, aug3MAX =  5, aug4 =  0, aug4MAX = 0 }, -- Vanya Clogs
}

local tradeTablePathD =
{
	[ 1] = { trade = { 26791, {9086, 3} }, base = 26791, aug1 =  512, aug1MAX =  8, aug2 =  514, aug2MAX =  6, aug3 =  329, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Eschite Helm
	[ 2] = { trade = { 26947, {9086, 3} }, base = 26947, aug1 =   25, aug1MAX = 14, aug2 =  514, aug2MAX =  6, aug3 =   71, aug3MAX =  3, aug4 =  0, aug4MAX = 0 }, -- Eschite Breastplate
	[ 3] = { trade = { 27097, {9086, 3} }, base = 27097, aug1 =   23, aug1MAX = 19, aug2 =  143, aug2MAX =  3, aug3 =   39, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Eschite Gauntlets
	[ 4] = { trade = { 27282, {9086, 3} }, base = 27282, aug1 =   37, aug1MAX = 24, aug2 =  141, aug2MAX =  5, aug3 =  140, aug3MAX =  4, aug4 =  0, aug4MAX = 0 }, -- Eschite Cuisses
	[ 5] = { trade = { 27457, {9086, 3} }, base = 27457, aug1 =  512, aug1MAX = 14, aug2 =   78, aug2MAX = 24, aug3 =  142, aug3MAX =  4, aug4 =  0, aug4MAX = 0 }, -- Eschite Greaves
	[ 6] = { trade = { 26792, {9086, 3} }, base = 26792, aug1 =  512, aug1MAX = 15, aug2 =   39, aug2MAX =  6, aug3 =  142, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Despair Helm
	[ 7] = { trade = { 26948, {9086, 3} }, base = 26948, aug1 =   25, aug1MAX = 24, aug2 =   37, aug2MAX = 19, aug3 =  143, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Despair Mail
	[ 8] = { trade = { 27098, {9086, 3} }, base = 27098, aug1 =   27, aug1MAX = 24, aug2 =   29, aug2MAX = 19, aug3 =  212, aug3MAX =  9, aug4 =  0, aug4MAX = 0 }, -- Despair Finger Gauntlets
	[ 9] = { trade = { 27293, {9086, 3} }, base = 27293, aug1 =  515, aug1MAX =  9, aug2 =   31, aug2MAX = 19, aug3 =  195, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Despair Cuisses
	[10] = { trade = { 27458, {9086, 3} }, base = 27458, aug1 =  513, aug1MAX =  9, aug2 =  512, aug2MAX =  6, aug3 =   54, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Despair Greaves
	[11] = { trade = { 26793, {9086, 3} }, base = 26793, aug1 =   23, aug1MAX = 14, aug2 =   27, aug2MAX = 24, aug3 =   40, aug3MAX =  5, aug4 =  0, aug4MAX = 0 }, -- Naga Somen
	[12] = { trade = { 26949, {9086, 3} }, base = 26949, aug1 =   79, aug1MAX = 25, aug2 =  513, aug2MAX =  9, aug3 =   25, aug3MAX = 19, aug4 = 78, aug4MAX = 0 }, -- Naga Samue
	[13] = { trade = { 27099, {9086, 3} }, base = 27099, aug1 = 1474, aug1MAX = 30, aug2 =  101, aug2MAX = 19, aug3 =  100, aug3MAX = 19, aug4 =  0, aug4MAX = 0 }, -- Naga Tekko
	[14] = { trade = { 27284, {9086, 3} }, base = 27284, aug1 =   25, aug1MAX = 19, aug2 =   29, aug2MAX = 24, aug3 =   41, aug3MAX =  3, aug4 =  0, aug4MAX = 0 }, -- Naga Hakama
	[15] = { trade = { 27459, {9086, 3} }, base = 27459, aug1 = 1477, aug1MAX = 50, aug2 = 1478, aug2MAX = 20, aug3 = 1479, aug3MAX = 20, aug4 =  0, aug4MAX = 0 }, -- Naga Kyahan
	[16] = { trade = { 26794, {9086, 3} }, base = 26794, aug1 =   25, aug1MAX = 14, aug2 =  100, aug2MAX = 19, aug3 =  101, aug3MAX = 14, aug4 =  0, aug4MAX = 0 }, -- Rawhide Mask
	[17] = { trade = { 26950, {9086, 3} }, base = 26950, aug1 =   79, aug1MAX = 15, aug2 =  195, aug2MAX =  6, aug3 =  144, aug3MAX =  1, aug4 = 78, aug4MAX = 0 }, -- Rawhide Vest
	[18] = { trade = { 27100, {9086, 3} }, base = 27100, aug1 =   35, aug1MAX = 14, aug2 =  516, aug2MAX =  6, aug3 =  517, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Rawhide Gloves
	[19] = { trade = { 27285, {9086, 3} }, base = 27285, aug1 =   83, aug1MAX = 14, aug2 =  140, aug2MAX =  4, aug3 =  138, aug3MAX =  1, aug4 = 82, aug4MAX = 0 }, -- Rawhide Trousers
	[20] = { trade = { 27460, {9086, 3} }, base = 27460, aug1 =  512, aug1MAX =  9, aug2 =   25, aug2MAX = 14, aug3 =  142, aug3MAX =  4, aug4 =  0, aug4MAX = 0 }, -- Rawhide Boots
	[21] = { trade = { 26795, {9086, 3} }, base = 26795, aug1 =   29, aug1MAX = 14, aug2 =   40, aug2MAX =  5, aug3 =  195, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Beret
	[22] = { trade = { 26951, {9086, 3} }, base = 26951, aug1 =   79, aug1MAX = 15, aug2 =   41, aug2MAX =  3, aug3 =  211, aug3MAX =  5, aug4 = 78, aug4MAX = 0 }, -- Pursuer's Doublet
	[23] = { trade = { 27101, {9086, 3} }, base = 27101, aug1 =   29, aug1MAX = 14, aug2 =  512, aug2MAX =  6, aug3 =   54, aug3MAX =  3, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Cuffs
	[24] = { trade = { 27286, {9086, 3} }, base = 27286, aug1 =  513, aug1MAX =  6, aug2 =  515, aug2MAX =  9, aug3 =  512, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Pants
	[25] = { trade = { 27461, {9086, 3} }, base = 27461, aug1 =   27, aug1MAX =  9, aug2 =  139, aug2MAX =  9, aug3 =  212, aug3MAX = 14, aug4 =  0, aug4MAX = 0 }, -- Pursuer's Gaiters
	[26] = { trade = { 26796, {9086, 3} }, base = 26796, aug1 =   35, aug1MAX = 19, aug2 =  140, aug2MAX =  9, aug3 =  516, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Tiara
	[27] = { trade = { 26952, {9086, 3} }, base = 26952, aug1 =  292, aug1MAX = 19, aug2 =  516, aug2MAX =  6, aug3 =   40, aug3MAX =  5, aug4 =  0, aug4MAX = 0 }, -- Psycloth Vest
	[28] = { trade = { 27102, {9086, 3} }, base = 27102, aug1 =   83, aug1MAX = 25, aug2 =  233, aug2MAX =  4, aug3 =  101, aug3MAX = 24, aug4 = 82, aug4MAX = 0 }, -- Psycloth Manillas
	[29] = { trade = { 27287, {9086, 3} }, base = 27287, aug1 =   83, aug1MAX = 25, aug2 =   35, aug2MAX = 14, aug3 =  140, aug3MAX =  6, aug4 = 82, aug4MAX = 0 }, -- Psycloth Lappas
	[30] = { trade = { 27462, {9086, 3} }, base = 27462, aug1 =  100, aug1MAX = 19, aug2 =  101, aug2MAX = 19, aug3 =  104, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Psycloth Boots
	[31] = { trade = { 26797, {9086, 3} }, base = 26797, aug1 =   83, aug1MAX = 16, aug2 =  140, aug2MAX =  9, aug3 =   49, aug3MAX =  1, aug4 = 82, aug4MAX = 0 }, -- Vanya Hood
	[32] = { trade = { 26953, {9086, 3} }, base = 26953, aug1 =   78, aug1MAX = 24, aug2 =   82, aug2MAX = 24, aug3 =  138, aug3MAX =  1, aug4 =  0, aug4MAX = 0 }, -- Vanya Robe
	[33] = { trade = { 27103, {9086, 3} }, base = 27103, aug1 =  518, aug1MAX =  9, aug2 =  297, aug2MAX =  9, aug3 =   35, aug3MAX = 19, aug4 =  0, aug4MAX = 0 }, -- Vanya Cuffs
	[34] = { trade = { 27288, {9086, 3} }, base = 27288, aug1 =   78, aug1MAX = 24, aug2 =   37, aug2MAX = 14, aug3 =   54, aug3MAX =  2, aug4 =  0, aug4MAX = 0 }, -- Vanya Slops
	[35] = { trade = { 27463, {9086, 3} }, base = 27463, aug1 =  329, aug1MAX =  4, aug2 =  323, aug2MAX = 14, aug3 =  141, aug3MAX =  6, aug4 =  0, aug4MAX = 0 }, -- Vanya Clogs
}

local LixerValue =
{
	[9084] = 10,
	[9085] = 50,
	[9086] = 2000,
}
local rankTable =
{
	{ 0, 1 },
	{ 50, 2 },
	{ 130, 3 },
	{ 250, 4 },
	{ 420, 5 },
	{ 640, 6 },
	{ 920, 7 },
	{ 1260, 8 },
	{ 1670, 9 },
	{ 2150, 10 },
	{ 2710, 11 },
	{ 3360, 12 },
	{ 4110, 13 },
	{ 4970, 14 },
	{ 5950, 15 },
}

-- End of Tables and functions
local Chirpadee = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Chirpadee",
        look = 3611,
        x = 600.000,
        y = -1.500,
        z = 19.000,
		rotation = 95.25,
		
		widescan = 1,

	onSpawn = function(npc)
		
	end,	
	
	onTrigger = function(player, npc, status)
		player:PrintToPlayer("チューチュー (You should bring me some escha gear and 3 if the Eschalixer +2.)", 0, npc:getPacketName())
		player:PrintToPlayer("チュー (I'll be able to augment the equipment for you at that point.)", 13)
    end,
	
	onTrade = function(player, npc, trade)
		
		local tradeedItem = 0
	
		if player:getCharVar("[GFZitah]item") == 0 then
			for k, v in pairs(tradeTablePathA) do
				if npcUtil.tradeHasExactly(trade, v.trade) then -- for no RP
					tradeedItem = k
					break
				end
			end
		end
		
		if tradeedItem > 0 then
			local rewardItemId = tradeTablePathA[tradeedItem].base
			player:setCharVar("[GFZitah]item", rewardItemId)
			npc:setLocalVar("rewardItemId", tradeTablePathA[tradeedItem].base)
			npc:setLocalVar("aug1A", tradeTablePathA[tradeedItem].aug1)
			npc:setLocalVar("aug2A", tradeTablePathA[tradeedItem].aug2)
			npc:setLocalVar("aug3A", tradeTablePathA[tradeedItem].aug3)
			npc:setLocalVar("aug4A", tradeTablePathA[tradeedItem].aug4)
			npc:setLocalVar("aug1MAXA", tradeTablePathA[tradeedItem].aug1MAX)
			npc:setLocalVar("aug2MAXA", tradeTablePathA[tradeedItem].aug2MAX)
			npc:setLocalVar("aug3MAXA", tradeTablePathA[tradeedItem].aug3MAX)
			npc:setLocalVar("aug4MAXA", tradeTablePathA[tradeedItem].aug4MAX)
			
			npc:setLocalVar("aug1B", tradeTablePathB[tradeedItem].aug1)
			npc:setLocalVar("aug2B", tradeTablePathB[tradeedItem].aug2)
			npc:setLocalVar("aug3B", tradeTablePathB[tradeedItem].aug3)
			npc:setLocalVar("aug4B", tradeTablePathB[tradeedItem].aug4)
			npc:setLocalVar("aug1MAXB", tradeTablePathB[tradeedItem].aug1MAX)
			npc:setLocalVar("aug2MAXB", tradeTablePathB[tradeedItem].aug2MAX)
			npc:setLocalVar("aug3MAXB", tradeTablePathB[tradeedItem].aug3MAX)
			npc:setLocalVar("aug4MAXB", tradeTablePathB[tradeedItem].aug4MAX)
			
			npc:setLocalVar("aug1C", tradeTablePathC[tradeedItem].aug1)
			npc:setLocalVar("aug2C", tradeTablePathC[tradeedItem].aug2)
			npc:setLocalVar("aug3C", tradeTablePathC[tradeedItem].aug3)
			npc:setLocalVar("aug4C", tradeTablePathC[tradeedItem].aug4)
			npc:setLocalVar("aug1MAXC", tradeTablePathC[tradeedItem].aug1MAX)
			npc:setLocalVar("aug2MAXC", tradeTablePathC[tradeedItem].aug2MAX)
			npc:setLocalVar("aug3MAXC", tradeTablePathC[tradeedItem].aug3MAX)
			npc:setLocalVar("aug4MAXC", tradeTablePathC[tradeedItem].aug4MAX)
			
			npc:setLocalVar("aug1D", tradeTablePathD[tradeedItem].aug1)
			npc:setLocalVar("aug2D", tradeTablePathD[tradeedItem].aug2)
			npc:setLocalVar("aug3D", tradeTablePathD[tradeedItem].aug3)
			npc:setLocalVar("aug4D", tradeTablePathD[tradeedItem].aug4)
			npc:setLocalVar("aug1MAXD", tradeTablePathD[tradeedItem].aug1MAX)
			npc:setLocalVar("aug2MAXD", tradeTablePathD[tradeedItem].aug2MAX)
			npc:setLocalVar("aug3MAXD", tradeTablePathD[tradeedItem].aug3MAX)
			npc:setLocalVar("aug4MAXD", tradeTablePathD[tradeedItem].aug4MAX)
		end
		
		local menu  = {}
		local page1 = {}
		local page2 = {}
		
		local delaySendMenu = function(player)
			player:timer(50, function(playerArg)
				playerArg:customMenu(menu)
			end)
		end
		
		menu =
		{
			title = "Which path?",
			options = {},
		}
		
		page1 =
		{
			{
				"Path A",
				function(playerArg)
					player:setCharVar("[Augment]choice", 1)
					player:PrintToPlayer("Path A", 13)
					menu.options = page2
					delaySendMenu(playerArg)
				end,
			},
			{
				"Path B",
				function(playerArg)
					player:setCharVar("[Augment]choice", 2)
					player:PrintToPlayer("Path B", 13)
					menu.options = page2
					delaySendMenu(playerArg)
				end,
			},
			{
				"Path C",
				function(playerArg)
					player:setCharVar("[Augment]choice", 3)
					player:PrintToPlayer("Path C", 13)
					menu.options = page2
					delaySendMenu(playerArg)
				end,
			},
			{
				"Path D",
				function(playerArg)
					player:setCharVar("[Augment]choice", 4)
					player:PrintToPlayer("Path D", 13)
					menu.options = page2
					delaySendMenu(playerArg)
				end,
			},
			{
				"Nevermind",
				function(playerArg)
				end,
			},
		}
		
		page2 =
		{
			{
				"You're sure?",
				function(playerArg)
					player:tradeComplete()
					local reward = player:getCharVar("[GFZitah]item")
					local aug1A = npc:getLocalVar("aug1A")
					local aug2A = npc:getLocalVar("aug2A")
					local aug3A = npc:getLocalVar("aug3A")
					local aug4A = npc:getLocalVar("aug4A")
					local aug1MAXA = npc:getLocalVar("aug1MAXA")
					local aug2MAXA = npc:getLocalVar("aug2MAXA")
					local aug3MAXA = npc:getLocalVar("aug3MAXA")
					local aug4MAXA = npc:getLocalVar("aug4MAXA")
					
					local aug1B = npc:getLocalVar("aug1B")
					local aug2B = npc:getLocalVar("aug2B")
					local aug3B = npc:getLocalVar("aug3B")
					local aug4B = npc:getLocalVar("aug4B")
					local aug1MAXB = npc:getLocalVar("aug1MAXB")
					local aug2MAXB = npc:getLocalVar("aug2MAXB")
					local aug3MAXB = npc:getLocalVar("aug3MAXB")
					local aug4MAXB = npc:getLocalVar("aug4MAXB")
					
					local aug1C = npc:getLocalVar("aug1C")
					local aug2C = npc:getLocalVar("aug2C")
					local aug3C = npc:getLocalVar("aug3C")
					local aug4C = npc:getLocalVar("aug4C")
					local aug1MAXC = npc:getLocalVar("aug1MAXC")
					local aug2MAXC = npc:getLocalVar("aug2MAXC")
					local aug3MAXC = npc:getLocalVar("aug3MAXC")
					local aug4MAXC = npc:getLocalVar("aug4MAXC")
					
					local aug1D = npc:getLocalVar("aug1D")
					local aug2D = npc:getLocalVar("aug2D")
					local aug3D = npc:getLocalVar("aug3D")
					local aug4D = npc:getLocalVar("aug4D")
					local aug1MAXD = npc:getLocalVar("aug1MAXD")
					local aug2MAXD = npc:getLocalVar("aug2MAXD")
					local aug3MAXD = npc:getLocalVar("aug3MAXD")
					local aug4MAXD = npc:getLocalVar("aug4MAXD")
					
					if player:getCharVar("[Augment]choice") == 1 then
						player:injectActionPacket(player:getID(), 11, 796, 0, 0, 0, 10, 1)
						player:timer(4000, function(player)
							player:addItem(reward, 1, aug1A, aug1MAXA, aug2A, aug2MAXA, aug3A, aug3MAXA, aug4A, aug4MAXA)
							player:setCharVar("[GFZitah]item", 0)
						end)
					elseif player:getCharVar("[Augment]choice") == 2 then
						player:injectActionPacket(player:getID(), 11, 796, 0, 0, 0, 10, 1)
						player:timer(4000, function(player)
							player:addItem(reward, 1, aug1B, aug1MAXB, aug2B, aug2MAXB, aug3B, aug3MAXB, aug4B, aug4MAXB)
							player:setCharVar("[GFZitah]item", 0)
						end)
					elseif player:getCharVar("[Augment]choice") == 3 then	
						player:injectActionPacket(player:getID(), 11, 796, 0, 0, 0, 10, 1)
						player:timer(4000, function(player)
							player:addItem(reward, 1, aug1C, aug1MAXC, aug2C, aug2MAXC, aug3C, aug3MAXC, aug4C, aug4MAXC)
							player:setCharVar("[GFZitah]item", 0)
						end)
					elseif player:getCharVar("[Augment]choice") == 4 then
						player:injectActionPacket(player:getID(), 11, 796, 0, 0, 0, 10, 1)
						player:timer(4000, function(player)
							player:addItem(reward, 1, aug1D, aug1MAXD, aug2D, aug2MAXD, aug3D, aug3MAXD, aug4D, aug4MAXD)
							player:setCharVar("[GFZitah]item", 0)
						end)
					end
					player:PrintToPlayer("Here you go.", 13)
				end,
			},
			{
				"Back",
				function(playerArg)
					menu.options = page1
					delaySendMenu(playerArg)
				end,
			},
		}
		menu.options = page1
		delaySendMenu(player)
		
	end
	
	
    })
    utils.unused(Chirpadee)
end)

return m
