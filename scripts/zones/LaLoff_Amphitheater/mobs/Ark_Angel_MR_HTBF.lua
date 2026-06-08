-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel MR
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
local entity = {}

-- TODO: Allegedly has a 12 hp/sec regen.  Determine if true, and add to onMobInitialize if so.

local function spawnArkAngelPet(mob, target)
    local battlefield = mob:getBattlefield()
    if battlefield then
        local battlefieldId   = battlefield:getID()
        local battlefieldArea = battlefield:getArea()
        local content         = xi.battlefield.contents[battlefieldId]
        local selectedPet     = math.random(1, 2)

        mob:setAutoAttackEnabled(false)
        mob:setMobMod(xi.mobMod.NO_MOVE, 1)
        mob:entityAnimationPacket(xi.animationString.CAST_SUMMONER_START)
        mob:timer(2000, function(mobArg)
            mobArg:entityAnimationPacket(xi.animationString.CAST_SUMMONER_STOP)

            local pet = SpawnMob(content.groups[selectedPet + 1]['mobIds'][battlefieldArea][1])
            if pet then
                battlefield:insertEntity(pet:getTargID(), false, true)

                pet:addListener('DEATH', 'AAMR_PET_DEATH', function(petArg)
                    local petBattlefield = petArg:getBattlefield()

                    petBattlefield:setLocalVar('petRespawnMR', os.time() + 30)
                end)

                pet:updateEnmity(target)
            end

            mobArg:setAutoAttackEnabled(true)
            mobArg:setMobMod(xi.mobMod.NO_MOVE, 0)
        end)
    end
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
        specials =
        {
            { id = xi.jsa.PERFECT_DODGE, hpp = math.random(60, 85)  },
            { id = xi.jsa.PERFECT_DODGE, hpp = math.random(10, 20)  },
        },
    })
end

entity.onMobEngage = function(mob, target)
    spawnArkAngelPet(mob, target)
end

entity.onMobFight = function(mob, target)
    if mob:getLocalVar('Charm') == 0 and mob:getHPP() < 50 then
        mob:useMobAbility(710)
        mob:setLocalVar('Charm', 1)
    end

    local battlefield = mob:getBattlefield()
    local respawnTime = battlefield:getLocalVar('petRespawnMR')
    if
        respawnTime ~= 0 and
        respawnTime <= os.time()
    then
        battlefield:setLocalVar('petRespawnMR', 0)
        spawnArkAngelPet(mob, target)
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
