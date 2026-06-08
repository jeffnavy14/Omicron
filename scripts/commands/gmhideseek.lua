-----------------------------------

-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

commandObj.onTrigger = function(player)
    local lookz = player:getModelId()
    local namez = player:getName()
    local zoneOrInstanceObj = player:getZone()
    local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end
    local npc = zoneOrInstanceObj:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,
        name = 'GM - ' ..namez,
        look = 1548,
        x = player:getXPos(),
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),
        widescan = 0,

        onTrigger = function(player, npc)
        local playerz = player:getName()
        player:printToArea(string.format('GM %s : Congratulations %s, you have found me!!!!!!', namez, playerz), xi.msg.channel.SYSTEM_3, 0, '')
        player:printToArea(string.format('GM %s : Please see the GM Event NPC in the Hangout to claim your reward!',namez), xi.msg.channel.SYSTEM_3, 0, '')
        player:printToArea(string.format('GM %s : Thank you to everyone who participated in the event!',namez), xi.msg.channel.SYSTEM_3, 0, '')
        player:setCharVar('[GMEvent]HS', 1)
        npc:setStatus(xi.status.DISAPPEAR)
        end,
        player:printToArea(string.format('GM %s : Hide and Seek has started, come find me in %s!', namez, player:getZoneName()), xi.msg.channel.SYSTEM_3, 0, '')
    })
    utils.unused(npc)

end

return commandObj
