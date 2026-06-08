-----------------------------------
-- Area: Reisenjima
--  Mob: Water_Elemental
-- Note: PH for Ascended_Ungeweder & Ascended_Gefyrst
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local random = math.random(1,2)
    local params =
    {
        immediate = true,
        spawnPoints = { { x = mob:getXPos(), y = mob:getYPos(), z = mob:getZPos() } }
    }

    local rareEnemyMod = 10 + player:getCharVar('[Vorseal]Rare Enemy')

    if not player:hasKeyItem(xi.ki.MOLLIFIER) then
        if random == 1 then 
            xi.mob.phOnDespawn(mob, ID.mob.ASCENDED_UNGEWEDER, rareEnemyMod, 180, params)
        else
            xi.mob.phOnDespawn(mob, ID.mob.ASCENDED_GEFYRST, rareEnemyMod, 180, params)
        end
    end
end

entity.onMobDespawn = function(mob)

end

return entity
