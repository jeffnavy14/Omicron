-----------------------------------
require('scripts/globals/npc_util')
require('scripts/utils/utils') -- file dir changed
--[[
require('scripts/globals/worldboss/worldbosspos')
require('scripts/globals/worldboss/de_bahamut')
require('scripts/globals/worldboss/de_agathos')
require('scripts/globals/worldboss/de_chaos')
require('scripts/globals/worldboss/de_crom_dubh')
require('scripts/globals/worldboss/de_darkness')
require('scripts/globals/worldboss/de_hades')
require('scripts/globals/worldboss/de_hahava')
require('scripts/globals/worldboss/de_ig_alima')
require('scripts/globals/worldboss/de_ildebrann')
require('scripts/globals/worldboss/de_kalasutrax')
require('scripts/globals/worldboss/de_kholomodumo')
require('scripts/globals/worldboss/de_lady_lilith')
require('scripts/globals/worldboss/de_metus')
require('scripts/globals/worldboss/de_odin')
require('scripts/globals/worldboss/de_oryx')
require('scripts/globals/worldboss/de_pil')
require('scripts/globals/worldboss/de_quetzalcoatl')
require('scripts/globals/worldboss/de_uptala')
require('scripts/globals/worldboss/de_aminon')
require('scripts/globals/worldboss/de_putraxia')
]]--
-----------------------------------
xi = xi or {}
xi.worldboss = xi.worldboss or {}
-----------------------------------

xi.worldboss.mob =
    {
    [ 1] = { name = 'Bahamut',      groupId = 11505, groupZoneId =  29, look = '0x00001b0500000000000000000000000000000000', wbMobFile = xi.worldboss.bahamut}, --
    [ 2] = { name = 'Aminon',       groupId = 11505, groupZoneId = 275, look = '0x0000850A00000000000000000000000000000000', wbMobFile = xi.worldboss.aminon}, --
    [ 3] = { name = 'Chaos',        groupId = 11506, groupZoneId = 278, look = '0x0000FF0D00000000000000000000000000000000', wbMobFile = xi.worldboss.chaos}, --
    [ 4] = { name = 'Putraxia',     groupId = 11524, groupZoneId = 275, look = '0x00003D0A00000000000000000000000000000000', wbMobFile = xi.worldboss.putraxia}, --
    [ 5] = { name = 'Uptala',       groupId = 11514, groupZoneId = 177, look = '0x0000390800000000000000000000000000000000', wbMobFile = xi.worldboss.uptala}, --
    [ 6] = { name = 'Odin',         groupId = 11518, groupZoneId =  78, look = '0x0000250700000000000000000000000000000000', wbMobFile = xi.worldboss.odin}, --
    [ 7] = { name = 'Hades',        groupId = 11508, groupZoneId = 277, look = '0x0000710a00000000000000000000000000000000', wbMobFile = xi.worldboss.hades}, --
    [ 8] = { name = 'Pil',          groupId = 11509, groupZoneId = 222, look = '0x0000360800000000000000000000000000000000', wbMobFile = xi.worldboss.pil}, --
    [ 9] = { name = 'Crom Dubh',    groupId = 11510, groupZoneId = 291, look = '0x00002e0a00000000000000000000000000000000', wbMobFile = xi.worldboss.crom_dubh}, --
    [10] = { name = 'Kholomodumo',  groupId = 11511, groupZoneId =  82, look = '0x0000950100000000000000000000000000000000', wbMobFile = xi.worldboss.kholomodumo}, --
    [11] = { name = 'Kalasutrax',   groupId = 11512, groupZoneId =  96, look = '0x0000110800000000000000000000000000000000', wbMobFile = xi.worldboss.kalasutrax}, --
    [12] = { name = 'Ildebrann',    groupId = 11513, groupZoneId = 205, look = '0x0000600200000000000000000000000000000000', wbMobFile = xi.worldboss.ildebrann}, --
    [13] = { name = 'Quetzalcoatl', groupId = 11515, groupZoneId = 291, look = '0x0000630200000000000000000000000000000000', wbMobFile = xi.worldboss.quetzalcoatl}, --
    [14] = { name = 'Agathos',      groupId = 11516, groupZoneId =  91, look = '0x0000570900000000000000000000000000000000', wbMobFile = xi.worldboss.agathos}, --
    [15] = { name = 'Oryx',         groupId = 11517, groupZoneId = 291, look = '0x0000b20800000000000000000000000000000000', wbMobFile = xi.worldboss.oryx}, --
    [16] = { name = 'Metus',        groupId = 11519, groupZoneId =  36, look = '0x00007b0b00000000000000000000000000000000', wbMobFile = xi.worldboss.metus}, --
    [17] = { name = 'Darkness',     groupId = 11520, groupZoneId = 293, look = '0x00007e0b00000000000000000000000000000000', wbMobFile = xi.worldboss.darkness}, --
    [18] = { name = 'Lady Lilith',  groupId = 11521, groupZoneId = 182, look = '0x00008d0800000000000000000000000000000000', wbMobFile = xi.worldboss.lady_lilith}, --
    [19] = { name = 'Ig-Alima',     groupId = 11522, groupZoneId = 103, look = '0x00000b0800000000000000000000000000000000', wbMobFile = xi.worldboss.ig_alima}, --
    [20] = { name = 'Hahava',       groupId = 11523, groupZoneId = 190, look = '0x00003f0800000000000000000000000000000000', wbMobFile = xi.worldboss.hahava}, --
    }

