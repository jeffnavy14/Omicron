-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Quu Domi the Gallant
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local ID = zones[xi.zone.CASTLE_OZTROJA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList =
{
    [ID.mob.QUU_DOMI_THE_GALLANT - 39] = ID.mob.QUU_DOMI_THE_GALLANT, -- Yagudo_Oracle: 46.861 0.343 -176.989
    [ID.mob.QUU_DOMI_THE_GALLANT - 25] = ID.mob.QUU_DOMI_THE_GALLANT, -- Yagudo_Oracle: 67.103 -0.079 -176.981
    [ID.mob.QUU_DOMI_THE_GALLANT - 17] = ID.mob.QUU_DOMI_THE_GALLANT, -- Yagudo_Oracle: 99.000 -0.181 -149.000
    [ID.mob.QUU_DOMI_THE_GALLANT - 2]  = ID.mob.QUU_DOMI_THE_GALLANT, -- Yagudo_Oracle: 35.847 -0.500 -101.685
    [ID.mob.QUU_DOMI_THE_GALLANT - 41] = ID.mob.QUU_DOMI_THE_GALLANT, -- Yagudo_Herald: 33.832 -0.068 -176.627
    [ID.mob.QUU_DOMI_THE_GALLANT - 33] = ID.mob.QUU_DOMI_THE_GALLANT, -- Yagudo_Herald: 18.545 -0.056 -120.283
    [ID.mob.QUU_DOMI_THE_GALLANT - 26] = ID.mob.QUU_DOMI_THE_GALLANT, -- Yagudo_Herald: 103.948 -1.250 -189.869
    [ID.mob.QUU_DOMI_THE_GALLANT - 3]  = ID.mob.QUU_DOMI_THE_GALLANT, -- Yagudo_Herald: 59.000 -4.000 -131.000
}

entity.onMobDeath = function(mob, player, optParams)
end

return entity
