-----------------------------------
-- ESCHA_RUAUN
-- Rhapsodies of Vana'diel Mission 2-29
-----------------------------------
-- !addmission 13 110
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.ESCHA_RUAUN)

mission.reward =
{
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.THE_DECISIVE_HEROINE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.MISAREAUX_COAST] =
        {
            ['Undulating_Confluence'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasCompletedMission(xi.mission.log_id.ROV, xi.mission.id.rov.TO_THE_SKIES)
                    then
                        player:startEvent(18)
                    end
                end,
            },
            onEventFinish =
            {
                [18] = function(player, csid, option, npc)
                    xi.teleport.to(player, xi.teleport.id.ESCHA_RUAUN)
                end,
            },
        },
    },

    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.ESCHA_RUAUN] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                    return 2
                end,
            },
            onEventFinish =
            {
                [2] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
