-----------------------------------
-- VISIONS_OF_DREAD
-- Rhapsodies of Vana'diel Mission 2-27
-----------------------------------
-- !addmission 13 106
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.VISIONS_OF_DREAD)

mission.reward =
{
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.TO_THE_SKIES },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,
        [xi.zone.HALL_OF_TRANSFERENCE] =
        {
            onEventUpdate =
            {
                [2] = function(player, csid, option, npc)
                    if option == 1 then
                        player:startEvent(4)
                    end
                end,
            },

            onEventFinish =
            {
                [4] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
