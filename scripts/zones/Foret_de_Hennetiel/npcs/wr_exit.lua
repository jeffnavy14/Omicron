-----------------------------------
-- Zone: Foret_de_Hennetiel
-- NPC: wr_exit (???)
-- Wild Reives Exit
-----------------------------------
local ID = zones[xi.zone.FORET_DE_HENNETIEL]
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local zone          = npc:getZone()
    local mob = zone:queryEntitiesByName('Tchakka')
    local Tchakka = mob[1]

    if Tchakka and
        Tchakka:isEngaged() then
            return
    else
        player:startEvent(2007)
    end
end

return entity
