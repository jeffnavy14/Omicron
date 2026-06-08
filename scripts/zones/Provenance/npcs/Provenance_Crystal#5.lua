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
      if not player:hasKeyItem(xi.ki.SEDUCTIVE_PETRIFACT) then
         return
      else
        -- Inject action packet for animation (replace animation ID as needed)
        player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
        -- Delay warp using a timer
        player:timer(1500, function()
            -- Warp the next area
            player:setPos(511.6136,12,521.3645,225)
            player:delKeyItem(xi.ki.SEDUCTIVE_PETRIFACT)
        end)
      end
end

return entity
