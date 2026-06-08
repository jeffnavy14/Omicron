local controller = {}

-----------------------------------
-- Config
--[[
Tied to di_controler
scripts/commands/addelvorseal
scripts/commands/foma_invasion
scripts/commands/whereisdi
scripts/effects/elvorseal
scripts/global.player - onGameIn
scripts/globals/server - onServerStart
scripts/zones/Escha_RuAun/mobs/Mireu
scripts/zones/Escha_RuAun/mobs/Naga_Raja
scripts/zones/Escha_RuAun/mobs/Naga_Raja_Lamia
scripts/zones/Escha_RuAun/Zone - onZoneTick
scripts/zones/Escha_Zitah/mobs/Mireu
scripts/zones/Escha_Zitah/mobs/Azi_Dahaka
scripts/zones/Escha_Zitah/mobs/Azi_Dahaka_Dragon
scripts/zones/Escha_Zitah/Zone - onZoneTick
scripts/zones/Reisenjima/mobs/Mireu
scripts/zones/Reisenjima/mobs/Quetzalcoatl
scripts/zones/Reisenjima/mobs/Quetzalcoatl_Sibilus
scripts/zones/Reisenjima/Zone - onZoneTick
]]--
-----------------------------------
controller.zones =
{
    xi.zone.ESCHA_ZITAH,
    xi.zone.REISENJIMA,
    xi.zone.ESCHA_RUAUN
}

controller.respawnDelay = 900   -- in seconds; 15 minutes
controller.warnDelay    = 600 -- in seconds, 10 minutes
controller.mireuChance  = 0.10
controller.dragonDelay  = 60  -- in seconds, 1 minute
controller.hpBase = 1450000
controller.hpScaling = 0.15
controller.leechThreshold = 0.02
controller.basePoints = 20
controller.dailyCap = 200
controller.mireuCap = 300
controller.idleDespawn = 1800 -- 30 minutes

-----------------------------------
-- Helpers
-----------------------------------
local function getZone()
    local index = GetServerVariable("DI_ZONE_INDEX")
    if index == 0 then
        index = 1
        SetServerVariable("DI_ZONE_INDEX", index)
    end
    return GetZone(controller.zones[index])
end

local function rotateZone()
    local index = GetServerVariable("DI_ZONE_INDEX")
    index = index + 1
    if index > #controller.zones then index = 1 end
    SetServerVariable("DI_ZONE_INDEX", index)
end

-----------------------------------
-- Broadcast
-----------------------------------
local unityLeaders =
{
    [1] = 'Pieuje', [2] = 'Ayame', [3] = 'Invincible Shield',
    [4] = 'Apururu', [5] = 'Maat', [6] = 'Aldo',
    [7] = 'Jakoh Wahcondalo', [8] = 'Naja Salaheem',
    [9] = 'Flaviria', [10] = 'Yoran Oran', [11] = 'Sylvie',
}

local zoneMobs =
{
    [288] = { 'Escha Zitah', 'Azi Dahaka' },
    [289] = { 'Escha RuAun', 'Naga Raja' },
    [291] = { 'Reisenjima', 'Quetzalcoatl' },
}

local posDialog =
{
    [288] = 'H-8',
    [289] = 'H-9',
    [291] = '??',
}

