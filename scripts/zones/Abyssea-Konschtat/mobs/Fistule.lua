-----------------------------------
-- Area: Abyssea Konschtat
--  Mob: Fistule
-- Note: Spawn by dissolve Guimauve, Bloodguzzler or Lentor
-----------------------------------
---@type TMobEntity
local entity = {}

local getNearestMob = function(fistule, mobs)
    local results = {}
    for mobId, mob in pairs(mobs) do
        if mob:isSpawned() and mob:isAlive() then
            local distance = fistule:checkDistance(mob)
            table.insert(results, { mobId = mobId, distance = distance })
        end
    end

    table.sort(results, function(a, b)
        return a.distance < b.distance
    end)

    if #results > 0 then
        return results[1]
    else
        return nil
    end
end

entity.onMobSpawn = function(mob)
    mob:setUntargetable(false)
end

entity.onMobRoam = function(mob)
    local ID = zones[xi.zone.ABYSSEA_KONSCHTAT]
    local mobToAbsorb =
    {
        [ID.mob.BLOODGUZZLER] = GetMobByID(ID.mob.BLOODGUZZLER),
        [ID.mob.GUIMAUVE] = GetMobByID(ID.mob.GUIMAUVE),
        [ID.mob.LENTOR] = GetMobByID(ID.mob.LENTOR)
    }

    local nearestMob = getNearestMob(mob, mobToAbsorb)
    if nearestMob and nearestMob.distance <= 10 then
        local nearestMobToAbsorb = mobToAbsorb[nearestMob.mobId]
        if nearestMobToAbsorb then
            mob:useMobAbility(xi.mobSkill.DISSOLVE, nearestMobToAbsorb)
            mob:setLocalVar('[ClaimedBy]', nearestMobToAbsorb:getLocalVar('[ClaimedBy]'))
            mob:setUntargetable(false)
            nearestMobToAbsorb:timer(10000, function(nMob)
                nMob:setHP(0)
            end)
        end
    end
end

entity.onMobDeath = function(mob, player, isKiller)
    if player then
        player:addTitle(xi.title.FISTULE_DRAINER)
    end
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 2931)
        else
            local obtained = member:addItem(2931, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 2931)
            end
        end
     end
end

return entity
