-----------------------------------
-- Area: Port Jeuno
--  NPC: Synergy_Engineer
-- !pos  -52 0 -11 246

--Base file Contributed by Graves
-----------------------------------
local ID = zones[xi.zone.PORT_JEUNO]
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

local function getScrapAmount()
    local random = math.random(1, 100)

    if random > 85 then
        return 12
    elseif random > 65 then
        return 9
    elseif random > 35 then
        return 6
    else
        return 3
    end
end

entity.onTrade = function(player, npc, trade)
    local seals = {
        [xi.item.SEAL_OF_GENBU]  = xi.item.SEAL_OF_GENBU_SCRAP,
        [xi.item.SEAL_OF_SUZAKU] = xi.item.SEAL_OF_SUZAKU_SCRAP,
        [xi.item.SEAL_OF_SEIRYU] = xi.item.SEAL_OF_SEIRYU_SCRAP,
        [xi.item.SEAL_OF_BYAKKO] = xi.item.SEAL_OF_BYAKKO_SCRAP,
    }
    local itemsToGive = {}

    for i = 0, trade:getSlotCount() - 1 do
        local itemId = trade:getItemId(i)
        if itemId ~= 0 and not seals[itemId] then
            player:printToPlayer( "Engineer: Where the Scraps I seek.", 0xd );
            return
        end
    end

    for sealId, scrapId in pairs(seals) do
        local count = trade:getItemQty(sealId)
        if count > 0 then
            local quantity = 0
            for i = 1, count do
                quantity = quantity + getScrapAmount()
            end
            table.insert(itemsToGive, { scrapId, quantity })
        end
    end

    if #itemsToGive > 0 then
        if player:getFreeSlotsCount() >= #itemsToGive then
            if npcUtil.giveItem(player, itemsToGive) then
                player:tradeComplete()
                player:printToPlayer( "Engineer: Here you go, use it in the furnace.", 0xd );
            end
        elseif player:getFreeSlotsCount() + trade:getSlotCount() >= #itemsToGive then
            player:tradeComplete()
            if npcUtil.giveItem(player, itemsToGive) then
                player:printToPlayer( "Engineer: Here you go, use it in the furnace.", 0xd );
            end
        end
    else
        player:printToPlayer( "Engineer: Where the Scraps I seek.", 0xd );
    end
end

entity.onTrigger = function(player, npc)
    player:printToPlayer( "Engineer: So you want some Scaps?", 0xd );
    player:printToPlayer( "Engineer: Trade me God Seals, you the Scraps simple as that.", 0xd );
    --player:printToPlayer( "Engineer: Trade 1 at a time I work slow.", 0xd );
    player:printToPlayer( "Engineer: Take your time, I will be here all week.", 0xd );
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity