-----------------------------------
-- Area: Escha RuAun
--  Mob: Warder of Love
-----------------------------------
local ID = zones[xi.zone.ESCHA_RUAUN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ESCHAN_YOVRA) do
    entity.phList[phId] = ID.mob.WARDER_OF_LOVE
end

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
    mob:setUntargetable(true)
    mob:hideName(true)
end

entity.onMobEngage = function(mob, target)
    mob:hideName(false)
    mob:setUntargetable(false)
    mob:setAnimationSub(2)
end

entity.onMobDisengage = function(mob)
    mob:hideName(true)
    mob:setUntargetable(true)
    mob:setAnimationSub(1)
end

entity.onMobDeath = function(mob, player, optParams)
    local keyItemChance = math.random(1,100)

    if not player:hasKeyItem(xi.ki.SEPTENARY_NAZAR) then
        if keyItemChance <= 15 then
            npcUtil.giveKeyItem(player, xi.ki.SEPTENARY_NAZAR)
        end
    end
end

entity.onMobDespawn = function(mob)

end

return entity
