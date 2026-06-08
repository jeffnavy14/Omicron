-----------------------------------
-- Area: Povenance
--  NPC: ???
-- Notes: Move to next island
-- !pos 
-----------------------------------
local ID = zones[xi.zone.PROVENANCE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
local provenanceWatcher = GetMobByID(ID.mob.PROVENANCE_WATCHER)
      if not player:hasKeyItem(xi.ki.MADDENING_PETRIFACT) or
             provenanceWatcher:isEngaged() then
         return
      else
        -- Inject action packet for animation (replace animation ID as needed)
        player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
        -- Delay warp using a timer
        player:timer(1500, function()
            -- Warp the next area
            player:setPos(-598.8798,-228,512.381,224)
            player:delKeyItem(xi.ki.MADDENING_PETRIFACT)
            if not provenanceWatcher:isAlive() then
               SpawnMob(ID.mob.PROVENANCE_WATCHER)
            end
        end)
      end
end

return entity
