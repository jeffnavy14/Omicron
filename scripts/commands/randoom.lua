---------------------------------------------------------------------------------------------------
-- Party Doom Master Script: Contains !partydoom command, stop logic, and onPlayerDeath hook.
-- Author: Gemini
---------------------------------------------------------------------------------------------------

---@type TCommand
local commandObj = {}

-- [[ EXPOSED STATE AND LOGIC ]]
-- The central table for managing active games (indexed by zoneId).
commandObj.active_doom_games = {}
local active_doom_games = commandObj.active_doom_games -- Alias for cleaner internal use

-- Command configuration
commandObj.cmdprops =
{
    permission = 1,
    parameters = "s?" -- Allows one optional parameter (e.g., "stop")
}

-- CONSTANTS
-- We assume DOOM is 15 based on typical server conventions and your doom (1).lua file
local DOOM_STATUS_ID = xi and xi.effect and xi.effect.DOOM or 15
local RERAISE_STATUS_ID = xi and xi.effect and xi.effect.RERAISE_IV or 113

-- NEW DEBUFF CONSTANTS
local TERROR_STATUS_ID = xi and xi.effect and xi.effect.TERROR or 28
local SLEEP_II_STATUS_ID = xi and xi.effect and xi.effect.SLEEP_II or 19
local SILENCE_STATUS_ID = xi and xi.effect and xi.effect.SILENCE or 6
local MEDICINE_STATUS_ID = xi and xi.effect and xi.effect.MEDICINE or 155 -- Added Medicine (ID 155)

local MIN_DOOM_DURATION = 10
local MAX_DOOM_DURATION = 15
local FIXED_DOOM_POWER = 10
local RERAISE_POWER = 4
local RERAISE_SUBID = 0
local RERAISE_DURATION = 3600

-- Common settings for the initial debilitating debuffs (applied once at start)
local DEBUFF_POWER = 1
local DEBUFF_SUBID = 0
local DEBUFF_DURATION = 60 -- Duration for TERROR, SLEEP II, SILENCE, MEDICINE

-- Utility function to get a random Doom duration in seconds.
local function get_random_doom_duration_sec()
    return math.random(MIN_DOOM_DURATION, MAX_DOOM_DURATION)
end

-- Function to apply the Doom status effect
local function apply_doom_effect(target)
    local duration_sec = get_random_doom_duration_sec()
    local power = FIXED_DOOM_POWER
    -- Apply Doom (type, params)
    target:addStatusEffect(DOOM_STATUS_ID, { power = power, tick = 3, duration = duration_sec, origin = target })

    local msg = string.format("Doom (Power %d) applied to %s. Time until death: %d seconds!", power, target:getName(), duration_sec)
    target:printToPlayer(msg)
end

-- Function to clean up a specific game state (used by check_game_status and the stop command)
local function cleanup_game(zoneId, announcer)
    local game_state = active_doom_games[zoneId]
    if not game_state then return end

    local final_participants_list = game_state.originalParticipants or {}

    -- Ensure Doom, Reraise, and all initial debuffs are removed from logged-in participants
    for charId, _ in pairs(final_participants_list) do
        local target = GetPlayerByID(charId)
        if target then
            -- Remove all event-related status effects regardless of alive/dead state
            if target:hasStatusEffect(DOOM_STATUS_ID) then
                target:delStatusEffect(DOOM_STATUS_ID)
            end
            if target:hasStatusEffect(RERAISE_STATUS_ID) then
                target:delStatusEffect(RERAISE_STATUS_ID)
            end
            -- REMOVE NEW DEBUFFS
            if target:hasStatusEffect(TERROR_STATUS_ID) then
                target:delStatusEffect(TERROR_STATUS_ID)
            end
            if target:hasStatusEffect(SLEEP_II_STATUS_ID) then
                target:delStatusEffect(SLEEP_II_STATUS_ID)
            end
            if target:hasStatusEffect(SILENCE_STATUS_ID) then
                target:delStatusEffect(SILENCE_STATUS_ID)
            end
            if target:hasStatusEffect(MEDICINE_STATUS_ID) then -- Removed Medicine
                target:delStatusEffect(MEDICINE_STATUS_ID)
            end
        end
    end

    -- Clean up global state
    active_doom_games[zoneId] = nil

    if announcer then
        announcer:printToArea("Event cleanup complete. Status effects removed.")
    end
