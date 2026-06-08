-----------------------------------
-- Area: Provenance
--   NM: Crystal Fetter
local ID = zones[xi.zone.PROVENANCE]
-----------------------------------
---@type TMobEntity
local entity = {}

local position =
{
[ 1] = {-581.1092, -228.000, 563.1008,  80},
[ 2] = {-556.0296, -228.000, 531.0078, 160},
[ 3] = {-562.2274, -228.000, 515.8910, 210},
[ 4] = {-591.2932, -228.000, 511.0583, 254},
[ 5] = {-586.7713, -228.000, 512.0256, 230},
[ 6] = {-596.6984, -228.000, 518.6611, 218},
[ 7] = {-581.1092, -228.000, 563.1008,  80},
[ 8] = {-556.0296, -228.000, 531.0078, 160},
[ 9] = {-562.2274, -228.000, 515.8910, 210},
[10] = {-591.2932, -228.000, 511.0583, 254},
[11] = {-586.7713, -228.000, 512.0256, 230},
[12] = {-596.6984, -228.000, 518.6611, 218},
}

local function applyFetterAura(mob, target)
    local auraEffects =
    {
    [2139] = { xi.effect.BURN,  xi.effect.ATTACK_DOWN}, -- red fire
    [2140] = { xi.effect.FROST, xi.effect.MAGIC_ATK_DOWN}, -- light blu ice
    [2141] = { xi.effect.CHOKE, xi.effect.EVASION_DOWN}, -- green air
    [2142] = { xi.effect.RASP,  xi.effect.DEFENSE_DOWN}, -- brown earth
    [2143] = { xi.effect.SHOCK, xi.effect.ACCURACY_DOWN}, -- purple lightning
    [2144] = { xi.effect.DROWN, xi.effect.MAGIC_DEF_DOWN}, -- blue water
    [2145] = { xi.effect.DIA,   xi.effect.INHIBIT_TP}, -- white light
    [2146] = { xi.effect.BIO,   xi.effect.MAGIC_ACC_DOWN}, -- black dark
    }

    local modelId = mob:getLocalVar('FetterModel') -- 17686530

    for fetterModel, effect in pairs(auraEffects[modelId]) do
        -- Apply each effect individually without overwriting others
        mob:addStatusEffect(effect, { power = 10, subType = effect, subPower = 50, tick = 3, duration = 180, tier = xi.auraTarget.ENEMIES, flag = xi.effectFlag.AURA, origin = mob })
    end

end


entity.onMobInitialize = function(mob)
--DespawnMob(GetMobByID(ID.mob.CRYSTAL_FETTER))
end

entity.onMobSpawn = function(mob)
    local provenanceWatcher = GetMobByID(ID.mob.PROVENANCE_WATCHER)
    local model = math.random(2139,2146)

    if provenanceWatcher:isAlive() then
        mob:setModelId(model)
        mob:setLocalVar('FetterModel', model)
    end

    for location, newPOS in pairs(position) do
        if location == math.random(1,12) then
            mob:setSpawn(newPOS[1],newPOS[2],newPOS[3],newPOS[4])
        end
    end

    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
    applyFetterAura(mob)
end

entity.onMobEngage = function(mob,target)

end

entity.onMobDespawn = function(mob)
    local provenanceWatcher = GetMobByID(ID.mob.PROVENANCE_WATCHER)

    if GetMobByID(ID.mob.PROVENANCE_WATCHER):isAlive() then
        provenanceWatcher:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
        provenanceWatcher:delStatusEffect(xi.effect.ARROW_SHIELD)   
        provenanceWatcher:delStatusEffect(xi.effect.MAGIC_SHIELD)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    local provenanceWatcher = GetMobByID(ID.mob.PROVENANCE_WATCHER)

    if GetMobByID(ID.mob.PROVENANCE_WATCHER):isAlive() then
        provenanceWatcher:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
        provenanceWatcher:delStatusEffect(xi.effect.ARROW_SHIELD)   
        provenanceWatcher:delStatusEffect(xi.effect.MAGIC_SHIELD)
    end
end

return entity
