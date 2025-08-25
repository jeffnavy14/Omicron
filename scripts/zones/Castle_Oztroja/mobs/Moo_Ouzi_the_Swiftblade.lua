-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Moo Ouzi the Swiftblade
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local ID = zones[xi.zone.CASTLE_OZTROJA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList =
{
    [ID.mob.MOO_OUZI_THE_SWIFTBLADE - 7] = ID.mob.MOO_OUZI_THE_SWIFTBLADE, -- -18.415 -0.075 -92.889
    [ID.mob.MOO_OUZI_THE_SWIFTBLADE - 3] = ID.mob.MOO_OUZI_THE_SWIFTBLADE, -- -38.689 0.191 -101.068
}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 303)
    xi.magian.onMobDeath(mob, player, optParams, set{ 892 })
end

return entity
