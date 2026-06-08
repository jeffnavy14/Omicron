---------------------------------------------------------------------------------------------------
-- func: !boom
-- desc: Inflicts boom on the targeted player, or if no target is selected, all players in the zone.
-- creator: Loneshadowwolf
---------------------------------------------------------------------------------------------------
require("scripts/globals/interaction/actions/message")
local commandObj = {}

commandObj.cmdprops =
{
    permission = 5,
    parameters = ""
}

-- Table containing the possible action IDs and related parameters
local actionPackets = {
    {5, 270}
}

-- function(player)
commandObj.onTrigger = function(player)

    local target = player:getCursorTarget()  -- Check if the player has a target
    local zone = player:getZone()
    local playersInZone = zone:getPlayers()  -- Get all players in the zone

    -- Randomly select an action packet from the list
    local selectedAction = actionPackets[math.random(1, #actionPackets)]
    local actionId = selectedAction[1]
    local animationId = selectedAction[2]

    if target then
        -- Target exists, apply action only to the targeted player
        target:injectActionPacket(target:getID(), actionId, animationId, 0, 0, 0, 10, 1)
        player:printToPlayer(string.format("%s getting that BOOM", target:getName()))
    else
        -- No target, apply action to all players in the zone
        if playersInZone and #playersInZone > 0 then
            for _, targ in pairs(playersInZone) do
                targ:injectActionPacket(targ:getID(), actionId, animationId, 0, 0, 0, 10, 1)
            end
            player:printToPlayer("Just gimme that BOOM")
        else
            player:printToPlayer("No players found in this zone!")
        end
    end
end

return commandObj

