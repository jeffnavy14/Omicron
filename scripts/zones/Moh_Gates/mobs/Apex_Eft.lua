-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Bog Body
-----------------------------------
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/weaponskillids")
require("scripts/globals/zone")
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}


entity.onMobInitialize = function(mob)
            mob:setMod(xi.mod.UDMGPHYS, -80)
            mob:setMod(xi.mod.UDMGRANGE, -80)
            mob:setMod(xi.mod.UDMGMAGIC, -80)    
    mob:setMod(xi.mod.COUNTER, 10) -- "Possesses a Counter trait"
    mob:setMod(xi.mod.PETRIFYRES, 450) -- "Possesses a resist petrify trait"
    mob:setMod(xi.mod.REGEN, 700) -- "Posseses an Auto-Regen (low to moderate)"	
end

entity.onMobSpawn = function(mob)
	mob:setMod(xi.mod.MATT, 600)
    mob:setMod(xi.mod.MACC, 2800)
	mob:setMod(xi.mod.DEF, 3000)
	mob:setMod(xi.mod.EVA, 1800)
	mob:setMod(xi.mod.MDEF, 3000)
	mob:setMod(xi.mod.TRIPLE_ATTACK, 30)
	mob:setMod(xi.mod.ATT, 3000)
	mob:setMod(xi.mod.ACC, 1800)
end

return entity