-----------------------------------
-- TO_THE_SKIES
-- Rhapsodies of Vana'diel Mission 2-28
-----------------------------------
-- !addmission 13 108
-----------------------------------
local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.TO_THE_SKIES)

mission.reward =
{
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.ESCHA_RUAUN },
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
                        player:hasCompletedMission(xi.mission.log_id.ROV, xi.mission.id.rov.VISIONS_OF_DREAD)
                    then
                        player:startEvent(287)
                    end
                end,
            },
            onEventFinish =
            {
                [287] = function(player, csid, option, npc)
                    if option == 0 then
                    mission:complete(player)
                    end
                end,

            },
        },
    },
}

return mission
