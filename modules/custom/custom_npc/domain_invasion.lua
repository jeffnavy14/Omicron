-----------------------------------
-- Add some test NPCs to GM_HOME (zone 210)
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Escha_RuAun/Zone")
-----------------------------------
local m = Module:new("domain_invasion")

-- Server Crash Failsafe
m:addOverride("xi.zones.Escha_RuAun.Zone.onInitialize", function(zone)
    super(zone)

    -- cleanup variables
    if GetServerVariable("[Domain]NMToD") < 1 then
	    SetServerVariable("[Domain]NMToD", 1)
	end
	if GetServerVariable("[Domain]Addon_Test") < 1 then
	    SetServerVariable("[Domain]Addon_Test", 1)
	end
	
	if GetServerVariable("[Domain]NMSpawned") == 1 then
	    SetServerVariable("[Domain]NMSpawned", 0)
	end
	if GetServerVariable("Addon_Test") < 1 then
	    SetServerVariable("Addon_Test", 4)
	end
    if GetServerVariable("[Domain]Addon_Spawned") == 1 then
	    SetServerVariable("[Domain]Addon_Spawned", 0)
	end
    if GetServerVariable("[Domain]Addon_Spawned_2") == 1 then
	    SetServerVariable("[Domain]Addon_Spawned_2", 0)
	end
    if GetServerVariable("[Domain]Addon_Spawned_3") == 1 then
	    SetServerVariable("[Domain]Addon_Spawned_3", 0)
	end
end)

-- NM 1
m:addOverride("xi.zones.Escha_RuAun.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already
    if
        GetServerVariable("[Domain]NM") == 0 and              -- Correct NM
        GetServerVariable("[Domain]NMSpawned") == 0 and       -- NM isn't spawned
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Jeronimo",
            x = 0.421,
            y = -43.600,
            z = -196.322,
            rotation = 65,
            widescan = 1,
    
            groupId = 96,
            groupZoneId = 289,

            onMobSpawn = function(mob)
			    SetServerVariable("[Domain]NMSpawned", 1)

                -- Debug
			    printf("Jeronimo Spawned")
				
			end,	
			onMobFight = function(mob, target)
                if target:hasEnmity() then
                   target:setLocalVar("[Escha_Points]", 1)
	        	end
	        end,
    		
            onMobDeath = function(mob, player, isKiller, noKiller)
			local reward = math.random(100, 225)
		        if player:getLocalVar("[Escha_Points]") == 1 then
		               player:addCurrency('escha_beads', reward)
                       player:PrintToPlayer(string.format("You have gained %s Escha Beads for your participation in this battle.", reward), xi.msg.channel.SYSTEM_3)
	            end	
                -- Variable control
			    SetServerVariable("[Domain]NMToD", os.time())
    		    SetServerVariable("[Domain]NM", 1)
				SetServerVariable("[Domain]NMSpawned", 0)

                -- Server-wide message
                player:PrintToArea("Jeronimo has been defeated, please talk to the lilith to be ported to the next fight.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
            end,
        })

        mob:setSpawn(0.421, -43.600, -196.322, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
		mob:setMobLevel(135)
	    mob:addMod(xi.mod.MAIN_DMG_RATING, 50)
        mob:addMod(xi.mod.STR, 50)
        mob:addMod(xi.mod.VIT, 20)
        mob:addMod(xi.mod.INT, 50)
        mob:addMod(xi.mod.MND, 20)
        mob:addMod(xi.mod.CHR, 20)
        mob:addMod(xi.mod.AGI, 20)
        mob:addMod(xi.mod.DEX, 40)
        mob:setMod(xi.mod.DEFP, 0)
        mob:setMod(xi.mod.RATTP, 0)
        mob:addMod(xi.mod.DEFP, 475)
        mob:addMod(xi.mod.RATTP, 475)
        mob:addMod(xi.mod.ACC, 100)
        mob:setMod(xi.mod.DOUBLE_ATTACK, 10)
        mob:setMod(xi.mod.EARTH_RES, 170)
        mob:setMod(xi.mod.DARK_RES, 250)
        mob:setMod(xi.mod.LIGHT_RES, 128)
        mob:setMod(xi.mod.FIRE_RES, 170)
        mob:setMod(xi.mod.WATER_RES, 170)
        mob:setMod(xi.mod.THUNDER_RES, 170)
        mob:setMod(xi.mod.ICE_RES, 200)
        mob:setMod(xi.mod.WIND_RES, 170)
        mob:setMod(xi.mod.SILENCERES, 100)
        mob:setMod(xi.mod.FIRE_ABSORB, 100)
        mob:setMod(xi.mod.STUNRES, 50)
        mob:setMod(xi.mod.BINDRES, 100)
        mob:setMod(xi.mod.GRAVITYRES, 100)
        mob:setMod(xi.mod.SLEEPRES, 100)
        mob:setMod(xi.mod.PARALYZERES, 100)
        mob:setMod(xi.mod.LULLABYRES, 100)
        mob:setMod(xi.mod.FASTCAST, 10)
        mob:addStatusEffect(xi.effect.BLAZE_SPIKES, 50, 0, 0)
        mob:addStatusEffect(xi.effect.REGAIN, 10, 3, 0)
        mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
        mob:addStatusEffect(xi.effect.ENFIRE_II, 100, 0, 0)
        mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
        end

end)

