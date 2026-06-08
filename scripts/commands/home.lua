-----------------------------------
-- func: homepoint
-- desc: Sends the target to their homepoint.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!home')
end





commandObj.onTrigger = function(player, target)
local function player_hate()
    local party = player:getParty()
    for _, partyMember in pairs(party) do
         if partyMember:hasEnmity() then
            local a, b = partyMember:hasEnmity(), true
                     if a==b then
                        return true
                     end
                        end
                        return false
         end 
end
local function warpPlayerToHomePoint(player)
    -- Inject action packet for animation (replace animation ID as needed)
    player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
    -- Delay warp using a timer
    player:timer(1000, function()
        -- Warp the player to their home point
        player:warp()
    end)
end
         if player_hate() == true then
            player:printToPlayer('You or someone in your party has Enmity, please try again when you are clear!')
         else
                  player:setCharVar('[MogPosXa]',0)
                  player:setCharVar('[MogPosXb]',0)
                  player:setCharVar('[MogPosYa]',0)
                  player:setCharVar('[MogPosYb]',0)
                  player:setCharVar('[MogPosZa]',0)
                  player:setCharVar('[MogPosZb]',0)
                  player:setCharVar('[MogRot]',0)
                  player:setCharVar('[MogZID]',0)
                  player:setCharVar('[MoghTele]',0)
            local xpos = tostring(player:getXPos() +1.1)
            local onex, twox = xpos:match('([^.]*)%.([^.]*)')
            local ypos = tostring(player:getYPos() +1.1)
            local oney, twoy = ypos:match('([^.]*)%.([^.]*)')
            local zpos = tostring(player:getZPos() +1.1)
            local onez, twoz = zpos:match('([^.]*)%.([^.]*)')
                  player:setCharVar('[MogPosXa]', tonumber(onex) + 10000)
                  player:setCharVar('[MogPosXb]', tonumber(twox) + 10000)
                  player:setCharVar('[MogPosYa]', tonumber(oney) + 10000)
                  player:setCharVar('[MogPosYb]', tonumber(twoy) + 10000)
                  player:setCharVar('[MogPosZa]', tonumber(onez) + 10000)
                  player:setCharVar('[MogPosZb]', tonumber(twoz) + 10000)
                  player:setCharVar('[MogRot]', player:getRotPos())
                  player:setCharVar('[MogZID]', player:getZoneID())
                  player:setCharVar('[MoghTele]', os.time() +300)
                  warpPlayerToHomePoint(player)
         end
end

return commandObj
