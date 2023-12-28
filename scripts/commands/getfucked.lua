---------------------------------------------------------------------------------------------------
-- func: getfucked (by atom0s)
-- desc: Forces monsters in a zone to attack the given target.
---------------------------------------------------------------------------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 6,
    parameters = 'i'
}

commandObj.onTrigger = function(player, target, count)
    -- Obtain the total count of monsters to update.
    local cnt = 50;
    if (count ~= nil) then
        cnt = tonumber(count);
        if (cnt == 0) then
            cnt = 50;
        end
    end

    -- Ensure the count is valid..
    if (cnt == nil or cnt == 0) then
        player:printToPlayer('Invalid monster count; cannot fuck the target.');
        return;
    end
    
    -- Get the target player..
    local t = GetPlayerByName(target);
    if (t == nil or t:isPC() == false) then
        player:printToPlayer('Invalid target; cannot fuck the target.');
        return;
    end
    
    -- Get the players zone id..
    local zone = t:getZoneID();
    
    -- Maths! 
    local z = bit.lshift(zone, 12);
    for x = 0, cnt do
        local m = x + (z + 0x1000000);
        local e = GetMobByID(m);
        if (e ~= nil and e:isMob() ~= false) then
            e:updateEnmity(t);
            e:setTP(3000);
        end
    end
    
    player:printToPlayer(string.format('%s has been fucked.', t:getName())); 
end
return commandObj