---------------------------------------------------------------------------------------------------
-- func: oldmog
-- desc: for players created prior to 8/6/2024, to up the slots in mogsafe, mogsack, mog locker to 80, still need to pay for mog locker
---------------------------------------------------------------------------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = "i"
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!oldmog')
end

commandObj.onTrigger = function(player, modvalue)

            -- moghouse
            player:changeContainerSize(xi.inv.MOGSAFE,  80)
            player:changeContainerSize(xi.inv.MOGSACK,  80)
            player:changeContainerSize(xi.inv.MOGLOCKER,  80)
		player:printToPlayer(string.format('Your mogsafe, mogsack and moglocker have not been set to 80 slots.'), xi.msg.channel.SYSTEM_3)
		player:printToPlayer(string.format('You will still need to pay for your Mog Locker.'), xi.msg.channel.SYSTEM_3)
end

return commandObj