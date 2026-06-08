-----------------------------------
-- Zone: Marjami_Ravine
-- NPC: wr_entrance (???)
-- Wild Reives Entrance
-----------------------------------
local ID = zones[xi.zone.MARJAMI_RAVINE]
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local zone          = npc:getZone()
    local mob = zone:queryEntitiesByName('Hurkan')
    local Hurkan = mob[1]

    if Hurkan and
        Hurkan:isEngaged() then
            player:startEvent(2008)
            return
    else
        player:startEvent(2008,1,2285,1,1,1,1)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    if option == 1 then
        player:updateEvent(1,2285,1,1,1,80)
    end
end

entity.onEventFinish = function(player, csid, option, npc)

end

return entity
