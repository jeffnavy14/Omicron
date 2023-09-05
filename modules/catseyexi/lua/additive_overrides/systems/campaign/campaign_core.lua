-----------------------------------
-- Campaign Core
-----------------------------------
require("modules/module_utils")
require("scripts/globals/utils")
require("scripts/globals/campaign")
require("modules/catseyexi/lua/additive_overrides/systems/campaign/campaign_data")
-----------------------------------
local m = Module:new("campaign_core")

xi = xi or {}
xi.campaign = xi.campaign or {}

local settings =
{
    TEST_MODE = true,                -- Restrict Campaign to GM characters
    CREDITS   = "[CAMPAIGN]CREDITS", -- Promotion Credits
}

local zoneData = {}

local state =
{
    INACTIVE = 0,
    WAITING  = 1,
    FIGHTING = 2,
}

-- Returns index of the first medal player doesn't have
local function getNextRank(player)
    for index, medal in pairs(xi.campaign.promotions) do
        if not player:hasKeyItem(medal[1]) then
            return index
        end
    end

    return #xi.campaign.promotions
end

local function getCredits(player, participants, win)
    local adjusted = utils.clamp(participants, 1, 18)

    if win then
        return xi.campaign.credits.win[adjusted]
    else
        return xi.campaign.credits.loss[adjusted]
    end
end

local function awardCredits(player, nextRank, credits)
    local rankInfo = xi.campaign.promotions[nextRank]
    local balance  = player:getCharVar(settings.CREDITS)

    player:PrintToPlayer(string.format("%s gains %u promotion credits.", player:getName(), credits), xi.msg.channel.SYSTEM_3)

    -- Handle rank up
    if balance + credits > rankInfo[2] then
        player:PrintToPlayer(string.format("%s has been awarded the %s!", player:getName(), rankInfo[3]), xi.msg.channel.SYSTEM_3)

        local carryOver = (balance + credits) - rankInfo[2]
        player:setCharVar(settings.CREDITS, carryOver)
        npcUtil.giveKeyItem(player, rankInfo[1])
    else
        player:PrintToPlayer(string.format("Your next promotion is the %s (%u/%u)", rankInfo[3], balance + credits, rankInfo[2]), xi.msg.channel.NS_SAY)
        player:setCharVar(settings.CREDITS, balance + credits)
    end
end

