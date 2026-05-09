-----------------------------------
-- func: matsui
-- desc: Throttled logic to prevent JA/Magic spam and allow melee
-----------------------------------
local commandObj = {}
local lastActionTime = 0 -- Timer to prevent spam

commandObj.cmdprops = { permission = 1, parameters = '' }

commandObj.onTrigger = function(player)
    local zone = player:getZone()

    local mob = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Matsui-P',
        look = "0000310c00000000000000000000000000000000",
        groupId = 5, 
        groupZoneId = 154, 
        minLevel = 135, maxLevel = 150,
        x = player:getXPos(), y = player:getYPos(), z = player:getZPos(),
        rotation = player:getRotPos(),

        onMobFight = function(mob, target)
            local hpp = mob:getHPP()
            local tp = mob:getTP()
            local now = os.time()

-- Tracking Timers via LocalVars
            local lastShadow = mob:getLocalVar("lastShadowTime")
            local lastUtility = mob:getLocalVar("lastUtilityTime")
            local lastNuke = mob:getLocalVar("lastNukeTime")

            -----------------------------------
            -- 1. SHADOWS (20s Window)
            -----------------------------------
            if now > lastShadow + 20 then
                if not mob:hasStatusEffect(xi.effect.COPY_IMAGE) then
                    -- Priority: Sanjin > Ni
                    mob:castSpell(xi.magic.spell.UTSUSEMI_SAN, target)
                    mob:setLocalVar("lastShadowTime", now)
                    return 
                end
            end

            -----------------------------------
            -- 2. DEBUFFS & NUKES (45s Window)
            -----------------------------------
            if now > lastNuke + 25 then
                -- Apply Aisha: Ichi for debuffing target
                if not target:hasStatusEffect(xi.effect.STR_DOWN) then
                    mob:castSpell(xi.magic.spell.AISHA_ICHI, target)
                else
                    -- Otherwise, fire an elemental Ni-tier spell
                    local nukes = {
                        xi.magic.spell.KATON_NI,
                        xi.magic.spell.HYOTON_NI,
                        xi.magic.spell.HUTON_NI,
                        xi.magic.spell.RAITON_NI
                    }
                    mob:castSpell(nukes[math.random(#nukes)], target)
                end
                mob:setLocalVar("lastNukeTime", now)
                return
            end
			-----------------------------------
            -- 2. UTILITY (60s Window)
            -----------------------------------
            if now > lastUtility + 60 then
            -- Defensive Priority
            if hpp < 60 and tp >= 500 then
                mob:useJobAbility(xi.jobAbility.CURING_WALTZ_V, mob)
                mob:setLocalVar("lastUtilityTime", now)
                return
            -- Offensive Priority
            elseif not mob:hasStatusEffect(xi.effect.DRAIN_SAMBA) and tp >= 100 then
                mob:useJobAbility(xi.jobAbility.DRAIN_SAMBA_II, mob)
                mob:setLocalVar("lastUtilityTime", now)
                return
                end
			end
            
			        -- OFFENSIVE MODS
      mob:addMod(xi.mod.STR, 160)
      mob:addMod(xi.mod.DEX, 160)
      mob:addMod(xi.mod.AGI, 160)
      mob:addMod(xi.mod.VIT, 130)
      mob:addMod(xi.mod.INT, 160)
      mob:addMod(xi.mod.MND, 130)
      mob:addMod(xi.mod.CHR, 1200)
      mob:setMod(xi.mod.ATT, 1120)
      mob:setMod(xi.mod.ACC, 3600)
	  mob:setMod(xi.mod.MDEF, 1100)
      mob:setMod(xi.mod.MEVA, 1900)
      mob:setMod(xi.mod.EVA, 1250)
      mob:addMod(xi.mod.MACC, 3600)
      mob:setMod(xi.mod.MATT, 1150)
      mob:addMod(xi.mod.WSACC, 3600)
      mob:setMod(xi.mod.SILENCERES, 1100)
      mob:setMod(xi.mod.STUNRES, 150)
      mob:setMod(xi.mod.BINDRES, 100)
      mob:setMod(xi.mod.GRAVITYRES, 100)
      mob:setMod(xi.mod.SLEEPRES, 100)
      mob:setMod(xi.mod.POISONRES, 100)
      mob:setMod(xi.mod.PARALYZERES, 100)
      mob:setMod(xi.mod.LULLABYRES, 100)
      
      mob:setMod(xi.mod.FIRE_SDT, 170)
      mob:setMod(xi.mod.ICE_SDT, 170)
      mob:setMod(xi.mod.WIND_SDT, 170)
      mob:setMod(xi.mod.EARTH_SDT, 170)
      mob:setMod(xi.mod.THUNDER_SDT, 170)
      mob:setMod(xi.mod.WATER_SDT, 170)
      mob:setMod(xi.mod.LIGHT_SDT, 170)
      mob:setMod(xi.mod.DARK_SDT, 200)
      
      mob:setMod(xi.mod.DOUBLE_ATTACK, 40)
      mob:setMod(xi.mod.TRIPLE_ATTACK, 15)
      mob:setMod(xi.mod.FASTCAST, 100)
        
        -- UTILITY MODS
        mob:addMod(xi.mod.HASTE_MAGIC, 2500) -- 25% Haste
        mob:addMod(xi.mod.DUAL_WIELD, 45)    -- Delay reduction
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1148)
        mob:setMobMod(xi.mobMod.SPELL_LIST, 435)
        end,

        releaseIdOnDisappear = true,
    })

    if mob then
        mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos())
        mob:spawn()
        player:printToPlayer("Matsui-P spawned! Throttled AI active to allow melee and shadows.")
    end
end

return commandObj