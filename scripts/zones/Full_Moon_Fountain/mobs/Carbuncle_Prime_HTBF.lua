-----------------------------------
-- Area: Full Moon Fountain
--  Mob: Carbuncle Prime
-- Involved in Quest: waking the beast II HTBF
local ID = zones[xi.zone.FULL_MOON_FOUNTAIN]
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local battlefield = mob:getBattlefield()
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
        mob:setLocalVar('numAdds', 6)

    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = 912, hpp = math.random(60, 85) }, -- uses Seering light once while near HPP.
            { id = 912, hpp = math.random(20, 45) }, -- uses Seering Light once while near HPP.
        },
    })
end

entity.onMobFight = function(mob, target)
    local battlefield = mob:getBattlefield()
    -- spawn avatars
    local numAdds = mob:getLocalVar('numAdds')

    if math.floor(mob:getHPP() * .1) == numAdds then
        local avaRemaining = {}
        for i = 1, 6 do
            if mob:getLocalVar('add'..i) == 0 then
                table.insert(avaRemaining, i)
            end
        end

        if #avaRemaining > 0 then
            local g   = avaRemaining[math.random(1, #avaRemaining)]
            local avatar = SpawnMob(ID.mob.CARBUNCLE_PRIME_HTBF + g)

            if avatar then
                avatar:updateEnmity(target)
                avatar:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos())
                mob:setLocalVar('add'..g, 1)
                mob:setLocalVar('numAdds', numAdds - 1)
                mob:addStatusEffect(xi.effect.PHYSICAL_SHIELD, { power = 1, origin = mob, icon = 0 })
                mob:addStatusEffect(xi.effect.ARROW_SHIELD, { power = 1, origin = mob, icon = 0 })
                mob:addStatusEffect(xi.effect.MAGIC_SHIELD, { power = 1, origin = mob, icon = 0 })

            end
        end
    end

    local addsAlive = false
    for i = 1, 6 do
        if mob:getLocalVar('add'..i) == 1 then
            local avatar = GetMobByID(ID.mob.CARBUNCLE_PRIME_HTBF + i)
            if avatar and avatar:isSpawned() and avatar:isAlive() then
                addsAlive = true
                break
            end
        end
    end

    if not addsAlive and mob:hasStatusEffect(xi.effect.PHYSICAL_SHIELD) then
        mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
        mob:delStatusEffect(xi.effect.ARROW_SHIELD)
        mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
    end
       
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
