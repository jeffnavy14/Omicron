-----------------------------------
-- Ends the GM Event Pigs Fly
-----------------------------------
local commandObj = {}
commandObj.cmdprops =
{
    permission = 4,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!endpigsfly <area>')
end

commandObj.onTrigger = function(player, area)
-- validate area to end event in
    if area == nil or area > 3 then
        error(player, 'Improper area selected, 1 = Northern SandOria, 2 = Bastok Mines, 3 = Windurst Woods')
        return
    end
            if area == 1 then
                local zone = GetZone(231) -- northern sandoria
                local filteredEntities = zone:queryEntitiesByName('DE_Pig Assassin')
                    for _, name in pairs(filteredEntities) do
                           DespawnMob(name:getID())
                              SetServerVariable('[LPFSEvent] PigCount', 0)
                    end
                player:printToArea('GM: Let Pigs Fly event has been stopped by a GM!', xi.msg.channel.SYSTEM_3, 0)
            elseif area == 2 then
                local zone = GetZone(234) -- bastok mines
                local filteredEntities = zone:queryEntitiesByName('DE_Pig Assassin')
                    for _, name in pairs(filteredEntities) do 
                           DespawnMob(name:getID())
                              SetServerVariable('[LPFBEvent] PigCount', 0)
                    end
                player:printToArea('GM: Let Pigs Fly event has been stopped by a GM!', xi.msg.channel.SYSTEM_3, 0)
            elseif area == 3 then
                local zone = GetZone(241) -- windurst woods
                local filteredEntities = zone:queryEntitiesByName('DE_Pig Assassin')
                    for _, name in pairs(filteredEntities) do 
                           DespawnMob(name:getID())
                              SetServerVariable('[LPFWEvent] PigCount', 0)
                    end
                player:printToArea('GM: Let Pigs Fly event has been stopped by a GM!', xi.msg.channel.SYSTEM_3, 0)
            end
end

return commandObj