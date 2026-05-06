-----------------------------------
-- Area: Abyssea - Uleguerand
--  NPC: Dominion Tactician
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ULEGUERAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

local itemType =
{
    ITEM        = 1,
    TEMP        = 2,
    AUGMENTED   = 3,
    ESCHELON    = 4,
}

local itemTypeSub =
{
    FIFTH       = 1,
    FOURTH      = 2,
    THIRD       = 3,
    SECOND      = 4,
    FIRST       = 5,
}

local tacticianItems =
{
    [itemType.ITEM] =
    {
    --  Sel      Item                       Cost
        [ 1] = { xi.item.CREED_CUIRASS,     1500 },
        [ 2] = { xi.item.BALE_CUIRASS,      1500 },
        [ 3] = { xi.item.FERINE_GAUSAPE,    1500 },
        [ 4] = { xi.item.AOIDOS_HONGRELINE, 1500 },
        [ 5] = { xi.item.SYLVAN_CABAN,      1500 },
        [ 6] = { xi.item.INCRESCENT_SHADE,   300 },
        [ 7] = { xi.item.DECRESCENT_SHADE,   300 },
    },

    [itemType.TEMP] =
    {
    --  Sel      Item                    Cost
        [1] = { xi.item.PETRIFY_SCREEN, 300 },
        [2] = { xi.item.TERROR_SCREEN,  300 },
        [3] = { xi.item.AMNESIA_SCREEN, 300 },
        [4] = { xi.item.DOOM_SCREEN,    300 },
        [5] = { xi.item.POISON_SCREEN,  300 },
    },

    [itemType.AUGMENTED] =
    {
    --  Sel     Item                  Cost  Possible Augments { Augment ID, Minimum, Maximum }
        [1] = { xi.item.SAVATE_FISTS, 2500, { { 45, 1,  4 }, {  41, 0, 3 }, { 182, 2, 6 }, { 786, 2, 7 }, { 1024, 1, 5 } } }, -- TODO: Should Aug 45 (DMG+) also apply Sub DMG?
        [2] = { xi.item.VODUN_MACE,   2500, { { 45, 2,  9 }, { 512, 2, 7 }, { 181, 2, 5 }, { 789, 2, 6 }, { 1065, 1, 3 } } },
        [3] = { xi.item.DIRE_SCYTHE,  2500, { { 45, 2, 18 }, { 512, 2, 2 }, { 187, 2, 4 }, { 787, 2, 7 }, { 1048, 1, 7 } } },
    },

    [itemType.ESCHELON] =
    {
        [itemTypeSub.FIFTH] =
            {
                [1] = { xi.item.BELLICUS_SABATONS,   1, { { 33, 23 }, { 512,  1 }, {  25, 1 } } }, -- def, str, att
                [2] = { xi.item.BESTIA_GREAVES,      1, { { 33, 22 }, { 513,  1 }, {  25, 1 } } }, -- def dex att
                [3] = { xi.item.PARAGON_SOLLERETS,   1, { { 33, 26 }, { 514,  1 }, {  25, 1 } } }, -- def vit att
                [4] = { xi.item.SKOPOS_SOCKS,        1, { { 33, 18 }, { 515,  1 }, {  27, 1 } } }, -- def agi racc
                [5] = { xi.item.KOKUGETSU_SUNE_ATE,  1, { { 33, 21 }, { 512,  1 }, {  23, 1 } } }, -- def str acc
                [6] = { xi.item.SPRY_GAITERS,        1, { { 33, 20 }, { 513,  1 }, {  23, 1 } } }, -- def dex acc
                [7] = { xi.item.MEDERI_BROGUES,      1, { { 33, 17 }, { 517,  1 }, { 518, 1 }, { 35, 0 } } }, -- def mnd chr macc
                [8] = { xi.item.LITERAE_SABOTS,      1, { { 33, 15 }, { 516,  1 }, { 120, 0 } } }, -- def int matt
                [9] = { xi.item.FACIO_GALOSHES,      1, { { 33, 15 }, {   9,  9 }, {  40, 1 } } }, -- def mp enm -
            },
        [itemTypeSub.FOURTH] =
            {
                [1] = { xi.item.BELLICUS_DASTANAS,   1, { { 33, 29 }, { 512,  1 }, {  25, 1 } } }, -- def, str, att
                [2] = { xi.item.BESTIA_MUFFLERS,     1, { { 33, 26 }, { 513,  1 }, {  25, 1 } } }, -- def dex att
                [3] = { xi.item.PARAGON_MOUFLES,     1, { { 33, 30 }, { 514,  1 }, {  25, 1 } } }, -- def vit att
                [4] = { xi.item.SKOPOS_BRACERS,      1, { { 33, 22 }, { 515,  1 }, {  27, 1 } } }, -- def agi racc
                [5] = { xi.item.KOKUGETSU_KOTE,      1, { { 33, 24 }, { 512,  1 }, {  23, 1 } } }, -- def str acc
                [6] = { xi.item.SPRY_WRISTBANDS,     1, { { 33, 23 }, { 513,  1 }, {  23, 1 } } }, -- def dex acc
                [7] = { xi.item.MEDERI_GANTS,        1, { { 33, 22 }, { 517,  1 }, { 518, 1 }, { 35, 0 } } }, -- def mnd chr macc
                [8] = { xi.item.LITERAE_CUFFS,       1, { { 33, 20 }, { 516,  1 }, { 120, 0 } } }, -- def int matt
                [9] = { xi.item.FACIO_GAGES,         1, { { 33, 19 }, {   9,  9 }, {  40, 1 } } }, -- def mp enm -
            },
        [itemTypeSub.THIRD] =
            {
                [1] = { xi.item.BELLICUS_CUISSES,    1, { { 33, 49 }, { 512,  2 }, {  25, 2 } } }, -- def, str, att
                [2] = { xi.item.BESTIA_BREECHES,     1, { { 33, 48 }, { 513,  2 }, {  25, 2 } } }, -- def dex att
                [3] = { xi.item.PARAGON_BRAYETTES,   1, { { 33, 54 }, { 514,  2 }, {  25, 2 } } }, -- def vit att
                [4] = { xi.item.SKOPOS_BRACCAE,      1, { { 33, 44 }, { 515,  2 }, {  27, 2 } } }, -- def agi racc
                [5] = { xi.item.KOKUGETSU_HAIDATE,   1, { { 33, 45 }, { 512,  2 }, {  23, 2 } } }, -- def str acc
                [6] = { xi.item.SPRY_TIGHTS,         1, { { 33, 45 }, { 513,  2 }, {  23, 2 } } }, -- def dex acc
                [7] = { xi.item.MEDERI_SLACKS,       1, { { 33, 41 }, { 517,  2 }, { 518, 2 }, { 35, 1 } } }, -- def mnd chr macc
                [8] = { xi.item.LITERAE_PANTS,       1, { { 33, 37 }, { 516,  2 }, { 120, 1 } } }, -- def int matt
                [9] = { xi.item.FACIO_SPATS,         1, { { 33, 37 }, {   9, 14 }, {  40, 2 } } }, -- def mp enm -
            },
        [itemTypeSub.SECOND] =
            {
                [1] = { xi.item.BELLICUS_CELATA,     1, { { 33, 36 }, { 512,  2 }, {  25, 1 } } }, -- def, str, att
                [2] = { xi.item.BESTIA_HELM,         1, { { 33, 35 }, { 513,  2 }, {  25, 2 } } }, -- def dex att
                [3] = { xi.item.PARAGON_GALEA,       1, { { 33, 39 }, { 514,  2 }, {  25, 2 } } }, -- def vit att
                [4] = { xi.item.SKOPOS_VISOR,        1, { { 33, 32 }, { 515,  2 }, {  27, 2 } } }, -- def agi racc
                [5] = { xi.item.KOKUGETSU_HATSUBURI, 1, { { 33, 33 }, { 512,  2 }, {  23, 2 } } }, -- def str acc
                [6] = { xi.item.SPRY_HEADGEAR,       1, { { 33, 32 }, { 513,  2 }, {  23, 2 } } }, -- def dex acc
                [7] = { xi.item.MEDERI_TAM,          1, { { 33, 31 }, { 517,  2 }, { 518, 2 }, { 35, 1 } } }, -- def mnd chr macc
                [8] = { xi.item.LITERAE_HAT,         1, { { 33, 28 }, { 516,  2 }, { 120, 1 } } }, -- def int matt
                [9] = { xi.item.FACIO_CAUBEEN,       1, { { 33, 27 }, {   9, 14 }, {  40, 2 } } }, -- def mp enm -
            },
        [itemTypeSub.FIRST] =
            {
                [1] = { xi.item.BELLICUS_CUIRASS,    1, { { 33, 65 }, { 512,  3 }, {  25, 3 } } }, -- def, str, att
                [2] = { xi.item.BESTIA_MAIL,         1, { { 33, 63 }, { 513,  3 }, {  25, 3 } } }, -- def dex att
                [3] = { xi.item.PARAGON_HAUBERT,     1, { { 33, 72 }, { 514,  3 }, {  25, 3 } } }, -- def vit att
                [4] = { xi.item.SKOPOS_JERKIN,       1, { { 33, 58 }, { 515,  3 }, {  27, 3 } } }, -- def agi racc
                [5] = { xi.item.KOKUGETSU_TOGI,      1, { { 33, 59 }, { 512,  3 }, {  23, 3 } } }, -- def str acc
                [6] = { xi.item.SPRY_VEST,           1, { { 33, 58 }, { 513,  3 }, {  23, 3 } } }, -- def dex acc
                [7] = { xi.item.MEDERI_TALAR,        1, { { 33, 51 }, { 517,  3 }, { 518, 3 }, { 35, 2 } } }, -- def mnd chr macc
                [8] = { xi.item.LITERAE_COAT,        1, { { 33, 47 }, { 516,  3 }, { 120, 2 } } }, -- def int matt
                [9] = { xi.item.FACIO_BLIAUT,        1, { { 33, 46 }, {   9, 19 }, {  40, 3 } } }, -- def mp enm -
            },
    },
}

