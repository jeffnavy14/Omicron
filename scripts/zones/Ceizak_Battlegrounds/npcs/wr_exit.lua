-----------------------------------
-- Zone: Ceizak Battlegrounds
-- NPC: wr_exit (???)
-- Wild Reives Exit
-----------------------------------
local ID = zones[xi.zone.CEIZAK_BATTLEGROUNDS]
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local zone          = npc:getZone()
    local mob = zone:queryEntitiesByName('Colkhab')
    local Colkhab = mob[1]

    if Colkhab and
        Colkhab:isEngaged() then
            return
    else
        player:startEvent(2007)
    end
end

return entity
