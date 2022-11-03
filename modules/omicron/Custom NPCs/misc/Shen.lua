-----------------------------------
-- CatsEyeXI Shen NM
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/npc_util")
-----------------------------------
local m = Module:new("Shen")

m:addOverride("xi.zones.Bibiki_Bay.mobs.Shen.onMobDespawn", function(mob)
    super(mob)
	-- Respawn the ???
    GetNPCByID(16793900):updateNPCHideTime(xi.settings.main.FORCE_SPAWN_QM_RESET_TIME)
end)

return m 

-- Few things to note with this module
-- This will spit out map_xi.exe errors and has been reported to LSB/Discord.
-- This Module does work as intended and will respawn the ??? correctly.
-- Not sure where else to make this work without the map server freaking out
-- But this is on the radar and will be tweaked as revisions are made.
-- https://discord.com/channels/392903136336936960/883228010596163594/1035578548976627822

-- Demetrie