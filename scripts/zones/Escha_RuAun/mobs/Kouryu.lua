-----------------------------------
-- Area: Escha RuAun
--  Mob: Kouryu
-----------------------------------
local ID = zones[xi.zone.ESCHA_RUAUN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    -- Create a short overlap before despawning Kirin
    mob:timer(1500, function(m)
        local kirinId = m:getLocalVar('KirinID')
        if kirinId ~= 0 then
            local kirin = GetMobByID(kirinId)
            if kirin and kirin:isSpawned() then
                DespawnMob(kirinId)
            end
        end
    end)
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
