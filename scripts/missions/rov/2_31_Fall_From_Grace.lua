-----------------------------------
-- FALL_FROM_GRACE
-- Rhapsodies of Vana'diel Mission 2-31
-----------------------------------
-- !addmission 13 116
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.FALL_FROM_GRACE)

mission.reward =
{
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.BANISHING_THE_DARKNESS},
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.KONSCHTAT_HIGHLANDS] =
        {
            ['Shattered_Telepoint'] =
            {
                onTrigger = function(player, npc)
                player:startEvent(5)
                end,
            },
            onEventFinish =
            {
                [5] = function(player, csid, option, npc)
                if option == 0 then
                    mission:complete(player)
                end
                end,
            },
        },
        [xi.zone.LA_THEINE_PLATEAU] =
        {
            ['Shattered_Telepoint'] =
            {
                onTrigger = function(player, npc)
                player:startEvent(16)
                end,
            },
            onEventFinish =
            {
                [16] = function(player, csid, option, npc)
                if option == 0 then
                    mission:complete(player)
                end
                end,
            },
        },
        [xi.zone.TAHRONGI_CANYON] =
        {
            ['Shattered_Telepoint'] =
            {
                onTrigger = function(player, npc)
                player:startEvent(43)
                end,
            },
            onEventFinish =
            {
                [43] = function(player, csid, option, npc)
                if option == 0 then
                    mission:complete(player)
                end
                end,
            },
        },
    },
}

return mission
