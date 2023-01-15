-----------------------------------
-- Area: Wajoam Woodlands
--  Mob: Haunted Chest
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}
local raceTable =
{
-- [race] = { model, skill, spell, lootpool },
    [  1] = { 603, 108, 201 },
    [  2] = { 604, 107, 202 },
    [  3] = { 605, 106, 203 },
    [  4] = { 606, 105, 204 },
    [  5] = { 607, 104, 205 },
    [  6] = { 608, 103, 206 },
    [  7] = { 609, 102, 207 },
    [  8] = { 610, 259, 109, 4052 },
}
entity.onMobSpawn = function(mob)
    mob:renameEntity("Opps Sorry")
    SetServerVariable("[Found]", 3)
   end

entity.onMobFight = function(mob, target)
    local race      = target:getRace()
    local model     = raceTable[race][1]
    local skillList = raceTable[race][2]
    local spellList = raceTable[race][3]
    local dropList  = raceTable[race][4]
    mob:setModelId(model)
    mob:setMobMod(xi.mobMod.SKILL_LIST, skillList)
    mob:setMobMod(xi.mobMod.SPELL_LIST, spellList)
	mob:setDropID(dropList)
end

entity.onMobDeath = function(mob, player)
    SetServerVariable("[TreasureHunt]", 0)
    SetServerVariable("[Found]", 0)
  end

return entity