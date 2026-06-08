-----------------------------------
-- func: fafnir
-- desc: Summon a fightable Fafnir (no loot)
-- note:
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 5,
    parameters = ''
}

commandObj.onTrigger = function(player)
    ---@type CZone|CInstance?
                    local alliance = player:getAlliance()
                    local partyAllianceCheck = 0

                    if player:checkSoloPartyAlliance() == 2 then
                        partyAllianceCheck = player:getAlliance()
                    else
                        partyAllianceCheck = player:getPartyWithTrusts()
                    end

                    for _, member in pairs(partyAllianceCheck) do
                            member:addStatusEffect(xi.effect.CONFRONTATION, { power = 1, origin = member })
                            member:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
                    end

                    local zoneOrInstanceObj = player:getZone()
                    local instance = player:getInstance()

                    if instance then
                        zoneOrInstanceObj = instance
                    end

                    local zone = GetZone(xi.zone.MISAREAUX_COAST)
                    local mob = zoneOrInstanceObj:insertDynamicEntity({

                        objtype = xi.objType.MOB,
                        name = 'Supreme Chaos',
                        look = '0x00004b0e00000000000000000000000000000000',
                        x = -160.0604,
                        y = -15.6770,
                        z = 632.2044,
                        rotation = 23,
                        groupId = 11506,
                        groupZoneId = 299,
                        ---------------------------------------------------------------------------
                        -----------onMobSpawn
                        ---------------------------------------------------------------------------
                        onMobSpawn = function(mob)
                            mob:setLocalVar('[rage]timer', 900) -- 3600 = 60 minutes
                            mob:setLocalVar('BSanctusUse', 1)
                            --[[
                            mob:addMod(xi.mod.MAIN_DMG_RATING, 150)
                            mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 600)
                            mob:addMod(xi.mod.STR, 400) 
                            mob:addMod(xi.mod.VIT, 400) 
                            mob:addMod(xi.mod.INT, 400) 
                            mob:addMod(xi.mod.MND, 400) 
                            mob:addMod(xi.mod.CHR, 400) 
                            mob:addMod(xi.mod.AGI, 400) 
                            mob:addMod(xi.mod.DEX, 400) 
                            mob:addMod(xi.mod.DEF, 400) 
                            mob:addMod(xi.mod.RATT, 475) 
                            mob:addMod(xi.mod.ACC, 750) 
                            mob:addMod(xi.mod.ATT, 550) 
                            mob:addMod(xi.mod.MATT, 250)
                            mob:addMod(xi.mod.MACC, 750) 
                            mob:addMod(xi.mod.MEVA, 500) 
                            mob:addMod(xi.mod.MDEF, 500)
                            mob:setMod(xi.mod.EVA, 400)
                            mob:setMod(xi.mod.EARTH_SDT, 128)
                            mob:setMod(xi.mod.DARK_SDT, 250)
                            mob:setMod(xi.mod.LIGHT_SDT, 200)
                            mob:setMod(xi.mod.ICE_SDT, 200)
                            mob:setMod(xi.mod.FIRE_SDT, 200)
                            mob:setMod(xi.mod.WATER_SDT, 200)
                            mob:setMod(xi.mod.THUNDER_SDT, 200)
                            mob:setMod(xi.mod.WIND_SDT, 200)
                            mob:setMod(xi.mod.SILENCERES, 100) 
                            mob:setMod(xi.mod.STUNRES, 1000) 
                            mob:setMod(xi.mod.BINDRES, 100) 
                            mob:setMod(xi.mod.GRAVITYRES, 100) 
                            mob:setMod(xi.mod.SLEEPRES, 100) 
                            mob:setMod(xi.mod.POISONRES, 100) 
                            mob:setMod(xi.mod.PARALYZERES, 100) 
                            mob:setMod(xi.mod.LULLABYRES, 0)
                            ]]--
                            mob:setMod(xi.mod.FASTCAST, 75) 
                            mob:addStatusEffect(xi.effect.DREAD_SPIKES, { power = 100, duration = 0, origin = mob})
                            mob:addStatusEffect(xi.effect.REGEN, { power = 350, duration = 0, origin = mob, tick = 3 })
                            mob:addStatusEffect(xi.effect.REGAIN, { power = 50, duration = 0, origin = mob})
                            mob:addStatusEffect(xi.effect.REFRESH, { power = 50, tick = 3, duration = 0, origin = mob })
                            mob:addStatusEffect(xi.effect.ENTHUNDER_II, { power = 100, duration = 0, origin = mob})
                            mob:addStatusEffect(xi.effect.CONFRONTATION,{power = 1, origin = mob})

                            mob:addListener('TAKE_DAMAGE', 'CHAOS_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
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
                            end)

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
                            mob:addListener('MAGIC_TAKE', 'CHAOS_MAGIC_TAKE', function(target, caster, spell) -- prevents from charming 
                                if procjobs[caster:getMainJob()] == 'ma' and
                                    math.random(0, 99) < 10 and
                                    target:getLocalVar('supreme_procm') == 0 then
                                    target:weaknessTrigger(2) -- Red proc
                                    target:addStatusEffect(xi.effect.TERROR, { power = 0, tick = 0, duration = 15 })
                                    target:setLocalVar('supreme_procm', 1)
                                end

                                if math.random(0,99) < 10 then
                                    mob:injectActionPacket(target:getID(),4,5000,0,0,185,10,1)
                                    mob:setMP(mob:getMaxMP())
                                end
                            end)

                            mob:addListener('WEAPONSKILL_TAKE', 'CHAOS_WEAPONSKILL_TAKE', function(target, user, wsid) -- removes ability to use Benidiction at 10%
                                if math.random(0, 99) < 10 then
                                    if target:getLocalVar('supreme_procw') == 0 and user:isPC() or user:isTrust() and procjobs[user:getMainJob()] == 'ws' then
                                        target:weaknessTrigger(0) -- Blue proc
                                        target:addStatusEffect(xi.effect.TERROR, { power = 0, tick = 0, duration = 15 })
                                        target:setLocalVar('supreme_procw', 1)
                                    end
                                end

                                if math.random(0,99) < 10 then
                                    mob:injectActionPacket(target:getID(),4,5000,0,0,185,10,1)
                                    mob:setTP(3000)
                                end

                            end)

                            mob:addListener('ABILITY_TAKE', 'CHAOS_ABILITY_TAKE', function(mob, user, ability, action) -- removed status effects
                                if procjobs[user:getMainJob()] == 'ja' and
                                    math.random(0, 99) < 10 and
                                    mob:getLocalVar('supreme_proca') == 0 then
                                    mob:weaknessTrigger(3) -- White proc
                                    mob:delStatusEffect(xi.effect.DREAD_SPIKES)
                                    mob:delStatusEffect(xi.effect.REGEN)
                                    mob:delStatusEffect(xi.effect.REGAIN)
                                    mob:delStatusEffect(xi.effect.ENTHUNDER_II)
                                    mob:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                                    mob:setLocalVar('supreme_proca', 1)
                                end

                                if math.random(0,99) < 10 then
                                    mob:injectActionPacket(target:getID(),4,5000,0,0,185,10,1)
                                    mob:resetEnmity(target)
                                    mob:addHP(mob:getHP() * .25)
                                end
                            end)

                            local elements =
                            {
                                { xi.mod.HTH_SDT,    xi.day.FIRESDAY      },
                                { xi.mod.SLASH_SDT,  xi.day.WATERSDAY     },
                                { xi.mod.PIERCE_SDT, xi.day.ICEDAY        },
                                { xi.mod.IMPACT_SDT, xi.day.DARKSDAY      },
                                { xi.mod.HTH_SDT,    xi.day.LIGHTSDAY     },
                                { xi.mod.SLASH_SDT,  xi.day.LIGHTNINGSDAY },
                                { xi.mod.PIERCE_SDT, xi.day.WINDSDAY      },
                                { xi.mod.IMPACT_SDT, xi.day.EARTHSDAY     },
                            }
        
        
                            local dayOfWeek = VanadielDayOfTheWeek()
                                for k, v in pairs(elements) do
                                    if dayOfWeek == v[2] then
                                        mob:setMod(v[1], 1000)
                                    end
                                end
                        end,
                        ---------------------------------------------------------------------------
                        -----------onMobFight
                        ---------------------------------------------------------------------------
                        onMobFight = function(mob, target)
                            target:addListener('ABILITY_USE',  'PLAYER_ABILITY', function(player, target, ability, action)
                                if player:isPC() and ability:getID() == 17 then -- hundred fist
                                    mob:useMobAbility(693) -- perfect dodge
                                end
                            end)
                            if mob:getHPP() <= 90 and
                               mob:getLocalVar('Bsanctus') == 0 then
                               mob:setLocalVar('BSanctusUse', 0)
                               mob:useMobAbility(4386) -- Black Sanctus
                               mob:setLocalVar('Bsanctus', 1)
                            end
                            if mob:getHPP() <= 75 and
                               mob:getLocalVar('Bsanctus') == 1 then
                               mob:useMobAbility(4386) -- Black Sanctus
                               mob:setLocalVar('Bsanctus', 2)
                            end
                            if mob:getHPP() <= 50 and
                               mob:getLocalVar('Bsanctus') == 2 then
                               mob:useMobAbility(4386) -- Black Sanctus
                               mob:setLocalVar('Bsanctus',3)
                            end
                            if mob:getHPP() <= 25 and
                               mob:getLocalVar('Bsanctus') == 3 then
                               mob:useMobAbility(4386) -- Black Sanctus
                               mob:setLocalVar('Bsanctus', 4)
                            end
                            if mob:getHPP() <= 10 and
                               mob:getLocalVar('supreme_procw') == 0 and
                               mob:getLocalVar('Benidiction') == 0 then
                               mob:useMobAbility(689) -- uses benidiction if magic proc isnt completed
                               mob:setLocalVar('Benidiction', 1) -- set so he wont use again
                            end
                            if mob:getHPP() <= 5 and
                               mob:getLocalVar('mijin_gakure') == 0 then
                               mob:useMobAbility(731) -- uses mijin_gakure
                               mob:setLocalVar('mijin_gakure', 1) -- set so he wont use again
                            end
                        end,
                        ---------------------------------------------------------------------------
                        -----------onSpellPrecast
                        ---------------------------------------------------------------------------
                        onSpellPrecast = function(mob, spell)
                            if spell:getID() == 218 or spell:getID(252) or spell:getID(275) then
                                spell:setAoE(xi.magic.aoe.RADIAL)
                                --spell:setFlag(xi.magic.spellFlag.HIT_ALL) -- no longer exists
                                spell:setRadius(20)
                                spell:setMPCost(1)
                            end
                        end,
                        ---------------------------------------------------------------------------
                        -----------onMagicHit
                        ---------------------------------------------------------------------------
                        onMagicHit = function(caster, target, spell)
                            local dayOfWeek = VanadielDayOfTheWeek()
                            local spellElement = spell:getElement()
                            local curhp = target:getHP()
                            local absorb = target:getLocalVar('magical')

                            if spellElement == xi.combat.element.getDayElement(dayOfWeek) and
                                (caster:isPC() or caster:isPet() or caster:isTrust()) then
                                target:setHP(curhp + absorb) -- absorb spells
                                caster:messageBasic(xi.msg.basic.RECOVERS_HP, 0, absorb)
                            end

                            if spell:getID() == 23 or spell:getID() == 24 or spell:getID() == 25 then
                                target:useMobAbility(695) -- use blood weapon on dia
                            end

                            if spell:getID() == 253 or spell:getID() == 273 or spell:getID() == 274 or spell:getID() == 259 and target:getLocalVar('supreme_procm') ~= 1  then
                                target:useMobAbility(688) -- use mighty strike on sleep - this does not proc against lullaby
                            end

                            if spell:getID() == 79 or spell:getID() == 80 then
                                target:setMP(target:getMaxMP())
                                target:useMobAbility(691) -- Manafont when using paralyze / slow
                                target:timer(100, function(targetArg)
                                    target:useMobAbility(692) -- ChainSpell when using paralyze / slow
                                end)
                            end  
                        end,
                        ---------------------------------------------------------------------------
                        -----------onMobDeath
                        ---------------------------------------------------------------------------
                        onMobDeath = function(mob, playerArg, optParams)
                            local alliance = player:getAlliance()
                            local partyAllianceCheck = 0

                            if player:checkSoloPartyAlliance() == 2 then
                                partyAllianceCheck = player:getAlliance()
                            else
                                partyAllianceCheck = player:getPartyWithTrusts()
                            end

                            for _, member in pairs(partyAllianceCheck) do
                                member:setCharVar('Supremes', utils.mask.setBit(member:getCharVar('Supremes'), 2, true))
                                member:delStatusEffect(xi.effect.CONFRONTATION)
                            end
                        end,
                        ---------------------------------------------------------------------------
                        -----------onMobDespawn
                        ---------------------------------------------------------------------------
                        onMobDespawn = function(mob, playerArg, optParams)
                            local alliance = player:getAlliance()
                            local partyAllianceCheck = 0

                            if player:checkSoloPartyAlliance() == 2 then
                                partyAllianceCheck = player:getAlliance()
                            else
                                partyAllianceCheck = player:getPartyWithTrusts()
                            end

                            for _, member in pairs(partyAllianceCheck) do
                                member:setCharVar('Supremes', utils.mask.setBit(member:getCharVar('Supremes'), 2, true))
                                member:delStatusEffect(xi.effect.CONFRONTATION)
                            end
                        end,

                        releaseIdOnDisappear = true,
                        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
                        mixins =
                        {
                            require('scripts/mixins/rage'),
                            require('scripts/mixins/job_special'),
                            require('scripts/mixins/draw_in'),
                        },
                        specialSpawnAnimation = true,
                     })
                        -- Use the mob object as you normally would
                        mob:setSpawn(-160.0604, -15.6770, 632.2044, 23)
                        mob:setDropID(4122) -- ***** is this the correct drop id?
                        mob:spawn()
                        mob:updateEnmity(player)
                        mob:updateClaim(player)

    player:printToPlayer(string.format('Spawning Fafnir (Lv: %i, HP: %i)\n%s', mob:getMainLvl(), mob:getMaxHP(), mob))
end

return commandObj