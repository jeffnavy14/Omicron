-- func: addkeyitems <player> <group>
-- desc: Adds a specific group of key items to the target player based on the abbreviation.
-----------------------------------

---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,  -- Adjust permission level as needed
    parameters = 'ss'  -- Two parameters: Player name and Group abbreviation
}

-- Error handling function
local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('Usage: !addkeyitems <player> <group>')
end

-- Define the key item groups for each abbreviation
local keyItemGroups = {
    rov = {
        2884, -- Rhapsody of white
        2885, -- Rhapsody of umber
        2886, -- Rhapsody of azure
        2887, -- Rhapsody of crimson
        2888, -- Rhapsody of emerald
        2889, -- Rhapsody of mauve
        2890, -- Rhapsody of fuchsia
        2891, -- Rhapsody of puce
        2892, -- Rhapsody of ochre
        2989, -- Dimensional compass
        2893, -- Scintillating phapsody
        3026  -- Phoenix Blessing
    },
    cop = {
        708,  -- Mysterious Amulet
        591,  -- Light of Dem
        590,  -- Light of Holla
        592,  -- Light of Mea
        604,  -- Pso'Xja Pass
        593,  -- Light of Vahzl
        594   -- Light of Al'Taieu
    },
    zm = {
        238,  -- Sacrificial Chamber Key
        247,  -- Prismatic Fragment
        452,  -- Cerulean Crystal
        3,    -- RoZ: Awakening (Mission)
    },
    toau = {
        780,  -- PSC Wildcat Badge
        783,  -- PFC Wildcat Badge
        784,  -- SP Wildcat Badge
        794,  -- LC Wildcat Badge
        795,  -- C Wildcat Badge
        825,  -- S Wildcat Badge
        826,  -- SM Wildcat Badge
        827,  -- CS Wildcat Badge
        894,  -- SL Wildcat Badge
        900,  -- FL Wildcat Badge
        909,  -- CAPTAIN Wildcat Badge
        812,  -- Astral Compass
        781,  -- Boarding Pass 
    },
    wotg = {
        910   -- Pure White Feather
    },
    all = {  -- Combine all key items from every group
        2884, 2885, 2886, 2887, 2888, 2889, 2890, 2891, 2892, 2989, 2893, 3026, -- rov
        708, 591, 590, 592, 604, 593, 594, -- cop
        238, 247, 452, 3, -- zm
        780, 783, 784, 794, 795, 825, 826, 827, 894, 900, 909, 812, -- toau
        910  -- wotg
    }
}

-- Validate and process the command
commandObj.onTrigger = function(player, target, group)
    -- Check if the group abbreviation is provided
    if not group then
        error(player, 'You must provide a group abbreviation (cop, zm, toau, wotg, rov, or all).')
        return
    end

    -- Validate the group abbreviation
    group = string.lower(group)  -- Ensure the group abbreviation is lowercase
    local keyItems = keyItemGroups[group]

    if not keyItems then
        error(player, 'Invalid group abbreviation. Valid groups are: cop, zm, toau, wotg, rov, all.')
        return
    end

    -- If no target player is provided, use the player who issued the command
    local targ
    if not target then
        targ = player
    else
        targ = GetPlayerByName(target)  -- Find player by name
        if not targ then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- Add each key item in the selected group
    for _, keyId in ipairs(keyItems) do
        -- Check if the target already has the key item
        if not targ:hasKeyItem(keyId) then
            -- Get the zone ID for message formatting
            local ID = zones[targ:getZoneID()]
            targ:addKeyItem(keyId)  -- Add the key item to the target player
            targ:messageSpecial(ID.text.KEYITEM_OBTAINED, keyId)  -- Notify the player of the key item obtained
        end
    end

    -- Confirm action to the player issuing the command
    player:printToPlayer(string.format('All %s key items have been added to %s.', group:upper(), targ:getName()))  -- Confirmation message
end

return commandObj
