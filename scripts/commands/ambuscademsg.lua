-----------------------------------
-- Sends a World Wide Message
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = 's'
}


commandObj.onTrigger = function(player, worldMessage)

  local players = player:getZone():getPlayers()

  for name, playerVal in pairs(players) do
      playerVal:messageName(8123, player,638,249,40,638,5) -- this is the correct message, just needs to make it zone wide and attach to ambuscade tome
  end
end

return commandObj
