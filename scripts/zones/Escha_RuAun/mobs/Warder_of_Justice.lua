-----------------------------------
-- Area: Escha RuAun
--  Mob: Warder of Justice
-----------------------------------
local ID = zones[xi.zone.ESCHA_RUAUN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ESCHAN_XZOMIT) do
    entity.phList[phId] = ID.mob.WARDER_OF_JUSTICE
end

entity.onMobDeath = function(mob, player, optParams)
    local keyItemChance = math.random(1,100)

    if not player:hasKeyItem(xi.ki.QUATERNARY_NAZAR) then
        if keyItemChance <= 15 then
            npcUtil.giveKeyItem(player, xi.ki.QUATERNARY_NAZAR)
        end
    end
end

entity.onMobDespawn = function(mob)

end

return entity
