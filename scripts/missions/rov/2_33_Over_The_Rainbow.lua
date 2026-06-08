-----------------------------------
-- OVER_THE_RAINBOW
-- Rhapsodies of Vana'diel Mission 2-33
-----------------------------------
-- !addmission 13 120
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.OVER_THE_RAINBOW)

mission.reward =
{
    keyItem     = xi.ki.MOST_CURIOUS_CURIO,
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.CACOPHONOUS_DISCORD},
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.WINDURST_WALLS] =
        {
            ['Shantotto'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasCompletedMission(xi.mission.log_id.ROV, xi.mission.id.rov.BANISHING_THE_DARKNESS)
                    then
                        player:startEvent(548)
                    end
                end,
            },
            onEventFinish =
            {
                [548] = function(player, csid, option, npc)
                    if option == 0 then
                    mission:complete(player)
                    end
                end,

            },
        },
    },
}

return mission
