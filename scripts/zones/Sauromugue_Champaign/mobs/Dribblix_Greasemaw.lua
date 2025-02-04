-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Dribblix Greasemaw
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if
        not player:hasKeyItem(xi.ki.SEEDSPALL_VIRIDIS) and
        not player:hasKeyItem(xi.ki.VIRIDIAN_KEY)
    then
        npcUtil.giveKeyItem(player, xi.ki.SEEDSPALL_VIRIDIS)
    end
end

return entity
