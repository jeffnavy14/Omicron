------------------------------------
-- Domain Invasion Events and Rewards
------------------------------------
require("scripts/globals/npc_util")
local prizes = require("scripts/globals/events/Domain_data")
------------------------------------

xi = xi or {}
xi.events = xi.events or {}
xi.events.domainCampaign = xi.events.domainCampaign or {}

xi.events.domainCampaign.onTrigger = function(player, csid)

    local escha = player:getCurrency("escha_beads")
	local cDate = player:getMainLvl()
    local domainInvasion = prizes
    local price = {}
    local priceShift = {}
    local hideOptions = 0

    -- Makes a table of prices
    for k, v in pairs(domainInvasion) do
        price[k] = domainInvasion[k]["price"]
    end

    -- Bit shifts values of prices (Defaults to 0 if price not in table)
    priceShift[1] = price[1] or 0
    priceShift[2] = bit.lshift(price[5] or 0, 16)
    priceShift[3] = price[9] or 0
    priceShift[4] = bit.lshift(price[13] or 0, 16)
    priceShift[5] = price[17] or 0
    priceShift[6] = bit.lshift(price[21] or 0, 16)
    priceShift[7] = price[25] or 0
    priceShift[8] = bit.lshift(price[29] or 0, 16)

    -- Combines two 16bit values to a single 32bit that will be passed as a CS param
    local priceBit1 = bit.bor(priceShift[1], priceShift[2])
    local priceBit2 = bit.bor(priceShift[3], priceShift[4])
    local priceBit3 = bit.bor(priceShift[5], priceShift[6])
    local priceBit4 = bit.bor(priceShift[7], priceShift[8])

    -- Turning on bits in hideOptions will make choices disappear
    for i=1, #priceShift do
        if priceShift[i] == 0 then
            hideOptions = bit.bor(hideOptions, bit.lshift(1, i - 1))
        end
    end

    -- Eight param is not used/unknown
    player:startEvent(csid, cDate, escha, priceBit1, priceBit2, priceBit3, priceBit4, hideOptions)
end

-- Shows list of items depending on option selected.
-- It also is in charge of purchasing selected item.
xi.events.domainCampaign.onEventUpdate = function(player, csid, option)

    local showItems = bit.band(option, 31) -- first 32 bits are for showing correct item list
    local itemSelected = bit.band(bit.rshift(option, 5), 31)
    local itemQuantity = bit.band(bit.rshift(option, 11), 511)
    local domainInvasion = prizes
    local escha = player:getCurrency("escha_beads")

    if
        showItems == 1 or
        showItems == 5 or
        showItems == 9 or
        showItems == 13 or
        showItems == 17 or
        showItems == 21 or
        showItems == 25 or
        showItems == 29
    then
        local items = {}
        for i = 1, 20 do
            if domainInvasion[showItems]["items"][i] ~= nil then
                table.insert(items, domainInvasion[showItems]["items"][i])
            else
                table.insert(items, 0)
            end
        end

        player:updateEvent(
            bit.bor(items[1], bit.lshift(items[2], 16)),
            bit.bor(items[3], bit.lshift(items[4], 16)),
            bit.bor(items[5], bit.lshift(items[6], 16)),
            bit.bor(items[7], bit.lshift(items[8], 16)),
            bit.bor(items[9], bit.lshift(items[10], 16)),
            bit.bor(items[11], bit.lshift(items[12], 16)),
            bit.bor(items[13], bit.lshift(items[14], 16)),
            bit.bor(items[15], bit.lshift(items[16], 16)))
    elseif
        showItems == 2 or
        showItems == 6 or
        showItems == 10 or
        showItems == 14 or
        showItems == 18 or
        showItems == 22 or
        showItems == 26 or
        showItems == 30
    then
        local price = domainInvasion[showItems - 1]["price"]
        local totalItemsMask = (2 ^ 20 - 1) - (2 ^ #domainInvasion[showItems - 1]["items"] - 1)  -- Uses 20 bits and sets to 1 for items not used.
        local items = {}

        for i = 1, 20 do
            if domainInvasion[showItems - 1]["items"][i] ~= nil then
                table.insert(items, domainInvasion[showItems - 1]["items"][i])
            else
                table.insert(items, 0)
            end
        end

        player:updateEvent(
            bit.bor(items[17], bit.lshift(items[18], 16)),
            bit.bor(items[19], bit.lshift(items[20], 16)),
            totalItemsMask,
            price,
            escha)
    else
        if npcUtil.giveItem(player, { {domainInvasion[showItems - 2]["items"][itemSelected + 1], itemQuantity} }) then
            player:delCurrency("escha_beads", domainInvasion[showItems - 2]["price"] * itemQuantity)
            player:updateEvent(
                domainInvasion[showItems - 2]["items"][itemSelected + 1],
                player:getCurrency("escha_beads"), -- Login Points after purchase
                0, -- Unknown (most likely totalItemMask)
                domainInvasion[showItems - 2]["price"],
                escha) -- Login points before purchase
        end
    end
end