xi.worldboss.spawnMob = function(mob)
    local wbRandom = math.random(1,20)
    for wbIndex, wbMob in pairs(xi.worldboss.mob) do
      if wbRandom == wbIndex then
          local deMob = wbMob.wbMobFile
          deMob(mob) -- xi.worldboss.xxxxxxx(mob)
      end
    end
end

xi.worldboss.spawnAnnouncement = function(mob)
   -- Annoucement to everyone in every zone of his spawn and location
   local namez = nil
   for mobIndex, mobName in pairs(xi.worldboss.mob) do
       if GetServerVariable('[WorldBossSpawn]'..mobName.name) > 0 then
          namez = mobName.name
       end
   end
      for i = 1, 299 do
          local zonex = GetZone(i):getPlayers()
                for _, member in pairs(zonex) do
                       member:printToPlayer('----------------WORLD BOSS ANNOUCEMENT----------------',xi.msg.channel.SYSTEM_3)
                       member:printToPlayer(string.format('%s has been spotted in %s, Please help vanqish this evil demon!', namez, mob:getZoneName()),xi.msg.channel.SYSTEM_3)
                end
      end
end
xi.worldboss.despawnAnnouncement = function(mob)
   -- Annoucement to everyone in every zone of WB has despawned
     if mob:getHP() > 1 then
       local namez = nil
       for mobIndex, mobName in pairs(xi.worldboss.mob) do
           if GetServerVariable('[WorldBossSpawn]'..mobName.name) > 0 then
              namez = mobName.name
           end
       end
          for i = 1, 299 do
              local zonex = GetZone(i):getPlayers()
                    for _, member in pairs(zonex) do
                           member:printToPlayer('----------------WORLD BOSS ANNOUCEMENT----------------',xi.msg.channel.SYSTEM_3)
                           member:printToPlayer(string.format('%s has vanished back to the depths in which they came from!', namez, mob:getZoneName()),xi.msg.channel.SYSTEM_3)
                    end
          end
     end
end
xi.worldboss.deathAnnouncement = function(mob)
   -- Annoucement to everyone in every zone of WB has been killed
   local namez = nil
   for mobIndex, mobName in pairs(xi.worldboss.mob) do
       if GetServerVariable('[WorldBossSpawn]'..mobName.name) > 0 then
          namez = mobName.name
       end
   end
      for i = 1, 299 do
          local zonex = GetZone(i):getPlayers()
                for _, member in pairs(zonex) do
                       member:printToPlayer('----------------WORLD BOSS ANNOUCEMENT----------------',xi.msg.channel.SYSTEM_3)
                       member:printToPlayer(string.format('%s has been defeated, Thank you for vanquishing this foe, Peace has been restored to the land!', namez, mob:getZoneName()),xi.msg.channel.SYSTEM_3)
                end
      end
end

