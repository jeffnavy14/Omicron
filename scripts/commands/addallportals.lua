-----------------------------------
-- func: addallhp's'
-- desc: Adds all homepoints to the given player.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer('!addallportals <player>')
end

commandObj.onTrigger = function(player, target)
    local eschaPortals =
    {
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 ,21, 22, 23,
        24, 25 ,26, 27, 28, 29, 30, 31
    }
    local confIds =
    {
        -- [xi.zone.ABYSSEA_KONSCHTAT] 
        {0, 0},
        {1, 0},
        {2, 0},
        {3, 0},
        {4, 0},
        {5, 0},
        {6, 0},
        {7, 0},
        -- [xi.zone.ABYSSEA_TAHRONGI]
        {0, 1},
        {1, 1},
        {2, 1},
        {3, 1},
        {4, 1},
        {5, 1},
        {6, 1},
        {7, 1},
        -- [xi.zone.ABYSSEA_LA_THEINE]
        {0, 2},
        {1, 2},
        {2, 2},
        {3, 2},
        {4, 2},
        {5, 2},
        {6, 2},
        {7, 2},
        -- [xi.zone.ABYSSEA_ATTOHWA]
        {0, 3},
        {1, 3},
        {2, 3},
        {3, 3},
        {4, 3},
        {5, 3},
        {6, 3},
        {7, 3},
        {8, 3},
        -- [xi.zone.ABYSSEA_MISAREAUX]
        {0, 4},
        {1, 4},
        {2, 4},
        {3, 4},
        {4, 4},
        {5, 4},
        {6, 4},
        {7, 4},
        {8, 4},
        -- [xi.zone.ABYSSEA_VUNKERL]
        {0, 5},
        {1, 5},
        {2, 5},
        {3, 5},
        {4, 5},
        {5, 5},
        {6, 5},
        {7, 5},
        {8, 5},
        -- [xi.zone.ABYSSEA_ALTEPA]
        {0, 6},
        {1, 6},
        {2, 6},
        {3, 6},
        {4, 6},
        {5, 6},
        {6, 6},
        {7, 6},
        -- [xi.zone.ABYSSEA_ULEGUERAND]
        {0, 7},
        {1, 7},
        {2, 7},
        {3, 7},
        {4, 7},
        {5, 7},
        {6, 7},
        {7, 7},
        -- [xi.zone.ABYSSEA_GRAUBERG]
        {0, 8},
        {1, 8},
        {2, 8},
        {3, 8},
        {4, 8},
        {5, 8},
        {6, 8},
        {7, 8},
    }

    -- validate target
    local targ = player

    -- add conflux
    for _, v in ipairs(confIds) do
        targ:addTeleport(xi.teleport.type.ABYSSEA_CONFLUX, v[1], v[2])

    end

    -- add eschaPortals
    for _, v in ipairs(eschaPortals) do
        targ:addTeleport(xi.teleport.type.ESCHAN_PORTAL, v)
    end

        -- add all Runic Portals
    for i = 1,6 do
    targ:addTeleport(xi.teleport.type.RUNIC_PORTAL, i)
    end


    -- add all waypoints
    for i = 1,50 do
    targ:addTeleport(xi.teleport.type.WAYPOINT, i)
    end

    player:printToPlayer(string.format('%s now has all Abyssea Confluxs, Escha Portals and Adoulin Waypoints.', targ:getName()))
end

return commandObj