local function broadcast(key, mob)
    local streakCount = GetServerVariable("DI_STREAK_COUNT")
    local zone        = mob and mob:getZone() or getZone()
    local zoneId      = zone:getID()
    local isMireu     = zone:getLocalVar("DI_IS_MIREU") == 1

    local zoneData    = zoneMobs[zoneId] or { "Unknown", "Dragon" }
    local zoneName    = zoneData[1]
    local mobName     = isMireu and "Mireu" or zoneData[2]
    local pos         = posDialog[zoneId] or "??"
    local hpp         = mob and mob:getHPP() or 100

    local messages =
    {
        ['Pieuje'] = {
            ['spawnWarning']         = string.format("Attention! All able-bodied members should report for battle in %s in the next 10 minutes. %s will make his presence known at %s.", zoneName, mobName, pos),
            ['minionsSpawned']       = string.format("We've received word that the %s vanguard has appeared at %s in %s! Go deal with them!", mobName, pos, zoneName),
            ['dragonSpawned']        = string.format("Just as our intelligence predicted, %s has appeared in %s at %s!", mobName, zoneName, pos),
            ['dragonMidFight']       = string.format("Our latest intelligence reports that %s in %s is at %d%% HP!", mobName, zoneName, hpp),
            ['dragonKilledDialog1']  = string.format("The light of victory is upon us! %s in %s has been defeated.", mobName, zoneName),
            ['dragonKilledDialog2']  = string.format("Let's see how we're doing... We've defeated %d monsters in a row.", streakCount),
            ['mobDespawned']         = string.format("Strange...our scouts report no trace of %s in %s.", mobName, zoneName),
        },
        ['Ayame'] = {
            ['spawnWarning']         = string.format("I have just received word from our scouts that %s is expected to arrive in %s in %s within the next 10 minutes.", mobName, zoneName, pos),
            ['minionsSpawned']       = string.format("It seems we have a bit of a problem... Servants of %s have appeared in %s in %s.", mobName, pos, zoneName),
            ['dragonSpawned']        = string.format("%s has been seen in %s in %s!", mobName, zoneName, pos),
            ['dragonMidFight']       = string.format("Our latest reports indicate that %s in %s is at %d%% HP!", mobName, zoneName, hpp),
            ['dragonKilledDialog1']  = string.format("Thanks to our combined strength, we have managed to bring down %s in %s!", mobName, zoneName),
            ['dragonKilledDialog2']  = string.format("So far, we have defeated %d monsters in a row.", streakCount),
            ['mobDespawned']         = string.format("%s is nowhere to be seen. Our advance party will continue to patrol %s in search of a trail.", mobName, zoneName),
        },
        ['Invincible Shield'] = {
            ['spawnWarning']         = string.format("Reconnaissance just sent this. Unusual activity's been reported in %s, grid %s. We think that %s will strike there within 10 minutes.", zoneName, pos, mobName),
            ['minionsSpawned']       = string.format("%s's minions have appeared in grid %s of %s! Dispose of them immediately!", mobName, pos, zoneName),
            ['dragonSpawned']        = string.format("%s has been identified in %s, grid %s. You and your maggoty friends better get down there now!", mobName, zoneName, pos),
            ['dragonMidFight']       = string.format("Our objective area is %s. Target is %s. Target's HP is at %d%%! Maintain your battle lines!", zoneName, mobName, hpp),
            ['dragonKilledDialog1']  = string.format("Target %s in %s is down! Now get back to base!", mobName, zoneName),
            ['dragonKilledDialog2']  = string.format("By my count, it looks like we've defeated %d monsters in a row.", streakCount),
            ['mobDespawned']         = string.format("What!? The target is out of sight! We've lost contact with %s in %s!", mobName, zoneName),
        },
        ['Apururu'] = {
            -- text cut off below
          --['spawnWarning']         = string.format("Oh dear, one of our members-wembers in %s says that %s could appear around %s anytime in the next 10 minutes. Would you please go and", zoneName, mobName, pos),
            ['spawnWarning']         = string.format("Oh dear, one of our members-wembers in %s says that %s could appear around %s anytime in the next 10 minutes.", zoneName, mobName, pos),
            ['minionsSpawned']       = string.format("Hm!? A group of monsters has appeared in advance of %s! Please, hurry-wurry to %s in %s immediately!", mobName, pos, zoneName),
            ['dragonSpawned']        = string.format("Bad news! Have you heard of %s? Well they say he's appeared in %s (%s) and seems very upsetaru!", mobName, zoneName, pos),
            ['dragonMidFight']       = string.format("I hear that old %s in %s is at %d%% HP as we speak-weak.", mobName, zoneName, hpp),
            ['dragonKilledDialog1']  = string.format("Thank goodness! It looks like that naughty-waughty %s in %s is no more. And it looks like our girl got away.", mobName, zoneName),
            ['dragonKilledDialog2']  = string.format("Hmm... I believe we've defeated %d monsters in a row.", streakCount),
            ['mobDespawned']         = string.format("Oh my. It looks like we've lost sightaru of that nasty %s in %s.", mobName, zoneName),
        },
        ['Maat'] = {
            ['spawnWarning']         = string.format("Hrmph. The Jeuno garrison sent us a request. They say %s will show up in %s around %s in the next 10 minutes or so.", mobName, zoneName, pos),
            ['minionsSpawned']       = string.format("Hmm... A group of %s's lapdogs has appeared at %s in %s.", mobName, pos, zoneName),
            ['dragonSpawned']        = string.format("That fool %s's appeared down in %s around %s. What say we show that monster what this fancy “Unity” business is all about?", mobName, zoneName, pos),
            ['dragonMidFight']       = string.format("%s in %s's at %d%% HP. Let him have it!", mobName, zoneName, hpp),
            ['dragonKilledDialog1']  = string.format("Hohoho! %s is now free of any and all %s shenanigans!", zoneName, mobName),
            ['dragonKilledDialog2']  = string.format("Now then, we've managed to take out %d monsters in a row.", streakCount),
            ['mobDespawned']         = string.format("What? That yellow %s in %s's gone and run off!", mobName, zoneName),
        },
        ['Sylvie'] = {
            ['spawnWarning']         = string.format("Okay, everyone! I just had a vision. In the next 10 minutes, somebody called “%s” will be showing up in %s, somewhere around %s!", mobName, zoneName, pos),
            ['minionsSpawned']       = string.format("There appears to be a unit separate from %s out there. Please head to %s (%s) and investigate.", mobName, zoneName, pos),
            ['dragonSpawned']        = string.format("Uh-oh! He's here! That %s guy's showed up in %s around %s, and he seems super duper mad.", mobName, zoneName, pos),
            ['dragonMidFight']       = string.format("The %s guy in %s feels like he's at around %d%% HP, I think.", mobName, zoneName, hpp),
            ['dragonKilledDialog1']  = string.format("Oh wow, good job, everyone! That %s guy in %s is all beaten up. I think we won! Yay!", mobName, zoneName),
            ['dragonKilledDialog2']  = string.format("Currently, we have taken down %d monsters in a row.", streakCount),
            ['mobDespawned']         = string.format("So...guys, don't get mad, but I lost track of %s's aura in %s. Where did he go?", mobName, zoneName),
        },
        ['Aldo'] = {
            ['spawnWarning']         = string.format("So here's the deal. Within the next 10 minutes, %s will be in %s (%s). Don't ask me how I know this, my sources never lie.", mobName, zoneName, pos),
            ['minionsSpawned']       = string.format("Tch! Some of %s's lackeys have appeared! You can find them in %s (%s).", mobName, zoneName, pos),
            ['dragonSpawned']        = string.format("Have you heard? %s's appeared in %s (%s). I don't know about you, but I smell a very interesting business opportunity here.", mobName, zoneName, pos),
            ['dragonMidFight']       = string.format("%s in %s's HP is at %d%%.", mobName, zoneName, hpp),
            ['dragonKilledDialog1']  = string.format("Good work team! %s in %s is history!", mobName, zoneName),
            ['dragonKilledDialog2']  = string.format("Up to now, we've defeated %d monsters in a row.", streakCount),
            ['mobDespawned']         = string.format("Urk... Where'd he go? %s in %s's gotten away.", mobName, zoneName),
        },
        ['Jakoh Wahcondalo'] = {
            ['spawnWarning']         = string.format("One of our young seers says she senses the growing prrresence of %s in %s around %s. She said sometime in the next “10 minutes”", mobName, zoneName, pos),
            ['minionsSpawned']       = string.format("I hear that a grrroup of %s's minions is waiting in %s (%s). Looks like a prelude to the main battle.", mobName, zoneName, pos),
            ['dragonSpawned']        = string.format("It's %s! He's appearrred in %s around %s. Help us brrring the fight to him!", mobName, zoneName, pos),
            ['dragonMidFight']       = string.format("Keep the prrressure on %s in %s! He's at %d%% HP!", mobName, zoneName, hpp),
            ['dragonKilledDialog1']  = string.format("%s in %s is no more! You kittens arrren't so weak after all!", mobName, zoneName),
            ['dragonKilledDialog2']  = string.format("Let's see how we'rrre doing... We've defeated %d monsters in a row.", streakCount),
            ['mobDespawned']         = string.format("You Opo-opo-headed numbskulls! %s in %s's gotten away!", mobName, zoneName),
        },
        ['Naja Salaheem'] = {
            ['spawnWarning']         = string.format("Listen up! A very rrreliable source tells me %s will be showing up in %s around %s in the next 10 minutes or so.", mobName, zoneName, pos),
            ['minionsSpawned']       = string.format("There's a grrroup of %s's minions that've arrived in %s near %s. Get out there and do whatcha do best!", mobName, zoneName, pos),
            ['dragonSpawned']        = string.format("What did I tell you? %s's been spotted in %s around %s. Do you need me to hold your paws, or can ya figure out the rest by yourselves?", mobName, zoneName, pos),
            ['dragonMidFight']       = string.format("%s in %s's at %d%% HP! Remember, if ya don't bring me back his head I can still settle for yourrrs!", mobName, zoneName, hpp),
            ['dragonKilledDialog1']  = string.format("And that, my frrriends, is how we do it. %s in %s is cat food.", mobName, zoneName),
            ['dragonKilledDialog2']  = string.format("Haha! That's the spirrrit! We've beaten %d monsters in a row.", streakCount),
            ['mobDespawned']         = string.format("Okay, now who wants to explain to me how %s in %s got away? I prrromise I won't bite...don't know what my morgenstern might do, though...", mobName, zoneName),
        },
        ['Flaviria'] = {
            ['spawnWarning']         = string.format("You there! Do you like %s? Do you like %s? According to our feelers, in the next 10 minutes, he should show up there around %s.", zoneName, mobName, pos),
            ['minionsSpawned']       = string.format("Alright then, it seems a group of %s's minions is looking to set the stage at %s in %s. Go introduce yourself!", mobName, pos, zoneName),
            ['dragonSpawned']        = string.format("What do you know? It's %s and he's at %s (%s). We should totally kill him!♪", mobName, zoneName, pos),
            ['dragonMidFight']       = string.format("This just in! %s in %s is at %d%% HP!", mobName, zoneName, hpp),
            ['dragonKilledDialog1']  = string.format("You did it! The evil %s is beat, %s is at peace, the princess is saved, a hero is you, etc.", mobName, zoneName),
            ['dragonKilledDialog2']  = string.format("Haha! Splendid! We've beaten %d monsters in a row.", streakCount),
            ['mobDespawned']         = string.format("Uh-oh. The %s that was in %s is not there anymore. Has anyone seen him? If any of you see him, please let us know.", mobName, zoneName),
        },
        ['Yoran Oran'] = {
            ['spawnWarning']         = string.format("The Rhinostery field researchers in %s reported some unusual data around %s. They think %s could show up there within 10 minutes.", zoneName, pos, mobName),
            ['minionsSpawned']       = string.format("Our field researchers sent a report from %s in %s. Apparently, monsters affiliated with %s have arrived there.", pos, zoneName, mobName),
            ['dragonSpawned']        = string.format("Our field researchers in %s have reported that %s has appeared around %s. What a rare research-ethy opportunity!", zoneName, mobName, pos),
            ['dragonMidFight']       = string.format("New data-ethy from %s suggests that %s is presently at %d%% HP ±0.15.", zoneName, mobName, hpp),
            ['dragonKilledDialog1']  = string.format("Excellent! The %s specimen from %s has been successfully defeated-ethy!", mobName, zoneName),
            ['dragonKilledDialog2']  = string.format("Hmm... Let's see how our research is progressing! We've defeated-ethy %d monsters in a row.", streakCount),
            ['mobDespawned']         = string.format("Most perplexing! The %s specimen from %s seems to have gotten away! What an unfortunate blow to our research-ethy.", mobName, zoneName),
        },
    }

    -- Special fallback for Mireu Descended which is often a unique global announcement
    local mireuDescended = "Mireu has descended upon the domain!"

    for i = 1, 299 do
        local targetZone = GetZone(i)
        if targetZone then
            for _, player in pairs(targetZone:getPlayers()) do
                local leaderId = player:getUnityLeader()
                local unityLeader = unityLeaders[leaderId]

                -- Only send if the player has a valid unity leader
                if leaderId and unityLeader then
                    local leaderMsgs = messages[unityLeader] or messages['Pieuje'] -- Fallback to Pieuje
                    local finalMsg = leaderMsgs[key]

                    -- If Mireu spawned, some systems use a generic announcement if specific key isn't provided
                    if isMireu and key == "minionsSpawned" then
                        finalMsg = mireuDescended
                    end

                    if finalMsg then
                        player:printToPlayer(finalMsg, xi.msg.channel.UNITY, tostring(unityLeader))
                    end
                end
            end
        end
    end
