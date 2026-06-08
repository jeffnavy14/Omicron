-----------------------------------
-- Area: Escha RuAun
--  Mob: Warder of Hope
-----------------------------------
local ID = zones[xi.zone.ESCHA_RUAUN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ESCHAN_PHUABO) do
    entity.phList[phId] = ID.mob.WARDER_OF_HOPE
end

entity.onMobSpawn = function(mob)
    mob:setAnimationSub(6)
    mob:setUntargetable(false)
    mob:setAutoAttackEnabled(true)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
end

entity.onMobDeath = function(mob, player, optParams)
    local keyItemChance = math.random(1,100)

    if not player:hasKeyItem(xi.ki.QUINARY_NAZAR) then
        if keyItemChance <= 15 then
            npcUtil.giveKeyItem(player, xi.ki.QUINARY_NAZAR)
        end
    end
end

entity.onMobDespawn = function(mob)

end

return entity
