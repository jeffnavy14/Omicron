---------------------------------------------------------------------------------------------------
-- func: getmodelidstring
-- desc: prints model of cursor target into chatlog of every mid and converts to hex
---------------------------------------------------------------------------------------------------
local commandObj = {}
commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!getmodelidstring')
end

local function lookTableToString(tbl)
    if not tbl or type(tbl) ~= "table" then return "nil" end
    local parts = {}
    local sortedKeys = {}
    for k in pairs(tbl) do table.insert(sortedKeys, k) end
    table.sort(sortedKeys)

    for _, k in ipairs(sortedKeys) do
        local v = tbl[k]
        local keyStr = type(k) == "string" and k or string.format("[%s]", tostring(k))
        local valStr
        if type(v) == "number" then
            valStr = string.format("0x%X", v)  -- convert numbers to hex
        elseif type(v) == "string" then
            valStr = string.format("'%s'", v)
        else
            valStr = tostring(v)
        end
        table.insert(parts, string.format("%s = %s", keyStr, valStr))
    end
    return "{ " .. table.concat(parts, ", ") .. " }"
end

commandObj.onTrigger = function(player, target)
    local entity = target or player:getCursorTarget() or player

    if target == nil then
        targ = player
    end

    if entity then
        local lookTable = entity:getModelIdLook()
        player:printToPlayer("look = " .. lookTableToString(lookTable))
    else
        player:printToPlayer("No target.")
    end
end

return commandObj
