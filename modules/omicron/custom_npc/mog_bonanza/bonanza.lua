-----------------------------------
-- Catseyebonanza
-----------------------------------
require("modules/module_utils")
local ID = require("scripts/zones/Lower_Jeuno/IDs")
-----------------------------------
local m = Module:new("bonanza")

m:addOverride("xi.zones.Bastok_Mines.Zone.onInitialize", function(zone)
super(zone)
    local Lilit = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Lilith",
        look = 2289,
        x = 93.253,
        y = 0.623,
        z = -75.164,
        rotation = 128,
        widescan = 1,

        onTrigger = function(player, npc)
            if player:getCharVar("testing") and player:hasItem(3443) then
               player:PrintToPlayer(string.format("Good Luck!!Your Number is %s, Keep your eye on discord for the winning numbers!!!!", player:getCharVar("testing")))
            end
            if player:getCharVar("testing") == 0 then
                       
                local random = math.random(1, 10000)
            
                if random > 10000 then
                    name = "10000"
                elseif random > 9000 then
                    name = "9000"
                elseif random > 8000 then
                    name = "8000"
                elseif random > 7000 then
                    name = "7000"
                elseif random > 6000 then
                    name = "6000"
                elseif random > 5000 then
                    name = "5000"
                elseif random > 4000 then
                    name = "4000"
                elseif random > 3000 then
                    name = "3000"
                elseif random > 2000 then
                    name = "2000"
                elseif random > 1000 then
                    name = "1000"
                end
		            player:addItem({id=3443, signature = name})
                    player:setCharVar("testing", random)
                    player:PrintToPlayer(string.format("Good Luck!!Your Number is %s, Keep your eye on discord for the winning numbers!!!!", player:getCharVar("testing")))
                    player:messageSpecial(ID.text.ITEM_OBTAINED, 3443)
            end 
        end,
    })
    utils.unused(Lilit)

end)

m:addOverride("xi.zones.Port_Windurst.Zone.onInitialize", function(zone)
    super(zone)
    local Lilit = zone:insertDynamicEntity({
    objtype = xi.objType.NPC,
        name = "Lilith",
        look = 2289,
        x = 191.660,
        y = -12.000,
        z = 229.149,
        rotation = 50,
        widescan = 1,

        onTrigger = function(player, npc)
            if player:getCharVar("testing") and player:hasItem(3443) then
               player:PrintToPlayer(string.format("Good Luck!!Your Number is %s, Keep your eye on discord for the winning numbers!!!!", player:getCharVar("testing")))
            end
            if player:getCharVar("testing") == 0 then
                        
                local random = math.random(1, 10000)
            
                if random > 10000 then
                    name = "10000"
                elseif random > 9000 then
                    name = "9000"
                elseif random > 8000 then
                    name = "8000"
                elseif random > 7000 then
                    name = "7000"
                elseif random > 6000 then
                    name = "6000"
                elseif random > 5000 then
                    name = "5000"
                elseif random > 4000 then
                    name = "4000"
                elseif random > 3000 then
                    name = "3000"
                elseif random > 2000 then
                    name = "2000"
                elseif random > 1000 then
                    name = "1000"
                end
		            player:addItem({id=3443, signature = name})
                    player:setCharVar("testing", random)
                    player:PrintToPlayer(string.format("Good Luck!!Your Number is %s, Keep your eye on discord for the winning numbers!!!!", player:getCharVar("testing")))
                    player:messageSpecial(ID.text.ITEM_OBTAINED, 3443)
            end 
        end,
    })
    utils.unused(Lilit)

end)

m:addOverride("xi.zones.Northern_San_dOria.Zone.onInitialize", function(zone)
    super(zone)
    local Lilit = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Lilith",
        look = 2289,
        x = 74.813,
        y = 0.000,
        z = 11.578,
        rotation = 204,
        widescan = 1,

        onTrigger = function(player, npc)
            if player:getCharVar("testing") and player:hasItem(3443) then
               player:PrintToPlayer(string.format("Good Luck!!Your Number is %s, Keep your eye on discord for the winning numbers!!!!", player:getCharVar("testing")))
            end
            if player:getCharVar("testing") == 0 then
                        
                local random = math.random(1, 10000)
            
                if random > 10000 then
                    name = "10000"
                elseif random > 9000 then
                    name = "9000"
                elseif random > 8000 then
                    name = "8000"
                elseif random > 7000 then
                    name = "7000"
                elseif random > 6000 then
                    name = "6000"
                elseif random > 5000 then
                    name = "5000"
                elseif random > 4000 then
                    name = "4000"
                elseif random > 3000 then
                    name = "3000"
                elseif random > 2000 then
                    name = "2000"
                elseif random > 1000 then
                    name = "1000"
                end
		            player:addItem({id=3443, signature = name})
                    player:setCharVar("testing", random)
                    player:PrintToPlayer(string.format("Good Luck!!Your Number is %s, Keep your eye on discord for the winning numbers!!!!", player:getCharVar("testing")))
                    player:messageSpecial(ID.text.ITEM_OBTAINED, 3443)
            end 
        end,
    })
    utils.unused(Lilit)

end)

return m