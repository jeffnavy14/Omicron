-----------------------------------
-- Nyzul Boss Drop ID Mixin
-----------------------------------
require("scripts/globals/mixins")
require("scripts/globals/status")
-----------------------------------

xi = xi or {}
xi.mix = xi.mix or {}
g_mixins = g_mixins or {}

g_mixins.nyzul_boss_drop = function(nyzulMob)
    nyzulMob:addListener("SPAWN", "NYZUL_BOSS_SPAWN", function(mob)
        local instance = mob:getInstance()
        local result   = instance:getLocalVar("Nyzul_Current_Floor")

        if result == 20 then
            mob:setDropID(4800)
        elseif result == 40 then
            mob:setDropID(4801)
        elseif result == 60 then
            mob:setDropID(4802)
        elseif result == 80 then
            mob:setDropID(4803)
        elseif result == 100 then
            mob:setDropID(4804)
        end
    end)
end

return g_mixins.nyzul_boss_drop
