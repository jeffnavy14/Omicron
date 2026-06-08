-- func: !travel
-- desc: Teleports a player to the given City or Town.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'b'
}

local zoneList =
{
    { 0x14, 0x56, xi.zone.BASTOK_MARKETS, -316.0894,-15.0013,-67.9380, 1},
    { 0x14, 0x46, xi.zone.BASTOK_MINES},
    { 0x14, 0x3C, xi.zone.PORT_BASTOK},
    { 0x14, 0x2F, xi.zone.METALWORKS, -43.8805,-10.0000,-0.5601},
    { 0x14, 0x4C, xi.zone.SOUTHERN_SAN_DORIA},
    { 0x14, 0x30, xi.zone.NORTHERN_SAN_DORIA},
    { 0x14, 0x52, xi.zone.PORT_SAN_DORIA},
    { 0x14, 0x22, xi.zone.CHATEAU_DORAGUILLE, -7.7750, 0.0000, -12.1987, 226},
    { 0x14, 0x3A, xi.zone.WINDURST_WATERS},
    { 0x14, 0x54, xi.zone.WINDURST_WALLS},
    { 0x14, 0x45, xi.zone.PORT_WINDURST},
    { 0x14, 0x38, xi.zone.WINDURST_WOODS},
    { 0x14, 0x55, xi.zone.HEAVENS_TOWER},
    { 0x14, 0x13, xi.zone.RULUDE_GARDENS},
    { 0x14, 0x4E, xi.zone.UPPER_JEUNO},
    { 0x14, 0x0E, xi.zone.LOWER_JEUNO},
    { 0x14, 0x06, xi.zone.PORT_JEUNO},
    { 0x14, 0x31, xi.zone.RABAO},
    { 0x14, 0x5F, xi.zone.SELBINA},
    { 0x14, 0x1E, xi.zone.MHAURA},
    { 0x14, 0x09, xi.zone.NORG},
    { 0x14, 0x29, xi.zone.KAZHAM},
    { 0x14, 0x8F, xi.zone.TAVNAZIAN_SAFEHOLD},
    { 0x14, 0xBB, xi.zone.AL_ZAHBI},
    { 0x14, 0xBC, xi.zone.AHT_URHGAN_WHITEGATE},
    { 0x14, 0xBF, xi.zone.NASHMAU},
    { 0x27, 0x1C, xi.zone.BASTOK_MARKETS_S},
    { 0x27, 0x11, xi.zone.SOUTHERN_SAN_DORIA_S},
    { 0x27, 0x2B, xi.zone.WINDURST_WATERS_S},
    { 0x27, 0x4C, xi.zone.WESTERN_ADOULIN},
    { 0x27, 0x4D, xi.zone.EASTERN_ADOULIN},
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!travel <autotranslate phrase>')
end

local function getBytePos(s, needle)
    for i = 1, string.len(s), 1 do
        if string.byte(s, i) == needle then
            return i
        end
    end

    return nil
end

commandObj.onTrigger = function(player, bytes)
    if player:getCharVar('inJail') > 0 then
        error(player, 'You are in jail buddy....you aint going no where!')
        return
    end
    
    local x = 0
    local y = 0
    local z = 0
    local rot = 0
    local zone

    if bytes == nil then
        error(player, 'Use the <autotranslate> for a City or Town.')
        return
    end

    bytes = string.sub(bytes, 6)
    local atpos = getBytePos(bytes, 253)

    if atpos ~= nil then
        local groupId = string.byte(bytes, atpos + 3)
        local messageId = string.byte(bytes, atpos + 4)
        for k, v in pairs(zoneList) do
            if v[1] == groupId and v[2] == messageId then
                x = v[4] or 0
                y = v[5] or 0
                z = v[6] or 0
                rot = v[7] or 0 -- Use the rotation value from the zone table
                zone = v[3]
                break
            end
        end
        if zone == nil then
            error(player, 'Auto-translated phrase is not a zone.')
            return
        end
    else
        zone = tonumber(bytes)
        if zone == nil or zone < 0 or zone >= xi.zone.MAX_ZONE then
            error(player, 'Invalid Zone or did not use Auto Translate.')
            return
        end
        for k, v in pairs(zoneList) do
            if v[3] == zone then
                x = v[4] or 0
                y = v[5] or 0
                z = v[6] or 0
                rot = 0
                zone = v[3]
                break
            end
        end
    end

    -- Check for enmity before displaying the menu
    if xi.customutil.hasEnmity(player) == true then
        player:printToPlayer("You can't use this command when you or a party member has Enmity.")
        return
    end

-- Check for Pure White Feather requirement for specific zones
if (zone == xi.zone.BASTOK_MARKETS_S or zone == xi.zone.SOUTHERN_SAN_DORIA_S or zone == xi.zone.WINDURST_WATERS_S) then
    if not player:hasKeyItem(xi.ki.PURE_WHITE_FEATHER) then
        player:printToPlayer('You need the Pure White Feather Key Item to access this zone.')
        return
    end
end

    -- Check if the player is trying to teleport to Aht Urhgan Whitegate or Al Zahbi
    if (zone == xi.zone.AHT_URHGAN_WHITEGATE or zone == xi.zone.NASHMAU or zone == xi.zone.AL_ZAHBI) and not player:hasKeyItem(xi.ki.BOARDING_PERMIT) then
        player:printToPlayer('You need a Boarding Permit to access this zone.')
        return
    end

    player:injectActionPacket(player:getID(), 5, 235, 0, 0, 0, 10, 1)

    player:timer(2000, function()
        player:setPos(x, y, z, rot, zone)
    end)
end

return commandObj
