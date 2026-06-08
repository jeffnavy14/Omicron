-----------------------------------
-- Zone:  Yorcia_Weald
-- NPC: wr_exit (???)
-- Wild Reives Exit
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
            return
    else
        player:startEvent(2007)
    end
end

return entity
