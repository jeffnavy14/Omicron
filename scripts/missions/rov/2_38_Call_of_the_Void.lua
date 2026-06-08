-----------------------------------
-- CALL_OF_THE_VOID
-- Rhapsodies of Vana'diel Mission 2-38
-----------------------------------
-- !addmission 13 132
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.CALL_OF_THE_VOID)

mission.reward =
{
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.BOTH_PATHS_TAKEN},
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [xi.zone.KONSCHTAT_HIGHLANDS] =
        {
            ['Dimensional_Portal'] =
            {
                onTrigger = function(player, npc)
                player:startEvent(6)
                end,
            },
            onEventFinish =
            {
                [6] = function(player, csid, option, npc)
                if option == 0 then
                        player:setPos(540.0, 0.0, -514.0, 63, xi.zone.EMPYREAL_PARADOX)
                end
                end,
            },
        },
        [xi.zone.LA_THEINE_PLATEAU] =
        {
            ['Dimensional_Portal'] =
            {
                onTrigger = function(player, npc)
                player:startEvent(17)
                end,
            },
            onEventFinish =
            {
                [17] = function(player, csid, option, npc)
                if option == 0 then
                        player:setPos(540.0, 0.0, -514.0, 63, xi.zone.EMPYREAL_PARADOX)
                end
                end,
            },
        },
        [xi.zone.TAHRONGI_CANYON] =
        {
            ['Dimensional_Portal'] =
            {
                onTrigger = function(player, npc)
                player:startEvent(44)
                end,
            },
            onEventFinish =
            {
                [44] = function(player, csid, option, npc)
                if option == 0 then
                        player:setPos(540.0, 0.0, -514.0, 63, xi.zone.EMPYREAL_PARADOX)
                end
                end,
            },
        },
        [xi.zone.EMPYREAL_PARADOX] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                    return 9
                end,
            },
            onEventFinish =
            {
                [9] = function(player, csid, option, npc)
                    if option == 1 then
                        npcUtil.giveItem(player, 10173)
                        mission:complete(player)
                    end
                end,
            },
        },
    },
}

return mission
