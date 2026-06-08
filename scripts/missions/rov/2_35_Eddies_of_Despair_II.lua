-----------------------------------
-- EDDIES_OF_DESPAIR_II
-- Rhapsodies of Vana'diel Mission 2-35
-----------------------------------
-- !addmission 13 124
-----------------------------------

local mission = Mission:new(xi.mission.log_id.ROV, xi.mission.id.rov.EDDIES_OF_DESPAIR_II)

mission.reward =
{

    nextMission = { xi.mission.log_id.ROV, xi.mission.id.rov.PRETENDER_TO_THE_THRONE},
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
                if npc:getID() == 17961682 and player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II then
                player:startEvent(6)
                    mission:complete(player)
                return elseif npc:getID() ~= 17961682 then
                npcUtil.giveItem(player, 9148)
                end
                end,
            },
            ['Eschan_Portal_#1'] =
            {
                onTrigger = function(player, npc)
                local amount = player:getCurrency('escha_silt')
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148) then
                player:startEvent(9100, 0, 2096959, 289, 8, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#2'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 9, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#3'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 10, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#4'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 319, 289, 11, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#5'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 12, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#6'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 13, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#7'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 14, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#8'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 15, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#9'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 16, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#10'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 17, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#11'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 18, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#12'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 19, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#13'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 20, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#14'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 21, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
            ['Eschan_Portal_#14'] =
            {
                onTrigger = function(player, npc)
                if player:getCurrentMission(xi.mission.log_id.ROV) == xi.mission.id.rov.EDDIES_OF_DESPAIR_II and player:hasItem(9148)  then
                player:startEvent(9100, 0, 2096959, 289, 7, 2, amount, 50)
                end
                end,
            },
            onEventFinish =
            {
                [9100] = function(player, csid, option, npc)
                if option == 3 then 
                  player:delItem(9148, 1)
                  return
                end
                end,
            },
        },
    },
}

return mission
