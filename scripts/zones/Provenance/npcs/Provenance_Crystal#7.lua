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
local Provenance_Watcher = GetMobByID(ID.mob.PROVENANCE_WATCHER)
      if Provenance_Watcher:isAlive() then
         return
      else
        -- Inject action packet for animation (replace animation ID as needed)
        player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
        -- Delay warp using a timer
        player:timer(1500, function()
        -- Warp the player to their hang out
        player:setPos(341.4659, -0.4111, -582.4335, 191, 280)
           -- starting area player:setPos(-277.2205,0.1694,-790.0978,204)
        end)
      end
end

return entity
