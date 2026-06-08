-----------------------------------
-- func: addeffect
-- desc: Adds the given effect to the given player.
-- custom: Added specific logic for Chocobo Racing STUN mechanics.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

commandObj.onTrigger = function(player, targetName)
    -- Custom Logic: Chocobo Race Stun
    if not (player:getCharVar("ChocoboRaceOn") == 1 and player:getZoneID() == xi.zone.CHOCOBO_CIRCUIT) then
        player:printToPlayer("You can only use this during a chocobo race!")
        return
    end

    local stunCharges = player:getCharVar("Chocostun")
    if stunCharges <= 0 then
        player:printToPlayer("You have no Chocostuns left!")
        return
    end

    local targ
    if targetName then
        targ = GetPlayerByName(targetName)
    end
    if not targ then
        targ = player:getTarget()
    end

    if targ == nil or not targ:isPC() then
        player:printToPlayer("You must target another player.")
        return
    end

    if targ:getID() == player:getID() then
        player:printToPlayer("You cannot stun yourself.")
        return
    end

    if not (targ:getCharVar("ChocoboRaceOn") == 1 and targ:getZoneID() == player:getZoneID()) then
        player:printToPlayer("You can only stun other racers.")
        return
    end

    -- All checks passed, proceed with stun
    player:setCharVar("Chocostun", stunCharges - 1)
    player:printToPlayer(string.format("Chocostun used! Remaining: %d", stunCharges - 1))

    local id = xi.effect.STUN
    local power = 1
    local duration = 2

    -- add effect
    if targ:addStatusEffect(id, { power = power, duration = duration, origin = player }) then
        targ:messagePublic(280, targ, id, id)
        local actionId = 5 -- Take Hit/Action
        local animationId = 226  -- Generic hit animation
        -- The actor is the player who used the stun.
        targ:injectActionPacket(targ:getID(), actionId, animationId, 0, 0, 0, 10, player:getID())
    else
        targ:messagePublic(283, targ, id)
    end
end

return commandObj