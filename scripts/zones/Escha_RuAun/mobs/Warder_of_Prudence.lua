-----------------------------------
-- Area: Escha RuAun
--  Mob: Warder of Prudence
-----------------------------------
local ID = zones[xi.zone.ESCHA_RUAUN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ESCHAN_HPEMDE) do
    entity.phList[phId] = ID.mob.WARDER_OF_PRUDENCE
end

entity.onMobDeath = function(mob, player, optParams)
    local keyItemChance = math.random(1,100)

    if not player:hasKeyItem(xi.ki.SENARY_NAZAR) then
        if keyItemChance <= 15 then
            npcUtil.giveKeyItem(player, xi.ki.SENARY_NAZAR)
        end
    end
end

entity.onMobDespawn = function(mob)

end

return entity
