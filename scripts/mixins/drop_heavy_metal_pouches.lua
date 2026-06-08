require('scripts/globals/mixins')
require("scripts/utils/utils")

g_mixins = g_mixins or {}

-----------------------------------
-- Drops heavy metal pouches
-----------------------------------
g_mixins.drop_heavy_metal_pouches = function(mob)

    mob:addListener('DEATH', 'HEAVYMETAL_MOB_DEATH', function(mobArg, player)
        local ID = zones[mobArg:getZoneID()]
        local party = player:getParty()
        local rand = math.random(1,100)
        if rand <= 25 then
            if mobArg:isNM() then
                for _, member in pairs(party) do
                    if member:getFreeSlotsCount() == 0 then
                        member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 5910)
                    else
                        local obtained = member:addItem(5910, 1)

                        if obtained then
                            member:messageSpecial(ID.text.ITEM_OBTAINED, 5910)
                        end
                    end
                end
            end
        end
    end)
end

return g_mixins.drop_heavy_metal_pouches