end


-- Function to check the status of the Doom Survival game (Called by the death hook)
function commandObj.check_game_status(zoneId)
    local game_state = active_doom_games[zoneId]
    if not game_state then return end

    local alive_participants = {}
    local first_participant_id = nil
    for charId, _ in pairs(game_state.participants) do
        first_participant_id = charId
        break
    end
    local announcer = GetPlayerByID(first_participant_id)
    local previous_alive_count = game_state.last_alive_count or 0

    -- PHASE 1: IDENTIFY DEAD/MISSING PLAYERS
    local players_to_remove = {}
    for charId, _ in pairs(game_state.participants) do
        local target = GetPlayerByID(charId)

        -- Check 1: Player is logged out or zoned
        if not target or target:getZoneID() ~= zoneId then
            table.insert(players_to_remove, charId)
        -- Check 2: Player is dead
        elseif target:isDead() then
            if announcer then
                announcer:printToArea(string.format("%s has succumbed to Doom!", target:getName()))
            end
            table.insert(players_to_remove, charId)
        else
            -- Player is alive and online
            table.insert(alive_participants, charId)
        end
    end

    -- Update participants list
    for _, charId in ipairs(players_to_remove) do
        game_state.participants[charId] = nil
    end

    local alive_count = #alive_participants


    -- PHASE 2: NEXT ROUND or END GAME CHECK
    if alive_count > 1 then
        -- Next round logic runs if someone died
        if alive_count < previous_alive_count then
            for _, charId in ipairs(alive_participants) do
                local target = GetPlayerByID(charId)
                if target then
                    -- 1. Remove old Doom (removes it completely by ID)
                    if target:hasStatusEffect(DOOM_STATUS_ID) then
                        target:delStatusEffect(DOOM_STATUS_ID)
                    end
                    -- 2. Apply new random Doom
                    apply_doom_effect(target)
                end
            end
        end

        game_state.last_alive_count = alive_count


    -- WIN/END CONDITION CHECK
    elseif alive_count <= 1 then
        local winner_msg = "The Doom Survival event has ended!"

        if alive_count == 1 then
            local winner = GetPlayerByID(alive_participants[1])
            if winner and not winner:isDead() then
                local zone_name = (announcer and announcer:getZone()) and announcer:getZone():getName() or "the area"
                winner_msg = string.format("A CHAMPION HAS EMERGED! %s has survived the Doom in %s!", winner:getName(), zone_name)

                winner:setHP(winner:getMaxHP())
                winner:setMP(winner:getMaxMP())
                
                -- Ensure winner's Doom is removed immediately
                if winner:hasStatusEffect(DOOM_STATUS_ID) then
                    winner:delStatusEffect(DOOM_STATUS_ID)
                    winner:printToPlayer("Congratulations! Your **Doom** status effect has been removed. You are the champion!")
                end
            end
        end

        if announcer then
            announcer:printToArea(winner_msg)
        end

        -- Final cleanup (removes Reraise, residual Doom, and initial debuffs from others)
        cleanup_game(zoneId, announcer)
    end
end