-- create command to tell if world boss is up, or maybe a npc so players can check if up and location
xi.worldboss.onGameHour = function(zone)
  local bossNames = {'Bahamut','Ig-Alima','Kalasutrax','Uptala','Ildebrann','Pil','Agathos','Hahava','Kholomodumo','Quetzalcoatl','Crom Dubh', 
                     'Oryx','Odin','Darkness','Hades','Lady Lilith','Metus','Putraxia','Chaos','Aminon'}
      for i = 1, #bossNames do
        if GetServerVariable('[WorldBossDespawn]') < os.time() then
            if GetServerVariable('[WorldBossSpawn]'..bossNames[i]) > 0 and
               GetMobByID(GetServerVariable('[WorldBossSpawn]'..bossNames[i])) == nil then
               SetServerVariable('[WorldBossSpawn]'..bossNames[i], 0)
               SetServerVariable('[WorldBossDespawn]', 0)
            elseif GetServerVariable('[WorldBossSpawn]'..bossNames[i]) > 0 and            
               GetMobByID(GetServerVariable('[WorldBossSpawn]'..bossNames[i])):isSpawned() then
               DespawnMob(GetServerVariable('[WorldBossSpawn]'..bossNames[i]))
               SetServerVariable('[WorldBossSpawn]'..bossNames[i], 0)
               SetServerVariable('[WorldBossDespawn]', 0)
            end
        end
      end 
    if GetServerVariable('[WorldBossTimer]') <= os.time() then
       xi.worldboss.spawnMob()
    end
end
function worldbossGiveImmunity(mob)
        local elements =
        {
            { xi.mod.HTH_SDT,    xi.day.FIRESDAY,      xi.damageType.FIRE,    xi.mod.FIRE_ABSORB},
            { xi.mod.SLASH_SDT,  xi.day.EARTHSDAY,     xi.damageType.EARTH,   xi.mod.EARTH_ABSORB},
            { xi.mod.PIERCE_SDT, xi.day.WATERSDAY,     xi.damageType.WATER,   xi.mod.WATER_ABSORB},
            { xi.mod.IMPACT_SDT, xi.day.WINDSDAY,      xi.damageType.WIND,    xi.mod.WIND_ABSORB},
            { xi.mod.HTH_SDT,    xi.day.ICEDAY,        xi.damageType.ICE,     xi.mod.ICE_ABSORB},
            { xi.mod.SLASH_SDT,  xi.day.LIGHTNINGDAY, xi.damageType.THUNDER, xi.mod.LTNG_ABSORB},
            { xi.mod.PIERCE_SDT, xi.day.LIGHTSDAY,     xi.damageType.LIGHT,   xi.mod.LIGHT_ABSORB},
            { xi.mod.IMPACT_SDT, xi.day.DARKSDAY,      xi.damageType.DARK,    xi.mod.DARK_ABSORB},
        }
            local dayOfWeek = VanadielDayOfTheWeek()
                for k, v in pairs(elements) do
                    if dayOfWeek == v[2] then
                       mob:setMod(v[1], 1000) -- 100% - negate attack type
                       mob:setMod(v[4], 100) -- 100% Absorb element
                    end
                end
end

function worldbossReflect(mob)
    mob:addListener('MAGIC_TAKE', 'REFLECT_MAGIC_TAKE', function(target, caster, spell)
      local reflectChance = math.random(1,100)
      local reflectTimer  = os.time()
        if reflectTimer < os.time() + 60 then
            if reflectChance < 25 then
                if caster:isPC() or caster:isPet() or caster:isTrust() and
                   spell:tookEffect() and
                   not mob:hasStatusEffect(xi.effect.SILENCE) then
                   mob:castSpell(spell:getID())
                end
            end
        end
    end)
end

function worldbossHateChange(mob, target)
   local hate = os.time()
         if hate < os.time() + 3600 then
            mob:resetEnmity(target)
         end
end

