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

<<<<<<< HEAD
function onTrigger(player, target)
    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end

    -- homepoint target
    targ:warp()
    if targ:getID() ~= player:getID() then
        player:PrintToPlayer(string.format("Sent %s to their homepoint.", targ:getName()))
    end
=======
function onTrigger(player)
    -- homepoint target
    player:warp()
>>>>>>> d37dd4cd8142648c3444793af107889151db07e8
end
