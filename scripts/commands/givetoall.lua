-----------------------------------
-- func: !givetoall
-- desc: gives everyone online an item
require('scripts/enum/zone')
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,  -- GM permission level
    parameters = 'ii' -- parameters
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!givetoall <itemId> <amount>')
end

commandObj.onTrigger = function(player, itemId, amount)
    if itemId == nil or itemId > 65535 or amount == nil or amount > 99 then
        error(player, 'Please enter a valid item Id and or amount!')
        return
    else
    local distribution = {}
        for _, zoneId in pairs(xi.zone) do
               table.insert(distribution, zoneId)
        end
        for _, zone in pairs(distribution) do
            for _, member in pairs(GetZone(_):getPlayers()) do
                   if player:getFreeSlotsCount() < amount then -- check inventory for available space
                      SendItemToDeliveryBox(member:getName(), itemId, amount,'LevelDown') -- Send to Delivery box if inventory is full
                      member:printToPlayer(string.format('Congratulations %s, you have received a gift from the GM team!', member:getName()), xi.msg.channel.SYSTEM_3)
                      member:printToPlayer('Your Inventory was full so we sent it to your Delivery Box!', xi.msg.channel.SYSTEM_3)
                   else npcUtil.giveItem(member,{ {itemId, amount} })
                      member:printToPlayer(string.format('Congratulations %s, you have received a gift from the GM team!', member:getName()), xi.msg.channel.SYSTEM_3)
                   end
            end
        end
    end
    -- Inform the executing player
    player:printToPlayer(string.format('You gave all players %i %s!.', amount, GetItemByID(itemId):getName()))
end
return commandObj