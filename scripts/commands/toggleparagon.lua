-----------------------------------
-- Turns off a players paragon effect for testing
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = 'sss'
}
local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!toggleparagon <toggle> <target>')
end

commandObj.onTrigger = function(player, toggle, target)
    if toggle == nil or
       target == nil then
        error(player, 'Incorrect selection! !paragon on <playersName> or  !paragon off <playersName>')
        return
    end
    local targ = GetPlayerByName(target)
    if targ == nil then
        player:printToPlayer(string.format('Player named "%s" not found!', target))
        return
    end

  if toggle == 'on' then
     targ:setCharVar('[ParagonMod]Active', 1)
     targ:addStatusEffectEx(xi.effect.PARAGON, xi.effect.PARAGON, 10, 3, 0)
     player:printToPlayer(string.format('You have turned on %s Paragon Effect', target))
        targ:setPos(targ:getXPos(), targ:getYPos(), targ:getZPos(), targ:getRotPos(), targ:getZoneID())
  elseif toggle == 'off' then
     targ:setCharVar('[ParagonMod]Active', 2)
     targ:delStatusEffect(xi.effect.PARAGON)
     player:printToPlayer(string.format('You have turned off %s Paragon Effect', target))
        targ:setPos(targ:getXPos(), targ:getYPos(), targ:getZPos(), targ:getRotPos(), targ:getZoneID())
  end


end
return commandObj
