-----------------------------------
-- Area: Fei'Yin
--   NM: Jenglot
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 348)
    -- Curses, Foiled A-Golem!?
    if (player:hasKeyItem(xi.ki.SHANTOTTOS_NEW_SPELL)) then
        player:delKeyItem(xi.ki.SHANTOTTOS_NEW_SPELL)
        player:addKeyItem(xi.ki.SHANTOTTOS_EX_SPELL)
    end
end

return entity
