-----------------------------------
-- Teleport  Yhoator
-- Enchantment: "Teleport-Yhoator"
-----------------------------------
local commandObj = {}
commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!yhoator')
end

commandObj.onTrigger = function(player, target)
    -- LOCKOUT CHECK
    if player:getCharVar("ratio") == 1 then
        player:printToPlayer("Access Denied: You are currently locked out of this command.")
        return
    end

    local result = 0
    if not player:hasKeyItem(xi.ki.YHOATOR_GATE_CRYSTAL) then
        result = 445
    else
        player:addStatusEffect(xi.effect.TELEPORT, { power = xi.teleport.id.YHOAT, duration = 1, origin = player, icon = 0 })
    end
end

return commandObj