end

local function setDespawnTime(zone)
    local despawnTime = GetSystemTime() + controller.idleDespawn
    SetServerVariable("DI_DESPAWN_TIME_" .. zone:getID(), despawnTime)
end

-----------------------------------
-- Spawn Phase (Mireu or Minions)
-----------------------------------
function controller.spawn()
    local zone = getZone()
    local wyrmId  = zone:getLocalVar("DI_WYRM_ID")
    local mireuId = zone:getLocalVar("DI_MIREU_ID")

    if wyrmId == 0 then
        print("[DI] Missing mob ID for "..zone:getName())
        return
    end

    SetServerVariable("DI_NEXT_SPAWN", 0)
    SetServerVariable("DI_WARN_TIME", 0)
    SetServerVariable("DI_DRAGON_SPAWN_TIME_" .. zone:getID(), 0)
	SetServerVariable("DI_DESPAWN_TIME_" .. zone:getID(), 0)

    zone:setLocalVar("DI_MINION", 0)
    zone:setLocalVar("DI_WYVERN_SPAWNED", 0)

    -- Reset Mireu flag every spawn
    zone:setLocalVar("DI_IS_MIREU", 0)

    -- Roll for Mireu
    if math.random() < controller.mireuChance then
        local mireu = SpawnMob(mireuId)
        if mireu then
            mireu:setMobMod(xi.mobMod.AOE_HIT_ALL, 1)
            mireu:setMobMod(xi.mobMod.CLAIM_TYPE, xi.claimType.UNCLAIMABLE)
            mireu:addStatusEffect(xi.effect.CONFRONTATION, { power = 1, origin = mireu, flag = xi.effectFlag.CONFRONTATION })
            setDespawnTime(zone)
            SetServerVariable("DI_IN_PROGRESS", 1)
            SetServerVariable("DomainInvasionActiveZone", zone:getID())
        end

        zone:setLocalVar("DI_IS_MIREU", 1)

        broadcast("dragonSpawned")
        broadcast("minionsSpawned") -- broadcast handles Mireu check internally now
        print("[DI] Mireu spawned in "..zone:getName())
        return
    end

    for i = 1, 11 do
        local minion = SpawnMob(wyrmId + i)
        if minion then
            minion:setMobMod(xi.mobMod.AOE_HIT_ALL, 1)
            minion:setMobMod(xi.mobMod.CLAIM_TYPE, xi.claimType.UNCLAIMABLE)
            minion:addStatusEffect(xi.effect.CONFRONTATION, { power = 1, origin = minion, flag = xi.effectFlag.CONFRONTATION })
            setDespawnTime(zone)
            SetServerVariable("DI_IN_PROGRESS", 1)
            SetServerVariable("DomainInvasionActiveZone", zone:getID())
        end
    end

    broadcast("Domain Invasion forces are gathering!")
    broadcast("minionsSpawned")
    print("[DI] Minions spawned in "..zone:getName())
