-----------------------------------
-- Area: Cloister of Frost
-- Mob: Shiva Prime
-- Involved in Quest: Trial by Ice, HTBF
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = 884, hpp = math.random(60, 85) }, -- uses Diamond Dust once while near 50% HPP.
            { id = 884, hpp = math.random(20, 45) }, -- uses Diamond Dust once while near 50% HPP.
        },
    })
end

entity.onMobFight = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
