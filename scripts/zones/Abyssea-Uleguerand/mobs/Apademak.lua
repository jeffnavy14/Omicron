-----------------------------------
-- Area: Abyssea - Uleguerand
--  Mob: Apademak
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 3289)
        else
            local obtained = member:addItem(3289, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 3289)
            end
        end
     end
end

return entity
