-----------------------------------
-- Dummy Mimic Lua File
-----------------------------------
require("scripts/globals/zone")
require("scripts/globals/status")
-----------------------------------

local entity = {}
local jobTable =
    {
    -- [job] = { model, skill, spell, lootpool },
        [  1] = { 2940, 183, 183, 4052 },
        [  2] = { 2910, 183, 183, 4052 },
        [  3] = { 2909, 183, 183, 4052 },
        [  4] = { 2881, 183, 183, 4052 },
        [  5] = { 2907, 183, 183, 4052 },
        [  6] = { 2399, 183, 183, 4052 },
        [  7] = { 2210, 183, 183, 4052 },
        [  8] = { 2908, 183, 183, 4052 },
    	[  9] = { 2398, 183, 183, 4052 },
        [ 10] = { 1075, 183, 183, 4052 },
        [ 11] = { 1076, 183, 183, 4052 },
        [ 12] = { 1145, 183, 183, 4052 },
        [ 13] = { 1182, 183, 183, 4052 },
        [ 14] = { 1362, 183, 183, 4052 },
        [ 15] = { 1420, 183, 183, 4052 },
        [ 16] = { 1430, 183, 183, 4052 },
        [ 17] = { 1431, 183, 183, 4052 },
        [ 18] = { 1432, 183, 183, 4052 },
        [ 19] = { 1433, 183, 183, 4052 },
        [ 20] = { 1434, 183, 183, 4052 },
        [ 21] = { 1639, 183, 183, 4052 },
        [ 22] = { 1730, 183, 183, 4052 },
    }

entity.onMobSpawn = function(mob)
--      mob:renameEntity("Oops Sorry")
        SetServerVariable("[Found]", 3)
--  	mob:setModelId(969)
end
entity.onMobEngaged = function(mob, target)
        local job       = target:getMainJob()
        local model     = jobTable[job][1]
        local skillList = jobTable[job][2]
        local spellList = jobTable[job][3]
        local dropList  = jobTable[job][4]
--      mob:setModelId(model)
--      mob:setMobMod(xi.mobMod.SKILL_LIST, skillList)
        mob:setMobMod(xi.mobMod.SPELL_LIST, spellList)
    	mob:setDropID(dropList)
		
end
entity.onMobDeath = function(mob, player)
        SetServerVariable("[MimicHunt]", 0)
        SetServerVariable("[Found]", 0)
end

return entity