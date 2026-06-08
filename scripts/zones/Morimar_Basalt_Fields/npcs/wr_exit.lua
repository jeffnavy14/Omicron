-----------------------------------
-- Zone:  Morimar_Basalt_Fields
-- NPC: wr_exit (???)
-- Wild Reives Exit
-----------------------------------
local ID = zones[xi.zone.MORIMAR_BASALT_FIELDS]
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local zone          = npc:getZone()
    local mob = zone:queryEntitiesByName('Achuka')
    local Achuka = mob[1]

    if Achuka and
        Achuka:isEngaged() then
            return
    else
        player:startEvent(2007)
    end
end

return entity
