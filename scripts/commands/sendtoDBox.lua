-----------------------------------
-- func: sendtodbox
-- desc: sends an item to specified players delivery box
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = 'sii'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!sendtoDBox (player) <item> <quantity>')
end

commandObj.onTrigger = function(player, target, itemId, amount)
    if target == nil or itemId == nil then
        player:printToPlayer('You must enter a valid player name and item ID.')
        return
    end
    if amount == nil then
       amount = 1
    end

    local targ = GetPlayerByName(target)
    if targ == nil then
        player:printToPlayer(string.format('Player named "%s" not found!', target))
        return
    end


    -- send to players delivery box
  --  SendItemToDeliveryBox('Player Name', Item ID, Quantity, 'Send By Player Name')
      SendItemToDeliveryBox(target, itemId, amount,'LevelDown')
    player:printToPlayer(string.format('You have sent %s to %s delivery box.', GetItemByID(itemId):getName(), targ:getName()))
end

return commandObj