local function endCampaign(zone, win)
    local zoneID = zone:getID()

    if zoneData[zoneID] == nil then
        return
    end

    for _, npcID in pairs(zoneData[zoneID].npcs or {}) do
        DespawnMob(npcID, zone)
    end

    for _, mobID in pairs(zoneData[zoneID].mobs or {}) do
        DespawnMob(mobID, zone)
    end

    local message = zones[zoneID].text.CAMPAIGN_RETREAT_ALLIES

    if win then
        message = zones[zoneID].text.CAMPAIGN_RETREAT_BEASTMAN
    end

    zoneData[zoneID].state = state.INACTIVE

    local players  = zone:getPlayers()
    local eligible = {}

    for _, participant in pairs(players) do
        if message == nil then
            if win then
                participant:PrintToPlayer("The Beastman Confederate forces have retreated!", xi.msg.channel.NS_SAY)
            else
                participant:PrintToPlayer("The Allied Forces of Altana have retreated...", xi.msg.channel.NS_SAY)
            end
        else
            participant:messageSpecial(message)
        end

       -- if participant:hasStatusEffect(xi.effect.ALLIED_TAGS) then
            participant:delStatusEffect(xi.effect.ALLIED_TAGS)
            table.insert(eligible, participant)
       -- end
    end


    for _, player in pairs(eligible) do
        local credits  = getCredits(player, #eligible, win)
        local nextRank = getNextRank(player)

        player:timer(3000, function(playerArg)
            awardCredits(playerArg, nextRank, credits)
			player:changeMusic(0, 251)
        end)
    end
end

local function aggroGroups(group1, group2)
    for _, entityId1 in pairs(group1) do
        for _, entityId2 in pairs(group2) do
            local entity1 = GetMobByID(entityId1)
            local entity2 = GetMobByID(entityId2)

            if entity1 == nil or entity2 == nil then
                printf("[warning] Could not apply aggro because either %i or %i are not valid entities", entityId1, entityId2)
            else
                --printf("Applying enmity: %i <-> %i", entityId1, entityId2)
                entity1:addEnmity(entity2, math.random(1, 5), math.random(1, 5))
                entity2:addEnmity(entity1, math.random(1, 5), math.random(1, 5))
            end
        end
    end
end

local function applyModsAndEffects(mob, mobInfo)
    if
        mobInfo.mods ~= nil and
        #mobInfo.mods > 0
    then
	
        for modID, modValue in pairs(mobInfo.mods) do
            mob:setMod(modID, modValue)
        end
    end

    if
        mobInfo.effects ~= nil and
        #mobInfo.effects > 0
    then
        for effectID, effectTable in pairs(mobInfo.effects) do
            mob:addStatusEffect(effectID, unpack(effectTable))
        end
    end
end

local function applyTemplate(mob, template)
    if template == nil then
        return
    end

    if template.mods ~= nil then
        for modID, modValue in pairs(template.mods) do
            mob:setMod(modID, modValue)
        end
    end

    if template.effects ~= nil then
        for effectID, effectTable in pairs(template.effects) do
            mob:addStatusEffect(effectID, unpack(effectTable))
        end
    end
end

local function applyMobFunctions(mobInfo, tbl)
    mobInfo.onMobInitialize = function(mob)
        if tbl.agro ~= nil then
            mob:setMobMod(xi.mobMod.DETECTION, tbl.agro)
            mob:setMobMod(xi.mobMod.SIGHT_RANGE, 15)
            mob:setMobMod(xi.mobMod.SOUND_RANGE, 10)
	
        else
            mob:setMobMod(xi.mobMod.DETECTION, 0x08)
        end

        if mobInfo.additionalEffect ~= nil then
            mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
        end
    end

    if tbl.onMobFight ~= nil then
        mobInfo.onMobFight = tbl.onMobFight
    end

    if tbl.onMobSpawn ~= nil then
        mobInfo.onMobSpawn = tbl.onMobSpawn
    end

    if tbl.onMobDespawn ~= nil then
        mobInfo.onMobDespawn = tbl.onMobDespawn
    end

    if tbl.onMobDeath ~= nil then
        mobInfo.onMobDeath = tbl.onMobDeath
    end

    if tbl.onMobRoam ~= nil then
        mobInfo.onMobRoam = tbl.onMobRoam
    end

    if tbl.additionalEffect ~= nil then
        mobInfo.onAdditionalEffect = function(mob, target, damage)
            return xi.mob.onAddEffect(mob, target, damage, tbl.additionalEffect, { power = math.random(16, 55) })
        end
    end
end

local function applyTowerFunctions(mobInfo, tbl)
    mobInfo.onMobInitialize = function(mob)
        if tbl.agro ~= nil then
            mob:setMobMod(xi.mobMod.DETECTION, tbl.agro)
            mob:setMobMod(xi.mobMod.SIGHT_RANGE, 15)
            mob:setMobMod(xi.mobMod.SOUND_RANGE, 10)
			mob:setMobMod(xi.mobMod.SKILL_LIST, 0)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 0)
	
        else
            mob:setMobMod(xi.mobMod.DETECTION, 0x08)
			mob:setMobMod(xi.mobMod.NO_MOVE, 1)
            mob:setMobMod(xi.mobMod.SKILL_LIST, 0)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 0)
        end

        if mobInfo.additionalEffect ~= nil then
            mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
        end
    end

    if tbl.onMobFight ~= nil then
        mobInfo.onMobFight = tbl.onMobFight
    end

    if tbl.onMobSpawn ~= nil then
        mobInfo.onMobSpawn = tbl.onMobSpawn
    end

    if tbl.onMobDespawn ~= nil then
        mobInfo.onMobDespawn = tbl.onMobDespawn
    end

    if tbl.onMobDeath ~= nil then
        mobInfo.onMobDeath = tbl.onMobDeath
    end

    if tbl.onMobRoam ~= nil then
        mobInfo.onMobRoam = tbl.onMobRoam
    end

    if tbl.additionalEffect ~= nil then
        mobInfo.onAdditionalEffect = function(mob, target, damage)
            return xi.mob.onAddEffect(mob, target, damage, tbl.additionalEffect, { power = math.random(16, 55) })
        end
    end
end