function worldbossBuildResistance(mob)
            mob:addListener('MAGIC_TAKE', 'BUILD_RESISTANCE', function(target, caster, spell)
                            -------- Sleep Resistance ---------
                        local sleepSpells = {98,253,259,273,274,584,598,596,576,678}
                            for _, spellCasted in pairs(sleepSpells) do
                              if spell:getID() == spellCasted then
                                if mob:getMod(xi.mod.SLEEPRES) < 1000 then
                                    if caster:isPC() or caster:isPet() or caster:isTrust() and
                                       spell:tookEffect() then
                                       mob:setMod(xi.mod.SLEEPRES, mob:getMod(xi.mod.SLEEPRES) + 10)
                                    end
                                end
                              end
                            end
                            -------- lullaby Resistance ---------
                        local lullabySpells = {376,377,463,471}
                            for _, spellCasted in pairs(lullabySpells) do
                              if spell:getID() == spellCasted then
                                if mob:getMod(xi.mod.LULLABYRES) < 1000 then
                                    if caster:isPC() or caster:isPet() or caster:isTrust() and
                                       spell:tookEffect() then
                                       mob:setMod(xi.mod.LULLABYRES, mob:getMod(xi.mod.LULLABYRES) + 10)
                                    end
                                end
                              end
                            end
                            -------- Silence Resistance ---------
                        local silenceSpells = {59,359,687,565,727,604,671,582}                        
                            for _, spellCasted in pairs(silenceSpells) do
                              if spell:getID() == spellCasted then
                                if mob:getMod(xi.mod.SILENCERES) < 1000 then
                                    if caster:isPC() or caster:isPet() or caster:isTrust() and
                                       spell:tookEffect() then
                                       mob:setMod(xi.mod.SILENCERES, mob:getMod(xi.mod.SILENCERES) + 10)
                                    end
                                end
                              end
                            end
                            -------- Stun Resistance ---------
                        local stunSpells = {252,532,628,623,640,616,669}                        
                            for _, spellCasted in pairs(stunSpells) do
                              if spell:getID() == spellCasted then
                                if mob:getMod(xi.mod.STUNRES) < 1000 then
                                    if caster:isPC() or caster:isPet() or caster:isTrust() and
                                       spell:tookEffect() then
                                       mob:setMod(xi.mod.STUNRES, mob:getMod(xi.mod.STUNRES) + 10)
                                    end
                                end
                              end
                            end
                            -------- Paralyze Resistance ---------
                        local paralyzeSpells = {58,80,356,341,342,343,604,608,644,613,654}                        
                            for _, spellCasted in pairs(stunSpells) do
                              if spell:getID() == spellCasted then
                                if mob:getMod(xi.mod.PARALYZERES) < 1000 then
                                    if caster:isPC() or caster:isPet() or caster:isTrust() and
                                       spell:tookEffect() then
                                       mob:setMod(xi.mod.PARALYZERES, mob:getMod(xi.mod.PARALYZERES) + 10)
                                    end
                                end
                              end
                            end
            end)
end

function worldBossProcSystem(mob)
       local procjobs =
            {
                [xi.job.WAR] = 'ws',
                [xi.job.MNK] = 'ja',
                [xi.job.WHM] = 'ma',
                [xi.job.BLM] = 'ma',
                [xi.job.RDM] = 'ma',
                [xi.job.THF] = 'ja',
                [xi.job.PLD] = 'ws',
                [xi.job.DRK] = 'ws',
                [xi.job.BST] = 'ja',
                [xi.job.BRD] = 'ma',
                [xi.job.RNG] = 'ja',
                [xi.job.SAM] = 'ws',
                [xi.job.NIN] = 'ja',
                [xi.job.DRG] = 'ws',
                [xi.job.SMN] = 'ma',
                [xi.job.DNC] = 'ja',
                [xi.job.SCH] = 'ma',
                [xi.job.RUN] = 'ws',
                [xi.job.GEO] = 'ma',
                [xi.job.COR] = 'ja',
                [xi.job.BLU] = 'ma',
                [xi.job.PUP] = 'ws',
            }
       mob:addListener('MAGIC_TAKE', 'WORLDBOSS_MAGIC_TAKE', function(target, caster, spell) -- prevents from charming 
             if procjobs[caster:getMainJob()] == 'ma' and
                math.random(0, 99) < 10 and
                target:getLocalVar('worldboss_procm') == 0 then
                target:weaknessTrigger(2) -- Red proc
                target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                target:setLocalVar('worldboss_procm', 1)
             end
       end)
       mob:addListener('WEAPONSKILL_TAKE', 'WORLDBOSS_WEAPONSKILL_TAKE', function(target, user, wsid) -- removes ability to use Benidiction at 10%
             if math.random(0, 99) < 10 then
                   if target:getLocalVar('') == 0 and user:isPC() or user:isTrust() and procjobs[user:getMainJob()] == 'ws' then
                      target:weaknessTrigger(0) -- Blue proc
                      target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                      target:setLocalVar('worldboss_procw', 1)
                   end
             end
       end)
       mob:addListener('ABILITY_TAKE', 'WORLDBOSS_ABILITY_TAKE', function(mob, user, ability, action) -- removed status effects
             if procjobs[user:getMainJob()] == 'ja' and
                math.random(0, 99) < 10 and
                mob:getLocalVar('worldboss_proca') == 0 then
                mob:weaknessTrigger(3) -- White proc
                mob:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                mob:setLocalVar('worldboss_proca', 1)
             end
       end)
       mob:addListener('TAKE_DAMAGE', 'WORLDBOSS_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
         local accumulatedPhisical = mob:getLocalVar('physical')
         local accumulatedMagical  = mob:getLocalVar('magical')
            if attackType == xi.attackType.PHYSICAL or
               attackType == xi.attackType.RANGED then
               accumulatedPhisical = accumulatedPhisical + damage -- sets how much damage over all
               mob:setLocalVar('physical', damage)
            else
               accumulatedMagical = accumulatedMagical + damage -- sets how much damage over all
               mob:setLocalVar('magical', damage)
            end
            if accumulatedPhisical + accumulatedMagical == mob:getMaxHP() / .5 and
                mob:getLocalVar('worldboss_procd') == 0 then
                mob:weaknessTrigger(1) -- Yellow proc
                mob:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                mob:setLocalVar('worldboss_procd', 1)
            end
       end)
