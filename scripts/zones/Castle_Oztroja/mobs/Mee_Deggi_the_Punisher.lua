-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Mee Deggi the Punisher
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local ID = zones[xi.zone.CASTLE_OZTROJA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList =
{
    [ID.mob.MEE_DEGGI_THE_PUNISHER - 39] = ID.mob.MEE_DEGGI_THE_PUNISHER, -- Yagudo_Interrogator: -207.370 -0.056 106.537
    [ID.mob.MEE_DEGGI_THE_PUNISHER - 31] = ID.mob.MEE_DEGGI_THE_PUNISHER, -- Yagudo_Interrogator: -188.253 -0.087 158.955
    [ID.mob.MEE_DEGGI_THE_PUNISHER - 16] = ID.mob.MEE_DEGGI_THE_PUNISHER, -- Yagudo_Interrogator: -254.302 -0.057 163.759
    [ID.mob.MEE_DEGGI_THE_PUNISHER - 1]  = ID.mob.MEE_DEGGI_THE_PUNISHER, -- Yagudo_Interrogator: -227.415 -4.340 145.213
    [ID.mob.MEE_DEGGI_THE_PUNISHER - 34] = ID.mob.MEE_DEGGI_THE_PUNISHER, -- Yagudo_Drummer:      -178.119 -0.644 153.039
    [ID.mob.MEE_DEGGI_THE_PUNISHER - 25] = ID.mob.MEE_DEGGI_THE_PUNISHER, -- Yagudo_Drummer:      -235.639 -0.063 103.280
    [ID.mob.MEE_DEGGI_THE_PUNISHER - 17] = ID.mob.MEE_DEGGI_THE_PUNISHER, -- Yagudo_Drummer:      -233.116 -0.741 172.067
    [ID.mob.MEE_DEGGI_THE_PUNISHER - 2]  = ID.mob.MEE_DEGGI_THE_PUNISHER, -- Yagudo_Drummer:      -207.840 -0.498 109.939
}

entity.onMobDeath = function(mob, player, optParams)
end

return entity