end

-----------------------------------
-- Spawn Main Dragon after adds
-----------------------------------
function controller.spawnWyvern(zone)
    local wyrmId = zone:getLocalVar("DI_WYRM_ID")

    -- AoE protection: only spawn once
    if zone:getLocalVar("DI_WYVERN_SPAWNED") == 1 then return end

    zone:setLocalVar("DI_WYVERN_SPAWNED", 1)
    local dragon = SpawnMob(wyrmId)
    if dragon then
        dragon:setMobMod(xi.mobMod.AOE_HIT_ALL, 1)
        dragon:setMobMod(xi.mobMod.CLAIM_TYPE, xi.claimType.UNCLAIMABLE)
        dragon:addStatusEffect(xi.effect.CONFRONTATION, { power = 1, origin = dragon, flag = xi.effectFlag.CONFRONTATION })
        setDespawnTime(zone)
        SetServerVariable("DI_IN_PROGRESS", 1)
        SetServerVariable("DomainInvasionActiveZone", zone:getID())
    end

    broadcast("A Domain Invasion dragon has appeared!")
    broadcast("dragonSpawned", dragon)
    print("[DI] Wyvern spawned in "..zone:getName())
end

-----------------------------------
-- Minion Death Handler
-----------------------------------
function controller.onMinionDeath(mob)
    local zone = mob:getZone()
    if zone:getLocalVar("DI_WYVERN_SPAWNED") == 1 then return end

    local wyrmId = zone:getLocalVar("DI_WYRM_ID")
    local minionsAlive = false

    -- Check if ANY of the 11 minions are still alive/spawned
    for i = 1, 11 do
        local minion = GetMobByID(wyrmId + i)
        if minion and minion:isSpawned() and minion:getHP() > 0 then
            minionsAlive = true
            break
        end
    end

    -- If all 11 minions are certified dead, trigger the dragon arrival safely
    if not minionsAlive and zone:getLocalVar("DI_WYVERN_SPAWNED") == 0 then
        -- Force ensure the counter variable is cleared out to avoid script stalls
        zone:setLocalVar("DI_MINION", 11) 
        
        local now = GetSystemTime()
        SetServerVariable("DI_DRAGON_SPAWN_TIME_"..zone:getID(), now + controller.dragonDelay)
        broadcast("The Domain Invasion dragon will arrive shortly!")
        print("[DI] All minions defeated. Dragon arrival scheduled for zone " .. zone:getID())
    end
end

-----------------------------------
-- Despawn Handler
-----------------------------------
function controller.handleDespawn(zoneId)
    local zone = GetZone(zoneId)
    if not zone then return end

    local wyrmId  = zone:getLocalVar("DI_WYRM_ID")
    local mireuId = zone:getLocalVar("DI_MIREU_ID")

    local mob = GetMobByID(wyrmId)
    local mireu = GetMobByID(mireuId)

    local activeMob = mob or mireu -- Default fallback for the broadcast tracking

    -- 1. If Mireu is up, clear him out
    if mireu and mireu:isSpawned() then
        activeMob = mireu
        DespawnMob(mireuId)
    end

    -- 2. If the main Dragon is up, clear him out
    if mob and mob:isSpawned() then
        activeMob = mob
        DespawnMob(wyrmId)
    end

    -- 3. FORCE CLEANUP ALL MINIONS (Wipes out lingering adds if skipped)
    if wyrmId and wyrmId > 0 then
        for i = 1, 11 do
            local minionId = wyrmId + i
            local minion = GetMobByID(minionId)
            if minion and minion:isSpawned() then
                DespawnMob(minionId)
            end
        end
    end

    -- Broadcast ALWAYS (even if mob nil)
    broadcast("mobDespawned", activeMob)

    -- Reset streaks on failure
    SetServerVariable("DI_MIREU_KILLS", 0)
    SetServerVariable("DI_STREAK_COUNT", 0)

    -- Reset state
    controller.resetZone(zone)
end

-----------------------------------
-- Reset Zone
-----------------------------------
function controller.resetZone(zone)

    if not zone then return end

    -- Prevent double reset
    if zone:getLocalVar("DI_RESET_DONE") == 1 then
        return
    end

    zone:setLocalVar("DI_RESET_DONE", 1)

    -- Reset invasion state
    zone:setLocalVar("DI_MINION", 0)
    zone:setLocalVar("DI_WYVERN_SPAWNED", 0)
    zone:setLocalVar("DI_IS_MIREU", 0)

    -- Remove Elvorseal
    for _, player in pairs(zone:getPlayers()) do
        if player:hasStatusEffect(xi.effect.ELVORSEAL) then
            player:delStatusEffect(xi.effect.ELVORSEAL)

            local pet = player:getPet()
            if pet then
                pet:delStatusEffect(xi.effect.ELVORSEAL)
            end

            for _, trust in ipairs(player:getPartyWithTrusts() or {}) do
                if trust:isTrust() then
                    trust:delStatusEffect(xi.effect.ELVORSEAL)
                end
            end
        end
    end

    -- Reset globals
    SetServerVariable("DI_IN_PROGRESS", 0)
    SetServerVariable("DomainInvasionActiveZone", 0)

    rotateZone()
    controller.scheduleNext()
end

