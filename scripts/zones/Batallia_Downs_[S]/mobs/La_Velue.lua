-----------------------------------
-- Area: Batallia Downs [S]
--   NM: La Velue
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.magian.onMobDeath(mob, player, optParams, set{ 6 })
    xi.hunts.checkHunt(mob, player, 491)
end

return entity
