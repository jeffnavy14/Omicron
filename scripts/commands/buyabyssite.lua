-----------------------------------
-- func: buyabyssite
-- desc: Buys a Clear Abyssite for 1000 gil and removes other Voidwatch abyssites applicable to the zone.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

local zoneAbyssites = {
    [xi.zone.EAST_RONFAURE]             = xi.keyItem.BLUE_ABYSSITE,
    [xi.zone.EAST_RONFAURE_S]           = xi.keyItem.BLUE_ABYSSITE,
    [xi.zone.JUGNER_FOREST]             = xi.keyItem.BLUE_ABYSSITE,
    [xi.zone.JUGNER_FOREST_S]           = xi.keyItem.BLUE_ABYSSITE,
    [xi.zone.NORTH_GUSTABERG]           = xi.keyItem.ORANGE_ABYSSITE,
    [xi.zone.NORTH_GUSTABERG_S]         = xi.keyItem.ORANGE_ABYSSITE,
    [xi.zone.PASHHOW_MARSHLANDS]        = xi.keyItem.ORANGE_ABYSSITE,
    [xi.zone.PASHHOW_MARSHLANDS_S]      = xi.keyItem.ORANGE_ABYSSITE,
    [xi.zone.WEST_SARUTABARUTA]         = xi.keyItem.BROWN_ABYSSITE,
    [xi.zone.WEST_SARUTABARUTA_S]       = xi.keyItem.BROWN_ABYSSITE,
    [xi.zone.MERIPHATAUD_MOUNTAINS]     = xi.keyItem.BROWN_ABYSSITE,
    [xi.zone.MERIPHATAUD_MOUNTAINS_S]   = xi.keyItem.BROWN_ABYSSITE,
    [xi.zone.BATALLIA_DOWNS]            = xi.keyItem.YELLOW_ABYSSITE,
    [xi.zone.BATALLIA_DOWNS_S]          = xi.keyItem.YELLOW_ABYSSITE,
    [xi.zone.ROLANBERRY_FIELDS]         = xi.keyItem.YELLOW_ABYSSITE,
    [xi.zone.ROLANBERRY_FIELDS_S]       = xi.keyItem.YELLOW_ABYSSITE,
    [xi.zone.SAUROMUGUE_CHAMPAIGN]      = xi.keyItem.YELLOW_ABYSSITE,
    [xi.zone.SAUROMUGUE_CHAMPAIGN_S]    = xi.keyItem.YELLOW_ABYSSITE,
    [xi.zone.BEAUCEDINE_GLACIER]        = xi.keyItem.PURPLE_ABYSSITE,
    [xi.zone.BEAUCEDINE_GLACIER_S]      = xi.keyItem.PURPLE_ABYSSITE,
    [xi.zone.XARCABARD]                 = xi.keyItem.PURPLE_ABYSSITE,
    [xi.zone.XARCABARD_S]               = xi.keyItem.PURPLE_ABYSSITE,
    [xi.zone.KONSCHTAT_HIGHLANDS]       = xi.keyItem.GREY_ABYSSITE,
    [xi.zone.LA_THEINE_PLATEAU]         = xi.keyItem.GREY_ABYSSITE,
    [xi.zone.TAHRONGI_CANYON]           = xi.keyItem.GREY_ABYSSITE,
}

commandObj.onTrigger = function(player)
    local zoneId = player:getZoneID()
    local specificAbyssite = zoneAbyssites[zoneId]

    if not specificAbyssite then
        player:printToPlayer("This command cannot be used in this zone.")
        return
    end

    local menu = {
        title = "Voidwatch Abyssite Management",
        options = {
            { "Buy Clear Abyssite (1,000 Gil)", function(p)
                local confirmMenu = {
                    title = "Buy Clear Abyssite for 1,000 Gil?",
                    options = {
                        { "Yes", function(p2)
                            if p2:hasKeyItem(xi.keyItem.CLEAR_ABYSSITE) then
                                p2:printToPlayer("You already possess a Clear Abyssite.")
                                return
                            end
                            if p2:getGil() < 1000 then
                                p2:printToPlayer("You do not have enough gil (1,000).")
                                return
                            end
                            p2:delGil(1000)
                            local ID = zones[p2:getZoneID()]
                            p2:addKeyItem(xi.keyItem.CLEAR_ABYSSITE)
                            p2:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.keyItem.CLEAR_ABYSSITE)
                        end },
                        { "No", function(p2) end }
                    }
                }
                p:timer(50, function(pTimer) pTimer:customMenu(confirmMenu) end)
            end },
            { "Delete Zone Abyssites", function(p)
                local confirmMenu = {
                    title = "Delete Voidwatch Abyssites for this zone?",
                    options = {
                        { "Yes", function(p2)
                            local ID = zones[p2:getZoneID()]
                            local removed = false
                            if p2:hasKeyItem(xi.keyItem.COLORFUL_ABYSSITE) then
                                p2:delKeyItem(xi.keyItem.COLORFUL_ABYSSITE)
                                p2:messageSpecial(ID.text.KEYITEM_OBTAINED + 1, xi.keyItem.COLORFUL_ABYSSITE)
                                removed = true
                            end
                            if p2:hasKeyItem(xi.keyItem.BLACK_ABYSSITE) then
                                p2:delKeyItem(xi.keyItem.BLACK_ABYSSITE)
                                p2:messageSpecial(ID.text.KEYITEM_OBTAINED + 1, xi.keyItem.BLACK_ABYSSITE)
                                removed = true
                            end
                            if p2:hasKeyItem(specificAbyssite) then
                                p2:delKeyItem(specificAbyssite)
                                p2:messageSpecial(ID.text.KEYITEM_OBTAINED + 1, specificAbyssite)
                                removed = true
                            end
                            if removed then
                                p2:printToPlayer("Previous Voidwatch abyssites for this zone have been removed.")
                            else
                                p2:printToPlayer("No applicable Voidwatch abyssites found to remove.")
                            end
                        end },
                        { "No", function(p2) end }
                    }
                }
                p:timer(50, function(pTimer) pTimer:customMenu(confirmMenu) end)
            end },
            { "Cancel", function(p) end }
        }
    }
    player:customMenu(menu)
end

return commandObj
