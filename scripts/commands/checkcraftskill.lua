-----------------------------------
-- func: checkcraftskill
-- desc: Displays a player's crafting skills.
-----------------------------------
-----------------------------------

---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!checkcraftskill (player)')
end

local craftSkills = {
    { id = xi.skill.WOODWORKING, name = "Woodworking" },
    { id = xi.skill.SMITHING,    name = "Smithing" },
    { id = xi.skill.GOLDSMITHING,name = "Goldsmithing" },
    { id = xi.skill.CLOTHCRAFT,  name = "Clothcraft" },
    { id = xi.skill.LEATHERCRAFT,name = "Leathercraft" },
    { id = xi.skill.BONECRAFT,   name = "Bonecraft" },
    { id = xi.skill.ALCHEMY,     name = "Alchemy" },
    { id = xi.skill.COOKING,     name = "Cooking" },
    { id = xi.skill.FISHING,     name = "Fishing" },
    { id = xi.skill.SYNERGY,     name = "Synergy" },
}

commandObj.onTrigger = function(player, target)
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    player:printToPlayer(string.format('--- %s\'s Crafting Skills ---', targ:getName()), xi.msg.channel.SYSTEM_3)

    local foundAny = false
    for _, craft in ipairs(craftSkills) do
        if craft.id ~= nil then
            local rawSkill = 0
            local success = false
            
            -- Use pcall to prevent crashes if getTotalSkill looks up an unmapped mod (like Synergy)
            if xi.crafting and type(xi.crafting.getTotalSkill) == "function" then
                success, rawSkill = pcall(xi.crafting.getTotalSkill, targ, craft.id)
            end
            
            if not success then
                rawSkill = targ:getSkillLevel(craft.id)
            end
            
            if rawSkill and rawSkill > 0 then
                player:printToPlayer(string.format('%-14s : %.1f', craft.name, rawSkill), xi.msg.channel.SYSTEM_3)
                foundAny = true
            end
        end
    end
    
    if not foundAny then
        player:printToPlayer('No crafting skills leveled.', xi.msg.channel.SYSTEM_3)
    end
end

return commandObj