-----------------------------------
-- Dragon Death
-----------------------------------
function controller.onDeath(mob)

    local zone = mob:getZone()

    print("[DI] Dragon defeated in "..zone:getName())

    local zoneData = zoneMobs[mob:getZoneID()]
    local zoneName = "Unknown"
    local mobName  = "Dragon"

    if zoneData then
        zoneName = zoneData[1]
        mobName  = zoneData[2]
    end

    -- FIXED Mireu detection
    local isMireu = (zone:getLocalVar("DI_IS_MIREU") == 1)

    -- FIXED streak logic
    if not isMireu then
        local streakCount = GetServerVariable("DI_STREAK_COUNT") + 1
        SetServerVariable("DI_STREAK_COUNT", streakCount)
    else
        local kills = GetServerVariable("DI_MIREU_KILLS") + 1
        local streakCount = GetServerVariable("DI_STREAK_COUNT") + 1

        SetServerVariable("DI_MIREU_KILLS", kills)
        SetServerVariable("DI_STREAK_COUNT", streakCount)
    end

    SetServerVariable("DI_DESPAWN_TIME_" .. zone:getID(), 0)
    zone:setLocalVar("DI_RESET_DONE", 0)
    SetServerVariable("DI_IN_PROGRESS", 0)
    SetServerVariable("DomainInvasionActiveZone", 0)
    broadcast('Oh wow, good job, everyone! That '..mobName..' in '..zoneName..' is all beaten up!')
    broadcast('Weve killed 100 of these so far!')
    broadcast("dragonKilledDialog1", mob)
    broadcast("dragonKilledDialog2", mob)

    -- ========================================
    -- Build player list (numeric-safe)
    -- ========================================
    local players = {}

    for _, player in pairs(zone:getPlayers()) do
        local id = player:getID()

        if mob:getLocalVar('[di_player]' .. id) == 1 then
            local dmg = mob:getLocalVar('[di_damage]' .. id) or 0

            table.insert(players, {
                player = player,
                damage = dmg
            })
        end
    end

    local validPlayers = controller.antiFilter(players, mob)
    local participantCount = #validPlayers

    print("[DI DEBUG] validPlayers: "..participantCount)
    print("[DI DEBUG] isMireu: "..tostring(isMireu))

    local maxHP = mob:getMaxHP()
    for _, data in pairs(validPlayers) do
        local ratio = data.damage / maxHP

        ratio = math.max(ratio, 0.0001)

        local beads = 500 + math.floor(500 * math.min(1, ratio / 0.2))
        npcUtil.giveCurrency(data.player, 'escha_beads', beads)

        controller.giveDomainPoints(data.player, participantCount, isMireu, data.damage, maxHP)
        controller.givePersonalReward(data.player)
    end

    for _, player in pairs(zone:getPlayers()) do
        if player:hasStatusEffect(xi.effect.ELVORSEAL) then
            player:delStatusEffect(xi.effect.ELVORSEAL)
            local pet = player:getPet()
            if pet then
                pet:delStatusEffect(xi.effect.ELVORSEAL)
            end
            for _, trust in ipairs(player:getPartyWithTrusts() or {}) do
                if trust:isTrust() then
                    trust:delStatusEffect(xi.effect.ELVORSEAL)
                end
            end
        end
    end

    -- ========================================
    -- Reset invasion state
    -- ========================================
    zone:setLocalVar("DI_MINION", 0)
    zone:setLocalVar("DI_WYVERN_SPAWNED", 0)
    zone:setLocalVar("DI_RESET_DONE", 0)

    -- Reset Mireu flag after fight
    zone:setLocalVar("DI_IS_MIREU", 0)

    rotateZone()
    controller.scheduleNext()

    -- Signal that the invasion is over
    SetServerVariable("DomainInvasionActiveZone", 0)
end

-----------------------------------
-- Dragon spawn mods
-----------------------------------
function controller.onSpawn(mob)
    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
    mob:setMobMod(xi.mobMod.AOE_HIT_ALL, 1)
    mob:addStatusEffect(xi.effect.CONFRONTATION, { power = 1, origin = mob, flag = xi.effectFlag.CONFRONTATION })

    -- Reset tracking (numeric-safe)
    mob:removeListener('DI_DRAGON')

    mob:addListener('TAKE_DAMAGE', 'DI_DRAGON', function(mobArg, damage, attacker, attackType)

        if mobArg:getHP() <= 0 or not attacker then
            return
        end

        -- Convert pets/trusts to player
        if attacker:isPet() or attacker:isTrust() then
            attacker = attacker:getMaster()
        end

        if not attacker or not attacker:isPC() then
            return
        end

        local playerId = attacker:getID()
        local dmgVar = '[di_damage]' .. playerId

        -- =========================
        -- Track damage
        -- =========================
        if attackType >= xi.attackType.PHYSICAL and attackType <= xi.attackType.SPECIAL then
            local total = mobArg:getLocalVar(dmgVar) or 0
            mobArg:setLocalVar(dmgVar, total + damage)
        end

        -- =========================
        -- Track players (NUMERIC SAFE)
        -- =========================
        mobArg:setLocalVar('[di_player]' .. playerId, 1)

    end)
end
-----------------------------------
-- Schedule next invasion
-----------------------------------
function controller.scheduleNext()
    local now = GetSystemTime()
    local spawnTime = now + controller.respawnDelay
    local warnTime  = spawnTime - controller.warnDelay

    SetServerVariable("DI_NEXT_SPAWN", spawnTime)
    SetServerVariable("DI_WARN_TIME", warnTime)

    print("[DI] Next spawn scheduled in "..controller.respawnDelay.." seconds")
end

-----------------------------------
-- 10 Minute Warning
-----------------------------------
local function warning()
    local zone = getZone()
    broadcast("The air begins to tremble... A powerful dragon will arrive in "..zone:getName().." in 10 minutes!")
    broadcast("spawnWarning")
    SetServerVariable("DI_WARN_TIME", 0)
end

function controller.checkGlobalReset()

    print("[DI] Global daily reset triggered")

    for i = 1, 299 do
        local zone = GetZone(i)
        if zone then
            for _, player in pairs(zone:getPlayers()) do
                player:setCurrency('domain_points_daily', 0)
            end
        end
    end

    -- Optional: store last reset time (for login checks/debug)
    SetServerVariable("DI_LAST_RESET", JstMidnight() - 86400)
end


function controller.resetOnLogIn(player)

    local lastReset = tonumber(GetServerVariable("DI_LAST_RESET")) or 0
    local playerLast = tonumber(player:getCharVar("DI_LAST_RESET")) or 0

    if playerLast < lastReset then
        player:setCurrency('domain_points_daily', 0)
        player:setCharVar("DI_MIREU_BONUS", 0)
        player:setCharVar("DI_LAST_RESET", lastReset)
    end
end

-----------------------------------
-- Tick Loop
-----------------------------------
function controller.tick()
    local now       = GetSystemTime()
    local nextSpawn = GetServerVariable("DI_NEXT_SPAWN")
    local warnTime  = GetServerVariable("DI_WARN_TIME")

    -- MASTER SWITCH
    if GetServerVariable("DI_ACTIVE") ~= 1 then
        return
    end

    if warnTime > 0 and now >= warnTime then warning() end
    if nextSpawn > 0 and now >= nextSpawn then controller.spawn() end

    -- Check for delayed dragon spawn per zone
    for _, zoneId in ipairs(controller.zones) do
        local zone = GetZone(zoneId)
        if zone then
            local spawnTime = GetServerVariable("DI_DRAGON_SPAWN_TIME_"..zoneId)
            if spawnTime > 0 and now >= spawnTime then
                controller.spawnWyvern(zone)
                SetServerVariable("DI_DRAGON_SPAWN_TIME_"..zoneId, 0)
            end
        end
    end

    -- =========================================
    -- GLOBAL DESPAWN CHECK (ZONE-INDEPENDENT)
    -- =========================================
    for _, zoneId in ipairs(controller.zones) do
        local despawnTime = GetServerVariable("DI_DESPAWN_TIME_" .. zoneId)

        if despawnTime > 0 and now >= despawnTime then
            print("[DI] Despawn triggered for zone "..zoneId)

            controller.handleDespawn(zoneId)

            SetServerVariable("DI_DESPAWN_TIME_" .. zoneId, 0)
        end
    end
