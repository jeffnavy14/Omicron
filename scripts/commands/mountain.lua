-----------------------------------
-- func: !mountain
-- desc: Teleport to top of Parradamo
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!home')
end

local function player_hate(player)
    local party = player:getParty()
    for _, partyMember in pairs(party) do
        if partyMember:hasEnmity() then
            return true
        end
    end
    return false
end

local function warpPlayerToMountain(player)
    -- Inject action packet for animation (replace animation ID as needed)
    player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
    -- Delay warp using a timer
    player:timer(1000, function()
        -- Warp the player to top of Parradamo
        player:setPos(317.8441, -26, -39.7234, 231, 215)
    end)
end

commandObj.onTrigger = function(player, target)
    -- Check if the player is in Abyssea - Attowha (zone ID 215)
    if player:getZoneID() ~= 215 then
        player:printToPlayer('You must be in Abyssea - Attohwa to use this warp!')
        return
    end

    -- Check for enmity
    if player_hate(player) then
        player:printToPlayer('You or someone in your party has Enmity, please try again when you are clear!')
    else
        warpPlayerToMountain(player)
    end
end

return commandObj