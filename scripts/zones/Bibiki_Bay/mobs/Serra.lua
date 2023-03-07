-----------------------------------
-- Area: Bibiki Bay
--   NM: Serra
-----------------------------------
require('scripts/globals/hunts')
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.magian.onMobDeath(mob, player, optParams, set{ 4 })
    xi.hunts.checkHunt(mob, player, 264)
end

return entity
