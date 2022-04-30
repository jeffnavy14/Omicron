-----------------------------------
-- Add some test NPCs to GM_HOME (zone 210)
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Yuhtunga_Jungle/Zone")
-----------------------------------
local m = Module:new("domain")
m:setEnabled(true)

m:addOverride("xi.zones.Yuhtunga_Jungle.onInitialize", function(zone)
    super(zone)
    local mob = zone:insertDynamicEntity({

        objtype = xi.objType.MOB,
        name = "Fafnir",

        x = 376.647,
        y = 21.000,
        z = 276.568,
        rotation = 28,

        groupId = 5,
        groupZoneId = 154,

        onMobDeath = function(mob, playerArg, isKiller)
		    
        end,
    })

    
	mob:setSpawn(376.647, 21.000, 276.568)
	mob:setDropID(0)
	mob:spawn()
end)

return m