end

function controller.stop()

    print("[DI] Controller STOPPED")

    -- Disable system
    SetServerVariable("DI_ACTIVE", 0)

    -- Clear timers
    SetServerVariable("DI_NEXT_SPAWN", 0)
    SetServerVariable("DI_WARN_TIME", 0)

    -- Optional: despawn mobs
    for _, zoneId in ipairs(controller.zones) do
        local zone = GetZone(zoneId)

        if zone then
            local wyrmId  = zone:getLocalVar("DI_WYRM_ID")
            local mireuId = zone:getLocalVar("DI_MIREU_ID")

            -- Despawn main mobs
            local mob = GetMobByID(wyrmId)
            if mob then DespawnMob(wyrmId) end

            local mireu = GetMobByID(mireuId)
            if mireu then DespawnMob(mireuId) end

            -- Reset zone state
            zone:setLocalVar("DI_MINION", 0)
            zone:setLocalVar("DI_WYVERN_SPAWNED", 0)
            zone:setLocalVar("DI_IS_MIREU", 0)
        end
    end
end

function controller.restart()

    print("[DI] Controller RESTARTING")

    controller.stop()
    controller.start()
end

-----------------------------------
-- Spawn scaling
-----------------------------------
function controller.applySpawnScaling(mob)
local lvl = mob:getMainLvl()

    local delta = lvl - 117 -- adjust deltas below for increased scaling if content level is increased in the future

    local ATT  = 100  + delta * 3
    local DEF  = 100  + delta * 2
    local ACC  = 100  + delta * 3
    local EVA  = 150  + delta * 2
    local MATT = 150  + delta * 1
    local MDEF = 150  + delta * 2
    local MACC = 150  + delta * 4
    local MEVA = 150  + delta * 2
    local HASTE = math.floor(6 + delta * 0.5)

    mob:addMod(xi.mod.ATT, ATT)
    mob:addMod(xi.mod.RATT, ATT)
    mob:addMod(xi.mod.DEF, DEF)
    mob:addMod(xi.mod.ACC, ACC)
    mob:addMod(xi.mod.RACC, ACC)
    mob:addMod(xi.mod.EVA, EVA)
    mob:addMod(xi.mod.MATT, MATT)
    mob:addMod(xi.mod.MDEF, MDEF)
    mob:addMod(xi.mod.MACC, MACC)
    mob:addMod(xi.mod.MEVA, MEVA)
    mob:addMod(xi.mod.HASTE_MAGIC, HASTE)
    mob:addMod(xi.mod.DMG, math.floor((lvl - 118) * 250))

    local statBonus = math.floor(150 + delta * 2)

    mob:addMod(xi.mod.STR, statBonus)
    mob:addMod(xi.mod.DEX, statBonus)
    mob:addMod(xi.mod.VIT, statBonus)
    mob:addMod(xi.mod.AGI, statBonus)
    mob:addMod(xi.mod.INT, statBonus)
    mob:addMod(xi.mod.MND, statBonus)
    mob:addMod(xi.mod.CHR, statBonus)

    local regen = math.floor(lvl * 0.2)

    mob:addMod(xi.mod.REGEN, regen)
    mob:addMod(xi.mod.REFRESH, regen)
    mob:addMod(xi.mod.REGAIN, regen * 2)
    mob:addMod(xi.mod.FASTCAST, math.floor(lvl * 0.3))

    local statusResMods = {
        xi.mod.SLEEPRES, xi.mod.POISONRES, xi.mod.PARALYZERES,
        xi.mod.BLINDRES, xi.mod.SILENCERES, xi.mod.VIRUSRES,
        xi.mod.PETRIFYRES, xi.mod.BINDRES, xi.mod.CURSERES,
        xi.mod.GRAVITYRES, xi.mod.SLOWRES, xi.mod.STUNRES,
        xi.mod.CHARMRES, xi.mod.AMNESIARES, xi.mod.LULLABYRES,
        xi.mod.DEATHRES, xi.mod.STATUSRES,
    }

    local baseRes = math.floor(40 + (delta ^ 1.2) * 4)

    for _, mod in ipairs(statusResMods) do
        mob:addMod(mod, baseRes)
    end
end
-----------------------------------
-- HP scaling
-----------------------------------
function controller.applyScaling(mob)

    local count = 0

    for _, player in ipairs(mob:getZone():getPlayers()) do
        if player:getObjType() == xi.objType.PC and
           player:hasStatusEffect(xi.effect.ELVORSEAL) then
            count = count + 1
        end
    end

    count = math.min(count, 36)

    mob:addMod(xi.mod.HPP, count)
    mob:updateHealth()
    mob:setHP(mob:getMaxHP())

end

-----------------------------------
-- Anti Cheating Leech Filter
-----------------------------------
function controller.antiFilter(players, mob)

    local result = {}

    local hp = mob:getMaxHP()

    for _, data in pairs(players) do

        if data.damage and (data.damage / hp) >= controller.leechThreshold then
            table.insert(result, data)
        end

    end

    return result

end

-----------------------------------
-- Personal rewards
-----------------------------------
local highTierReward =
{
    [1] = xi.item.PLUTON_COFFER,
    [2] = xi.item.RIFT_BOULDER_COFFER,
    [3] = xi.item.BEITETSU_COFFER,
    [4] = xi.item.HEAVY_METAL_POUCH,
}

local lowTierReward =
{
    [1] = xi.item.PLUTON_BOX,
    [2] = xi.item.BOULDER_BOX,
    [3] = xi.item.BEITETSU_BOX,
    [4] = xi.item.HEAVY_METAL_POUCH,
}

