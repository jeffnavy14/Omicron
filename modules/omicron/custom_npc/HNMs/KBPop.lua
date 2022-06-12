-----------------------------------
require("modules/module_utils")
require("scripts/zones/Behemoths_Dominion/Zone")
-----------------------------------
local m = Module:new("KBPop")
m:setEnabled(true)

m:addOverride("xi.zones.Escha_RuAun.Zone.onInitialize", function(zone)
       super(zone)

local kbpop = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "KB Pop",
		look = "2445",
        x = -267.4073,
        y = -19.5450,
        z = 81.4810,
        rotation = 28,

        onTrigger = function(player, npc)
        if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SetServerVariable("[EschanKB]", 1)
        end
	end,
	})