-----------------------------------
-- func: campaign <command> (player)
-- commands:
-- !campaign start (player) starts campaign for the current player
-- !campaign stop  (player) stops campaign (if any) currently running in the player's zone
-- !campaign win (player) win the campaign (if any) currently running in the player's zone
-----------------------------------
require("modules/catseyexi/lua/additive_overrides/systems/campaign/campaign_core")
-----------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    local usage = "Usage: !campaign <command> (player)"
    player:PrintToPlayer(msg .. "\n" .. usage)
end

function onTrigger(player, command)
    switch(command): caseof
    {
        ["start"] = function()
            xi.campaign.start(player)
            player:PrintToPlayer(string.format("%s campaign started", player:getZoneName()))
        end,

        ["stop"] = function()
            xi.campaign.stop(player)
            player:PrintToPlayer(string.format("%s campaign stopped", player:getZoneName()))
        end,

        ["win"] = function()
            xi.campaign.win(player)
        end,
    }
end
