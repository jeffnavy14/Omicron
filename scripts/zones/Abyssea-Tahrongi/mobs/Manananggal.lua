-----------------------------------
-- Area: Abyssea - Tahrongi
--   NM: Manananggal
-----------------------------------
mixins = { require('scripts/mixins/families/qutrub') }
-----------------------------------
---@type TMobEntity
local entity = {}

<<<<<<< HEAD

entity.onMobSpawn = function(mob)
            mob:setUntargetable(false)
end

entity.onMobRoam = function(mob)
end

entity.onMobDeath = function(mob, player, optParams)
end

=======
>>>>>>> upstream/base
return entity
