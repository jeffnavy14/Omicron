-----------------------------------
-- Zone: Abyssea - Vunkerl
--  NPC: Bastion Prefect
-----------------------------------
local entity = {}

local itemType =
{
    ITEM        = 3,
    TEMP        = 5,
}

local bastionItems =
{
    [itemType.ITEM] =
    {
--  Sel      Item                                 Cost, 
    [ 1] = { xi.item.UNKAI_HAIDATE,               300 },
    [ 2] = { xi.item.IGA_HAKAMA,                  300 },
    [ 3] = { xi.item.LANCERS_CUISSOTS,            300 },
    [ 4] = { xi.item.CALLERS_SPATS,               300 },
    [ 5] = { xi.item.MAVI_TAYT,                   300 },
    [ 6] = { xi.item.NAVARCHS_CULOTTES,           300 },
    [ 7] = { xi.item.CIRQUE_PANTALONI,            300 },
    [ 8] = { xi.item.CHARIS_TIGHTS,               300 },
    [ 9] = { xi.item.SAVANTS_PANTS,               300 },
    [10] = { xi.item.DAYBREAK_SOUL,               200 },
    [11] = { xi.item.TWILIGHT_SOUL,               200 },
    [12] = { xi.item.MAGNUS_STONE_POUCH,          150 },
    },
    [itemType.TEMP] =
    {
--  Sel      Item                          Cost, Qty
    [ 1] = { xi.item.LUCID_POTION_III,            50 },
    [ 2] = { xi.item.LUCID_ETHER_III,             50 },
    [ 3] = { xi.item.LUCID_ELIXIR_II,             75 },
    [ 4] = { xi.item.FLASK_OF_HEALING_MIST,       75 },
    [ 5] = { xi.item.FLASK_OF_MANA_MIST,          75 },
    [ 6] = { xi.item.TUBE_OF_HEALING_SALVE_II,    75 },
    [ 7] = { xi.item.PAIR_OF_LUCID_WINGS_I,       80 },
    [ 8] = { xi.item.BOTTLE_OF_CLERICS_DRINK,     80 },
    [ 9] = { xi.item.DUSTY_WING,                 100 },
    [10] = { xi.item.BOTTLE_OF_GNOSTICS_DRINK,   100 },
    [11] = { xi.item.BOTTLE_OF_SPRINTERS_DRINK,  100 },
    [12] = { xi.item.BOTTLE_OF_MONARCHS_DRINK,   100 },
    [13] = { xi.item.BOTTLE_OF_BERSERKERS_TONIC, 120 },
    [14] = { xi.item.BOTTLE_OF_SWIFTSHOT_TONIC,  120 },
    [15] = { xi.item.BOTTLE_OF_FANATICS_DRINK,   150 },
    [16] = { xi.item.BOTTLE_OF_FOOLS_DRINK,      150 },
    },
}

entity.onTrade = function(player, npc, trade)

end

entity.onTrigger = function(player, npc)
local amount = player:getCurrency('resistance_credit')
player:startEvent(120,amount)
end

entity.onEventUpdate = function(player, csid, option, npc)

end

entity.onEventFinish = function(player, csid, option, npc)
    local itemCategory = bit.band(option, 0x07)
    local itemSelected = bit.band(bit.rshift(option, 16), 0x1F)
    local resistTotal = player:getCurrency('resistance_credit')

    if itemCategory == itemType.ITEM then
        local itemData = bastionItems[itemCategory][itemSelected]
        local itemQty = itemData[1] ~= xi.item.FORBIDDEN_KEY and 1 or bit.rshift(option, 24)
        local itemCost = itemData[2] * itemQty

        if
            itemCost <= resistTotal and
            npcUtil.giveItem(player, { { itemData[1], itemQty } })
        then
            player:delCurrency('resistance_credit', itemCost)
        end
    elseif itemCategory == itemType.TEMP then
        local itemData = bastionItems[itemCategory][itemSelected]
        local itemCost = itemData[2]

        if
            itemCost <= resistTotal and
            npcUtil.giveTempItem(player, { { itemData[1], 1 } })
        then
            player:delCurrency('resistance_credit', itemCost)
        end
    end
end

return entity