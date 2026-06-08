-----------------------------------
-- THE_MAN_BEHIND_THE_MASK
-- Rhapsodies of Vana'diel Mission 2-40
-----------------------------------
-- !addmission 13 142
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.THE_MAN_BEHIND_THE_MASK)

mission.reward =
{
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.UNCERTAIN_FUTURES },
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
                        player:hasCompletedMission(xi.mission.log_id.ROV, xi.mission.id.rov.BOTH_PATHS_TAKEN)
                    then
                        player:startEvent(290)
                    end
                end,
            },
            onEventFinish =
            {
                [290] = function(player, csid, option, npc)
                    if option == 1 then
                    npcUtil.giveKeyItem(player, xi.ki.RHAPSODY_IN_EMERALD)
                    mission:complete(player)
                    end
                end,

            },
        },
    },
}

return mission
