-----------------------------------
-- func: hangout
-- desc: Sends the target to the hangout
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
local function player_hate()
    local party = player:getParty()
    for _, partyMember in pairs(party) do
         if partyMember:hasEnmity() then
            local a, b = partyMember:hasEnmity(), true
                     if a==b then
                        return true
                     end
                        end
                        return false
         end 
end
local function warpPlayerToHangOut(player)
    -- Inject action packet for animation (replace animation ID as needed)
    player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
    -- Delay warp using a timer
    player:timer(1000, function()
        -- Warp the player to their hang out
        player:setPos(341.4659, -0.4111, -582.4335, 191, 280)
    end)
end
         if player_hate() == true then
            player:printToPlayer('You or someone in your party has Enmity, please try again when you are clear!')
         else
                  warpPlayerToHangOut(player)
         end
end

return commandObj
