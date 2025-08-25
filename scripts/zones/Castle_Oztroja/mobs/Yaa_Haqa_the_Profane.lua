-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Yaa Haqa the Profane
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local ID = zones[xi.zone.CASTLE_OZTROJA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList =
{
    [ID.mob.YAA_HAQA_THE_PROFANE - 4] = ID.mob.YAA_HAQA_THE_PROFANE, -- Yagudo_Zealot:       -24.719 -16.250 -139.678
    [ID.mob.YAA_HAQA_THE_PROFANE - 1] = ID.mob.YAA_HAQA_THE_PROFANE, -- Yagudo_Prior:        -32.302 -16.250 -139.169
    [ID.mob.YAA_HAQA_THE_PROFANE - 2] = ID.mob.YAA_HAQA_THE_PROFANE, -- Yagudo_Lutenist:     -25.044 -16.250 -141.534
    [ID.mob.YAA_HAQA_THE_PROFANE - 3] = ID.mob.YAA_HAQA_THE_PROFANE, -- Yagudo_Conquistador: -22.395 -16.250 -139.341
}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 305)
end

return entity
