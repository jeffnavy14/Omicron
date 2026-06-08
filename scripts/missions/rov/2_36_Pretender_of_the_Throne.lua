-----------------------------------
-- PRETENDER_TO_THE_THRONE
-- Rhapsodies of Vana'diel Mission 2-36
-----------------------------------
-- !addmission 13 126
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.PRETENDER_TO_THE_THRONE )

mission.reward =
{
    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.BANISHED},
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
                onTrigger = function(player, npc, mob)
                 if npc:getID() == 17961682 and player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.PRETENDER_TO_THE_THRONE then
                     local nmBalamor = npc:getZone():queryEntitiesByName('Balamor')[2]
                        if not nmBalamor:isSpawned() then
                            SpawnMob(nmBalamor:getID()):updateClaim(player)
                        elseif mission:getVar(player, 'Status') == 1 then
                            player:startEvent(7)
                        end
                 end
                end,
            },
            onEventFinish =
            {
                [7] = function(player, csid, option, npc)
                    npcUtil.giveItem(player, 10172)
                    mission:complete(player)
                end,
            },

            ['Balamor'] =
            {
                onMobDeath = function(mob, player, isKiller, noKiller)
                    mission:setVar(player, 'Status', 1)
                end,
            },
        },
    },
}

return mission
