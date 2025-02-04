-----------------------------------
-- Area: Rolanberry Fields
--   NM: Chuglix Berrypaws
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if
        not player:hasKeyItem(xi.ki.SEEDSPALL_CAERULUM) and
        not player:hasKeyItem(xi.ki.VIRIDIAN_KEY)
    then
        npcUtil.giveKeyItem(player, xi.ki.SEEDSPALL_CAERULUM)
    end
end

return entity
