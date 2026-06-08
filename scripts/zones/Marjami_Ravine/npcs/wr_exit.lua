-----------------------------------
-- Zone:  Marjami_Ravine
-- NPC: wr_exit (???)
-- Wild Reives Exit
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
            return
    else
        player:startEvent(2007)
    end
end

return entity
