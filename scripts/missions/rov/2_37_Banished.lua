-----------------------------------
-- BANISHED
-- Rhapsodies of Vana'diel Mission 2-37
-----------------------------------
-- !addmission 13 130
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.BANISHED)

mission.reward =
{
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.CALL_OF_THE_VOID },
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
                        player:hasCompletedMission(xi.mission.log_id.ROV, xi.mission.id.rov.PRETENDER_TO_THE_THRONE)
                    then
                        player:startEvent(289)
                    end
                end,
            },
            onEventFinish =
            {
                [289] = function(player, csid, option, npc)
                    if option == 0 then
                    mission:complete(player)
                    end
                end,

            },
        },
    },
}

return mission
