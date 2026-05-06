-----------------------------------
-- Area: Abyssea Vunkerl
--  Mob: Ironclad_Executioner
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:hideName(true)
    mob:setAnimationSub(5)
    mob:wait(500)
    mob:setMobMod(xi.mobMod.ROAM_DISTANCE,0)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO,1)
end

entity.onMobEngage = function(mob, target)
    mob:hideName(false)
    mob:setAnimationSub(4)
    mob:setUntargetable(false)
    mob:wait(500)
end

entity.onMobDisengage = function(mob)
    mob:hideName(true)
    mob:setAnimationSub(5)
end
entity.onMobDeath = function(mob, player, isKiller)
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 3293)
        else
            local obtained = member:addItem(3293, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 3293)
            end
        end
     end
end

return entity