-- This table and the following two functions can possibly be moved somewhere else in the future.  This is an attempt at
-- standardizing some of the augmented item logic.  If we end up recycling this code for other areas, augmentChance will
-- need to be passed into the giveAugmentedItem function.
local augmentChance =
{
    100,
    50,
    0,
    0,
}

local function isDuplicateAugment(paramList, augmentID)
    for i = 3, 9, 2 do
        if augmentID == paramList[i] then
            return true
        end
    end

    return false
end

local function giveAugmentedItem(player, itemID, augmentList, maxAugments)
    local itemParams = { itemID, 1, 0, 0, 0, 0, 0, 0, 0, 0 }
    local paramIndex = 3

    for i = 1, maxAugments do
        if math.random(1, 100) <= augmentChance[i] then
            local augmentTable = augmentList[math.random(1, #augmentList)]

            if not isDuplicateAugment(itemParams, augmentTable[1]) then
                itemParams[paramIndex] = augmentTable[1]
                itemParams[paramIndex + 1] = math.random(augmentTable[2], augmentTable[3])
                paramIndex = paramIndex + 2
            end
        end
    end

    if player:addItem(unpack(itemParams)) then
        player:messageSpecial(ID.text.ITEM_OBTAINED, itemID)
        return true
    else
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemID)
        return false
    end
end


local function giveTrophyAugmentedItem(player, itemID, augmentList, maxAugments)
    local itemParams = { itemID, 1, 0, 0, 0, 0, 0, 0, 0, 0 }
    local paramIndex = 3

    for i = 1, maxAugments do
        if math.random(1, 100) <= augmentChance[i] then
            local augmentTable = augmentList[math.random(1, #augmentList)]

            if not isDuplicateAugment(itemParams, augmentTable[1]) then
                itemParams[paramIndex] = augmentTable[1]
                itemParams[paramIndex + 1] = augmentTable[2]
                paramIndex = paramIndex + 2
            end
        end
    end

    if player:addItem(unpack(itemParams)) then
       player:messageSpecial(ID.text.ITEM_OBTAINED, itemID)
    return true
    else
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemID)
    return false
    end
end


entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local dominionNotes = player:getCurrency('dominion_note')
    local firstEchelonTrophy  = player:getCurrency('first_echelon_trophy') *1048576
    local secondEchelonTrophy = player:getCurrency('second_echelon_trophy') * 32768
    local thirdEchelonTrophy  = player:getCurrency('third_echelon_trophy') * 1024
    local fourthEchelonTrophy = player:getCurrency('fourth_echelon_trophy') * 32
    local fifthEchelonTrophy  = player:getCurrency('fifth_echelon_trophy') * 1
    local trophyMask = 0 -- 5 bits per trophy, cap at 30ea (31 can be displayed, but non-retail), 5th echelon is least sig
    local mask = {firstEchelonTrophy,secondEchelonTrophy,thirdEchelonTrophy,fourthEchelonTrophy,fifthEchelonTrophy}
        if trophyMask == 0 then
           for k, v in pairs(mask) do 
               trophyMask = trophyMask + v
           end
        end
    player:startEvent(120, dominionNotes, 0, 0, 0, 0, trophyMask)
end

entity.onEventUpdate = function(player, csid, option, npc)
    local menuCategory = bit.band(option, 0xF)

    if menuCategory == 6 then
        -- TODO: Update percentages for each NM in question for the selected
        -- page.  Page selection is bit.rshift(option, 8)
        player:updateEvent(0, 0, 0, 0, 0, 0, 0, 0)
    end
end

entity.onEventFinish = function(player, csid, option, npc)

    local guerdonSubCatagory = bit.rshift(option, 16)
    local guerdonItemChosen = bit.band(bit.rshift(option,8), 0xFF)
    local itemCategory = bit.band(option, 0xF)
    local itemSelected = bit.rshift(option, 8)
    local dominionNotes       = player:getCurrency('dominion_note')
    local firstEchelonTrophy  = player:getCurrency('first_echelon_trophy')
    local secondEchelonTrophy = player:getCurrency('second_echelon_trophy')
    local thirdEchelonTrophy  = player:getCurrency('third_echelon_trophy')
    local fourthEchelonTrophy = player:getCurrency('fourth_echelon_trophy')
    local fifthEchelonTrophy  = player:getCurrency('fifth_echelon_trophy')

    if
        itemCategory >= 1 and
        itemCategory <= 3 and
        dominionNotes >= tacticianItems[itemCategory][itemSelected][2]
    then
        local itemData = tacticianItems[itemCategory][itemSelected]

        if itemCategory == itemType.ITEM then
            if npcUtil.giveItem(player, { { itemData[1], 1 } }) then
                player:delCurrency('dominion_note', itemData[2])
            end
        elseif itemCategory == itemType.TEMP then
            if npcUtil.giveTempItem(player, { { itemData[1], 1 } }) then
                player:delCurrency('dominion_note', itemData[2])
            end
        elseif itemCategory == itemType.AUGMENTED then
            if giveAugmentedItem(player, itemData[1], itemData[3], 2) == true then
                player:delCurrency('dominion_note', itemData[2])
            end
        end
    elseif itemCategory == 4 then
        local itemData = tacticianItems[itemCategory][guerdonSubCatagory][guerdonItemChosen]
      if itemCategory == itemType.ESCHELON then 
         if guerdonSubCatagory == itemTypeSub.FIFTH and
            fifthEchelonTrophy >= tacticianItems[itemCategory][guerdonSubCatagory][guerdonItemChosen][2] then
            if giveTrophyAugmentedItem(player, itemData[1], itemData[3], 1) == true then
               player:delCurrency('fifth_echelon_trophy', 1)
            end
         elseif guerdonSubCatagory == itemTypeSub.FOURTH and
                fourthEchelonTrophy >= tacticianItems[itemCategory][guerdonSubCatagory][guerdonItemChosen][2] then
            if giveTrophyAugmentedItem(player, itemData[1], itemData[3], 1) == true then
               player:delCurrency('fourth_echelon_trophy', itemData[2])
            end
         elseif guerdonSubCatagory == itemTypeSub.THIRD and
                thirdEchelonTrophy >= tacticianItems[itemCategory][guerdonSubCatagory][guerdonItemChosen][2] then
            if giveTrophyAugmentedItem(player, itemData[1], itemData[3], 1) == true then
               player:delCurrency('third_echelon_trophy', itemData[2])
            end
         elseif guerdonSubCatagory == itemTypeSub.SECOND and
                secondEchelonTrophy >= tacticianItems[itemCategory][guerdonSubCatagory][guerdonItemChosen][2] then
            if giveTrophyAugmentedItem(player, itemData[1], itemData[3], 1) == true then
               player:delCurrency('second_echelon_trophy', itemData[2])
            end
         elseif guerdonSubCatagory == itemTypeSub.FIRST and
                firstEchelonTrophy >= tacticianItems[itemCategory][guerdonSubCatagory][guerdonItemChosen][2] then
            if giveTrophyAugmentedItem(player, itemData[1], itemData[3], 1) == true then
               player:delCurrency('first_echelon_trophy', itemData[2])
            end
         end
      end
    elseif itemCategory == 5 then
           local trophyList = {
                                    [5] = {'first_echelon_trophy' },
                                    [4] = {'second_echelon_trophy'},
                                    [3] = {'third_echelon_trophy' },
                                    [2] = {'fourth_echelon_trophy'},
                                    [1] = {'fifth_echelon_trophy' },
                              }
           local itemTraded   = bit.band(bit.rshift(option, 8), 0xF) 
           local amountTraded = bit.band(bit.rshift(option, 24), 0xFF)
           local itemReceived = bit.band(bit.rshift(option,16), 0xF) -- 1 = top option double reward / 2 == bottom option half reward
           local offset       = 0
           local rewardQty    = 0  
              for _, trophy in pairs(trophyList) do
                  if _ == itemTraded then
                     if itemReceived == 1 then
                        offset = offset + itemTraded - 1
                        rewardQty = amountTraded * 2
                        local reward = trophyList[offset][1]
                              player:addCurrency(reward, rewardQty)
                              player:delCurrency(trophyList[itemTraded][1], amountTraded)
                     elseif itemReceived == 2 then
                        offset = offset + itemTraded + 1
                        rewardQty = amountTraded / 2
                        local reward = trophyList[offset][1]
                              player:addCurrency(reward, rewardQty)
                              player:delCurrency(trophyList[itemTraded][1], amountTraded)
                     end
                  end
              end
    end
end

return entity