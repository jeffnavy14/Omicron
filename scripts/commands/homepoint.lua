-----------------------------------
-- func: homepoint
-- desc: Sends the target to their homepoint.
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!homepoint (player)")
end

function onTrigger(player)
    -- homepoint target
    player:warp()
end
