-----------------------------------
-- cmd: !hqrate
-- Gives HQ Rate + Material Loss
-----------------------------------
local command = {}

command.cmdprops =
{
    permission = 3,
    parameters = 's'
}

command.description = "Gives HQ Rate +3 and Material Loss -6."

command.onTrigger = function(player, targetName)
    local target = player

    if targetName then
        target = GetPlayerByName(targetName)
        if not target then
            player:printToPlayer(string.format("Player named '%s' not found!", targetName), xi.msg.channel.SYSTEM_3)
            return
        end
    else
        local cursorTarget = player:getCursorTarget()
        if cursorTarget and cursorTarget:isPC() then
            target = cursorTarget
        end
    end

    target:delStatusEffect(xi.effect.FOOD)
    target:addMod(xi.mod.SYNTH_HQ_RATE, 2000)
    target:addMod(xi.mod.SYNTH_MATERIAL_LOSS, 100)
    target:addMod(xi.mod.SYNTH_SUCCESS_RATE, 100)

    --target:addMod(xi.mod.WOOD,130)
    --target:addMod(xi.mod.SMITH,130)
    --target:addMod(xi.mod.GOLDSMITH,130)
    --target:addMod(xi.mod.CLOTH,130)
    --target:addMod(xi.mod.BONE,130)
    --target:addMod(xi.mod.LEATHER,130)
    --target:addMod(xi.mod.ALCHEMY,130)
    --target:addMod(xi.mod.ALCHEMY,130)
    
    target:printToPlayer("HQ Rate +2000 and Material Loss -100% applied.", xi.msg.channel.SYSTEM_3)
    if target:getID() ~= player:getID() then
        player:printToPlayer(string.format("Applied HQ Rate effects to %s.", target:getName()), xi.msg.channel.SYSTEM_3)
    end

    target:addStatusEffect(xi.effect.FOOD, { duration = 120, origin = player, sourceType = xi.effectSourceType.FOOD, sourceTypeParam = 5784 })
end

return command
