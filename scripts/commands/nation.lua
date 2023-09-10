--------------------------------------------------------------
-- func: @mogshop <page number>
-- desc: opens the custom moogle shop menu anywhere in the world
--------------------------------------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'i'
}


commandObj.onTrigger = function(player,page)
local level = player:getMainLvl();

-- printf("%s just triggered Mogshop", player:getName());

    if (page == 0 or page == nil) then
        player:PrintToPlayer( "Teleport Moogle : 1: Northern Sandoria, 2: Port Bastok, 3: Port Windurst", 0x1F);
    elseif (page == 1) then -- HQ Crystals
        player:setPos(130, -0.199, -3, 119, 231)
        player:PrintToPlayer( "Teleport Moogle : Enjoy your trip Kupo!", 0x1F);
    elseif (page == 2) then -- Pharmacy
        player:setPos(59, 8.5, -239, 119, 236)
        player:PrintToPlayer( "Teleport Moogle : Enjoy your trip Kupo!", 0x1F);
    elseif (page == 3) then -- MogDonalds
        player:setPos(197, -15.650, 258, 119, 240)
        player:PrintToPlayer( "Teleport Moogle : Enjoy your trip Kupo!", 0x1F);
    end

end;

return commandObj