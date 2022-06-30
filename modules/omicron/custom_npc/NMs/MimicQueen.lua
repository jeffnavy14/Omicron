----------------------------------
-- Mimic Spawner 
----------------------------------
require("scripts/globals/status")
require("scripts/zones/Escha_ZiTah/Zone")
-----------------------------------
local m = Module:new("mimic")
m:setEnabled(true)


m:addOverride("xi.zones.GM_Home.Zone.onInitialize", function(zone)
    super(zone)

	if
       GetServerVariable("[Mimic]") > 1 then
       SetServerVariable("[Mimic]", 0)
	end

	if
       GetServerVariable("[Coffer]") > 1 then
       SetServerVariable("[Coffer]", 0)
	end

	if
       GetServerVariable("[Respawn]") > 1 then
       SetServerVariable("[Respawn]", 0)
	end

	if 
	  	GetServerVariable("[Mimic]") == 0 and             
        	GetServerVariable("[Coffer]") == 0 
	then
		SetServerVariable("[Coffer]",math.random(1,9))
	end

end)

m:addOverride("xi.zones.Escha_ZiTah.Zone.onInitialize", function(zone)
       super(zone)


	  	local coffer1 = zone:insertDynamicEntity({
        	objtype = xi.objType.NPC,
        	name = "Glorious Coffer",
        	look = "0x00000B0100000000000000000000000000000000",

   	      x = 17.3768,
  	      y = 0.8648,
  	      z = -2.1185,
     	      rotation = 28,
            widescan = 0,


        onTrigger = function(player, npc)        
		   if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SpawnMob(17957504)
		   SetServerVariable("[Mimic]", 1)
		   SetServerVariable("[Coffer]", 0)
		  npc:setStatus(xi.status.DISAPPEAR)
		    end
		end,
    })

	  	local coffer2 = zone:insertDynamicEntity({
        	objtype = xi.objType.NPC,
        	name = "Glorious Coffer",
        	look = "0x00000B0100000000000000000000000000000000",

   	      x = 17.3768,
  	      y = 0.8648,
  	      z = -2.1185,
     	      rotation = 28,
            widescan = 0,


        onTrigger = function(player, npc)        
		   if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SpawnMob(17957505)
		   SetServerVariable("[Mimic]", 1)
		   SetServerVariable("[Coffer]", 0)
		  npc:setStatus(xi.status.DISAPPEAR)
		    end
		end,
    })

	  	local coffer3 = zone:insertDynamicEntity({
        	objtype = xi.objType.NPC,
        	name = "Glorious Coffer",
        	look = "0x00000B0100000000000000000000000000000000",

   	      x = 17.3768,
  	      y = 0.8648,
  	      z = -2.1185,
     	      rotation = 28,
            widescan = 0,


        onTrigger = function(player, npc)        
		   if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SpawnMob(17957506)
		   SetServerVariable("[Mimic]", 1)
		   SetServerVariable("[Coffer]", 0)
		  npc:setStatus(xi.status.DISAPPEAR)
		    end
		end,
    })

end)

m:addOverride("xi.zones.Escha_RuAun.Zone.onInitialize", function(zone)
       super(zone)



	  	local coffer4 = zone:insertDynamicEntity({
        	objtype = xi.objType.NPC,
        	name = "Glorious Coffer",
        	look = "0x00000B0100000000000000000000000000000000",

   	      x = 1.0496,
  	      y = -37.0849,
  	      z = -443.0017,
     	      rotation = 28,
            widescan = 0,

        onTrigger = function(player, npc)        
		   if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SpawnMob(17961854)
		   SetServerVariable("[Mimic]", 1)
		   SetServerVariable("[Coffer]", 0)
		  npc:setStatus(xi.status.DISAPPEAR)
		    end
		end,
    })



	  	local coffer5 = zone:insertDynamicEntity({
        	objtype = xi.objType.NPC,
        	name = "Glorious Coffer",
        	look = "0x00000B0100000000000000000000000000000000",

   	      x = 1.0496,
  	      y = -37.0849,
  	      z = -443.0017,
     	      rotation = 28,
            widescan = 0,


        onTrigger = function(player, npc)        
		   if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SpawnMob(17961855)
		   SetServerVariable("[Mimic]", 1)
		   SetServerVariable("[Coffer]", 0)
		  npc:setStatus(xi.status.DISAPPEAR)
		    end
		end,
    })

	

	  	local coffer6 = zone:insertDynamicEntity({
        	objtype = xi.objType.NPC,
        	name = "Glorious Coffer",
        	look = "0x00000B0100000000000000000000000000000000",

   	      x = 1.0496,
  	      y = -37.0849,
  	      z = -443.0017,
     	      rotation = 28,
            widescan = 0,


        onTrigger = function(player, npc)        
		   if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SpawnMob(17961856)
		   SetServerVariable("[Mimic]", 1)
		   SetServerVariable("[Coffer]", 0)
		  npc:setStatus(xi.status.DISAPPEAR)
		    end
		end,
    })

end)

m:addOverride("xi.zones.Reisenjima.Zone.onInitialize", function(zone)
       super(zone)

	

	  	local coffer7 = zone:insertDynamicEntity({
        	objtype = xi.objType.NPC,
        	name = "Glorious Coffer",
        	look = "0x00000B0100000000000000000000000000000000",

   	      x = -498.3272,
  	      y = -21.7547,
  	      z = -450.7563,
     	      rotation = 28,
            widescan = 0,


        onTrigger = function(player, npc)        
		   if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SpawnMob(17970003)
		   SetServerVariable("[Mimic]", 1)
		   SetServerVariable("[Coffer]", 0)
		  npc:setStatus(xi.status.DISAPPEAR)
		    end
		end,
    })
	

	  	local coffer8 = zone:insertDynamicEntity({
        	objtype = xi.objType.NPC,
        	name = "Glorious Coffer",
        	look = "0x00000B0100000000000000000000000000000000",

   	      x = -498.3272,
  	      y = -21.7547,
  	      z = -450.7563,
     	      rotation = 28,
            widescan = 0,


        onTrigger = function(player, npc)        
		   if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SpawnMob(17970004)
		   SetServerVariable("[Mimic]", 1)
		   SetServerVariable("[Coffer]", 0)
		  npc:setStatus(xi.status.DISAPPEAR)
		    end
		end,
    })
	

	  	local coffer9 = zone:insertDynamicEntity({
        	objtype = xi.objType.NPC,
        	name = "Glorious Coffer",
        	look = "0x00000B0100000000000000000000000000000000",

   	      x = -498.3272,
  	      y = -21.7547,
  	      z = -450.7563,
     	      rotation = 28,
            widescan = 0,


        onTrigger = function(player, npc)        
		   if player:getGMLevel() > 0 and player:checkNameFlags(0x04000000) then
		   SpawnMob(17970005)
		   SetServerVariable("[Mimic]", 1)
		   SetServerVariable("[Coffer]", 0)
		  npc:setStatus(xi.status.DISAPPEAR)
		    end
		end,
    })


end)

return m