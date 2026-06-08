-----------------------------------
-- func: getde
-- desc: displays the Dynamic Entities infomration in a zone if its spawned
-----------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 3,
    parameters = ""
}

-- function(player)
commandObj.onTrigger = function(player)


local zone = player:getZone()
    local filteredEntities = zone:queryEntitiesByName('DE.*')
    for _, name in pairs(filteredEntities) do 
        player:printToPlayer(string.format('%s', name))
    end
end

return commandObj