end

function worldBossResetJA(target)
        local resetJAList =
        {
            [xi.job.WAR] =
                {
                  16,31,32,33,34,35,149,150,226,252,267,323
                },
            [xi.job.MNK] =
                {
                  17,36,37,38,39,40,82,151,152,227,253,269,324
                },
            [xi.job.WHM] =
                {
                  18,74,153,154,245,246,270,271,325
                },
            [xi.job.BLM] =
                {
                  19,75,254,272,273,326,388
                },
            [xi.job.RDM] =
                {
                  20,83,247,274,275,327
                },
            [xi.job.THF] =
                {
                  21,41,42,43,44,45,76,84,155,156,228,236,276,321,328
                },
            [xi.job.PLD] =
                {
                  22,46,47,48,79,92,157,158,255,277,278,329,394
                },
            [xi.job.DRK] =
                {
                  23,49,50,51,77,159,160,256,279,280,330,389
                },
            [xi.job.BST] =
                {
                  24,52,53,54,78,85,161,162,331,387
                },
            [xi.job.BRD] =
                {
                  25,163,164,229,283,229,283,284,332
                },
            [xi.job.RNG] =
                {
                  26,56,57,58,59,60,86,165,166,224,257,285,286,333
                },
            [xi.job.SAM] =
                {
                  27,62,63,64,167,168,173,174,230,258,287,288,320,334
                },
            [xi.job.NIN] =
                {
                  28,171,248,249,259,291,335
                },
            [xi.job.DRG] =
                {
                  29,61,65,66,67,68,80,87,169,170,260,292,293,295,318,319,336,393
                },
            [xi.job.SMN] =
                {
                  30,88,89,90,91,172,232,250,296,337,385
                },
            [xi.job.BLU] =
                {
                  93,94,95,175,176,297,298,338
                },
            [xi.job.COR] =
                {
                  96,97,123,124,133,177,178,301,339,392
                },
            [xi.job.PUP] =
                {
                  135,136,137,266,309,310,322,340
                },
            [xi.job.DNC] =
                {
                  181,182,183,198,199,200,213,239,261,263,341,384
                },
            [xi.job.SCH] =
                {
                  210,211,212,214,223,233,265,342
                },
        [xi.job.GEO] =
            {
                343,345,346,347,348,349,350,351,352,353,354,355,377,386
            },
        [xi.job.RUN] =
            {
                356,357, 367,370,374,375,376,378,379,380,383
            },
    }

    local mjob = target:getMainJob()
    local sjob = target:getSubJob()

    if resetJAList[mjob] then
        for i = 1, #resetJAList[mjob] do
            local abilityId = resetJAList[mjob][i]
            local mAbility = GetAbility(abilityId)
            if mAbility and target:hasJobAbility(abilityId) then
                target:addRecast(xi.recast.ABILITY, mAbility:getRecastID(), mAbility:getRecast())
            end
        end
    end

    if resetJAList[sjob] then
        for i = 1, #resetJAList[sjob] do
            local abilityId = resetJAList[sjob][i]
            local sAbility = GetAbility(abilityId)
            if sAbility and target:hasJobAbility(abilityId) then
                target:addRecast(xi.recast.ABILITY, sAbility:getRecastID(), sAbility:getRecast())
            end
        end
    end
end



--[[

enum TREASUREPOOLTYPE
{
    TREASUREPOOL_SOLO     = 1,
    TREASUREPOOL_PARTY    = 6,
    TREASUREPOOL_ALLIANCE = 18,
    TREASUREPOOL_ZONE     = 128
};

zone_misc.lua

    TREASURE              = 0x0100, -- Presence in the global zone TreasurePool = 256

    (xi.zoneMisc.TREASURE)


]]--