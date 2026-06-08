local commandObj = {}

commandObj.cmdprops = {
    permission = 0,
    parameters = ""
}

local function error(player, msg)
    player:printToPlayer(msg)
end

local function delayedSetHP(player)
    if player:isAlive() then
        player:setHP(0)
        player:printToPlayer("Ohhhh nooo... guess that was too much power for you, Our bad.... Happy April Fools lol.")
    else
        player:printToPlayer("You are already dead.....")
    end
end

commandObj.onTrigger = function(player)
    local playerID = player:getID()

    -- Inject action packet
    player:injectActionPacket(playerID, 5, 208, 0, 0, 0, 10, 1)

    -- Delay for 2 seconds before setting HP to 0
    player:timer(2000, function() delayedSetHP(player) end)
end

return commandObj
