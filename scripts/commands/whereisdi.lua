-----------------------------------
-- func: whereisdi
-- desc: Tells players the current and next Domain Invasion locations
-----------------------------------
local controller = require("scripts/globals/di_controller")

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ""
}

local zoneNames =
{
    [xi.zone.ESCHA_ZITAH] = "Escha - Zi'Tah",
    [xi.zone.ESCHA_RUAUN] = "Escha - Ru'Aun",
    [xi.zone.REISENJIMA]  = "Reisenjima",
}

commandObj.onTrigger = function(player)
    local active = GetServerVariable("DI_ACTIVE")
    if active ~= 1 then
        player:printToPlayer("Domain Invasion is currently disabled.")
        return
    end

    local index = GetServerVariable("DI_ZONE_INDEX")
    if index == 0 then index = 1 end

    local currentZoneId = controller.zones[index]
    local nextIndex = (index % #controller.zones) + 1
    local nextZoneId = controller.zones[nextIndex]

    local nextSpawn = GetServerVariable("DI_NEXT_SPAWN")
    local currentZoneName = zoneNames[currentZoneId] or "Unknown"
    local nextZoneName = zoneNames[nextZoneId] or "Unknown"

    if nextSpawn > 0 then
        local wait = nextSpawn - os.time()
        if wait < 0 then wait = 0 end
        local minutes = math.floor(wait / 60)
        local seconds = wait % 60
        player:printToPlayer(string.format("The next Domain Invasion will begin in %s in %d:%02d.", currentZoneName, minutes, seconds))
    else
        local zone = GetZone(currentZoneId)
        local isMireu = zone and zone:getLocalVar("DI_IS_MIREU") == 1
        if isMireu then
            player:printToPlayer(string.format("Domain Invasion: MIREU is active in %s!", currentZoneName))
        else
            player:printToPlayer(string.format("Domain Invasion is currently ACTIVE in %s!", currentZoneName))
        end
    end

    player:printToPlayer(string.format("The following invasion will be held in %s.", nextZoneName))
end

return commandObj