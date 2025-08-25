-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Soulstealer Skullnix
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local ID = zones[xi.zone.LABYRINTH_OF_ONZOZO]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList =
{
    [ID.mob.SOULSTEALER_SKULLNIX + 20] = ID.mob.SOULSTEALER_SKULLNIX, -- Goblin_Shepherd:  38.347 5.500 178.050
    [ID.mob.SOULSTEALER_SKULLNIX + 25] = ID.mob.SOULSTEALER_SKULLNIX, -- Goblin_Shepherd:  41.150 5.026 204.483
    [ID.mob.SOULSTEALER_SKULLNIX + 16] = ID.mob.SOULSTEALER_SKULLNIX, -- Goblin_Mercenary: 43.103 5.677 181.977
    [ID.mob.SOULSTEALER_SKULLNIX + 13] = ID.mob.SOULSTEALER_SKULLNIX, -- Goblin_Bandit:    5.096 3.930 166.865
}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 298)
    xi.regime.checkRegime(player, mob, 771, 2, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 772, 2, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 774, 2, xi.regime.type.GROUNDS)
end

return entity
