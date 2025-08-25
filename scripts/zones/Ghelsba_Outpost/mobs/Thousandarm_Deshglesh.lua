-----------------------------------
-- Area: Ghelsba Outpost (140)
--   NM: Thousandarm Deshglesh
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local ID = zones[xi.zone.GHELSBA_OUTPOST]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList =
{
    [ID.mob.THOUSANDARM_DESHGLESH - 9] = ID.mob.THOUSANDARM_DESHGLESH, -- Orcish_Stonechucker: 80.000 -0.249 328.000
    [ID.mob.THOUSANDARM_DESHGLESH - 6] = ID.mob.THOUSANDARM_DESHGLESH, -- Orcish_Stonechucker: 96.763 -0.047 319.781
    [ID.mob.THOUSANDARM_DESHGLESH - 2] = ID.mob.THOUSANDARM_DESHGLESH, -- Orcish_Stonechucker: 82.000 -0.500 366.000
    [ID.mob.THOUSANDARM_DESHGLESH - 8] = ID.mob.THOUSANDARM_DESHGLESH, -- Orcish_Neckchopper:  94.576 -1.274 333.168
    [ID.mob.THOUSANDARM_DESHGLESH - 5] = ID.mob.THOUSANDARM_DESHGLESH, -- Orcish_Neckchopper:  85.215 -0.739 344.257
    [ID.mob.THOUSANDARM_DESHGLESH - 1] = ID.mob.THOUSANDARM_DESHGLESH, -- Orcish_Neckchopper:  123.357 -0.102 332.706
    [ID.mob.THOUSANDARM_DESHGLESH - 7] = ID.mob.THOUSANDARM_DESHGLESH, -- Orcish_Grunt:        98.658 -0.319 328.269
}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 170)
end

return entity
