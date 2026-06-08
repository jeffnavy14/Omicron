-----------------------------------
-- ID: 6312
-- Item: hugemaw_harolds_coffer
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------
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
        { 15, xi.item.MEGASCO_EARRING },
        { 15, xi.item.SETAE_RING      },
        { 70, xi.item.NONE            },
    }

    local loottwo =
    {
        { 80, xi.item.CHUNK_OF_HAROLD_HUGEMAWS_RED_ORE },
        { 10, xi.item.VIAL_OF_UMBRAL_MARROW },
        { 10, xi.item.MULCIBARS_SCORIA      },
    }

    local lootthree = -- Reforged AF +1 items
    {
        {  5, xi.item.SQUARE_OF_BEHEMOTH_LEATHER    },
        {  5, xi.item.SPOOL_OF_PLATINUM_SILK_THREAD },
        {  5, xi.item.SQUARE_OF_RAXA                },
        {  5, xi.item.SQUARE_OF_TWILL_DAMASK        },
        {  5, xi.item.LOCK_OF_SIRENS_HAIR           },
        {  5, xi.item.ORICHALCUM_SHEET              },
        {  5, xi.item.DURIUM_SHEET                  },
        {  5, xi.item.DAMASCUS_INGOT                },
        { 60, xi.item.NONE                          },
    }

    local lootfour = -- Reforged Relic / AF +1 items
    {
        {  5, xi.item.MALIYAKALEYA_ORB      },
        {  5, xi.item.HEPATIZON_INGOT       },
        {  5, xi.item.BERYLLIUM_INGOT       },
        {  5, xi.item.PIECE_OF_EXALTED_LUMBER },
        {  5, xi.item.SPOOL_OF_SIFS_MACRAME  },
        {  5, xi.item.GABBRATH_HORN          },
        {  5, xi.item.BZTAVIAN_STINGER       },
        {  5, xi.item.ROCKFIN_TOOTH          },
        {  5, xi.item.WAKTZA_ROSTRUM         },
        {  5, xi.item.YGGDREANT_BOLE         },
        { 50, xi.item.NONE                   },
    }

    local lootfive = -- Lvl 99 JSE Augmenting
    {
        {  2, xi.item.REFRACTIVE_CRYSTAL },
        { 98, xi.item.NONE               },
    }

    local lootsix = -- Currency
    {
        { 33, xi.item.BEITETSU         },
        { 33, xi.item.PLUTON           },
        { 33, xi.item.RIFTBORN_BOULDER },
    }

    local lootGroups =
    {
        { lootone,   function() return 1 end },
        { loottwo,   function() return math.random(1, 3) end },
        { lootthree, function() return 1 end },
        { lootfour,  function() return 1 end },
        { lootfive,  function() return 1 end },
        { lootsix,   function() return math.random(3, 18) end },
    }

    local loot = {}
    for _, entry in ipairs(lootGroups) do
        local item = xi.itemUtils.pickItemRandom(convertLootGroup(entry[1]))
        table.insert(loot, { item, entry[2]() })
    end

    for _, reward in ipairs(loot) do if reward[1] >= 1 then npcUtil.giveItem(target, { { reward[1], reward[2] } }) end end
    npcUtil.giveCurrency(target, 'gil', math.random(3123, 8791))
end

return itemObject