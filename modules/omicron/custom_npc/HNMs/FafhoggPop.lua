-----------------------------------
require("modules/module_utils")
require("scripts/zones/Dragons_Aery/Zone")
-----------------------------------
local m = Module:new("FafHoggPop")
m:setEnabled(true)

m:addOverride("xi.zones.Dragons_Aery.Zone.onInitialize", function(zone)
       super(zone)

local kbpop = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Nidhogg Pop",
		look = "2445",
        x = 88.7748,
        y = 5.4479,
        z = 23.1736,
        rotation = 28,

        onTrigger = function(player, npc)
        if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SetServerVariable("[EschanNid]", 1)
        end
	end,
	})

local kbpop = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Fafnir Pop",
		look = "2445",
        x = 93.4929,
        y = 5.3174,
        z = 28.1736,
        rotation = 28,

        onTrigger = function(player, npc)
        if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SetServerVariable("[EschanFaf]", 1)
        end
	end,
	})

return m