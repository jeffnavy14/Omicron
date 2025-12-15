local entity = {}

entity.onTrade = function(player, npc, trade)
    local augAdjust = math.random (3,40) -- example max augment
    local ranaug1 = math.random (1,83)
	local ranaug2 = math.random (96,153)
	local ranaug3 = math.random (320,343)
	local ranaug4 = math.random (512, 559)
    -- Build trade table dynamically for IDs 10240, 28671
    local tradeTable = {}
    for itemId = 10240, 28671 do
        tradeTable[itemId] = {
            base = itemId,
            aug1 = ranaug1, aug1MAX = augAdjust,
            aug2 = ranaug2, aug2MAX = augAdjust,
            aug3 = ranaug3, aug3MAX = augAdjust,
			aug4 = ranaug4, aug4MAX = augAdjust,
        }
    end

    -- Loop through the trade to see what item was given
    local tradedItemId = nil
    for slot = 0, 7 do
        local item = trade:getItemId(slot)
        if item and tradeTable[item] then
            tradedItemId = item
            break
        end
    end
    -- Check the trade: must be exactly the item + currency
    if npcUtil.tradeHasExactly(trade, {tradedItemId}) then
       local rewardData = tradeTable[tradedItemId]

        player:confirmTrade()
        player:printToPlayer("Here is your augmented reward", 0, npc:getPacketName())

        player:addItem(
            rewardData.base, 1,
            rewardData.aug1, rewardData.aug1MAX,
            rewardData.aug2, rewardData.aug2MAX,
            rewardData.aug3, rewardData.aug3MAX,
			rewardData.aug4, rewardData.aug4MAX
        )
    
	else
        player:printToPlayer("No valid trade found.", 0, npc:getPacketName())
    end
end

entity.onTrigger = function(player, npc)
player:printToPlayer("Trade me any Armor/Weapon and I will augment it for you.", 0, npc:getPacketName())

end
entity.onEventUpdate = function(player, csid, option, npc)

end

entity.onEventFinish = function(player, csid, option, npc)

end

return entity
