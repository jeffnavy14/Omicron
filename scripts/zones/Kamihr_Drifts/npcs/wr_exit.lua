-----------------------------------
-- Zone:  Kamihr_Drifts
-- NPC: wr_exit (???)
-- Wild Reives Exit
-----------------------------------
local ID = zones[xi.zone.KAMIHR_DRIFTS]
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local zone          = npc:getZone()
    local mob = zone:queryEntitiesByName('Kumhau')
    local Kumhau = mob[1]

    if Kumhau and
        Kumhau:isEngaged() then
            return
    else
        player:startEvent(2007)
    end
end

return entity
