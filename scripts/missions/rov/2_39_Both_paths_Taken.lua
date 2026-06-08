-----------------------------------
-- BOTH_PATHS_TAKEN
-- Rhapsodies of Vana'diel Mission 2-39
-----------------------------------
-- !addmission 13 136
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.BOTH_PATHS_TAKEN)

mission.reward =
{
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.THE_MAN_BEHIND_THE_MASK },
}

mission.sections =
{
    -- 1: Finishing BCNM and Final CS
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId and missionStatus == 0
        end,

        [xi.zone.LA_THEINE_PLATEAU] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                        return 18
                end,
            },

            onEventFinish =
            {
                [18] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