local function spawnNPC(zone, tbl, pos)
    printf("[campaign]Spawning NPC: %s", tbl.name)

    local mobInfo =
    {
        objtype     = xi.objType.MOB,
        allegiance  = xi.allegiance.PLAYER,
        name        = tbl.name,
        x           = pos[1],
        y           = pos[2],
        z           = pos[3],
        rotation    = pos[4],
        look        = tbl.look,
        groupId     = tbl.groupId,
        groupZoneId = tbl.groupZoneId,

        releaseIdOnDisappear  = true,
        specialSpawnAnimation = true,
    }

    applyMobFunctions(mobInfo, tbl)

    local mob = zone:insertDynamicEntity(mobInfo)

    applyTemplate(mob, tbl.template)
    applyModsAndEffects(mob, tbl)
	
    mob:setSpawn(unpack(pos))
	mob:setDropID(0)
    mob:setMobMod(xi.mobMod.NO_DROPS,     1)
    mob:setMobMod(xi.mobMod.CHARMABLE,    0)
    mob:spawn()

    DisallowRespawn(mob:getID(), true)

    mob:setSpeed(25)
    mob:setAllegiance(1)

    mob:setRoamFlags(xi.roamFlag.SCRIPTED)

     mob:addListener("DEATH", "CAMPAIGN_NPC_DEATH", function(mobArg)
         local zoneID = zone:getID()
         zoneData[zoneID].defeatedNPCs = (zoneData[zoneID].defeatedNPCs or 0) + 1
	 
         local defeated = zoneData[zoneID].defeatedNPCs
         local total    = #zoneData[zoneID].npcs
	 
         printf("[campaign]NPC died %s/%u", defeated, total)
	 
         -- When all NPCs are dead, end campaign
         if defeated >= total then
             endCampaign(mobArg:getZone(), false)
         end
     end)

    return mob
end


local function spawnTOWER(zone, tbl, pos)
       printf("[campaign]Spawning Tower: %s", tbl.name)

    local mobInfo =
    {
        objtype     = xi.objType.MOB,
        allegiance  = xi.allegiance.PLAYER,
        name        = tbl.name,
        x           = pos[1],
        y           = pos[2],
        z           = pos[3],
        rotation    = pos[4],
        look        = "0x0000660500000000000000000000000000000000",
        groupId     = tbl.groupId,
        groupZoneId = tbl.groupZoneId,

        releaseIdOnDisappear  = true,
        specialSpawnAnimation = true,
    }

    applyTowerFunctions(mobInfo, tbl)

    local mob = zone:insertDynamicEntity(mobInfo)

    applyTemplate(mob, tbl.template)
    applyModsAndEffects(mob, tbl)

    mob:setSpawn(unpack(pos))
    mob:setMobMod(xi.mobMod.NO_DROPS,     1)
    mob:setMobMod(xi.mobMod.CHARMABLE,    0)
    mob:spawn()

    DisallowRespawn(mob:getID(), true)

    mob:setAllegiance(1)
    
	
    mob:setAutoAttackEnabled(false)

    mob:addListener("DEATH", "CAMPAIGN_NPC_DEATH", function(mobArg)
        local zoneID = zone:getID()
        zoneData[zoneID].defeatedNPCs = (zoneData[zoneID].defeatedNPCs or 0) + 1

        local defeated = zoneData[zoneID].defeatedNPCs
        local total    = #zoneData[zoneID].tower

        printf("[campaign]NPC died %s/%u", defeated, total)

        -- When all NPCs are dead, end campaign
        if defeated >= total then
            endCampaign(mobArg:getZone(), false)
        end
    end)

    return mob
end

local function spawnMob(zone, tbl, pos)
    printf("[campaign]Spawning mob: %s", tbl.name)

    local mobInfo =
    {
        objtype     = xi.objType.MOB,
        name        = tbl.name,
        x           = pos[1],
        y           = pos[2],
        z           = pos[3],
        rotation    = pos[4],
--      look        = tbl.look,
        groupId     = tbl.groupId,
        groupZoneId = tbl.groupZoneId,

        releaseIdOnDisappear  = true,
        specialSpawnAnimation = true,
    }

    applyMobFunctions(mobInfo, tbl)

    local mob = zone:insertDynamicEntity(mobInfo)

    applyTemplate(mob, tbl.template)
    applyModsAndEffects(mob, tbl)

    mob:setSpawn(unpack(pos))
	mob:setDropID(0)
    mob:setMobMod(xi.mobMod.NO_DROPS,  1)
    mob:setMobMod(xi.mobMod.CHARMABLE, 0)
    mob:spawn()

    DisallowRespawn(mob:getID(), true)

    mob:addListener("DEATH", "CAMPAIGN_MOB_DEATH", function(mobArg)
        local zoneID = zone:getID()
        zoneData[zoneID].defeatedMobs = (zoneData[zoneID].defeatedMobs or 0) + 1

        local defeated = zoneData[zoneID].defeatedMobs
        local total    = #zoneData[zoneID].mobs

        printf("[campaign]Mob died %s/%u", defeated, total)

        -- When all Mobs are dead, end campaign
        if defeated >= total then
            endCampaign(mobArg:getZone(), true)
        end
    end)

    return mob
end