-- NM 2
m:addOverride("xi.zones.Reisenjima_Henge.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already.
    if
        GetServerVariable("[Domain]NM") == 1 and              -- Correct NM
        GetServerVariable("[Domain]NMSpawned") == 0 and       -- NM isn't spawned
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
		local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Tortuga",
            x = 0.195,
            y = 5.50,
            z = -1.378,
            rotation = 65,
            widescan = 1,
    
            groupId = 89,
            groupZoneId = 291,

            onMobSpawn = function(mob)
			    SetServerVariable("[Domain]NMSpawned", 1)

                -- Debug
                printf("Tortuga is Spawned")
			end,	
			onMobFight = function(mob, target)
                if target:hasEnmity() then
                   target:setLocalVar("[Escha_Points]", 1)
	        	end
	        end,

            onMobDeath = function(mob, player, isKiller, noKiller)
			local final = math.random(1, 100)
                if final < 49 then
				SetServerVariable("[Domain]NM", 2)
				player:PrintToArea("Battosai and his minions are ready for battle.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
				SetServerVariable("[Domain]NMToD", os.time())
    		    SetServerVariable("[Domain]NMSpawned", 0)
				end
				if final > 50 then
				SetServerVariable("[Domain]NM", 3)
				player:PrintToArea("Oh no not Bahamut, please defeat the team of minions as quick as possible.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
				SetServerVariable("[Domain]NMToD", os.time())
    		    SetServerVariable("[Domain]NMSpawned", 0)
				end
			local reward = math.random(100, 225)
		        if player:getLocalVar("[Escha_Points]") == 1 then
		           player:addCurrency('escha_beads', reward)
                   player:PrintToPlayer(string.format("You have gained %s Escha Beads for your participation in this battle.", reward), xi.msg.channel.SYSTEM_3)
	            end	
            end,
        })
    
        mob:setSpawn(0.195, 5.500, -1.378, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
		mob:setMobLevel(135)
	    mob:addMod(xi.mod.MAIN_DMG_RATING, 50)
        mob:addMod(xi.mod.STR, 40)
        mob:addMod(xi.mod.VIT, 20)
        mob:addMod(xi.mod.INT, 50)
        mob:addMod(xi.mod.MND, 20)
        mob:addMod(xi.mod.CHR, 20)
        mob:addMod(xi.mod.AGI, 20)
        mob:addMod(xi.mod.DEX, 40)
        mob:setMod(xi.mod.DEFP, 0)
        mob:setMod(xi.mod.RATTP, 0)
        mob:addMod(xi.mod.DEFP, 475)
        mob:addMod(xi.mod.RATTP, 475)
        mob:addMod(xi.mod.ACC, 150)
        mob:setMod(xi.mod.EARTH_RES, 128)
        mob:setMod(xi.mod.DARK_RES, 250)
        mob:setMod(xi.mod.LIGHT_RES, 200)
        mob:setMod(xi.mod.ICE_RES, 200)
        mob:setMod(xi.mod.FIRE_RES, 200)
        mob:setMod(xi.mod.WATER_RES, 200)
        mob:setMod(xi.mod.THUNDER_RES, 200)
        mob:setMod(xi.mod.WIND_RES, 200)
        mob:setMod(xi.mod.SILENCERES, 100)
        mob:setMod(xi.mod.STUNRES, 50)
        mob:setMod(xi.mod.BINDRES, 100)
        mob:setMod(xi.mod.GRAVITYRES, 100)
        mob:setMod(xi.mod.SLEEPRES, 100)
        mob:setMod(xi.mod.POISONRES, 100)
        mob:setMod(xi.mod.PARALYZERES, 100)
        mob:setMod(xi.mod.LULLABYRES, 100)
        mob:setMod(xi.mod.FASTCAST, 10)
        mob:addStatusEffect(xi.effect.SHOCK_SPIKES, 50, 0, 0)
        mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
        mob:addStatusEffect(xi.effect.ENTHUNDER_II, 100, 0, 0)
        end
	    
end)

-- NM 3
m:addOverride("xi.zones.Provenance.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already.
    if
	    GetServerVariable("Addon_Test") == 0 and
        GetServerVariable("[Domain]NM") == 2 and              -- Correct NM
        GetServerVariable("[Domain]NMSpawned") == 0 and       -- NM isn't spawned
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Battosai",
            look = 3601,
            x = -580,
            y = -228,
            z = 540,
            rotation = 65,
            widescan = 1,
    
            groupId = 64,
            groupZoneId = 288,
			
            onMobSpawn = function(mob)
			    SetServerVariable("[Domain]NMSpawned", 1)

                -- Debug
                printf("Battosai is spawned")
			end,
			onMobFight = function(mob, target)
                if target:hasEnmity() then
                   target:setLocalVar("[Escha_Points]", 1)
	        	end
	        end,

            onMobDeath = function(mob, player, isKiller, noKiller)
				local reward = math.random(100, 225)
		           if player:getLocalVar("[Escha_Points]") == 1 then
		              player:addCurrency('escha_beads', reward)
                      player:PrintToPlayer(string.format("You have gained %s Escha Beads for your participation in this battle.", reward), xi.msg.channel.SYSTEM_3)
	                end	 
                -- Variable control
			    SetServerVariable("[Domain]NMToD", os.time()) -- Set NM ToD
    		    SetServerVariable("[Domain]NM", 0)            -- Set NM to be spawned next
				SetServerVariable("[Domain]NMSpawned", 0)     -- Set NM spawned flag (To not spawn infinite NMs)
				SetServerVariable("[Domain]Addon_Spawned", 0)
				SetServerVariable("[Domain]Addon_Spawned_2", 0)
				SetServerVariable("[Domain]Addon_Spawned_3", 0)
				SetServerVariable("Addon_Test", 4)

                -- Server-wide message
                player:PrintToArea("Battosai has been defeated got to the nearest lilth to goto the next battle.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
            end,
        })
    
        mob:setSpawn(-580, -228, 540, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
		SetServerVariable("[Domain]NMSpawned", 1)
		mob:setMobLevel(135)
		mob:addMod(xi.mod.MAIN_DMG_RATING, 50)
        mob:addMod(xi.mod.STR, 40)
        mob:addMod(xi.mod.VIT, 20)
        mob:addMod(xi.mod.INT, 65)
        mob:addMod(xi.mod.MND, 20)
        mob:addMod(xi.mod.CHR, 20)
        mob:addMod(xi.mod.AGI, 20)
        mob:addMod(xi.mod.DEX, 40)
        mob:setMod(xi.mod.DEFP, 0)
        mob:setMod(xi.mod.RATTP, 0)
        mob:addMod(xi.mod.DEFP, 375)
        mob:addMod(xi.mod.RATTP, 375)
        mob:addMod(xi.mod.ACC, 100)
        mob:setMod(xi.mod.EARTH_RES, 170)
        mob:setMod(xi.mod.DARK_RES, 240)
        mob:setMod(xi.mod.LIGHT_RES, 170)
        mob:setMod(xi.mod.FIRE_RES, 128)
        mob:setMod(xi.mod.WATER_RES, 170)
        mob:setMod(xi.mod.THUNDER_RES, 170)
        mob:setMod(xi.mod.WIND_RES, 128)
        mob:setMod(xi.mod.ICE_RES, 200)
        mob:setMod(xi.mod.SILENCERES, 100)
        mob:setMod(xi.mod.STUNRES, 50)
        mob:setMod(xi.mod.BINDRES, 100)
        mob:setMod(xi.mod.GRAVITYRES, 100)
        mob:setMod(xi.mod.SLEEPRES, 100)
        mob:setMod(xi.mod.POISONRES, 100)
        mob:setMod(xi.mod.PARALYZERES, 100)
        mob:setMod(xi.mod.LULLABYRES, 100)
        mob:setMod(xi.mod.EARTH_ABSORB, 100)
        mob:setMod(xi.mod.LIGHT_ABSORB, 100)
        mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
        mob:setMod(xi.effect.FAST_CAST, 25)
        mob:addStatusEffect(xi.effect.ENSTONE_II, 100, 0, 0)
        mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
        end
	    
end)
-- Alt
m:addOverride("xi.zones.Provenance.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already.
    if
	    GetServerVariable("Addon_Test") == 4 and
        GetServerVariable("[Domain]NM") == 3 and              -- Correct NM
        GetServerVariable("[Domain]NMSpawned") == 0 and       -- NM isn't spawned
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Bahamut",
            x = -580,
            y = -228,
            z = 540,
            rotation = 65,
            widescan = 1,
    
            groupId = 17,
            groupZoneId = 29,
				onMobFight = function(mob, target)
	    	local lifePercent = mob:getHPP()
            if lifePercent < 70 and GetServerVariable("MegaFlareUsed") == 0 then
                mob:useMobAbility(1551)
	    		SetServerVariable("MegaFlareUsed", 1)
	        end
	    	if lifePercent < 45 and GetServerVariable("MegaFlareUsed") == 1 then
                mob:useMobAbility(1551)
	    		SetServerVariable("MegaFlareUsed", 2)
	        end
	    	if lifePercent < 25 and GetServerVariable("GigaFlareUsed") == 0 then
                mob:useMobAbility(1552)
	    		SetServerVariable("GigaFlareUsed", 1)
	        end
	    	if lifePercent < 5 and GetServerVariable("GigaFlareUsed") == 1 then
                mob:useMobAbility(1552)
	    		mob:setMod(xi.mod.TRIPLE_ATTACK, 20)
	    		SetServerVariable("GigaFlareUsed", 2)
	        end
			if target:hasEnmity() then
               target:setLocalVar("[Escha_Points]", 1)
	        end
	        end,
  
            onMobSpawn = function(mob)
	            mob:addStatusEffect(xi.effect.PHALANX, 35, 0, 180)
                mob:addStatusEffect(xi.effect.STONESKIN, 350, 0, 300)
                mob:addStatusEffect(xi.effect.PROTECT, 175, 0, 1800)
                mob:addStatusEffect(xi.effect.SHELL, 24, 0, 1800)
	            SetServerVariable("[Domain]NMSpawned", 1)
                    -- Debug
                    printf("Bahamut is Spawned")
			end,

            onMobDeath = function(mob, player, isKiller, noKiller)
			   local reward = math.random(200, 325)
		       if player:getLocalVar("[Escha_Points]") == 1 then
		          player:addCurrency('escha_beads', reward)
                  player:PrintToPlayer(string.format("You have gained %s Escha Beads for your participation in this battle.", reward), xi.msg.channel.SYSTEM_3)
	           end	 
                -- Variable control
			    SetServerVariable("[Domain]NMToD", os.time()) -- Set NM ToD
    		    SetServerVariable("[Domain]NM", 0)            -- Set NM to be spawned next
				SetServerVariable("[Domain]NMSpawned", 0)     -- Set NM spawned flag (To not spawn infinite NMs)
				SetServerVariable("[Domain]Addon_Spawned", 0)
				SetServerVariable("[Domain]Addon_Spawned_2", 0)
				SetServerVariable("[Domain]Addon_Spawned_3", 0)
				SetServerVariable("Addon_Test", 4)
				SetServerVariable("MegaFlareUsed", 0)
	            SetServerVariable("GigaFlareUsed", 0)

                -- Server-wide message
                player:PrintToArea("Oh wow Bahamut and his Minions have been defeated!!!!!! Speak to lilith for your next battle.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)

                -- Debug
				printf("Current value of Spawned flag should be 0: %s", GetServerVariable("[Domain]NMSpawned"))
            end,
        })
    
                mob:setSpawn(-580, -228, 540, 65)
                mob:setDropID(0) -- No loot!
                mob:spawn()
	        	SetServerVariable("[Domain]NMSpawned", 1)
             	mob:setMobLevel(145)
             	mob:addMod(xi.mod.CURE_CAST_TIME, 225)
             	mob:addMod(xi.mod.CURE_POTENCY, 500)
             	mob:setMod(xi.mod.MATT, 600)
                mob:setMod(xi.mod.MACC, 2800)
             	mob:setMod(xi.mod.DEF, 3000)
             	mob:setMod(xi.mod.MDEF, 3000)
             	mob:setMod(xi.mod.TRIPLE_ATTACK, 30)
             	mob:setMod(xi.mod.ENSPELL_DMG, 100)
                mob:setMod(xi.mod.HASTE_MAGIC, 200)
             	mob:setMod(xi.mod.ATT, 3000)
             	mob:setMod(xi.mod.ACC, 1800)
             	mob:setMod(xi.mod.TRIPLE_ATTACK, 20)
             	mob:setMod(xi.mod.DOUBLE_ATTACK, 20)
             	mob:setMod(xi.mod.HASTE_MAGIC, 200)
             	mob:setMobMod(xi.mobMod.SKILL_LIST, 726)
             	mob:setMobMod(xi.mobMod.SPELL_LIST, 144)
             	mob:setMod(xi.mod.PETRIFYRES, 500) -- "Possesses a resist petrify trait"
             	mob:setMod(xi.mod.STUNRES, 1000)
                mob:setMod(xi.mod.COUNTER, 10) -- "Possesses a Counter trait"		
            end
	    
end)
-- Addon 1
m:addOverride("xi.zones.Provenance.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already.
    if
        GetServerVariable("Addon_Test") == 4 and
        GetServerVariable("[Domain]NM") == 2 and              -- Correct NM
		GetServerVariable("[Domain]Addon_Spawned") == 0 and
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Test 1",
            x = -570,
            y = -228,
            z = 538,
            rotation = 65,
            widescan = 1,
    
            groupId = 5,
            groupZoneId = 222,
			
            onMobSpawn = function(mob)
		        SetServerVariable("[Domain]Addon_Spawned", 1)

                printf("Test 1 Spawned")
			end,
            onMobFight = function(mob, target)
                if target:hasEnmity() then
                   target:setLocalVar("[Escha_Points]", 1)
	        	end
	        end,
            onMobDeath = function(mob, player, isKiller, noKiller)
				local reward = math.random(10, 25)
		            if player:getLocalVar("[Escha_Points]") == 1 then
		               player:addCurrency('escha_beads', reward)
                       player:PrintToPlayer(string.format("You have gained %s Escha Beads for your participation in this battle.", reward), xi.msg.channel.SYSTEM_3)
	                end	 
                local Addon = GetServerVariable("Addon_Test")
                local AddonLeft = math.floor(Addon / 4)
		                SetServerVariable("Addon_Test", Addon - AddonLeft - 1)
				    if GetServerVariable("Addon_Test", 0 ) then
				       SetServerVariable("[Domain]NMToD", os.time()) -- Set NM time
				    end

                -- Server-wide message
                player:PrintToArea("Test 1 Has been Defeated.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
            end,
        })
    
        mob:setSpawn(-570, -228, 538, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
		SetServerVariable("[Domain]Addon_Spawned", 1)
        mob:setMobLevel(119)
        mob:addMod(xi.mod.MAIN_DMG_RATING, 50)
        mob:addMod(xi.mod.STR, 50)
        mob:addMod(xi.mod.VIT, 20)
        mob:addMod(xi.mod.INT, 50)
        mob:addMod(xi.mod.MND, 20)
        mob:addMod(xi.mod.CHR, 20)
        mob:addMod(xi.mod.AGI, 20)
        mob:addMod(xi.mod.DEX, 40)
        mob:setMod(xi.mod.DEFP, 0)
        mob:setMod(xi.mod.RATTP, 0)
        mob:addMod(xi.mod.DEFP, 475)
        mob:addMod(xi.mod.RATTP, 475)
        mob:addMod(xi.mod.ACC, 100)
        mob:setMod(xi.mod.DOUBLE_ATTACK, 10)
        mob:setMod(xi.mod.EARTH_RES, 170)
        mob:setMod(xi.mod.DARK_RES, 250)
        mob:setMod(xi.mod.LIGHT_RES, 128)
        mob:setMod(xi.mod.FIRE_RES, 170)
        mob:setMod(xi.mod.WATER_RES, 170)
        mob:setMod(xi.mod.THUNDER_RES, 170)
        mob:setMod(xi.mod.ICE_RES, 200)
        mob:setMod(xi.mod.WIND_RES, 170)
        mob:setMod(xi.mod.SILENCERES, 100)
        mob:setMod(xi.mod.FIRE_ABSORB, 100)
        mob:setMod(xi.mod.STUNRES, 50)
        mob:setMod(xi.mod.BINDRES, 100)
        mob:setMod(xi.mod.GRAVITYRES, 100)
        mob:setMod(xi.mod.SLEEPRES, 100)
        mob:setMod(xi.mod.PARALYZERES, 100)
        mob:setMod(xi.mod.LULLABYRES, 100)
        mob:setMod(xi.mod.FASTCAST, 10)
	    mob:setMod(xi.mod.DOUBLE_ATTACK, 20)
        mob:addStatusEffect(xi.effect.BLAZE_SPIKES, 50, 0, 0)
        end
	    
end)
-- Addon 2
m:addOverride("xi.zones.Provenance.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already.
    if
        GetServerVariable("Addon_Test") == 4 and
        GetServerVariable("[Domain]NM") == 2 and              -- Correct NM
		GetServerVariable("[Domain]Addon_Spawned_2") == 0 and
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Test 2",
            x = -580,
            y = -228,
            z = 540,
            rotation = 65,
            widescan = 1,
    
            groupId = 4,
            groupZoneId = 222,
			
            onMobSpawn = function(mob)
		        SetServerVariable("[Domain]Addon_Spawned_2", 1)

                -- Debug
                printf("Test 2 Spawned")
            end,
            onMobFight = function(mob, target)
                if target:hasEnmity() then
                   target:setLocalVar("[Escha_Points]", 1)
	        	end
	        end,
            onMobDeath = function(mob, player, isKiller, noKiller)
			    local reward = math.random(10, 25)
		            if player:getLocalVar("[Escha_Points]") == 1 then
		               player:addCurrency('escha_beads', reward)
                       player:PrintToPlayer(string.format("You have gained %s Escha Beads for your participation in this battle.", reward), xi.msg.channel.SYSTEM_3)
	                end	  
                -- Variable control
	            local Addon = GetServerVariable("Addon_Test")
                local AddonLeft = math.floor(Addon / 4)
		            SetServerVariable("Addon_Test", Addon - AddonLeft - 1)
				if GetServerVariable("Addon_Test", 0 ) then
				   SetServerVariable("[Domain]NMToD", os.time()) -- Set NM ToD
				end

                -- Server-wide message
                player:PrintToArea("Test 2 has been defeated.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)

            end,
        })
    
        mob:setSpawn(-580, -228, 540, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
		SetServerVariable("[Domain]Addon_Spawned_2", 1)
        mob:setMobLevel(119)
        mob:addMod(xi.mod.STR, 40)
        mob:addMod(xi.mod.VIT, 20)
        mob:addMod(xi.mod.INT, 65)
        mob:addMod(xi.mod.MND, 20)
        mob:addMod(xi.mod.CHR, 20)
        mob:addMod(xi.mod.AGI, 20)
        mob:addMod(xi.mod.DEX, 40)
        mob:setMod(xi.mod.DEFP, 0)
        mob:setMod(xi.mod.RATTP, 0)
        mob:addMod(xi.mod.DEFP, 375)
        mob:addMod(xi.mod.RATTP, 375)
        mob:addMod(xi.mod.ACC, 100)
        mob:setMod(xi.mod.EARTH_RES, 170)
        mob:setMod(xi.mod.DARK_RES, 240)
        mob:setMod(xi.mod.LIGHT_RES, 170)
        mob:setMod(xi.mod.FIRE_RES, 128)
        mob:setMod(xi.mod.WATER_RES, 170)
        mob:setMod(xi.mod.THUNDER_RES, 170)
        mob:setMod(xi.mod.WIND_RES, 128)
        mob:setMod(xi.mod.ICE_RES, 200)
        mob:setMod(xi.mod.SILENCERES, 100)
        mob:setMod(xi.mod.STUNRES, 50)
        mob:setMod(xi.mod.BINDRES, 100)
        mob:setMod(xi.mod.GRAVITYRES, 100)
        mob:setMod(xi.mod.SLEEPRES, 100)
        mob:setMod(xi.mod.POISONRES, 100)
        mob:setMod(xi.mod.PARALYZERES, 100)
        mob:setMod(xi.mod.LULLABYRES, 100)
        mob:setMod(xi.mod.EARTH_ABSORB, 100)
        mob:setMod(xi.mod.LIGHT_ABSORB, 100)
	    mob:setMod(xi.mod.DOUBLE_ATTACK, 20)
        mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
	    
        end
	    
end)
-- Addon 3
m:addOverride("xi.zones.Provenance.Zone.onZoneTick", function(zone)
    super(zone)

    -- Spawn mob if its the correct mob and if it isnt spawned already.
    if
        GetServerVariable("Addon_Test") == 4 and
        GetServerVariable("[Domain]NM") == 2 and              -- Correct NM
		GetServerVariable("[Domain]Addon_Spawned_3") == 0 and
        (os.time() - GetServerVariable("[Domain]NMToD")) > 30 -- NM Cooldown
    then
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = "Test 3",
            x = -590,
            y = -228,
            z = 540,
            rotation = 65,
            widescan = 1,
    
            groupId = 6,
            groupZoneId = 222,
			
            onMobSpawn = function(mob)
		        SetServerVariable("[Domain]Addon_Spawned_3", 1)
                -- Debug
                printf("Test 3 Spawned")
			end,
            onMobFight = function(mob, target)
                if target:hasEnmity() then
                   target:setLocalVar("[Escha_Points]", 1)
	        	end
	        end,
            onMobDeath = function(mob, player, isKiller, noKiller)
                local reward = math.random(10, 25)
		            if player:getLocalVar("[Escha_Points]") == 1 then
		               player:addCurrency('escha_beads', reward)
                       player:PrintToPlayer(string.format("You have gained %s Escha Beads for your participation in this battle.", reward), xi.msg.channel.SYSTEM_3)
	                end	  
		            		-- Variable control
	            local Addon = GetServerVariable("Addon_Test")
                local AddonLeft = math.floor(Addon / 4)
		            SetServerVariable("Addon_Test", Addon - AddonLeft - 1)
				    if GetServerVariable("Addon_Test", 0 ) then
				       SetServerVariable("[Domain]NMToD", os.time()) -- Set NM ToD
				    end
						

                -- Server-wide message
                player:PrintToArea("Test 3 has been defeated.", xi.msg.channel.SYSTEM_3, xi.msg.area.SYSTEM)
            end,
        })
    
        mob:setSpawn(-590, -228, 540, 65)
        mob:setDropID(0) -- No loot!
        mob:spawn()
		SetServerVariable("[Domain]Addon_Spawned_3", 1)
        mob:setMobLevel(119)
        mob:addMod(xi.mod.MAIN_DMG_RATING, 50)
        mob:addMod(xi.mod.STR, 40)
        mob:addMod(xi.mod.VIT, 20)
        mob:addMod(xi.mod.INT, 50)
        mob:addMod(xi.mod.MND, 20)
        mob:addMod(xi.mod.CHR, 20)
        mob:addMod(xi.mod.AGI, 20)
        mob:addMod(xi.mod.DEX, 40)
        mob:setMod(xi.mod.DEFP, 0)
        mob:setMod(xi.mod.RATTP, 0)
        mob:addMod(xi.mod.DEFP, 475)
        mob:addMod(xi.mod.RATTP, 475)
        mob:addMod(xi.mod.ACC, 150)
	    mob:setMod(xi.mod.MATT, 380)
        mob:setMod(xi.mod.MACC, 900)
        mob:setMod(xi.mod.EARTH_RES, 128)
        mob:setMod(xi.mod.DARK_RES, 250)
        mob:setMod(xi.mod.LIGHT_RES, 200)
        mob:setMod(xi.mod.ICE_RES, 200)
        mob:setMod(xi.mod.FIRE_RES, 200)
        mob:setMod(xi.mod.WATER_RES, 200)
        mob:setMod(xi.mod.THUNDER_RES, 200)
        mob:setMod(xi.mod.WIND_RES, 200)
        mob:setMod(xi.mod.SILENCERES, 100)
        mob:setMod(xi.mod.STUNRES, 50)
        mob:setMod(xi.mod.BINDRES, 100)
        mob:setMod(xi.mod.GRAVITYRES, 100)
        mob:setMod(xi.mod.SLEEPRES, 100)
        mob:setMod(xi.mod.POISONRES, 100)
        mob:setMod(xi.mod.PARALYZERES, 100)
        mob:setMod(xi.mod.LULLABYRES, 100)
        mob:setMod(xi.mod.FASTCAST, 10)
	    mob:setMod(xi.mod.DOUBLE_ATTACK, 20)
        mob:addStatusEffect(xi.effect.SHOCK_SPIKES, 50, 0, 0)
        mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
        mob:addStatusEffect(xi.effect.ENTHUNDER_II, 100, 0, 0)
        mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
        end
	    
    end)

return m
