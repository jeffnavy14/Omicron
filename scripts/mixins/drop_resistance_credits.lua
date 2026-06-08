require('scripts/globals/mixins')
require("scripts/utils/utils")

g_mixins = g_mixins or {}

-----------------------------------
-- Drops Resistance credits
-----------------------------------
g_mixins.drop_resistance_credit = function(mob)
    mob:addListener('DEATH', 'RESISTANCE_MOB_DEATH', function(mob, player)
        if not player or not mob:isNM() then
            return
        end

        local alliance = player:getAlliance() or { player }
        local difficulty = player:checkDifficulty(mob) or 0
        local modifier = 5 * difficulty

        if modifier <= 0 then
            modifier = math.random(15, 35)
        end

        for _, member in pairs(alliance) do
            member:addCurrency('resistance_credit', modifier)
            member:printToPlayer(string.format('%s has obtained %s Resistance Credits.', member:getName(), modifier), xi.msg.channel.SYSTEM_3)
        end
    end)
end

return g_mixins.drop_resistance_credit
