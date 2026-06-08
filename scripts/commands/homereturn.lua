-----------------------------------
-- func: return you to the previous location you used !home at
-- desc
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!homereturn')
end

commandObj.onTrigger = function(player, target)
        local point = '.'
        local xa = player:getCharVar('[MogPosXa]') - 10001
        local xb = player:getCharVar('[MogPosXb]') - 10001
        local xx = tonumber(xa ..point ..xb)
        local ya = player:getCharVar('[MogPosYa]') - 10001
        local yb = player:getCharVar('[MogPosYb]') - 10001
        local yy = tonumber(ya ..point ..yb)
        local za = player:getCharVar('[MogPosZa]') - 10001
        local zb = player:getCharVar('[MogPosZb]') - 10001
        local zz = tonumber(za ..point ..zb)
        local ro = player:getCharVar('[MogRot]')
        local zo = player:getCharVar('[MogZID]')
        local targ = player
    if zo == 222 then
       player:printToPlayer('The Provenance zone is off limits to !homereturn')
       return
    else
       if player:getCharVar('[MoghTele]') > os.time() then
        player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
        -- Delay warp using a timer
        player:timer(1000, function()
               player:setPos(xx, yy, zz, ro, zo)
               player:setCharVar('[MogPosXa]', 0)
               player:setCharVar('[MogPosXb]', 0)
               player:setCharVar('[MogPosYa]', 0)
               player:setCharVar('[MogPosYb]', 0)
               player:setCharVar('[MogPosZa]', 0)
               player:setCharVar('[MogPosZb]', 0)
               player:setCharVar('[MogRot]', 0)
               player:setCharVar('[MogZID]', 0)
               player:setCharVar('[MoghTele]', 0)
               end)
        elseif player:getCharVar('[MoghTele]') < os.time() then
               player:printToPlayer('You time to return has expired!')
       end
    end
end

return commandObj
