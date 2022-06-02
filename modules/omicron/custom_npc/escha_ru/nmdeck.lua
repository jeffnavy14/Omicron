-----------------------------------
-- (zone 123)
-- Relic Weapons
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Escha_RuAun/Zone")
-----------------------------------
local m = Module:new("???_Ports")
m:setEnabled(true)

m:addOverride("xi.zones.Escha_RuAun.Zone.onInitialize", function(zone)
    -------------------------
	-- Port to GOD Balcony --
	-------------------------
       super(zone)

    local suzport = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Suzaku Portal",
		look = "0x0000340000000000000000000000000000000000",
        x = -358.551,
        y = -40.106,
        z = -254.958,
        rotation = 28,
        widescan = 1,

        onTrigger = function(player, npc)
		    if player:hasKeyItem(xi.keyItem.SUZAKUS_BENEFACTION) then
		        player:setPos(-454.702, -71.552, -308.579)
		    end
		end,
    })

    local byaport = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Byakko Portal",
		look = "0x0000340000000000000000000000000000000000",
        x = -353.084,
        y = -40.106,
        z = 262.058,
        rotation = 28,

        onTrigger = function(player, npc)
		    if player:hasKeyItem(xi.keyItem.BYAKKOS_PRIDE) then
		        player:setPos(-443.993, -71.552, 336.419)
		    end
		end,
    })

    local genport = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Genbu Portal",
		look = "0x0000340000000000000000000000000000000000",
        x = 140.386,
        y = -40.147,
        z = 417.497,
        rotation = 28,

        onTrigger = function(player, npc)
		    if player:hasKeyItem(xi.keyItem.GENBUS_HONOR) then
		        player:setPos(186.160, -71.552, 515.480)
		    end
		end,
    })

    local syrport = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Seiyru Portal",
		look = "0x0000340000000000000000000000000000000000",
        x = 441.000,
        y = -40.106,
        z = -4.900,
        rotation = 28,

        onTrigger = function(player, npc)
		    if player:hasKeyItem(xi.keyItem.SEIRYUS_NOBILITY) then
		        player:setPos(548.250, -71.552, -17.000)
		    end
		end,
    })
	
	-----------------------
	-- NPC's to pop NM's --
	-----------------------
    local suzport = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Suzaku Pop",
		look = "0600900400000000000000000000000000000000",
        x = -497.334,
        y = -70.020,
        z = -239.032,
        rotation = 28,
        widescan = 1,

        onTrigger = function(player, npc)
        if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) or
		   player:hasKeyItem(xi.keyItem.SUZAKUS_BENEFACTION) then
		   player:delKeyItem(xi.keyItem.SUZAKUS_BENEFACTION)
		
		    local zone = player:getZone()
            local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan Suzaku",
                x = -513.394,
                y = -70.020,
                z = -269.371,
                rotation = 50,
                groupId = 81,
                groupZoneId = 289,
	        
                onMobDeath = function(mob, playerArg, isKiller)
                    -- Do stuff
                end,
	        
                releaseIdOnDeath = true,
            })
	        
            mob:setDropID(4054)
	        mob:setSpawn(-513.394, -70.020, -269.371, 50)
            mob:spawn()
        end
	end,
    })

    local byaport = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Byakko Pop",
		look = "0600900400000000000000000000000000000000",
        x = -383.542,
        y = -70.020,
        z = 399.272,
        rotation = 28,

        onTrigger = function(player, npc)
        if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) or
		   player:hasKeyItem(xi.keyItem.BYAKKOS_PRIDE) then
		   player:delKeyItem(xi.keyItem.BYAKKOS_PRIDE)
		    local zone = player:getZone()
            local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan Byakko",
                x = -417.141,
                y = -70.298,
                z = 409.665,
                rotation = player:getRotPos(),
                groupId = 78,
                groupZoneId = 289,
	        
                onMobDeath = function(mob, playerArg, isKiller)
                    -- Do stuff
                end,
	        
                releaseIdOnDeath = true,
            })
	        
            mob:setDropID(4050)
	        mob:setSpawn(-417.141, -70.298, 409.665, player:getRotPos())
            mob:spawn()
        end
	end,
    })

    local genport = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Genbu Pop",
		look = "0600900400000000000000000000000000000000",
        x = 260.729,
        y = -70.020,
        z = 485.106,
        rotation = 28,

        onTrigger = function(player, npc)
        if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) or
		   player:hasKeyItem(xi.keyItem.GENBUS_HONOR) then
		   player:delKeyItem(xi.keyItem.GENBUS_HONOR)
		    local zone = player:getZone()
            local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan Genbu",
                x = 260.208,
                y = -70.298,
                z = 523.173,
                rotation = player:getRotPos(),
                groupId = 79,
                groupZoneId = 289,
	        
                onMobDeath = function(mob, playerArg, isKiller)
                    -- Do stuff
                end,
	        
                releaseIdOnDeath = true,
            })
	        
            mob:setDropID(4051)
	        mob:setSpawn(260.208, -70.298, 523.173, player:getRotPos())
            mob:spawn()
        end
	end,
    })

    local syrpop = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Seiryu Pop",
		look = "0600900400000000000000000000000000000000",
        x = 545.647,
        y = -70.020,
        z = -95.372,
        rotation = 28,

        onTrigger = function(player, npc)
        if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) or
		   player:hasKeyItem(xi.keyItem.SEIRYUS_NOBILITY) then
		   player:delKeyItem(xi.keyItem.SEIRYUS_NOBILITY)
		    local zone = player:getZone()
            local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan Seiryu",
                x = 581.474,
                y = -70.298,
                z = -86.974,
                rotation = player:getRotPos(),
                groupId = 80,
                groupZoneId = 289,
	        
                onMobDeath = function(mob, playerArg, isKiller)
                    -- Do stuff
                end,
	        
                releaseIdOnDeath = true,
            })
	        
            mob:setDropID(4053)
	        mob:setSpawn(581.474, -70.298, -86.974, player:getRotPos())
            mob:spawn()
        end
	end,
	})
end)

return m

