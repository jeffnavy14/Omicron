-----------------------------------
-- ID: 6319
-- Item: abyssdivers_coffer
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

local function convertLootGroup(lootGroup)
    local converted = {}

    for i, entry in ipairs(lootGroup) do
        if entry.weight ~= nil and entry.itemId ~= nil then
            converted[i] = entry
        else
            converted[i] = { weight = entry[1] or 0, itemId = entry[2] }
        end
    end

    return converted
end

itemObject.onItemUse = function(target, user, item, action)
    local lootone =
    {
        {  10, xi.item.WINGCUTTER },
        {   1, xi.item.WINGCUTTER_P1 },
        {  10, xi.item.MACABRE_GAUNTLETS },
        {   1, xi.item.MACABRE_GAUNTLETS_P1 },
        {  78, xi.item.NONE       },
    }
    local loottwo =
    {
        {   80,  xi.item.ABYSSDIVERS_FEATHER  }, -- Abyssdivers Feather
        {   10,  xi.item.VIAL_OF_UMBRAL_MARROW  }, -- Umbral Marrow
        {   10,  xi.item.MULCIBARS_SCORIA  }, -- Mulcibars Scoria
    }
    local lootthree = -- Reforged AF +1 items
    {
        {   5, xi.item.SQUARE_OF_BEHEMOTH_LEATHER }, -- Behemoth Leather
        {   5, xi.item.SPOOL_OF_PLATINUM_SILK_THREAD }, -- Platinum Silk Thread
        {   5, xi.item.SQUARE_OF_RAXA }, -- Raxa
        {   5, xi.item.SQUARE_OF_TWILL_DAMASK }, -- Twill Damask
        {   5, xi.item.LOCK_OF_SIRENS_HAIR }, -- Sirens Hair
        {   5, xi.item.ORICHALCUM_SHEET }, -- Orichalcum Sheet
        {   5, xi.item.DURIUM_SHEET }, -- Durium Sheet
        {   5, xi.item.DAMASCUS_INGOT }, -- Damascus Ingot
        {   60, xi.item.NONE  },
    }
    local lootfour = -- Reforged Relic / AF +1 items
    {
        {   5, xi.item.MALIYAKALEYA_ORB }, -- Maliyakaleya Orb
        {   5, xi.item.HEPATIZON_INGOT }, -- Hepatizon Ingot
        {   5, xi.item.BERYLLIUM_INGOT }, -- Beryllium Ingot
        {   5, xi.item.PIECE_OF_EXALTED_LUMBER }, -- Exalted Lumber
        {   5, xi.item.SPOOL_OF_SIFS_MACRAME }, -- Sifs Macrame
        {   5, xi.item.GABBRATH_HORN }, -- Gabbrath Horn
        {   5, xi.item.BZTAVIAN_STINGER }, -- Bztavian Stinger
        {   5, xi.item.ROCKFIN_TOOTH }, -- Rockfin Tooth
        {   5, xi.item.WAKTZA_ROSTRUM }, -- Waktza Rostrum
        {   5, xi.item.YGGDREANT_BOLE }, -- Yggdreant Bole
        {   50, xi.item.NONE  },
    }
    local lootfive = -- Lvl 99 JSE Augmenting
    {
        {   2, xi.item.REFRACTIVE_CRYSTAL }, -- Refractive Crystal
        {   98, xi.item.NONE  },
    }
    local lootsix = -- Currency
    {
        {    33,  xi.item.BEITETSU  }, -- Beitetsu
        {    33,  xi.item.PLUTON  }, -- Pluton
        {    33,  xi.item.RIFTBORN_BOULDER  }, -- Riftborn Boulder
    }

    local lootGroups =
    {
        { lootone,  function() return 1 end },
        { loottwo,  function() return math.random(1,3) end },
        { lootthree,function() return 1 end },
        { lootfour, function() return 1 end },
        { lootfive, function() return 1 end },
        { lootsix,  function() return math.random(3,18) end },
    }

    local loot = {}

    for _, entry in ipairs(lootGroups) do
        local group = entry[1]
        local qtyFn = entry[2]

        local item = xi.itemUtils.pickItemRandom(convertLootGroup(group))
        table.insert(loot, { item, qtyFn() })
    end

    for _, reward in ipairs(loot) do
        if reward[1] >= 1 then
            npcUtil.giveItem(target, { { reward[1], reward[2] } })
        end
    end

    npcUtil.giveCurrency(target, 'gil', math.random(3123, 8791))
end

return itemObject
