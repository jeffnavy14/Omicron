-----------------------------------
-- WHERE_DIVINITIES_COLLIDE
-- Rhapsodies of Vana'diel Mission 2-26
-----------------------------------
-- !addmission 13 104
-- Hall of Transference
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.WHERE_DIVINITIES_COLLIDE)

mission.reward =
{
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.VISIONS_OF_DREAD },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.HALL_OF_TRANSFERENCE] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                    if
                        player:hasCompletedMission(xi.mission.log_id.ROV, xi.mission.id.rov.WISDOM_OF_OUR_FOREFATHERS)
                    then
                    mission:complete(player)
                    return 2
                    end
                end,
            },
        },
    },
}

return mission
