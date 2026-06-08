-----------------------------------
-- func: givesigned <player> <itemId> <signature>
-- desc: Gives a signed item to the target player.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'sis' -- string (player), integer (itemId), string (signature)
}

commandObj.onTrigger = function(player, target, itemId, signature)
    if target == nil or itemId == nil or signature == nil then
        player:printToPlayer('Usage: !givesigned <player> <itemId> <signature>')
        return
    end

    local targ = GetPlayerByName(target)
    if targ == nil then
        player:printToPlayer(string.format('Player named "%s" not found!', target))
        return
    end

    -- Load needed text ids for target's current zone
    local ID = zones[targ:getZoneID()]

    -- Check if the player has inventory space
    if targ:getFreeSlotsCount() == 0 then
        targ:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemId)
        player:printToPlayer(string.format('Player \'%s\' does not have free space!', target))
    else
        -- Using the table syntax for custom signatures
        -- This requires your server core to support table arguments for addItem
        targ:addItem({id = itemId, signature = signature})

        -- Display messages
        targ:messageSpecial(ID.text.ITEM_OBTAINED, itemId)
        player:printToPlayer(string.format('Gave \'%s\' Item %u with signature "%s"', target, itemId, signature))
    end
end

return commandObj