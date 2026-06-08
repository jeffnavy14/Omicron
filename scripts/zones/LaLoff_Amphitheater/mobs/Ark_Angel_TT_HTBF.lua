-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel TT
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(xi.mod.UFASTCAST, 60)
end

entity.onMobSpawn = function(mob)
        mob:addMod(xi.mod.STR, 100) 
        mob:addMod(xi.mod.VIT, 100) 
        mob:addMod(xi.mod.INT, 100) 
        mob:addMod(xi.mod.MND, 100) 
        mob:addMod(xi.mod.CHR, 100) 
        mob:addMod(xi.mod.AGI, 100) 
        mob:addMod(xi.mod.DEX, 100) 
        mob:addMod(xi.mod.DEF, 100) 
        mob:addMod(xi.mod.RATT, 250) 
        mob:addMod(xi.mod.ACC, 375) 
        mob:addMod(xi.mod.ATT, 275) 
        mob:addMod(xi.mod.MATT, 250)
        mob:addMod(xi.mod.MACC, 250) 
        mob:addMod(xi.mod.MEVA, 200) 
        mob:addMod(xi.mod.MDEF, 200)
        mob:setMod(xi.mod.EVA, 100)
        mob:setMod(xi.mod.EARTH_SDT, 100)
        mob:setMod(xi.mod.DARK_SDT, 100)
        mob:setMod(xi.mod.LIGHT_SDT, 100)
        mob:setMod(xi.mod.ICE_SDT, 100)
        mob:setMod(xi.mod.FIRE_SDT, 100)
        mob:setMod(xi.mod.WATER_SDT, 100)
        mob:setMod(xi.mod.THUNDER_SDT, 100)
        mob:setMod(xi.mod.WIND_SDT, 100)
        mob:setMod(xi.mod.SILENCERES, 100) 
        mob:setMod(xi.mod.STUNRES, 50) 
        mob:setMod(xi.mod.BINDRES, 50) 
        mob:setMod(xi.mod.GRAVITYRES, 50) 
        mob:setMod(xi.mod.SLEEPRES, 50) 
        mob:setMod(xi.mod.POISONRES, 50) 
        mob:setMod(xi.mod.PARALYZERES, 50) 
        mob:setMod(xi.mod.LULLABYRES, 0) 
        mob:setMod(xi.mod.FASTCAST, 50)
        mob:addStatusEffect(xi.effect.REGEN,  { power = 25, tick = 3, duration = 0, origin = mob})
        mob:addStatusEffect(xi.effect.REGAIN,  { power = 10, tick = 3, duration = 0, origin = mob})
    xi.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            { id = xi.jsa.BLOOD_WEAPON },
            {
                id = xi.jsa.MANAFONT,
                endCode = function(mobArg) -- "Uses Manafont and ... Will cast Sleepga followed by Meteor."
                    mobArg:castSpell(273) -- sleepga
                    mobArg:castSpell(218) -- meteor
                end,
            },
        },
    })
end

entity.onMobEngage = function(mob, target)
    local mobid = mob:getID()

    for member = mobid-5, mobid + 2 do
        local m = GetMobByID(member)
        if m and m:getCurrentAction() == xi.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

entity.onMobFight = function(mob, target)
    if
        mob:hasStatusEffect(xi.effect.BLOOD_WEAPON) and
        bit.band(mob:getBehavior(), xi.behavior.STANDBACK) > 0
    then
        mob:setBehavior(bit.band(mob:getBehavior(), bit.bnot(xi.behavior.STANDBACK)))
        mob:setMobMod(xi.mobMod.TELEPORT_TYPE, 0)
        mob:setMobMod(xi.mobMod.SPAWN_LEASH, 0)
        mob:setSpellList(0)
    end

    if
        not mob:hasStatusEffect(xi.effect.BLOOD_WEAPON) and
        bit.band(mob:getBehavior(), xi.behavior.STANDBACK) == 0
    then
        mob:setBehavior(bit.bor(mob:getBehavior(), xi.behavior.STANDBACK))
        mob:setMobMod(xi.mobMod.TELEPORT_CD, 30)
        mob:setMobMod(xi.mobMod.TELEPORT_START, 936)
        mob:setMobMod(xi.mobMod.TELEPORT_END, 962)
        mob:setMobMod(xi.mobMod.TELEPORT_TYPE, 1)
        mob:setMobMod(xi.mobMod.SPAWN_LEASH, 22)
        mob:setSpellList(516)
    end

    mob:timer(30000, function(mobArg)
        mob:setBehavior(bit.band(mob:getBehavior(), bit.bnot(xi.behavior.STANDBACK)))
    end)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
