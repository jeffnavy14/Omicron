--------------------------------------------------------------------------------
-- func: Campaign
-- desc: Forces a campaign battle to start using the exposed module wrapper.
--------------------------------------------------------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 3, -- Adjusted for GM-level privileges
    parameters = 's'
}

local function sendUsage(player, errorMsg)
    if errorMsg then
        player:printToPlayer('Error: ' .. errorMsg)
    end
    player:printToPlayer('Syntax Examples:')
    player:printToPlayer('  !Campaign                 -> Starts a completely random battle.')
    player:printToPlayer('  !Campaign <zone> <army> <unit> -> Forces specific indices.')
end

commandObj.onTrigger = function(player, args)
    -- Check that the module's exposed block actually exists in the shared namespace
    if not xi or not xi.campaign or not xi.campaign.forceStart then
        player:printToPlayer("Error: Campaign module interface not found. Ensure the main module script loaded without errors.")
        return
    end

    local zIdx, aIdx, uIdx = nil, nil, nil

    -- Unpack space-separated parameters if provided
    if args and args ~= "" then
        local tokens = {}
        for token in string.gmatch(args, "%S+") do
            table.insert(tokens, tonumber(token))
        end
        
        zIdx = tokens[1]
        aIdx = tokens[2]
        uIdx = tokens[3]
        
        -- Guard against partial argument inputs
        if (zIdx and not aIdx) or (aIdx and not uIdx) then
            sendUsage(player, 'Malformed targets. You must provide ALL 3 numeric indices or provide NONE.')
            return
        end
    end

    -- Call the module's exposed function exactly as written
    xi.campaign.forceStart(player, zIdx, aIdx, uIdx)
end

return commandObj