function controller.givePersonalReward(player)
    -- Overall 25% chance to be eligible for an additional reward
    if math.random(1, 100) <= 25 then
        local roll = math.random(1, 100)
        local item = nil

        -- 1% chance to get from High Tier
        if roll <= 10 then
            item = highTierReward[math.random(1, #highTierReward)]
        -- 25% chance to get from Low Tier (mutually exclusive)
        elseif roll >= 11 and roll <= 100 then
            item = lowTierReward[math.random(1, #lowTierReward)]
        end

        if item then
            npcUtil.giveItem(player, item)
        end
    end
end

-----------------------------------
-- rewards
-----------------------------------
function controller.rewardsBase()

    local kills = GetServerVariable("DI_MIREU_KILLS")

    if kills >= 5 then
        return 50, controller.mireuCap
    elseif kills == 4 then
        return 40, controller.dailyCap
    elseif kills == 3 then
        return 30, controller.dailyCap
    elseif kills == 2 then
        return 20, controller.dailyCap
    elseif kills == 1 then
        return 15, controller.dailyCap
    end

    return controller.basePoints, controller.dailyCap
end

function controller.rewardsParticipants(count)

    if count >= 6 then
        return 2
    end

    local multipliers = {2,2.2,2.4,2.6,2.8} -- Bonuses for number of participants

    return multipliers[count] or 1

end

function controller.giveDomainPoints(player, playerCount, isMireu, damageDealt, maxHP)
    local lastReset = GetServerVariable("DI_LAST_RESET") or 0
    local playerLast = player:getCharVar("DI_LAST_RESET") or 0

    if playerLast < lastReset then
        player:setCurrency('domain_points_daily', 0)
        player:setCharVar("DI_MIREU_BONUS", 0)
        player:setCharVar("DI_LAST_RESET", lastReset)
    end

    local basePoints, cap = controller.rewardsBase()

    if isMireu then
        player:setCharVar("DI_MIREU_BONUS", 1)
        basePoints = basePoints * 2
        cap = controller.mireuCap
    end

    -- If the player has participated in a Mireu kill today, their daily cap is the higher Mireu cap (300)
    if player:getCharVar("DI_MIREU_BONUS") == 1 then
        cap = controller.mireuCap
    end

    local multiplier = controller.rewardsParticipants(playerCount)
    local pointsRatio = math.max(damageDealt / maxHP, 0)
    local points = math.floor(basePoints * multiplier * (1 + pointsRatio))

    player:addCurrency('escha_silt', math.floor(500 * multiplier))

    -- ========================================
    -- DAILY TRACKING
    -- ========================================
    local daily = player:getCurrency('domain_points_daily') or 0

    -- Already capped
    if daily >= cap then
        return
    end

    -- Clamp to remaining allowance
    local remaining = cap - daily

    if points > remaining then
        points = remaining
    end

    -- ========================================
    -- GIVE REWARDS
    -- ========================================
    npcUtil.giveCurrency(player, 'domain_points', points)
    player:addCurrency('domain_points_daily', points)

end

local fencingCoordinates =
{
    [xi.zone.ESCHA_ZITAH] = { x = -2.0, z = 34.5, y =  -0.425},
    [xi.zone.ESCHA_RUAUN] = { x = 0.001, z = -210.0, y = -44.099 },
    [xi.zone.REISENJIMA] = { x = 615.2, z = -947.79, y = -372.084 },
}

function controller.buildFencing(player)
    local zoneId = player:getZoneID()
    local coords = fencingCoordinates[zoneId]

    if not coords then
        return
    end

    local objective = {
        fence = {
            pos = { x = coords.x, z = coords.z }, -- center of fence
            radius = 25.00, -- radius from pos in yalms
            render = 10.00, -- distance from fence it becomes visible
            blue = true -- optional, turns default red fence bars blue
        },
    }

    player:objectiveUtility(objective)
end

local function checkPlayerDIDistance(player)
    local zone = player:getZoneID()
    local coordinates = fencingCoordinates[zone]
    local textID = zones[zone].text

    if player:getObjType() == xi.objType.PC then
        if player:hasStatusEffect(xi.effect.ELVORSEAL) then

            if not coordinates then
                return
            end

            local isOutside = player:checkDistance(
                coordinates.x,
                coordinates.y,
                coordinates.z
            ) > 25

            local warned = player:getLocalVar('FENCE_WARNED')

            if isOutside and warned == 0 then
                player:messageSpecial(textID.RETURN_TO_BATTLEFIELD)
                player:setLocalVar('FENCE_WARNED', 1)
                player:setLocalVar('FENCE_TIMER_ACTIVE', 1)

                player:timer(15000, function(playerArg)
                    if playerArg:getLocalVar('FENCE_TIMER_ACTIVE') == 1 then
                        playerArg:delStatusEffect(xi.effect.ELVORSEAL)
                        playerArg:removeListener('DI_DISTANCE_TICK')
                        playerArg:setLocalVar('FENCE_TIMER_ACTIVE', 0)
                    end
                end)

            elseif not isOutside and warned == 1 then
                player:setLocalVar('FENCE_WARNED', 0)
                player:setLocalVar('FENCE_TIMER_ACTIVE', 0)
            end
        end
    end
end

function controller.checkDistanceDI(player)
    checkPlayerDIDistance(player)
end

local zoneNames =
{
    [xi.zone.ESCHA_ZITAH] = "Escha - Zi'Tah",
    [xi.zone.ESCHA_RUAUN] = "Escha - Ru'Aun",
    [xi.zone.REISENJIMA]  = "Reisenjima",
}

local warpCoords =
{
    [xi.zone.ESCHA_ZITAH] = { -2.2990, 0.6584, 54.6255, 73 },
    [xi.zone.ESCHA_RUAUN] = { 0.1598, -43.6000, -231.3654, 198 },
    [xi.zone.REISENJIMA]  = { 629.1215, -371.5999, -930.0229, 91 },
}

local function whereisDI(player)
    local active = GetServerVariable("DI_ACTIVE")
    if active ~= 1 then
        player:printToPlayer("Domain Invasion is currently disabled.",0,'Who Knows')
        return
    end

    local index = GetServerVariable("DI_ZONE_INDEX")
    if index == 0 then index = 1 end

    local currentZoneId = controller.zones[index]
    local nextIndex = (index % #controller.zones) + 1
    local nextZoneId = controller.zones[nextIndex]

    local nextSpawn = GetServerVariable("DI_NEXT_SPAWN")
    local currentZoneName = zoneNames[currentZoneId] or "Unknown"
    local nextZoneName = zoneNames[nextZoneId] or "Unknown"

    if nextSpawn > 0 then
        local wait = nextSpawn - os.time()
        if wait < 0 then wait = 0 end
        local minutes = math.floor(wait / 60)
        local seconds = wait % 60
        player:printToPlayer(string.format("The next Domain Invasion will begin in %s in %d:%02d.", currentZoneName, minutes, seconds),0,'Domain Invasion')
    else
        local zone = GetZone(currentZoneId)
        local isMireu = zone and zone:getLocalVar("DI_IS_MIREU") == 1
        if isMireu then
            player:printToPlayer(string.format("Domain Invasion: MIREU is active in %s!", currentZoneName),0,'Domain Invasion')
        else
            player:printToPlayer(string.format("Domain Invasion is currently ACTIVE in %s!", currentZoneName),0,'Domain Invasion')
        end
    end

    player:printToPlayer(string.format("The following invasion will be held in %s.", nextZoneName),0,'Domain Invasion')
end

-----------------------------------
-- Spawn NPCS
-----------------------------------

local di_npcEntities =
{
    [xi.zone.REISENJIMA] =
    {
        { -501.7035, -19.4000, -481.5450, 255, '0x0000d70300000000000000000000000000000000'},
    },
    [xi.zone.ESCHA_ZITAH] =
    {
        { -356.6905, 0.0515, -171.1729, 245, '0x01000a0517100920043004400450006000700000' },
    },
    [xi.zone.ESCHA_RUAUN] =
    {
        { -10.8517, -34.0001, -461.0081, 23, '0x01000f010010052005301c401c50006000700000' },
    }
}

controller.domain_Entities = {}


local function generateEntities()
    for zoneId, data in pairs(di_npcEntities ) do
        local zone = GetZone(zoneId)
        if zone then
            for _, entry in pairs(data) do
                local rot  = entry[4]
                local x    = entry[1]
                local y    = entry[2]
                local z    = entry[3]
                local look = entry[5]

                local npc = zone:insertDynamicEntity({
                    objtype = xi.objType.NPC,
                    name = 'Domain Invasion',
                    look = look,
                    x = x,
                    y = y,
                    z = z,
                    rotation = rot,
                    widescan = 0,
                    releaseIdOnDisappear = true,
                    onTrigger = function(player, npc)
                        local index = GetServerVariable("DI_ZONE_INDEX")
                        if index == 0 then index = 1 end
                        local currentDIZoneId = controller.zones[index]
                        local playerZoneId = player:getZoneID()
                        local nextSpawn = GetServerVariable("DI_NEXT_SPAWN")
                        local warnTime = GetServerVariable("DI_WARN_TIME")

                        -- Check if DI is in this zone and either active (nextSpawn == 0) or in the 10-minute warning phase (warnTime == 0)
                        if GetServerVariable("DI_ACTIVE") == 1 and playerZoneId == currentDIZoneId and (nextSpawn == 0 or warnTime == 0) then
                            player:customMenu({
                                title = "Domain Invasion: " .. (zoneNames[playerZoneId] or "Active"),
                                options = {
                                    {
                                        "Receive Elvorseal and Teleport",
                                        function(player)
                                            if not player:hasStatusEffect(xi.effect.ELVORSEAL) then
                                                player:timer(1000, function()
                                                    player:addStatusEffect(xi.effect.ELVORSEAL, {
                                                        power = 1,
                                                        origin = player,
                                                        duration = 0,
                                                        flag = xi.effectFlag.CONFRONTATION
                                                    })
                                                end)
                                            end
                                            local coords = warpCoords[playerZoneId]
                                            if coords then
                                                player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
                                                player:timer(1000, function()
                                                    player:setPos(unpack(coords))
                                                end)
                                            end
                                        end
                                    },
                                    {
                                        "Check Invasion Status",
                                        function(p) whereisDI(p) end
                                    },
                                }
                            })
                        else
                            whereisDI(player)
                        end
                    end,
                })

                if npc then
                    table.insert(controller.domain_Entities , npc:getID())
                end
            end
        end
    end
end

local function showDI_Entities()
    generateEntities()

    for _, entityID in pairs(controller.domain_Entities ) do
        local entity = GetNPCByID(entityID)
        if entity then
            entity:setStatus(xi.status.NORMAL)
        end
    end
end

-----------------------------------
-- Start Controller
-----------------------------------
local IDr = zones[xi.zone.REISENJIMA]
local IDez = zones[xi.zone.ESCHA_ZITAH]
local IDer = zones[xi.zone.ESCHA_RUAUN]

local diMobs =
{
    [xi.zone.ESCHA_ZITAH]  = { wyrm = IDez.mob.AZI_DAHAKA, mireu = IDez.mob.MIREU },
    [xi.zone.REISENJIMA]   = { wyrm = IDr.mob.QUETZALCOATL, mireu = IDr.mob.MIREU },
    [xi.zone.ESCHA_RUAUN]  = { wyrm = IDer.mob.NAGA_RAJA, mireu = IDer.mob.MIREU },
}

function controller.start()
    showDI_Entities()
    SetServerVariable("DI_ACTIVE", 1)
    SetServerVariable("DI_IN_PROGRESS", 0)
    SetServerVariable("DomainInvasionActiveZone", 0)

    if GetServerVariable("DI_ZONE_INDEX") == 0 then
        SetServerVariable("DI_ZONE_INDEX", 1)
    end

    -- Ensure DI_LAST_RESET is updated if the server was down during JST midnight
    local lastReset = GetServerVariable("DI_LAST_RESET")
    local currentMidnight = JstMidnight() - 86400
    if lastReset < currentMidnight then
        SetServerVariable("DI_LAST_RESET", currentMidnight)
    end

for _, zoneId in ipairs(controller.zones) do
        local zone = GetZone(zoneId)
        local data = diMobs[zoneId]
        if zone and data then
            zone:setLocalVar("DI_WYRM_ID", data.wyrm)
            zone:setLocalVar("DI_MIREU_ID", data.mireu)
            zone:setLocalVar("DI_MINION", 0)
            zone:setLocalVar("DI_WYVERN_SPAWNED", 0)
            zone:setLocalVar("DI_RESET_DONE", 0) -- ENSURE THIS IS 0
            SetServerVariable("DI_DRAGON_SPAWN_TIME_" .. zoneId, 0)
            SetServerVariable("DI_DESPAWN_TIME_" .. zoneId, 0)
        end
    end

    if GetServerVariable("DI_NEXT_SPAWN") == 0 then
        controller.scheduleNext()
    end

    print("[DI] Domain Invasion controller started")
end

-- =======================================
-- HEARTBEAT OVERRIDE to keep zone awake
-- =======================================
function controller.heartbeat()
    controller.tick()

    if GetServerVariable("DI_ACTIVE") == 1 and GetServerVariable("DI_IN_PROGRESS") == 1 then
        SetServerVariable("DomainInvasionActiveZone", getZone():getID())
    else
        SetServerVariable("DomainInvasionActiveZone", 0)
    end
end

return controller

--[[
🆕 Domain Invasion - Retail Like - Beta Testing Live
Custom Changes Include -
Mireu has a chance to spawn multiple times a day
Domain point Cap per day = 200 points, 300 with Mireu
Custom NPC in each zone to warp you to that zones Arena if that zone is scheduled for DI
Custom Player COmmand - !whereisdi
AntiLeech Filter - You must do a percentage of damage to qualify for points, Damage from trusts and pets count towards you damage percentage
Personal Loot - you have a chance of obtaining Pluton, Boulder Beitetsu box / case, Heavy Metal Pouch
]]--