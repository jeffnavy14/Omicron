-----------------------------------
-- Area: Abyssea - Uleguerand
--  Mob: Isgebind
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 3290)
        else
            local obtained = member:addItem(3290, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 3290)
            end
        end
     end
end

return entity