local function getRandomPos(posList)
    return posList[math.random(1, #posList)]
end

local function spawnNPCs(zone, mobs, boss, posList, groupSize)
    local zoneID = zone:getID()

    for i = 1, groupSize do
        local mob = spawnNPC(zone, mobs, getRandomPos(posList))
        table.insert(zoneData[zoneID].npcs, mob:getID())
    end

    local boss = spawnNPC(zone, boss, getRandomPos(posList))
    table.insert(zoneData[zoneID].npcs, boss:getID())
end

local function spawnStructure(zone, tower, posList, groupSize)
    local zoneID = zone:getID() 
	local tower = spawnTOWER(zone, tower, getRandomPos(posList))
	table.insert(zoneData[zoneID].npcs, tower:getID())
end

local function spawnMobs(zone, mobs, boss, other, posList, groupSize)
    local zoneID = zone:getID()

    for i = 1, groupSize do
        local mob = spawnMob(zone, mobs, getRandomPos(posList))
        table.insert(zoneData[zoneID].mobs, mob:getID())
    end

    local boss = spawnMob(zone, boss, getRandomPos(posList))
    table.insert(zoneData[zoneID].mobs, boss:getID())
	
	local other = spawnMob(zone, other, getRandomPos(posList))
    table.insert(zoneData[zoneID].mobs, other:getID())
end


local function startCampaign(player)
    local zone = player:getZone()
    local zoneID = zone:getID()

    local area    = xi.campaign.data[zoneID]
    local control = CampaignGetControl(zoneID)
    local allies  = xi.campaign.allies[control]
    local enemies = xi.campaign.enemies[control]
	
    if
        allies == nil or
        #allies == 0 or
        enemies == nil or
        #enemies == 0
    then
        print("Missing mobs for the current area/nation - Campaign cancelled", xi.msg.channel.SYSTEM_3)
        return
    end

    local ally  = xi.campaign.allies[control][math.random(1, 5)]
    local enemy = xi.campaign.enemies[control][math.random(1, 5)]
	
    if zones[zoneID].text.CAMPAIGN_BATTLE_BEGIN then
        player:messageSpecial(zones[zoneID].text.CAMPAIGN_BATTLE_BEGIN)
    end

    player:PrintToPlayer(string.format("Spawning: %s", ally.name), xi.msg.channel.SYSTEM_3)
    player:addStatusEffect(xi.effect.ALLIED_TAGS)

    zoneData[zoneID]              = zoneData[zoneID] or {}
    zoneData[zoneID].state        = state.WAITING
    zoneData[zoneID].defeatedNPCs = 0
    zoneData[zoneID].defeatedMobs = 0
    zoneData[zoneID].npcs         = {}
    zoneData[zoneID].mobs         = {}
	zoneData[zoneID].tower        = {}
	

    local partySize1 = 8 + player:getPartySize()
	local partySize2 = 12 + player:getPartySize()

    BattleStatus (2, zoneID)
    spawnNPCs(zone, ally.mobs,  ally.boss, area.defender, partySize1)
	spawnStructure(zone, ally.tower, area.tower)
    spawnMobs(zone, enemy.mobs, enemy.boss, enemy.other, area.attacker, partySize2)
    aggroGroups(zoneData[zoneID].npcs, zoneData[zoneID].mobs)
end

xi.campaign.start = function(player)
    startCampaign(player)
	player:changeMusic(0, 251)
end

xi.campaign.stop = function(player)
    endCampaign(player:getZone(), false)
end

xi.campaign.win = function(player)
	endCampaign(player:getZone(), true)
end

-- This allows us to reload mob/npcs without restart
local function reloadOverride(str, func)
    m:addOverride(str, func)

    local path = utils.splitStr(str, ".")

    if
        xi ~= nil and
        xi.zones ~= nil and
        xi.zones[path[3]] ~= nil and                -- Zone_Name
        xi.zones[path[3]][path[4]] ~= nil and       -- Zone_Name.npcs
        xi.zones[path[3]][path[4]][path[5]] ~= nil  -- Zone_Name.npcs.Entity
    then
        xi.zones[path[3]][path[4]][path[5]][path[6]] = func
    end
end

for _, area in pairs(xi.campaign.data) do
    for nation, npcs in pairs(area.npcs) do
        local npcLua = string.format("xi.zones.%s.npcs.%s", area.name, npcs.guard)
        xi.module.ensureTable(npcLua)
		
        reloadOverride(npcLua .. ".onTrigger", function(player, npc)
            -- If test mode, make accessible only to GM
            if 
               settings.TEST_MODE  or
               player:getGMLevel() > 0 and 
               player:checkNameFlags(0x04000000)
            then
		
                local zoneID = player:getZoneID()
                zoneData[zoneID] = zoneData[zoneID] or {}
		
                if
                    zoneData[zoneID].state == state.INACTIVE or
                    zoneData[zoneID].state == nil
                then
                    startCampaign(player)
					player:changeMusic(0, 247)
                else
                    endCampaign(player:getZone(), false)
					player:changeMusic(0, 251)
                end
            end
        end)
    end
end

return m
