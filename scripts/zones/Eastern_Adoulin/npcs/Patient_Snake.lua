-----------------------------------
-- Fake Debug NPC Script (char_history Edition)
-- Pulls actual historical data to roast the player
-----------------------------------
local ID = zones[xi.zone.EASTERN_ADOULIN]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    -- Animate the NPC to look busy
    npc:entityAnimationPacket("spcl")

    local charName = player:getName()

    -- Pulling the exact bindings you discovered!
    local kos = player:getHistory(xi.history.TIMES_KNOCKED_OUT)
    local mhVisits = player:getHistory(xi.history.MH_ENTRANCES)
    local enemiesKilled = player:getHistory(xi.history.ENEMIES_DEFEATED)
    local parties = player:getHistory(xi.history.JOINED_PARTIES)
    local alliances = player:getHistory(xi.history.JOINED_ALLIANCES)
    
    -- Our new bindings!
    local distance = player:getHistory(xi.history.DISTANCE_TRAVELLED)
    local npcs = player:getHistory(xi.history.NPC_INTERACTIONS)

    -- Pick a random roast from 1 to 7
    local roastSelector = math.random(1, 7)

    if roastSelector == 1 then
        -- The Floor Inspector (TIMES_KNOCKED_OUT)
        player:printToPlayer(string.format("[DEBUG] times_knocked_out = %d. Ah, %s, the server's premier floor inspector. The dirt down there looks great, doesn't it?", kos, charName))

    elseif roastSelector == 2 then
        -- The Homebody (MH_ENTRANCES)
        player:printToPlayer(string.format("[WARN] mh_entrances = %d. You've hidden in your Mog House %d times. Scared of the outside world, or just rearranging your potted plants?", mhVisits, mhVisits))

    elseif roastSelector == 3 then
        -- The Ecological Disaster (ENEMIES_DEFEATED)
        player:printToPlayer(string.format("[SYS] enemies_defeated = %d. You are a walking ecological disaster. The local Mandragora population is officially unionizing against you.", enemiesKilled))

    elseif roastSelector == 4 then
        -- The LFG Check (JOINED_PARTIES)
        if parties == 0 then
            player:printToPlayer("[ERROR] joined_parties = 0. A true lone wolf. Or maybe nobody wants to invite you. Have you considered taking up fishing?")
        else
            player:printToPlayer(string.format("[SYS] joined_parties = %d. I'm actually surprised %d groups of people willingly invited you.", parties, parties))
        end

    elseif roastSelector == 5 then
        -- The Dynamis Roaster (JOINED_ALLIANCES)
        if alliances > 0 then
            player:printToPlayer(string.format("[DEBUG] joined_alliances = %d. Which means you've sat through exactly %d loot drop arguments. I am so sorry.", alliances, alliances))
        else
            player:printToPlayer("[SYS] joined_alliances = 0. You haven't experienced true pain until an Alliance wipes to a single link in Dynamis.")
        end
        
    elseif roastSelector == 6 then
        -- The Marathon Runner (DISTANCE_TRAVELLED)
        player:printToPlayer(string.format("[SYS] Checking distance_travelled... %d yalms. Your virtual chocobo called. It's pressing charges for neglect.", distance))
        
    elseif roastSelector == 7 then
        -- The Annoying Customer (NPC_INTERACTIONS)
        player:printToPlayer(string.format("[ERROR] npc_interactions limit approaching. You have bothered NPCs exactly %d times... and yet, you still decided to click on me.", npcs))
    end
end

return entity
