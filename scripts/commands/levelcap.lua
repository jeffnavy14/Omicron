-----------------------------------
-- Set level cap to 75
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'i'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!levelcap')
end

local capon = function(player)
      player:setCharVar('LvlCapOGLvl', player:getMainLvl())
      player:setLevel(75)
      player:setLevelCap(75)
      player:setCharVar('LvlCapOn', 1)
end

local capoff = function(player)
      player:setLevelCap(99)
      player:setLevel(player:getCharVar('LvlCapOGLvl'))
      player:setCharVar('LvlCapOn', 0)
      player:setCharVar('LvlCapOGLvl', 0)
      player:delExp(1)
end

commandObj.onTrigger = function(player, tier)
  local mode = utils.clamp(tier or 0, 0, 2)
  local state = player:getCharVar('LvlCapOn')

        if not player:getCharVar('LvlCapOGLvl') == 99 then
            if player:getMainLvl() ~= 99 then
               player:printToPlayer('You must be level 99 to use this command')
               return end
        else
            if mode == 0 and state == 0 then
               capon(player)
                     player:printToPlayer('Level Cap On!')
            elseif mode == 0 and state == 1 then
               capoff(player)
                      player:printToPlayer('Level Cap Off!')
            end
        end
end

return commandObj