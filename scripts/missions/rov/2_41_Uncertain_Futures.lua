-----------------------------------
-- UNCERTAIN_FUTURES
-- Rhapsodies of Vana'diel Mission 2-41
-----------------------------------
-- !addmission 13 144
-- Hall of Transference
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.UNCERTAIN_FUTURES)

mission.reward =
{
        keyItem = xi.ki.SONG_OF_HOPE,
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.DARKNESS_BECKONS},
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.PORT_SAN_DORIA] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.UNCERTAIN_FUTURES then
                    return 30042
                end
                end,
            },
            onEventFinish =
            {
                [30042] = function(player, csid, option, npc)
                    if option == 1 then
                        mission:complete(player)
                    end
                end,
            },
        },
        [xi.zone.SOUTHERN_SAN_DORIA] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.UNCERTAIN_FUTURES then
                    return 30042
                end
                end,
            },
            onEventFinish =
            {
                [30042] = function(player, csid, option, npc)
                    if option == 1 then
                        mission:complete(player)
                    end
                end,
            },
        },
        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.UNCERTAIN_FUTURES then
                    return 30042
                end
                end,
            },
            onEventFinish =
            {
                [30042] = function(player, csid, option, npc)
                    if option == 1 then
                        mission:complete(player)
                    end
                end,
            },
        },
        [xi.zone.WINDURST_WATERS] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.UNCERTAIN_FUTURES then
                    return 30042
                end
                end,
            },
            onEventFinish =
            {
                [30042] = function(player, csid, option, npc)
                    if option == 1 then
                        mission:complete(player)
                    end
                end,
            },
        },
        [xi.zone.WINDURST_WALLS] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.UNCERTAIN_FUTURES then
                    return 30042
                end
                end,
            },
            onEventFinish =
            {
                [30042] = function(player, csid, option, npc)
                    if option == 1 then
                        mission:complete(player)
                    end
                end,
            },
        },
        [xi.zone.PORT_WINDURST] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.UNCERTAIN_FUTURES then
                    return 30042
                end
                end,
            },
            onEventFinish =
            {
                [30042] = function(player, csid, option, npc)
                    if option == 1 then
                        mission:complete(player)
                    end
                end,
            },
        },
        [xi.zone.WINDURST_WOODS] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.UNCERTAIN_FUTURES then
                    return 30042
                end
                end,
            },
            onEventFinish =
            {
                [30042] = function(player, csid, option, npc)
                    if option == 1 then
                        mission:complete(player)
                    end
                end,
            },
        },
        [xi.zone.BASTOK_MINES] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.UNCERTAIN_FUTURES then
                    return 30042
                end
                end,
            },
            onEventFinish =
            {
                [30042] = function(player, csid, option, npc)
                    if option == 1 then
                        mission:complete(player)
                    end
                end,
            },
        },
        [xi.zone.BASTOK_MARKETS] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.UNCERTAIN_FUTURES then
                    return 30042
                end
                end,
            },
            onEventFinish =
            {
                [30042] = function(player, csid, option, npc)
                    if option == 1 then
                        mission:complete(player)
                    end
                end,
            },
        },
        [xi.zone.PORT_BASTOK] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.UNCERTAIN_FUTURES then
                    return 30042
                end
                end,
            },
            onEventFinish =
            {
                [30042] = function(player, csid, option, npc)
                    if option == 1 then
                        mission:complete(player)
                    end
                end,
            },
        },
    },
}

return mission
