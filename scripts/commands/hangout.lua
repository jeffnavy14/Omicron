-----------------------------------
-- func: hangout
-- desc: Sends the target to the hangout with strict lockout parameters
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

commandObj.onTrigger = function(player, target)
    -- 1. LOCKOUT CHECK: Block access if player has charVar ratio set to 1
    if player:getCharVar("ratio") == 1 then
        player:printToPlayer("Access Denied: You are currently locked out of the hangout area.")
        return
    end

    -- 2. ENMITY CHECK: Scan the party for active threat lists
    local function player_hate()
        local party = player:getParty()
        for _, partyMember in pairs(party) do
            if partyMember and partyMember:hasEnmity() then
                return true
            end
        end
        return false -- Fixed: Moved outside the loop to ensure all members are evaluated
    end

    -- 3. WARP AUTOMATION
    local function warpPlayerToHangOut(playerArg)
        -- Inject action packet for animation
        playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
        
        -- Delay warp using a standard 1-second timer
        playerArg:timer(1000, function()
            playerArg:setPos(341.4659, -0.4111, -582.4335, 191, 280)
        end)
    end

    -- 4. EVALUATION TREE
    if player_hate() then
        player:printToPlayer('You or someone in your party has Enmity, please try again when you are clear!')
    else
        warpPlayerToHangOut(player)
    end
end

return commandObj
