-----------------------------------
-- THE_DECISIVE_HEROINE
-- Rhapsodies of Vana'diel Mission 2-30
-----------------------------------
-- !addmission 13 114
-- Hall of Transference
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.THE_DECISIVE_HEROINE)

mission.reward =
{
    keyItem     = xi.ki.SIRENS_PLUME,
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.FALL_FROM_GRACE},
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.ESCHA_RUAUN] =
        {
            ['qm'] =
            {
                onTrigger = function(player, npc)
                player:startEvent(4)
                end,
            },
            onEventFinish =
            {
                [4] = function(player, csid, option, npc)
                if option == 0 then
                    npcUtil.giveKeyItem(player, xi.ki.RHAPSODY_IN_EMERALD)
                    mission:complete(player)
                end
                end,
            },
        },
    },
}

return mission
