-----------------------------------
-- Zone: Yorcia_Weald
-- NPC: wr_entrance (???)
-- Wild Reives Entrance
-----------------------------------
local ID = zones[xi.zone.YORCIA_WEALD]
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local zone          = npc:getZone()
    local mob = zone:queryEntitiesByName('Yumcax')
    local Yumcax = mob[1]

    if Yumcax and
        Yumcax:isEngaged() then
            player:startEvent(2008)
            return
    else
        player:startEvent(2008,1,2284,1,1,1,1)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    if option == 1 then
        player:updateEvent(1,2284,1,1,1,80)
    end
end

entity.onEventFinish = function(player, csid, option, npc)

end

return entity