-- Main command trigger function is attached to the commandObj
commandObj.onTrigger = function(player, arg1)
    if not player then return end

    local zone = player:getZone()
    local zoneId = player:getZoneID()

    if not zoneId or zoneId == 0 or not zone then
        player:printToPlayer("Error: Could not determine your current zone.")
        return
    end

    local zone_name = zone:getName()

    -- --- STOP COMMAND LOGIC ---
    if arg1 and string.lower(arg1) == "stop" then
        if not active_doom_games[zoneId] then
            player:printToPlayer("No active Doom Survival event found in this zone.")
            return
        end

        cleanup_game(zoneId, player)
        
        local msg = string.format("Doom Survival event manually stopped by %s. Effects removed.", player:getName())
        player:printToArea(msg)
        player:printToPlayer("Doom Survival event successfully terminated.")
        return
    end

    -- --- START COMMAND LOGIC (!partydoom) ---

    if active_doom_games[zoneId] then
        player:printToPlayer(string.format("A Doom Survival event is already active in %s! Use !partydoom stop to end it.", zone_name))
        return
    end

    local starter_id = player:getID()
    local participants = {}
    local zone_members = zone:getPlayers()
    local initial_count = 0
    
    -- Filter participants: must be alive and not in combat
    for _, member in ipairs(zone_members) do
        if member and member:getID() ~= starter_id and not member:isDead() and not member:hasEnmity() then
            participants[member:getID()] = true
            initial_count = initial_count + 1
        end
    end

    if initial_count < 2 then
        player:printToPlayer("You need at least two non-dead players without enmity to start the event.")
        return
    end

    local original_participants_copy = {}
    for charId, _ in pairs(participants) do
        original_participants_copy[charId] = true
    end

    -- Apply initial Doom, Reraise IV, and new debuffs
    for member_id, _ in pairs(participants) do
        local member = GetPlayerByID(member_id)
        if member then
            -- Grant Reraise IV
            member:addStatusEffect(RERAISE_STATUS_ID, { power = RERAISE_POWER, tick = RERAISE_SUBID, duration = RERAISE_DURATION, origin = member })
            member:printToPlayer("You have been granted **Reraise IV** for the duration of the event.")
            
            -- Apply initial Doom
            apply_doom_effect(member)

            -- APPLY NEW DEBUFFS
            member:addStatusEffect(TERROR_STATUS_ID, { power = DEBUFF_POWER, tick = DEBUFF_SUBID, duration = DEBUFF_DURATION, origin = member })
            member:addStatusEffect(SLEEP_II_STATUS_ID, { power = DEBUFF_POWER, tick = DEBUFF_SUBID, duration = DEBUFF_DURATION, origin = member })
            member:addStatusEffect(SILENCE_STATUS_ID, { power = DEBUFF_POWER, tick = DEBUFF_SUBID, duration = DEBUFF_DURATION, origin = member })
            member:addStatusEffect(MEDICINE_STATUS_ID, { power = DEBUFF_POWER, tick = DEBUFF_SUBID, duration = DEBUFF_DURATION, origin = member }) -- Added Medicine
            member:printToPlayer("WARNING! You have been afflicted with TERROR, SLEEP II, SILENCE, and MEDICINE!")
        end
    end

    if player then
        player:printToArea(string.format("[GM] %s has initiated the Doom Survival Event in %s! Total participants: %d.", player:getName(), zone_name, initial_count))
        player:printToArea("One death detected will trigger the next round of Doom.")
    end

    -- Store the active game state
    active_doom_games[zoneId] = {
        participants = participants,
        originalParticipants = original_participants_copy,
        last_alive_count = initial_count
    }
end

-- [[ GLOBAL EVENT HOOK INJECTION ]]
-- Overwrite the existing global event handler
local old_onPlayerDeath = xi.player.onPlayerDeath

xi.player.onPlayerDeath = function(player)
    -- 1. Run the original death logic first (if it existed)
    if type(old_onPlayerDeath) == 'function' and old_onPlayerDeath ~= xi.player.onPlayerDeath then
        old_onPlayerDeath(player)
    end

    -- 2. Run our new logic
    local zoneId = player:getZoneID()
    
    -- We check the game status using the exposed function on our commandObj table
    if commandObj.check_game_status and commandObj.active_doom_games[zoneId] then
        commandObj.check_game_status(zoneId)
    end
end

-- Return the commandObj which contains the !partydoom logic
return commandObj
