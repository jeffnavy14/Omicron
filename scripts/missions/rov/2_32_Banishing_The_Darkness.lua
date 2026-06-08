-----------------------------------
-- BANISHING_THE_DARKNESS
-- Rhapsodies of Vana'diel Mission 2-32
-----------------------------------
-- !addmission 13 118
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.BANISHING_THE_DARKNESS)

mission.reward =
{
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.OVER_THE_RAINBOW},
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.NORG] =
        {
            ['_700'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasCompletedMission(xi.mission.log_id.ROV, xi.mission.id.rov.FALL_FROM_GRACE)
                    then
                        player:startEvent(288)
                    end
                end,
            },
            onEventFinish =
            {
                [288] = function(player, csid, option, npc)
                    if option == 0 then
                    mission:complete(player)
                    end
                end,

            },
        },
    },
}

return mission
