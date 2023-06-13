-----------------------------------
-- Decorative Monster
-----------------------------------
require("modules/module_utils")
require("scripts/zones/The_Colosseum/Zone")
-----------------------------------
local m = Module:new("TraineeMob")
m:setEnabled(true)
	
m:addOverride("xi.zones.The_Colosseum.Zone.onInitialize", function(zone)
	
    super(zone)
	
	SetServerVariable("[Arena]FightMonth", tonumber(os.date("%m")))
	local month = GetServerVariable("[Arena]FightMonth")
	
	local TraineeMob = zone:insertDynamicEntity({
		
		objtype = xi.objType.NPC,
        name = "Trainee",
        look = 1975,
        x = -568.000,
        y = 2.000,
        z = 40.000,
        rotation = 180,
		
		onSpawm = function(player, npc)
			if month == 1 then
				npc:setModelId(1975)
			elseif month == 2 then
				npc:setModelId(2928)
			elseif month == 3 then
				npc:setModelId(3565)
			elseif month == 4 then
				npc:setModelId(2944)
			elseif month == 5 then
				npc:setModelId(2954)
			elseif month == 6 then
				npc:setModelId(3176)
			elseif month == 7 then
				npc:setModelId(3187)
			elseif month == 8 then
				npc:setModelId(2628)
			elseif month == 9 then
				npc:setModelId(268)
			elseif month == 10 then
				npc:setModelId(3578)
			elseif month == 11 then
				npc:setModelId(789)
			elseif month == 12 then
				npc:setModelId(270)
			end
		end
		
	})

	utils.unused(TraineeMob)	

end)

return m	
